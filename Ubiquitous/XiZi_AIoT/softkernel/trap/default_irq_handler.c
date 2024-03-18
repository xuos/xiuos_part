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
 * @file default_irq_handler.c
 * @brief irq distributor
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: default_irq_handler.c
Description: irq distributor
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <stddef.h>

#include "core.h"
#include "trap_common.h"

#include "assert.h"
#include "log.h"
#include "multicores.h"
#include "task.h"

static struct IrqDispatcherRightGroup right_group;
static struct XiziTrapDriver* p_intr_driver = NULL;
bool intr_distributer_init(struct IrqDispatcherRightGroup* _right_group)
{
    right_group = *_right_group;
    p_intr_driver = AchieveResource(&_right_group->intr_driver_tag);
    return p_intr_driver != NULL;
}

void default_interrupt_routine(void)
{
    /* default handler borrow the rights of dispatcher */
    ///@todo Support other cores. (currently assume that CPU_0 is used)
    ERROR("Interrupt %d has been asserted\n", p_intr_driver->curr_int[0]);
}

extern void context_switch(struct context**, struct context*);
void intr_irq_dispatch(struct trapframe* tf)
{
    assert(p_intr_driver != NULL);

    p_intr_driver->cpu_irq_disable();

    // enter irq
    uintptr_t int_info = 0;
    if ((int_info = p_intr_driver->hw_before_irq()) == 0) {
        return;
    }
    spinlock_lock(&whole_kernel_lock);

    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
    if (LIKELY(current_task != NULL)) {
        current_task->main_thread.trapframe = tf;
    }

    unsigned cpu = p_intr_driver->hw_cur_int_cpu(int_info);
    unsigned irq = p_intr_driver->hw_cur_int_num(int_info);
    p_intr_driver->curr_int[cpu] = irq;

    // distribute irq
    irq_handler_t isr = p_intr_driver->sw_irqtbl[irq].handler;
    if (isr) {
        isr(irq, tf, NULL);
    } else {
        default_interrupt_routine();
    }

    // finish irq.
    p_intr_driver->curr_int[cpu] = 0;
    p_intr_driver->hw_after_irq(int_info);

    if (UNLIKELY(cur_cpu()->task == NULL && current_task != NULL)) {
        context_switch(&current_task->main_thread.context, cur_cpu()->scheduler);
    }
    assert(current_task == cur_cpu()->task);

    spinlock_unlock(&whole_kernel_lock);
    p_intr_driver->cpu_irq_enable();
}
