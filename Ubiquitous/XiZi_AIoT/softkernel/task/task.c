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
#include "log.h"
#include "multicores.h"
#include "scheduler.h"
#include "syscall.h"
#include "task.h"

struct CPU global_cpus[NR_CPU];
uint32_t ready_task_priority;

static void _task_manager_init()
{
    // init task list to NULL
    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
        doubleListNodeInit(&xizi_task_manager.task_list_head[i]);
    }
    doubleListNodeInit(&xizi_task_manager.task_blocked_list_head);
    // init task (slab) allocator
    slab_init(&xizi_task_manager.task_allocator, sizeof(struct TaskMicroDescriptor));
    slab_init(&xizi_task_manager.task_buddy_allocator, sizeof(struct KBuddy));

    // pid pool
    xizi_task_manager.next_pid = 0;

    // init priority bit map
    ready_task_priority = 0;
}

/// @brief alloc a new task without init
static struct TaskMicroDescriptor* _alloc_task_cb()
{
    // alloc task and add it to used task list
    struct TaskMicroDescriptor* task = (struct TaskMicroDescriptor*)slab_alloc(&xizi_task_manager.task_allocator);
    if (UNLIKELY(task == NULL)) {
        ERROR("Not enough memory\n");
        return NULL;
    }
    // set pid once task is allocated
    memset(task, 0, sizeof(*task));
    task->pid = xizi_task_manager.next_pid++;

    return task;
}

int _task_retrieve_sys_resources(struct TaskMicroDescriptor* ptask)
{
    assert(ptask != NULL);

    /* handle sessions for condition 1, ref. delete_share_pages() */
    // close all server_sessions
    struct server_session* server_session = NULL;
    while (!IS_DOUBLE_LIST_EMPTY(&ptask->svr_sess_listhead)) {
        server_session = CONTAINER_OF(ptask->svr_sess_listhead.next, struct server_session, node);
        // cut the connection from task to session
        if (!server_session->closed) {
            xizi_share_page_manager.unmap_task_share_pages(ptask, server_session->buf_addr, CLIENT_SESSION_BACKEND(server_session)->nr_pages);
            server_session->closed = true;
        }
        doubleListDel(&server_session->node);
        SERVER_SESSION_BACKEND(server_session)->server = NULL;
        // delete session (also cut connection from session to task)
        if (SERVER_SESSION_BACKEND(server_session)->client_side.closed) {
            xizi_share_page_manager.delete_share_pages(SERVER_SESSION_BACKEND(server_session));
        }
    }
    // close all client_sessions
    struct client_session* client_session = NULL;
    while (!IS_DOUBLE_LIST_EMPTY(&ptask->cli_sess_listhead)) {
        client_session = CONTAINER_OF(ptask->cli_sess_listhead.next, struct client_session, node);
        // cut the connection from task to session
        if (!client_session->closed) {
            xizi_share_page_manager.unmap_task_share_pages(ptask, client_session->buf_addr, CLIENT_SESSION_BACKEND(client_session)->nr_pages);
            client_session->closed = true;
        }
        doubleListDel(&client_session->node);
        CLIENT_SESSION_BACKEND(client_session)->client = NULL;
        // delete session (also cut connection from session to task)
        if (CLIENT_SESSION_BACKEND(client_session)->server_side.closed) {
            xizi_share_page_manager.delete_share_pages(CLIENT_SESSION_BACKEND(client_session));
        }
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
static void _dealloc_task_cb(struct TaskMicroDescriptor* task)
{
    if (UNLIKELY(task == NULL)) {
        ERROR("deallocating a NULL task\n");
        return;
    }

    _task_retrieve_sys_resources(task);

    // stack is mapped in vspace, so it should be free by pgdir
    if (task->pgdir.pd_addr) {
        xizi_pager.free_user_pgdir(&task->pgdir);
    }
    if (task->main_thread.stack_addr) {
        kfree((char*)task->main_thread.stack_addr);
    }

    struct double_list_node* cur_node = &task->node;
    // remove it from used task list
    doubleListDel(cur_node);

    // free task back to allocator
    if (task->massive_ipc_allocator != NULL) {
        KBuddyDestory(task->massive_ipc_allocator);
        slab_free(&xizi_task_manager.task_buddy_allocator, (void*)task->massive_ipc_allocator);
    }
    slab_free(&xizi_task_manager.task_allocator, (void*)task);

    // remove priority
    if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[task->priority])) {
        ready_task_priority &= ~(1 << task->priority);
    }
}

