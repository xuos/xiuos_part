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

static struct Thread* next_runable_task;
static uint64_t min_run_time;

bool find_runable_task(RbtNode* node, void* data)
{
    struct ScheduleNode* snode = (struct ScheduleNode*)node->data;
    struct Thread* thd = snode->pthd;

    if (!thd->dead) {
        if (thd->snode.sched_context.run_time <= min_run_time) {
            next_runable_task = thd;
            min_run_time = thd->snode.sched_context.run_time;
            thd->snode.sched_context.run_time++;
        }
        return true;
    } else {
        struct TaskLifecycleOperations* tlo = GetSysObject(struct TaskLifecycleOperations, &xizi_task_manager.task_lifecycle_ops_tag);
        tlo->free_pcb(thd);
        return false;
    }

    return true;
}

struct Thread* max_priority_runnable_task(void)
{
    /// @todo better strategy
    next_runable_task = NULL;
    min_run_time = UINT64_MAX;
    rbt_traverse(&g_scheduler.snode_state_pool[READY], find_runable_task, NULL);
    return next_runable_task;
}

#include "multicores.h"
#include "rbtree.h"
#include "task.h"

bool init_schedule_node(struct ScheduleNode* snode, struct Thread* bind_thd)
{
    snode->pthd = bind_thd;
    snode->snode_id = bind_thd->tid;

    snode->sched_context.remain_tick = 0;
    snode->sched_context.run_time = 0;

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
    assert(snode != NULL);
    // DEBUG("%d %p %d %s\n", snode->snode_id, snode->pthd, snode->pthd->tid, snode->pthd->name);
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

    assert(snode->state == READY);

    bool trans_res = task_trans_sched_state(snode, //
        &g_scheduler.snode_state_pool[READY], //
        &g_scheduler.snode_state_pool[DEAD], DEAD);
    assert(trans_res = true);
    assert(RBTTREE_DELETE_SUCC == rbt_delete(&g_scheduler.snode_state_pool[DEAD], snode->snode_id));
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
    snode->sched_context.remain_tick = TASK_CLOCK_TICK;
    assert(trans_res = true);
    return;
}