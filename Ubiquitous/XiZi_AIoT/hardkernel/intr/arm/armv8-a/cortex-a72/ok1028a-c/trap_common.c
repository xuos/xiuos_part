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
 * @file trap_common.c
 * @brief trap interface of hardkernel
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2023.05.06
 */

/*************************************************
File name: trap_common.c
Description: trap interface of hardkernel
Others:
History:
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <string.h>

#include "core.h"
#include "cortex_a72.h"
#include "exception_registers.h"
#include "gicv3_common_opa.h"
#include "trap_common.h"

#include "log.h"
#include "multicores.h"

extern void init_stack(uint64_t, uint64_t);
extern void user_trap_swi_enter(void);
extern void trap_iabort(void);
extern void trap_dabort(void);
extern void trap_irq_enter(void);
extern void trap_undefined_instruction(void);

static struct XiziTrapDriver xizi_trap_driver;

void panic(char* s)
{
    KPrintf("panic: %s\n", s);
    for (;;)
        ;
}

/* stack for different mode*/
static char mode_stack_pages[NR_CPU][NR_MODE_STACKS][MODE_STACK_SIZE];

extern uint64_t _vector_jumper;
extern uint64_t _vector_start;
extern uint64_t _vector_end;

// void init_cpu_mode_stacks(int cpu_id)
// {
//     uint32_t modes[] = { ARM_MODE_EL0_t, ARM_MODE_EL1_t, ARM_MODE_EL2_t, ARM_MODE_EL3_t };
//     // initialize the stacks for different mode
//     for (int i = 0; i < sizeof(modes) / sizeof(uint64_t); i++) {
//         memset(mode_stack_pages[cpu_id][i], 0, MODE_STACK_SIZE);
//         init_stack(modes[i], (uint64_t)mode_stack_pages[cpu_id][i]);
//     }
// }

extern void alltraps();
static void _sys_irq_init(int cpu_id)
{
    // primary core init intr
    xizi_trap_driver.switch_hw_irqtbl((uintptr_t*)alltraps);

    if (cpu_id == 0) {
        xizi_trap_driver.switch_hw_irqtbl((uintptr_t*)alltraps);
        gic_init();
    }
    gicv3inithart();
}

static void _cpu_irq_enable(void)
{
    // arm_set_interrupt_state(true);
    intr_on();
}

static void _cpu_irq_disable(void)
{
    intr_off();
}

static void _single_irq_enable(int irq, int cpu, int prio)
{
    gic_setup_spi(cpu, irq);
}

static void _single_irq_disable(int irq, int cpu)
{
    return;
}

static inline uintptr_t* _switch_hw_irqtbl(uintptr_t* new_tbl_base)
{
    w_vbar_el1((uint64_t)new_tbl_base);

    return NULL;
}

static void _bind_irq_handler(int irq, irq_handler_t handler)
{
    xizi_trap_driver.sw_irqtbl[irq].handler = handler;
}

static uint32_t _hw_before_irq()
{

    uint32_t iar = gic_read_irq_ack();
    return iar;
}

static uint32_t _hw_cur_int_num(uint32_t int_info)
{
    return int_info & 0x3FF;
}

static void _hw_after_irq(uint32_t int_info)
{
    gic_write_end_of_irq(int_info);
}

int _cur_cpu_id()
{
    return cpu_get_current();
}

static struct XiziTrapDriver xizi_trap_driver = {
    .sys_irq_init = _sys_irq_init,
    .cur_cpu_id = _cur_cpu_id,

    .cpu_irq_enable = _cpu_irq_enable,
    .cpu_irq_disable = _cpu_irq_disable,
    .single_irq_enable = _single_irq_enable,
    .single_irq_disable = _single_irq_disable,
    .switch_hw_irqtbl = _switch_hw_irqtbl,

    .bind_irq_handler = _bind_irq_handler,

    .hw_before_irq = _hw_before_irq,
    .hw_cur_int_num = _hw_cur_int_num,
    .hw_after_irq = _hw_after_irq,
};

struct XiziTrapDriver* hardkernel_intr_init(struct TraceTag* hardkernel_tag)
{
    xizi_trap_driver.sys_irq_init(0);
    xizi_trap_driver.cpu_irq_disable();
    return &xizi_trap_driver;
}