/* alloc a new task with init */
extern void trap_return(void);
__attribute__((optimize("O0"))) void task_prepare_enter()
{
    xizi_leave_kernel();
    trap_return();
}

static struct TaskMicroDescriptor* _new_task_cb()
{
    // alloc task space
    struct TaskMicroDescriptor* task = _alloc_task_cb();
    if (!task) {
        return NULL;
    }
    // init vm
    task->pgdir.pd_addr = NULL;
    /* init basic task member */
    doubleListNodeInit(&task->cli_sess_listhead);
    doubleListNodeInit(&task->svr_sess_listhead);

    /* init main thread of task */
    task->main_thread.task = task;
    // alloc stack page for task
    if ((void*)(task->main_thread.stack_addr = (uintptr_t)kalloc(USER_STACK_SIZE)) == NULL) {
        _dealloc_task_cb(task);
        return NULL;
    }

    /* set context of main thread stack */
    /// stack bottom
    memset((void*)task->main_thread.stack_addr, 0x00, USER_STACK_SIZE);
    char* sp = (char*)task->main_thread.stack_addr + USER_STACK_SIZE - 4;

    /// 1. trap frame into stack, for process to nomally return by trap_return
    sp -= sizeof(*task->main_thread.trapframe);
    task->main_thread.trapframe = (struct trapframe*)sp;

    /// 2. context into stack
    sp -= sizeof(*task->main_thread.context);
    task->main_thread.context = (struct context*)sp;
    arch_init_context(task->main_thread.context);

    return task;
}

static void _task_set_default_schedule_attr(struct TaskMicroDescriptor* task)
{
    task->remain_tick = TASK_CLOCK_TICK;
    task->maxium_tick = TASK_CLOCK_TICK * 10;
    task->state = READY;
    task->priority = TASK_DEFAULT_PRIORITY;
    doubleListAddOnHead(&task->node, &xizi_task_manager.task_list_head[task->priority]);
    ready_task_priority |= (1 << task->priority);
}

struct TaskMicroDescriptor* next_task_emergency = NULL;
extern void context_switch(struct context**, struct context*);
static void _scheduler(struct SchedulerRightGroup right_group)
{
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);
    struct TaskMicroDescriptor* next_task;
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
        assert(next_task->state == READY);
        next_task->state = RUNNING;
        cpu->task = next_task;
        p_mmu_driver->LoadPgdir((uintptr_t)V2P(next_task->pgdir.pd_addr));
        context_switch(&cpu->scheduler, next_task->main_thread.context);
        assert(next_task->state != RUNNING);
    }
}

static void _task_yield_noschedule(struct TaskMicroDescriptor* task, bool blocking)
{
    assert(task != NULL);

    // rearrage current task position
    doubleListDel(&task->node);
    if (task->state == RUNNING) {
        task->state = READY;
    }
    task->remain_tick = TASK_CLOCK_TICK;
    if (task == cur_cpu()->task) {
        cur_cpu()->task = NULL;
    }
    doubleListAddOnBack(&task->node, &xizi_task_manager.task_list_head[task->priority]);
}

static void _task_block(struct TaskMicroDescriptor* task)
{
    assert(task != NULL);
    assert(task->state != RUNNING);
    doubleListDel(&task->node);
    if (xizi_task_manager.task_list_head[task->priority].next == &xizi_task_manager.task_list_head[task->priority]) {
        ready_task_priority &= ~(1 << task->priority);
    }
    task->state = BLOCKED;
    doubleListAddOnHead(&task->node, &xizi_task_manager.task_blocked_list_head);
}

static void _task_unblock(struct TaskMicroDescriptor* task)
{
    assert(task != NULL);
    assert(task->state == BLOCKED);
    doubleListDel(&task->node);
    task->state = READY;
    doubleListAddOnHead(&task->node, &xizi_task_manager.task_list_head[task->priority]);
    ready_task_priority |= (1 << task->priority);
}

static void _set_cur_task_priority(int priority)
{
    if (priority < 0 || priority >= TASK_MAX_PRIORITY) {
        ERROR("priority is invalid\n");
        return;
    }

    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
    assert(current_task != NULL);

    current_task->priority = priority;

    doubleListDel(&current_task->node);
    doubleListAddOnBack(&current_task->node, &xizi_task_manager.task_list_head[current_task->priority]);

    ready_task_priority |= (1 << current_task->priority);

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

bool module_task_manager_init(void)
{
    xizi_task_manager.init();
    return true;
}
