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
#include "kalloc.h"
#include "multicores.h"
#include "share_page.h"
#include "syscall.h"
#include "task.h"

static struct TaskMicroDescriptor* kernel_irq_proxy;
static struct {
    struct TaskMicroDescriptor* handle_task;
    struct Session session;
    struct session_backend* p_kernel_session;
    int opcode;
} irq_forward_table[NR_IRQS];

static void send_irq_to_user(int irq_num)
{
    if (irq_forward_table[irq_num].handle_task != NULL) {
        struct Session* session = &irq_forward_table[irq_num].session;
        int len = IPC_ARG_INFO_BASE_OFFSET;
        len += sizeof(struct IpcArgInfo);

        /* get message space and add session tail */
        void* session_kern_vaddr = P2V(xizi_pager.address_translate(&kernel_irq_proxy->pgdir, (uintptr_t)session->buf));
        struct IpcMsg* buf = session_kern_vaddr + session->tail;

        /* check if server session is full */
        if (buf->header.magic == IPC_MSG_MAGIC && buf->header.done == 0) {
            DEBUG("irq server cannot handle new interrupt by now.\n");
            return;
        }
        memset((void*)buf, 0, len);
        session->tail = (session->tail + len) % session->capacity;

        /* construct message */
        buf->header.len = len;
        buf->header.nr_args = 1;
        buf->header.init = 1;
        buf->header.opcode = irq_forward_table[irq_num].opcode;
        buf->header.done = 0;
        buf->header.magic = IPC_MSG_MAGIC;
        buf->header.valid = 1;

        /* add session head */
        session->head = (session->head + len) % session->capacity;
    }
}

int user_irq_handler(int irq, void* tf, void* arg)
{
    if (irq_forward_table[irq].handle_task != NULL) {
        send_irq_to_user(irq);

        next_task_emergency = irq_forward_table[irq].handle_task;
        if (cur_cpu()->task != NULL) {
            xizi_task_manager.task_yield_noschedule(cur_cpu()->task, false);
        }
    }
    return 0;
}

extern struct session_backend* create_session_inner(struct TaskMicroDescriptor* client, struct TaskMicroDescriptor* server, int capacity, struct Session* user_session);
/// @warning no tested.

static struct XiziTrapDriver* p_intr_driver = NULL;
int sys_register_irq(int irq_num, int irq_opcode)
{
    // init intr resource;
    if (p_intr_driver == NULL) {
        struct TraceTag intr_ac_tag;
        if (!AchieveResourceTag(&intr_ac_tag, RequireRootTag(), "hardkernel/intr-ac-resource")) {
            ERROR("intr not initialized.\n");
            return -1;
        }
        p_intr_driver = (struct XiziTrapDriver*)AchieveResource(&intr_ac_tag);
    }

    // init kerenl sender proxy
    if (kernel_irq_proxy == NULL) {
        kernel_irq_proxy = xizi_task_manager.new_task_cb();
        kernel_irq_proxy->state = NEVER_RUN;
        xizi_pager.new_pgdir(&kernel_irq_proxy->pgdir);
        memcpy(kernel_irq_proxy->pgdir.pd_addr, kern_pgdir.pd_addr, TOPLEVLE_PAGEDIR_SIZE);
    }

    // bind irq to session
    if (irq_forward_table[irq_num].handle_task != NULL) {
        ERROR("irq %d is occupied.\n", irq_num);
        return -1;
    }
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
    irq_forward_table[irq_num].handle_task = cur_task;
    irq_forward_table[irq_num].opcode = irq_opcode;
    irq_forward_table[irq_num].p_kernel_session = create_session_inner(kernel_irq_proxy, cur_task, PAGE_SIZE, &irq_forward_table[irq_num].session);
    p_intr_driver->bind_irq_handler(irq_num, user_irq_handler);
    cur_task->bind_irq = true;

    return 0;
}

int sys_unbind_irq(struct TaskMicroDescriptor* task, int irq_num)
{
    if (irq_forward_table[irq_num].handle_task != task) {
        return -1;
    }

    irq_forward_table[irq_num].handle_task = NULL;
    sys_close_session(kernel_irq_proxy, &irq_forward_table[irq_num].session);
    DEBUG("Unbind: %s to irq %d", task->name, irq_num);
    return 0;
}

int sys_unbind_irq_all(struct TaskMicroDescriptor* task)
{
    for (int idx = 0; idx < NR_IRQS; idx++) {
        if (irq_forward_table[idx].handle_task == task) {
            sys_unbind_irq(task, idx);
        }
    }
    task->bind_irq = false;
    return 0;
}