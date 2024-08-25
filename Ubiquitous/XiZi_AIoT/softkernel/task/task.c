/*
 * Copyright (c) 2020 AIIT XUOS Lab
 * XiUOS is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *        http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
/**
 * @file task.c
 * @brief task implementation
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: task.c
Description: task implementation
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <string.h>

#include "core.h"

#include "assert.h"
#include "kalloc.h"
#include "memspace.h"
#include "multicores.h"
#include "scheduler.h"
#include "syscall.h"
#include "task.h"
#include "trap_common.h"

struct CPU global_cpus[NR_CPU];
uint32_t ready_task_priority;

static inline void task_node_leave_list(struct Thread* task)
{
    doubleListDel(&task->node);
    if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[task->priority])) {
        ready_task_priority &= ~((uint32_t)1 << task->priority);
    }
}

static inline void task_node_add_to_ready_list_head(struct Thread* task)
{
    doubleListAddOnHead(&task->node, &xizi_task_manager.task_list_head[task->priority]);
    ready_task_priority |= ((uint32_t)1 << task->priority);
}

static inline void task_node_add_to_ready_list_back(struct Thread* task)
{
    doubleListAddOnBack(&task->node, &xizi_task_manager.task_list_head[task->priority]);
    ready_task_priority |= ((uint32_t)1 << task->priority);
}

static void _task_manager_init()
{
    // init task list to NULL
    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
        doubleListNodeInit(&xizi_task_manager.task_list_head[i]);
    }
    doubleListNodeInit(&xizi_task_manager.task_blocked_list_head);
    doubleListNodeInit(&xizi_task_manager.task_running_list_head);
    doubleListNodeInit(&xizi_task_manager.task_sleep_list_head);
    // init task (slab) allocator
    slab_init(&xizi_task_manager.memspace_allocator, sizeof(struct MemSpace));
    slab_init(&xizi_task_manager.task_allocator, sizeof(struct Thread));
    slab_init(&xizi_task_manager.task_buddy_allocator, sizeof(struct KBuddy));
    semaphore_pool_init(&xizi_task_manager.semaphore_pool);

    // tid pool
    xizi_task_manager.next_pid = 0;

    // init priority bit map
    ready_task_priority = 0;
}

/// @brief alloc a new task without init
static struct Thread* _alloc_task_cb()
{
    // alloc task and add it to used task list
    struct Thread* task = (struct Thread*)slab_alloc(&xizi_task_manager.task_allocator);
    if (UNLIKELY(task == NULL)) {
        ERROR("Not enough memory\n");
        return NULL;
    }
    // set tid once task is allocated
    memset(task, 0, sizeof(*task));
    task->tid = xizi_task_manager.next_pid++;
    task->thread_context.user_stack_idx = -1;

    return task;
}

int _task_return_sys_resources(struct Thread* ptask)
{
    assert(ptask != NULL);

    /* handle sessions for condition 1, ref. delete_share_pages() */
    struct session_backend* session_backend = NULL;
    // close all server_sessions
    struct server_session* server_session = NULL;
    while (!IS_DOUBLE_LIST_EMPTY(&ptask->svr_sess_listhead)) {
        server_session = CONTAINER_OF(ptask->svr_sess_listhead.next, struct server_session, node);
        assert(server_session != NULL);
        session_backend = SERVER_SESSION_BACKEND(server_session);
        assert(session_backend->server == ptask);
        // cut the connection from task to session
        server_session->closed = true;
        xizi_share_page_manager.delete_share_pages(session_backend);
    }
    // close all client_sessions
    struct client_session* client_session = NULL;
    while (!IS_DOUBLE_LIST_EMPTY(&ptask->cli_sess_listhead)) {
        client_session = CONTAINER_OF(ptask->cli_sess_listhead.next, struct client_session, node);
        assert(client_session != NULL);
        session_backend = CLIENT_SESSION_BACKEND(client_session);
        assert(session_backend->client == ptask);
        // cut the connection from task to session
        client_session->closed = true;
        xizi_share_page_manager.delete_share_pages(session_backend);
    }

    if (ptask->server_identifier.meta != NULL) {
        struct TraceTag server_identifier_owner;
        AchieveResourceTag(&server_identifier_owner, RequireRootTag(), "softkernel/server-identifier");
        assert(server_identifier_owner.meta != NULL);
        DeleteResource(&ptask->server_identifier, &server_identifier_owner);
    }

    // delete registered irq if there is one
    if (ptask->bind_irq) {
        sys_unbind_irq_all(ptask);
    }

    return 0;
}

