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
#include "log.h"
#include "multicores.h"
#include "kalloc.h"
#include "scheduler.h"
#include "task.h"

struct CPU global_cpus[NR_CPU];
uint32_t ready_task_priority;

static void _task_manager_init()
{
    // init lock for task list
    spinlock_init(&xizi_task_manager.lock, "proclist");
    // init task list to NULL
    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
        doubleListNodeInit(&xizi_task_manager.task_list_head[i]);
    }
    // init task (slab) allocator
    slab_init(&xizi_task_manager.task_allocator, sizeof(struct TaskMicroDescriptor));

    // pid pool
    xizi_task_manager.next_pid = 0;

    // init priority bit map
    ready_task_priority = 0;
}

/// @brief alloc a new task without init
static struct TaskMicroDescriptor* _alloc_task_cb()
{
    spinlock_lock(&xizi_task_manager.lock);
    // alloc task and add it to used task list
    struct TaskMicroDescriptor* task = (struct TaskMicroDescriptor*)slab_alloc(&xizi_task_manager.task_allocator);
    if (UNLIKELY(task == NULL)) {
        ERROR("Not enough memory\n");
        spinlock_unlock(&xizi_task_manager.lock);
        return NULL;
    }
    // set pid once task is allocated
    memset(task, 0, sizeof(*task));
    task->pid = xizi_task_manager.next_pid++;
    // update pcb used
    xizi_task_manager.nr_pcb_used += 1;

    spinlock_unlock(&xizi_task_manager.lock);
    return task;
}

/// @brief this function changes task list without locking, so it must be called inside a lock critical area
/// @param task
static void _dealloc_task_cb(struct TaskMicroDescriptor* task)
{
    if (UNLIKELY(task == NULL)) {
        ERROR("deallocating a NULL task\n");
        return;
    }

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
    slab_free(&xizi_task_manager.task_allocator, (void*)task);
    xizi_task_manager.nr_pcb_used -= 1;

    // remove priority
    if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[task->priority])) {
        ready_task_priority &= ~(1 << task->priority);
    }
}

/* alloc a new task with init */
static struct TaskMicroDescriptor* _new_task_cb()
{
    // alloc task space
    struct TaskMicroDescriptor* task = _alloc_task_cb();
    if (!task) {
        return NULL;
    }
    // init vm
    if (!xizi_pager.new_pgdir(&task->pgdir)) {
        _dealloc_task_cb(task);
        return NULL;
    }
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

static void _task_set_default_schedule_attr(struct TaskMicroDescriptor* task, struct TraceTag* cwd)
{
    spinlock_init(&task->lock, task->name);
    task->remain_tick = TASK_CLOCK_TICK;
    task->maxium_tick = TASK_CLOCK_TICK * 10;
    task->state = READY;
    task->cwd = *cwd;
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

    while (1) {
        spinlock_lock(&xizi_task_manager.lock);
        next_task = NULL;
        /* find next runnable task */
        assert(cur_cpu()->task == NULL);
        if (next_task_emergency != NULL) {
            next_task = next_task_emergency;
            spinlock_lock(&next_task->lock);
            next_task->state = RUNNING;
            spinlock_unlock(&next_task->lock);
            next_task_emergency = NULL;
        } else {
            next_task = xizi_task_manager.next_runnable_task();
        }
        spinlock_unlock(&xizi_task_manager.lock);
        /* not a runnable task */
        if (UNLIKELY(next_task == NULL)) {
            continue;
        }
        assert(next_task->state == RUNNING);
        // p_mmu_driver->LoadPgdirCrit((uintptr_t)V2P(next_task->pgdir.pd_addr), &right_group.intr_driver_tag);
        p_mmu_driver->LoadPgdir((uintptr_t)V2P(next_task->pgdir.pd_addr));

        struct CPU* cpu = cur_cpu();
        cpu->task = next_task;
        context_switch(&cpu->scheduler, next_task->main_thread.context);
    }
}

static uint32_t yield_cnt = 0;
static void _cur_task_yield_noschedule(void)
{
    yield_cnt++;

    spinlock_lock(&xizi_task_manager.lock);
    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
    assert(current_task != NULL);

    // rearrage current task position
    doubleListDel(&current_task->node);
    // DEBUG("%s,%d\n", current_task->name, strcmp(current_task->name, name1));
    if (current_task->maxium_tick <= 0) {
        if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[current_task->priority])) {
            ready_task_priority &= ~(1 << current_task->priority);
        }
        current_task->priority += 1;
        current_task->maxium_tick = TASK_CLOCK_TICK * 10;
    }
    doubleListAddOnBack(&current_task->node, &xizi_task_manager.task_list_head[current_task->priority]);
    ready_task_priority |= (1 << current_task->priority);
    // set current task state
    spinlock_lock(&current_task->lock);
    current_task->state = READY;
    current_task->remain_tick = TASK_CLOCK_TICK;
    spinlock_unlock(&current_task->lock);
    cur_cpu()->task = NULL;
    if (yield_cnt == 50) {
        recover_priority();
        yield_cnt = 0;
    }
    spinlock_unlock(&xizi_task_manager.lock);
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
    .cur_task_yield_noschedule = _cur_task_yield_noschedule,
    .set_cur_task_priority = _set_cur_task_priority
};

bool module_task_manager_init(void)
{
    xizi_task_manager.init();
    return true;
}
