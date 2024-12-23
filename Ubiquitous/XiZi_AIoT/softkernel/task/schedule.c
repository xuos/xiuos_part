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
 * @file scheduler.c
 * @brief scheduler implementation
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: scheduler.c
Description: scheduler implementation
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "log.h"
#include "schedule_algo.h"

struct Thread* max_priority_runnable_task(void)
{
    static struct Thread* task = NULL;
    // static int priority = 0;

    // priority = __builtin_ffs(ready_task_priority) - 1;
    // if (priority > 31 || priority < 0) {
    //     return NULL;
    // }

    // DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[priority], node)
    // {
    //     assert(task != NULL);
    //     if (task->state == READY && !task->dead) {
    //         // found a runnable task, stop this look up
    //         return task;
    //     } else if (task->dead && task->state != RUNNING) {

    //         struct TaskLifecycleOperations* tlo = GetSysObject(struct TaskLifecycleOperations, &xizi_task_manager.task_lifecycle_ops_tag);
    //         tlo->free_pcb(task);
    //         return NULL;
    //     }
    // }
    if (!rbt_is_empty(&g_scheduler.snode_state_pool[READY])) {
        return ((struct ScheduleNode*)(g_scheduler.snode_state_pool[READY].root->data))->pthd;
    }
    return NULL;
}

#include "multicores.h"
#include "rbtree.h"
#include "task.h"

bool init_schedule_node(struct ScheduleNode* snode, struct Thread* bind_thd)
{
    snode->pthd = bind_thd;
    snode->snode_id = bind_thd->tid;
    snode->sched_context.remain_tick = 0;
    snode->sleep_context.remain_ms = 0;
    snode->state = INIT;
    if (RBTTREE_INSERT_SECC != rbt_insert(&g_scheduler.snode_state_pool[INIT], //
            snode->snode_id, (void*)snode)) {
        return false;
    }
    return true;
}

bool task_trans_sched_state(struct ScheduleNode* snode, RbtTree* from_pool, RbtTree* to_pool, enum ThreadState target_state)
{
    assert(snode->snode_id != UNINIT_SNODE_ID && snode->pthd != NULL);
    if (RBTTREE_DELETE_SUCC != rbt_delete(from_pool, snode->snode_id)) {
        DEBUG("Thread %d not in from schedule pool\n", snode->pthd->tid);
        return false;
    }

    if (RBTTREE_INSERT_SECC != rbt_insert(to_pool, snode->snode_id, (void*)snode)) {
        DEBUG("Thread %d trans state failed\n", snode->pthd->tid);
        return false;
    }

    snode->state = target_state;
    return true;
}

void task_dead(struct Thread* thd)
{
    assert(thd != NULL);
    struct ScheduleNode* snode = &thd->snode;
    enum ThreadState thd_cur_state = snode->state;

    assert(snode->state == READY);

    bool trans_res = task_trans_sched_state(snode, //
        &g_scheduler.snode_state_pool[READY], //
        &g_scheduler.snode_state_pool[DEAD], DEAD);
    assert(trans_res = true);
    return;
}

void task_block(struct Thread* thd)
{
    assert(thd != NULL);
    struct ScheduleNode* snode = &thd->snode;
    enum ThreadState thd_cur_state = snode->state;

    assert(thd_cur_state != RUNNING);

    bool trans_res = task_trans_sched_state(snode, //
        &g_scheduler.snode_state_pool[thd_cur_state], //
        &g_scheduler.snode_state_pool[BLOCKED], BLOCKED);
    assert(trans_res = true);
    return;
}

void task_into_ready(struct Thread* thd)
{
    assert(thd != NULL);
    struct ScheduleNode* snode = &thd->snode;
    enum ThreadState thd_cur_state = snode->state;

    bool trans_res = task_trans_sched_state(snode, //
        &g_scheduler.snode_state_pool[thd_cur_state], //
        &g_scheduler.snode_state_pool[READY], READY);
    snode->sched_context.remain_tick = TASK_CLOCK_TICK;
    assert(trans_res = true);
    return;
}

void task_yield(struct Thread* thd)
{
    assert(thd != NULL);
    struct ScheduleNode* snode = &thd->snode;
    enum ThreadState thd_cur_state = snode->state;

    assert(thd == cur_cpu()->task && thd_cur_state == RUNNING);
    cur_cpu()->task = NULL;

    bool trans_res = task_trans_sched_state(snode, //
        &g_scheduler.snode_state_pool[thd_cur_state], //
        &g_scheduler.snode_state_pool[READY], READY);
    assert(trans_res = true);
    return;
}