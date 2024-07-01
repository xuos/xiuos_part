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
 * @file sys_yield.c
 * @brief task yield
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_yield.c
Description: task yield
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "multicores.h"
#include "syscall.h"
#include "task.h"

#include "assert.h"

int sys_yield(task_yield_reason reason)
{
    struct Thread* cur_task = cur_cpu()->task;
    xizi_task_manager.task_yield_noschedule(cur_task, false);

    // handle ipc block
    if ((reason & SYS_TASK_YIELD_BLOCK_IPC) != 0) {
        if (cur_task->advance_unblock) {
            cur_task->advance_unblock = false;
        } else {
            xizi_task_manager.task_block(&xizi_task_manager.task_blocked_list_head, cur_task);
        }
    }

    // wake up all possible server
    struct client_session* client_session = NULL;
    DOUBLE_LIST_FOR_EACH_ENTRY(client_session, &cur_task->cli_sess_listhead, node)
    {
        assert(client_session != NULL);
        struct session_backend* session_backend = CLIENT_SESSION_BACKEND(client_session);
        if (session_backend->server->state == BLOCKED) {
            xizi_task_manager.task_unblock(session_backend->server);
        }
    }

    return 0;
}