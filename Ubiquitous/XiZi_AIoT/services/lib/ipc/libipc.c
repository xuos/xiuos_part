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
 * @file libipc.c
 * @brief package seesion for inter process call perpose
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: libipc.c
Description: package seesion for inter process call perpose
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <string.h>

#include "libipc.h"
#include "libserial.h"
#include "usyscall.h"

/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    int len = IPC_ARG_INFO_BASE_OFFSET;

    int arg_info_offset = len; // start of arg info
    len += argc * sizeof(struct IpcArgInfo);

    int arg_buf_offset = len; // start of arg buffer
    for (int i = 0; i < argc; i++) {
        len += arg_size[i];
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    if (buf == NULL) {
        return NULL;
    }
    buf->header.len = len;
    buf->header.done = 0;
    buf->header.valid = 0;

    for (int i = 0; i < argc; i++) {
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
        arg_info->len = arg_size[i];
        arg_info->offset = arg_buf_offset;

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
        arg_buf_offset += arg_size[i];
    }
    buf->header.nr_args = argc;
    buf->header.init = 1;
    return buf;
}

/// @brief set nth arg in ipc_msg with data
/// @param msg
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    if (arg_num >= msg->header.nr_args) {
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %d\n", __func__, arg_num, msg->header.nr_args);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    if (len > nth_arg_info->len) {
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %d\n", __func__, len, nth_arg_info->len);
        return false;
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(buf, data, len);
    return true;
}

/// @brief get nth arg in ipc_msg and move value to data
/// @param msg
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    if (arg_num >= msg->header.nr_args) {
        printf("[%s] IPC: arg_num out of msg range", __func__);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    if (len > nth_arg_info->len) {
        printf("[%s] IPC: size of arg out of buffer range", __func__);
        return false;
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(data, buf, len);
    return true;
}

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    msg->header.done = 0;
    while (msg->header.done == 0) {
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    }
    assert(msg->header.done == 1);
}

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    msg->header.done = 0;
}

int ipc_session_wait(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    while (msg->header.done == 0) {
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    }
    assert(msg->header.done == 1);
    return msg->header.ret_val;
}

static int cur_sess_id = -1;
int cur_session_id(void)
{
    return cur_sess_id;
}

static bool session_delayed = false;
void delay_session(void)
{
    session_delayed = true;
}

bool is_cur_session_delayed(void)
{
    return session_delayed;
}

void ipc_server_loop(struct IpcNode* ipc_node)
{
    struct Session session_list[NR_MAX_SESSION];
    memset(session_list, 0, sizeof(session_list));
    for (;;) {
        /* if connect sessions are greater than NR_MAX_SESSION,
            a full round will require multiple polls.
            Eg.(3 polls to with 6 sessions and NR_MAX_SESSION = 4):
                [0, 1, 2, 3], [4, 5, 0, 1], [2, 3, 4, 5]
        */
        poll_session(session_list, NR_MAX_SESSION);
        /* handle each session */
        bool has_delayed = true;
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
            has_delayed = false;
            for (int i = 0; i < NR_MAX_SESSION; i++) {
                session_delayed = false;
                if (session_list[i].buf == NULL) {
                    yield(SYS_TASK_YIELD_NO_REASON);
                    break;
                }
                cur_sess_id = session_list[i].id;
                struct IpcMsg* msg = IPCSESSION_MSG(&session_list[i]);
                /* handle every message in current session
                    a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                    interfaces[opcode] should explicitly call delay_session() and return to delay this session
                */
                while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done == 0) {
                    // printf("session %d [%d, %d]\n", session_list[i].id, session_list[i].head, session_list[i].tail);
                    if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], msg->header.len) < 0) {
                        break;
                    }

                    // this is a message needs to handle
                    if (ipc_node->interfaces[msg->header.opcode]) {
                        ipc_node->interfaces[msg->header.opcode](msg);
                        // check if this session is delayed by op handler, all messages after the delayed message in current session is blocked.
                        if (is_cur_session_delayed()) {
                            msg->header.delayed = 1;
                            has_delayed = true;
                            break;
                        }
                    } else {
                        printf("Unsupport opcode(%d) for server: %s\n", msg->header.opcode, ipc_node->name);
                    }
                    // current msg is a message that needs to ignore
                    // finish this message in server's perspective
                    if (session_forward_head(&session_list[i], msg->header.len) < 0) {
                        break;
                    }
                    msg = IPCSESSION_MSG(&session_list[i]);
                }
                // stop handle this session
                cur_sess_id = -1;
            }
        }
    }
}