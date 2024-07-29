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
 * @file sys_kill.c
 * @brief task exit syscall
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2024.03.19
 */

/*************************************************
File name: sys_kill.c
Description: task kill syscall
Others:
History:
1. Date: 2023-03-19
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "trap_common.h"

#include "task.h"

extern int sys_exit(struct Thread* task);
int sys_kill(int id)
{
    struct Thread* task = NULL;
    // check if task is a running one
    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_running_list_head, node)
    {
        if (task->tid == id) {
            sys_exit(task);
            return 0;
        }
    }

    // check if task is a blocking one
    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_blocked_list_head, node)
    {
        if (task->tid == id) {
            sys_exit(task);
            return 0;
        }
    }

    // check if task is a ready one
    for (int prio = 0; prio < TASK_MAX_PRIORITY; prio++) {
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[prio], node)
        {
            if (task->tid == id) {
                sys_exit(task);
                return 0;
            }
        }
    }

    return -1;
}