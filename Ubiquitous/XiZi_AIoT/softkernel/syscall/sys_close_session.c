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
 * @file sys_close_session.c
 * @brief close session syscall
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_close_session.c
Description: close session syscall
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "assert.h"
#include "multicores.h"
#include "share_page.h"
#include "syscall.h"
#include "task.h"

int sys_close_session(struct TaskMicroDescriptor* cur_task, struct Session* session)
{
    assert(cur_task != NULL);
    /* check if session is available */
    if (session->buf == NULL || (uintptr_t)session->buf < USER_IPC_SPACE_BASE || (uintptr_t)session->buf > USER_IPC_SPACE_TOP) {
        return -1;
    }

    /* check if session is a client one or a server one */
    struct session_backend* session_backend = NULL;
    bool session_valid = false;

    struct client_session* client_session = NULL;
    DOUBLE_LIST_FOR_EACH_ENTRY(client_session, &cur_task->cli_sess_listhead, node)
    {
        if ((uintptr_t)session->buf == client_session->buf_addr) {
            session_valid = true;
            session_backend = CLIENT_SESSION_BACKEND(client_session);
            if (!client_session->closed) {
                client_session->closed = true;
                xizi_share_page_manager.unmap_task_share_pages(cur_task, session_backend->client_side.buf_addr, session_backend->nr_pages);
            }
            break;
        }
    }
    if (UNLIKELY(session_backend == NULL)) {
        struct server_session* server_session = NULL;
        DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
        {
            if ((uintptr_t)session->buf == server_session->buf_addr) {
                session_valid = true;
                session_backend = SERVER_SESSION_BACKEND(server_session);
                if (!server_session->closed) {
                    server_session->closed = true;
                    xizi_share_page_manager.unmap_task_share_pages(cur_task, session_backend->server_side.buf_addr, session_backend->nr_pages);
                }
                break;
            }
        }
    }

    /* close this session */
    if (UNLIKELY(session_backend->client_side.closed && session_backend->server_side.closed) && LIKELY(session_valid)) {
        xizi_share_page_manager.delete_share_pages(session_backend);
    }

    return 0;
}