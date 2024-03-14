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
#include "multicores.h"
#include "share_page.h"
#include "syscall.h"
#include "task.h"

int sys_poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
    if (cur_task == NULL) {
        ERROR("%s by killed task\n");
        return -1;
    }

    spinlock_lock(&cur_task->lock);

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
            spinlock_unlock(&cur_task->lock);
            return -1;
        }
        // update session_backend
        server_session->head = userland_session_arr[i].head;
        server_session->tail = userland_session_arr[i].tail;
        doubleListDel(cur_node);
        doubleListAddOnBack(cur_node, &cur_task->svr_sess_listhead);
    }
    spinlock_unlock(&cur_task->lock);

    /* handle sessions for condition 2, ref. delete_share_pages() */
    bool has_delete = true;
    while (has_delete) {
        has_delete = false;

        spinlock_lock(&cur_task->lock);
        DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
        {
            if (SERVER_SESSION_BACKEND(server_session)->client_side.closed) {
                // client had closed it, then server will close it too
                struct session_backend* session_backend = SERVER_SESSION_BACKEND(server_session);

                spinlock_unlock(&cur_task->lock);
                if (!session_backend->server_side.closed) {
                    session_backend->server_side.closed = true;
                    xizi_share_page_manager.unmap_task_share_pages(cur_task, session_backend->server_side.buf_addr, session_backend->nr_pages);
                }
                xizi_share_page_manager.delete_share_pages(session_backend);
                has_delete = true;
                break;
            }
        }
        if (!has_delete) {
            spinlock_unlock(&cur_task->lock);
        }
    }

    /* poll with new sessions */
    spinlock_lock(&cur_task->lock);
    int i = 0;
    DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
    {
        if (i >= arr_capacity) {
            break;
        }
        userland_session_arr[i++] = (struct Session) {
            .buf = (void*)server_session->buf_addr,
            .capacity = server_session->capacity,
            .head = server_session->head,
            .tail = server_session->tail,
            .id = SERVER_SESSION_BACKEND(server_session)->session_id,
        };
    }
    if (LIKELY(i < arr_capacity)) {
        userland_session_arr[i].buf = 0;
    }
    spinlock_unlock(&cur_task->lock);

    return 0;
}