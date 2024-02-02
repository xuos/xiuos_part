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
 * @file sys_connect_session.c
 * @brief connect session syscall
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_connect_session.c
Description: connect session syscall
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <stdint.h>

#include "assert.h"
#include "multicores.h"
#include "share_page.h"
#include "syscall.h"
#include "task.h"

int create_session_inner(struct TaskMicroDescriptor* client, struct TaskMicroDescriptor* server, int capacity, struct Session* user_session)
{
    // create share pages
    struct session_backend* session_backend = xizi_share_page_manager.create_share_pages(client, server, capacity);
    if (UNLIKELY(session_backend == NULL)) {
        DEBUG("create_share_pages failed\n");
        return -1;
    }

    // init user_session
    user_session->buf = (void*)session_backend->client_side.buf_addr;
    user_session->capacity = session_backend->client_side.capacity;
    user_session->head = 0;
    user_session->tail = 0;
    user_session->id = session_backend->session_id;

    return 0;
}

int sys_connect_session(char* path, int capacity, struct Session* user_session)
{
    if (capacity <= 0) {
        return -1;
    }

    struct TaskMicroDescriptor* client = cur_cpu()->task;
    /// get server
    struct TraceTag server_identifier_owner;
    if (!AchieveResourceTag(&server_identifier_owner, RequireRootTag(), "softkernel/server-identifier")) {
        panic("Server identifier not initialized.\b");
    }
    assert(server_identifier_owner.meta != NULL || server_identifier_owner.type == TRACER_OWNER);

    struct TraceTag server_tag;
    if (!AchieveResourceTag(&server_tag, &server_identifier_owner, path)) {
        ERROR("Not server: %s\n", path);
        return -1;
    }

    struct TaskMicroDescriptor* server = AchieveResource(&server_tag);
    assert(server != NULL);
    return create_session_inner(client, server, capacity, user_session);
}