/// @brief this function changes task list without locking, so it must be called inside a lock critical area
/// @param task
static void _dealloc_task_cb(struct Thread* task)
{
    if (UNLIKELY(task == NULL)) {
        ERROR("deallocating a NULL task\n");
        return;
    }

    _task_return_sys_resources(task);

    /* free thread's user stack */
    if (task->thread_context.user_stack_idx != -1) {
        // stack is mapped in vspace, so it should be freed from pgdir
        assert(task->thread_context.user_stack_idx >= 0 && task->thread_context.user_stack_idx < 64);
        assert(task->memspace != NULL);

        /* the stack must have be set in memspace if bitmap has been set */
        assert(xizi_pager.unmap_pages(task->memspace->pgdir.pd_addr, task->thread_context.uspace_stack_addr, USER_STACK_SIZE));
        bitmap64_free(&task->memspace->thread_stack_idx_bitmap, task->thread_context.user_stack_idx);
        /* thread's user stack space is also allocated for kernel free space */
        assert(kfree((char*)task->thread_context.ustack_kvaddr));

        if (task->memspace != NULL) {
            task->memspace->mem_size -= USER_STACK_SIZE;
        }
    }

    /* free thread's kernel stack */
    if (task->thread_context.kern_stack_addr) {
        kfree((char*)task->thread_context.kern_stack_addr);
    }

    /* free memspace if needed to */
    if (task->memspace != NULL) {
        // awake deamon in this memspace
        if (task->memspace->thread_to_notify != NULL) {
            if (task->memspace->thread_to_notify != task) {
                if (task->memspace->thread_to_notify->state == BLOCKED) {
                    xizi_task_manager.task_unblock(task->memspace->thread_to_notify);
                } else {
                    task->memspace->thread_to_notify->advance_unblock = true;
                }
            } else if (task->memspace->thread_to_notify == task) {
                task->memspace->thread_to_notify = NULL;
            }
        }

        doubleListDel(&task->memspace_list_node);
        /* free memspace if thread is the last one using it */
        if (IS_DOUBLE_LIST_EMPTY(&task->memspace->thread_list_guard)) {
            // free memspace
            free_memspace(task->memspace);
        }
    }

    // remove thread from used task list
    task_node_leave_list(task);

    // free task back to allocator
    slab_free(&xizi_task_manager.task_allocator, (void*)task);
}

/* alloc a new task with init */
extern void trap_return(void);
__attribute__((optimize("O0"))) void task_prepare_enter()
{
    xizi_leave_kernel();
    trap_return();
}

static struct Thread* _new_task_cb(struct MemSpace* pmemspace)
{
    // alloc task space
    struct Thread* task = _alloc_task_cb();
    if (!task) {
        return NULL;
    }

    /* init basic task member */
    doubleListNodeInit(&task->cli_sess_listhead);
    doubleListNodeInit(&task->svr_sess_listhead);

    /* when creating a new task, memspace will be freed outside during memory shortage */
    task->memspace = NULL;

    /* init main thread of task */
    task->thread_context.task = task;
    // alloc stack page for task
    if ((void*)(task->thread_context.kern_stack_addr = (uintptr_t)kalloc(USER_STACK_SIZE)) == NULL) {
        /* here inside, will no free memspace */
        _dealloc_task_cb(task);
        return NULL;
    }

    /* from now on, _new_task_cb() will not generate error */
    /* init vm */
    assert(pmemspace != NULL);
    task->memspace = pmemspace;
    task->thread_context.user_stack_idx = -1;
    doubleListNodeInit(&task->memspace_list_node);
    doubleListAddOnBack(&task->memspace_list_node, &pmemspace->thread_list_guard);

    /* set context of main thread stack */
    /// stack bottom
    memset((void*)task->thread_context.kern_stack_addr, 0x00, USER_STACK_SIZE);
    char* sp = (char*)task->thread_context.kern_stack_addr + USER_STACK_SIZE - 4;

    /// 1. trap frame into stack, for process to nomally return by trap_return
    sp -= sizeof(*task->thread_context.trapframe);
    task->thread_context.trapframe = (struct trapframe*)sp;

