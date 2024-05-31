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
 * @file sys_poll_session.c
 * @brief server poll its connected sessions
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_poll_session.c
Description: server poll its connected sessions
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "assert.h"
#include "ipc.h"
#include "multicores.h"
#include "share_page.h"
#include "syscall.h"
#include "task.h"

#define IPCSESSION_MSG(session) ((struct IpcMsg*)((char*)((session)->buf) + (session)->head))

static inline bool is_msg_needed(struct IpcMsg* msg)
{
    assert(msg != NULL);
    return msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done == 0 && msg->header.handling == 0;
}

int sys_poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    struct Thread* cur_task = cur_cpu()->task;
    if (cur_task == NULL) {
        ERROR("%s by killed task\n");
        return -1;
    }

    struct double_list_node* cur_node = NULL;
    struct server_session* server_session = NULL;
    /* update old sessions */
    for (int i = 0; i < arr_capacity; i++) {
        if (UNLIKELY(userland_session_arr[i].buf == NULL)) {
            break;
        }
        cur_node = cur_task->svr_sess_listhead.next;
        server_session = CONTAINER_OF(cur_node, struct server_session, node);
        if (UNLIKELY(server_session->buf_addr != (uintptr_t)userland_session_arr[i].buf)) {
            ERROR("mismatched old session addr, user buf: %x, server buf: %x\n", userland_session_arr[i].buf, server_session->buf_addr);
            return -1;
        }
        // update session_backend
        // if current session is handled
        if (server_session->head != userland_session_arr[i].head) {
            struct Thread* client = SERVER_SESSION_BACKEND(server_session)->client;
            if (client->state == BLOCKED) {
                xizi_task_manager.task_unblock(client);
            } else {
                client->current_ipc_handled = true;
            }
        }
        server_session->head = userland_session_arr[i].head;
        server_session->tail = userland_session_arr[i].tail;
        doubleListDel(cur_node);
        doubleListAddOnBack(cur_node, &cur_task->svr_sess_listhead);
    }

    /* poll with new sessions */
    int nr_sessions_need_to_handle = 0;
    bool has_middle_delete = false;
    int session_idx = 0;
    DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
    {
        if (session_idx >= arr_capacity) {
            break;
        }

        if (SERVER_SESSION_BACKEND(server_session)->client_side.closed) {
            // client had closed it, then server will close it too
            struct session_backend* session_backend = SERVER_SESSION_BACKEND(server_session);
            assert(session_backend->server == cur_task);
            assert(session_backend->client == NULL);
            assert(server_session->closed == false);
            server_session->closed = true;
            xizi_share_page_manager.delete_share_pages(session_backend);
            // signal that there is a middle deletion of session
            has_middle_delete = true;
            break;
        }

        userland_session_arr[session_idx] = (struct Session) {
            .buf = (void*)server_session->buf_addr,
            .capacity = server_session->capacity,
            .head = server_session->head,
            .tail = server_session->tail,
            .id = SERVER_SESSION_BACKEND(server_session)->session_id,
        };

        struct IpcMsg* msg = IPCSESSION_MSG(&userland_session_arr[session_idx]);
        if (is_msg_needed(msg)) {
            nr_sessions_need_to_handle++;
        }

        session_idx++;
    }
    if (session_idx < arr_capacity) {
        userland_session_arr[session_idx].buf = NULL;
        if (!has_middle_delete && nr_sessions_need_to_handle == 0) {
            xizi_task_manager.task_yield_noschedule(cur_task, false);
            xizi_task_manager.task_block(&xizi_task_manager.task_blocked_list_head, cur_task);
        }
    }

    return 0;
}