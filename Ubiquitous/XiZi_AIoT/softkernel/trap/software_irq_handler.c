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
 * @file software_irq_handler.c
 * @brief syscall distributor
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: software_irq_handler.c
Description: syscall distributor
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "core.h"
#include "trap_common.h"

#include "assert.h"
#include "multicores.h"
#include "syscall.h"
#include "task.h"

static struct SwiDispatcherRightGroup right_group;
static struct XiziTrapDriver* p_intr_driver = NULL;

bool swi_distributer_init(struct SwiDispatcherRightGroup* _right_group)
{
    right_group = *_right_group;
    p_intr_driver = AchieveResource(&_right_group->intr_driver_tag);
    return p_intr_driver != NULL;
}

extern void context_switch(struct context**, struct context*);
void software_irq_dispatch(struct trapframe* tf)
{

    assert(p_intr_driver != NULL);

    p_intr_driver->cpu_irq_disable();
    spinlock_lock(&whole_kernel_lock);

    // get current task
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
    /// @todo: Handle dead task

    int syscall_num = -1;
    if (cur_task && cur_task->state != DEAD) {
        cur_task->main_thread.trapframe = tf;
        // call syscall

        int ret = arch_syscall(cur_task->main_thread.trapframe, &syscall_num);

        if (syscall_num != SYSCALL_EXEC) {
            arch_set_return(tf, ret);
        }
    }

    if ((cur_cpu()->task == NULL && cur_task != NULL) || cur_task->state != RUNNING) {
        cur_cpu()->task = NULL;
        context_switch(&cur_task->main_thread.context, cur_cpu()->scheduler);
    }
    assert(cur_task == cur_cpu()->task);
    if (syscall_num == SYSCALL_EXIT) {
        panic("Exit reaches");
    }

    spinlock_unlock(&whole_kernel_lock);
    p_intr_driver->cpu_irq_enable();
}