    /// 2. context into stack
    sp -= sizeof(*task->thread_context.context);
    task->thread_context.context = (struct context*)sp;
    arch_init_context(task->thread_context.context);

    return task;
}

static void _task_set_default_schedule_attr(struct Thread* task)
{
    task->remain_tick = TASK_CLOCK_TICK;
    task->maxium_tick = TASK_CLOCK_TICK * 10;
    task->state = READY;
    task->priority = TASK_DEFAULT_PRIORITY;
    task_node_add_to_ready_list_head(task);
}

static void task_state_set_running(struct Thread* task)
{
    assert(task != NULL && task->state == READY);
    task->state = RUNNING;
    task_node_leave_list(task);
    doubleListAddOnHead(&task->node, &xizi_task_manager.task_running_list_head);
}

struct Thread* next_task_emergency = NULL;
extern void context_switch(struct context**, struct context*);
static void _scheduler(struct SchedulerRightGroup right_group)
{
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);
    struct XiziTrapDriver* p_intr_driver = AchieveResource(&right_group.intr_driver_tag);
    struct Thread* next_task;
    struct CPU* cpu = cur_cpu();

    while (1) {
        next_task = NULL;
        /* find next runnable task */
        assert(cur_cpu()->task == NULL);
        if (next_task_emergency != NULL && next_task_emergency->state == READY) {
            next_task = next_task_emergency;
        } else {
            next_task = xizi_task_manager.next_runnable_task();
        }
        next_task_emergency = NULL;

        /* if there's not a runnable task, wait for one */
        if (next_task == NULL) {
            xizi_leave_kernel();
            /* leave kernel for other cores, so they may create a runnable task */
            xizi_enter_kernel();
            continue;
        }

        /* run the chosen task */
        task_state_set_running(next_task);
        cpu->task = next_task;
        assert(next_task->memspace->pgdir.pd_addr != NULL);
        p_mmu_driver->LoadPgdir((uintptr_t)V2P(next_task->memspace->pgdir.pd_addr));
        context_switch(&cpu->scheduler, next_task->thread_context.context);
        assert(next_task->state != RUNNING);
    }
}

static void _task_yield_noschedule(struct Thread* task, bool blocking)
{
    assert(task != NULL);
    /// @warning only support current task yield now
    assert(task == cur_cpu()->task && task->state == RUNNING);

    // rearrage current task position
    task_node_leave_list(task);
    if (task->state == RUNNING) {
        task->state = READY;
    }
    task->remain_tick = TASK_CLOCK_TICK;
    cur_cpu()->task = NULL;
    task_node_add_to_ready_list_back(task);
}

static void _task_block(struct double_list_node* head, struct Thread* task)
{
    assert(head != NULL);
    assert(task != NULL);
    assert(task->state != RUNNING);
    task_node_leave_list(task);
    task->state = BLOCKED;
    doubleListAddOnHead(&task->node, head);
}

static void _task_unblock(struct Thread* task)
{
    assert(task != NULL);
    assert(task->state == BLOCKED || task->state == SLEEPING);
    task_node_leave_list(task);
    task->state = READY;
    task_node_add_to_ready_list_back(task);
}

/// @brief  @warning not tested function
/// @param priority
static void _set_cur_task_priority(int priority)
{
    if (priority < 0 || priority >= TASK_MAX_PRIORITY) {
        ERROR("priority is invalid\n");
        return;
    }

    struct Thread* current_task = cur_cpu()->task;
    assert(current_task != NULL && current_task->state == RUNNING);

    task_node_leave_list(current_task);

    current_task->priority = priority;

    task_node_add_to_ready_list_back(current_task);

    return;
}

struct XiziTaskManager xizi_task_manager = {
    .init = _task_manager_init,
    .new_task_cb = _new_task_cb,
    .free_pcb = _dealloc_task_cb,
    .task_set_default_schedule_attr = _task_set_default_schedule_attr,

    .next_runnable_task = max_priority_runnable_task,
    .task_scheduler = _scheduler,

    .task_block = _task_block,
    .task_unblock = _task_unblock,
    .task_yield_noschedule = _task_yield_noschedule,
    .set_cur_task_priority = _set_cur_task_priority
};

bool module_task_manager_init(TraceTag* softkernel_tag)
{
    CreateResourceTag(&xizi_task_manager.tag, softkernel_tag, "KTaskManager", TRACER_OWNER, &xizi_task_manager);
    xizi_task_manager.init();
    return true;
}
