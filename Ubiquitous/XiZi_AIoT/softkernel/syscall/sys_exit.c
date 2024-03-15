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
 * @file sys_exit.c
 * @brief task exit syscall
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_exit.c
Description: task exit syscall
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "trap_common.h"

#include "actracer.h"
#include "assert.h"
#include "list.h"
#include "multicores.h"
#include "syscall.h"
#include "task.h"

int sys_exit()
{

    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
    assert(cur_task != NULL);

    /* handle sessions for condition 1, ref. delete_share_pages() */
    // close all server_sessions
    struct server_session* server_session = NULL;
    while (!IS_DOUBLE_LIST_EMPTY(&cur_task->svr_sess_listhead)) {
        server_session = CONTAINER_OF(cur_task->svr_sess_listhead.next, struct server_session, node);
        // cut the connection from task to session
        if (!server_session->closed) {
            xizi_share_page_manager.unmap_task_share_pages(cur_task, server_session->buf_addr, CLIENT_SESSION_BACKEND(server_session)->nr_pages);
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
    while (!IS_DOUBLE_LIST_EMPTY(&cur_task->cli_sess_listhead)) {
        client_session = CONTAINER_OF(cur_task->cli_sess_listhead.next, struct client_session, node);
        // cut the connection from task to session
        if (!client_session->closed) {
            xizi_share_page_manager.unmap_task_share_pages(cur_task, client_session->buf_addr, CLIENT_SESSION_BACKEND(client_session)->nr_pages);
            client_session->closed = true;
        }
        doubleListDel(&client_session->node);
        CLIENT_SESSION_BACKEND(client_session)->client = NULL;
        // delete session (also cut connection from session to task)
        if (CLIENT_SESSION_BACKEND(client_session)->server_side.closed) {
            xizi_share_page_manager.delete_share_pages(CLIENT_SESSION_BACKEND(client_session));
        }
    }

    if (cur_task->server_identifier.meta != NULL) {
        struct TraceTag server_identifier_owner;
        AchieveResourceTag(&server_identifier_owner, RequireRootTag(), "softkernel/server-identifier");
        assert(server_identifier_owner.meta != NULL);
        DeleteResource(&cur_task->server_identifier, &server_identifier_owner);
    }

    // delete task for pcb_list
    xizi_task_manager.cur_task_yield_noschedule();
    cur_task->state = DEAD;

    return 0;
}