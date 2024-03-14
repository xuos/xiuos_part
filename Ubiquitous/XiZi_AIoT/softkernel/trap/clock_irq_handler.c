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
 * @file clock_irq_handler.c
 * @brief clock interrupt handler
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: clock_irq_handler.c
Description: clock interrupt handler
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "clock_common_op.h"

#include "actracer.h"
#include "assert.h"
#include "multicores.h"
#include "task.h"

#include "log.h"

static struct TraceTag clock_driver_tag;
static struct XiziClockDriver* p_clock_driver = NULL;

bool clock_intr_handler_init(struct TraceTag* p_clock_driver_tag)
{
    clock_driver_tag = *p_clock_driver_tag;
    p_clock_driver = AchieveResource(p_clock_driver_tag);
    return p_clock_driver != NULL;
}

uint64_t global_tick = 0;
int xizi_clock_handler(int irq, void* tf, void* arg)
{
    /* handle clock interrupt using driver */
    if (p_clock_driver->is_timer_expired()) {
        p_clock_driver->clear_clock_intr();
        global_tick++;
        struct TaskMicroDescriptor* current_task = cur_cpu()->task;
        if (current_task) {
            current_task->remain_tick--;
            current_task->maxium_tick--;
            if (current_task->remain_tick == 0) {
                xizi_task_manager.cur_task_yield_noschedule();
            }
        }
    }
    return 0;
}