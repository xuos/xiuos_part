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
#include "scheduler.h"

struct Thread* max_priority_runnable_task(void)
{
    static struct Thread* task = NULL;
    static int priority = 0;

    priority = __builtin_ffs(ready_task_priority) - 1;
    if (priority > 31 || priority < 0) {
        return NULL;
    }

    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[priority], node)
    {
        if (task->state == READY && !task->dead) {
            // found a runnable task, stop this look up
            return task;
        } else if (task->dead && task->state != RUNNING) {
            xizi_task_manager.free_pcb(task);
            return NULL;
        }
    }
    return NULL;
}

struct Thread* round_robin_runnable_task(uint32_t priority)
{
    struct Thread* task = NULL;

    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[priority], node)
    {
        if (task->state == READY && !task->dead) {
            // found a runnable task, stop this look up
            return task;
        } else if (task->dead && task->state != RUNNING) {
            xizi_task_manager.free_pcb(task);
            return NULL;
        }
    }

    return NULL;
}

/* recover task priority */
void recover_priority(void)
{
    struct Thread* task = NULL;
    for (int i = 1; i < TASK_MAX_PRIORITY; i++) {
        if (i == TASK_DEFAULT_PRIORITY)
            continue;
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[i], node)
        {
            if (!IS_DOUBLE_LIST_EMPTY(&task->node)) {
                // DEBUG("%s priority recover\n", task->name);
                task->priority = TASK_DEFAULT_PRIORITY;
                doubleListDel(&task->node);
                doubleListAddOnBack(&task->node, &xizi_task_manager.task_list_head[task->priority]);
                i--;
                break;
            }
        }
    }
}