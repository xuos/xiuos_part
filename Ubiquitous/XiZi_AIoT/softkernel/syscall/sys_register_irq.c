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
 * @file sys_register_irq.c
 * @brief task registration for interrupt
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: sys_register_irq.c
Description: task registration for interrupt
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <string.h>

#include "trap_common.h"

#include "actracer.h"
#include "assert.h"
#include "ipc.h"
#include "multicores.h"
#include "share_page.h"
#include "syscall.h"
#include "task.h"

static struct TaskMicroDescriptor kernel_irq_proxy;
static struct {
    struct TaskMicroDescriptor* handle_task;
    struct Session* session;
    int opcode;
} irq_forward_table[NR_IRQS];

static void send_irq_to_user(int irq_num)
{
    int len = IPC_ARG_INFO_BASE_OFFSET;
    /* add session tail */
    struct IpcMsg* buf = irq_forward_table[irq_num].session->buf + irq_forward_table[irq_num].session->tail;
    irq_forward_table[irq_num].session->tail += len;
    memset((void*)buf, 0, len);
    /* construct message */
    buf->header.len = len;
    buf->header.nr_args = 0;
    buf->header.init = 1;
    buf->header.opcode = irq_forward_table[irq_num].opcode;
    buf->header.done = 0;
    buf->header.magic = IPC_MSG_MAGIC;
    buf->header.valid = 1;
    /* add session head */
    irq_forward_table[irq_num].session->head += len;
}

int user_irq_handler(int irq, void* tf, void* arg)
{
    send_irq_to_user(irq);
    next_task_emergency = irq_forward_table[irq].handle_task;
    xizi_task_manager.cur_task_yield_noschedule();
    return 0;
}

extern int create_session_inner(struct TaskMicroDescriptor* client, struct TaskMicroDescriptor* server, int capacity, struct Session* user_session);
int sys_register_irq(int irq_num, int irq_opcode)
{
    static struct TraceTag intr_ac_tag;
    if (!AchieveResourceTag(&intr_ac_tag, RequireRootTag(), "hardkernel/intr-ac-resource")) {
        ERROR("intr not initialized.\n");
        return -1;
    }
    struct XiziTrapDriver* p_intr_driver = AchieveResource(&intr_ac_tag);

    if (p_intr_driver->sw_irqtbl[irq_num].handler != NULL) {
        ERROR("irq %d is occupied.\n", irq_num);
        return -1;
    }
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
    irq_forward_table[irq_num].handle_task = cur_task;
    irq_forward_table[irq_num].opcode = irq_opcode;
    create_session_inner(&kernel_irq_proxy, cur_task, PAGE_SIZE, irq_forward_table[irq_num].session);
    p_intr_driver->bind_irq_handler(irq_num, user_irq_handler);

    return 0;
}