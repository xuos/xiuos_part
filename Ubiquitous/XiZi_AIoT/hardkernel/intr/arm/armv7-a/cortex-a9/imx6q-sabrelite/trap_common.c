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
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: trap_common.c
Description: trap interface of hardkernel
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <string.h>

#include "core.h"
#include "gicv2_common_opa.h"
#include "trap_common.h"

#include "log.h"

extern void init_stack(uint32_t, uint32_t);
extern void user_trap_swi_enter(void);
extern void trap_iabort(void);
extern void trap_dabort(void);
extern void trap_irq_enter(void);
extern void trap_undefined_instruction(void);

static struct XiziTrapDriver xizi_trap_driver;

void panic(char* s)
{
    xizi_trap_driver.cpu_irq_disable();
    KPrintf("panic: %s\n", s);
    for (;;)
        ;
}

/* stack for different mode*/
static char mode_stack_pages[NR_CPU][NR_MODE_STACKS][MODE_STACK_SIZE];

extern uint32_t _vector_jumper;
extern uint32_t _vector_start;
extern uint32_t _vector_end;

void init_cpu_mode_stacks(int cpu_id)
{
    uint32_t modes[] = { ARM_MODE_FIQ, ARM_MODE_IRQ, ARM_MODE_ABT, ARM_MODE_UND };
    // initialize the stacks for different mode
    for (int i = 0; i < sizeof(modes) / sizeof(uint32_t); i++) {
        memset(mode_stack_pages[cpu_id][i], 0, MODE_STACK_SIZE);
        init_stack(modes[i], (uint32_t)mode_stack_pages[cpu_id][i]);
    }
}

void handle_reserved(void)
{
    // unimplemented trap handler
    LOG("Unimplemented Reserved\n");
    panic("");
}

void handle_fiq(void)
{
    LOG("Unimplemented FIQ\n");
    panic("");
}

static void _sys_irq_init()
{
    /* load exception vectors */
    volatile uint32_t* vector_base = &_vector_start;

    // Set Interrupt handler start address
    vector_base[1] = (uint32_t)trap_undefined_instruction; // Undefined Instruction
    vector_base[2] = (uint32_t)user_trap_swi_enter; // Software Interrupt
    vector_base[3] = (uint32_t)trap_iabort; // Prefetch Abort
    vector_base[4] = (uint32_t)trap_dabort; // Data Abort
    vector_base[5] = (uint32_t)handle_reserved; // Reserved
    vector_base[6] = (uint32_t)trap_irq_enter; // IRQ
    vector_base[7] = (uint32_t)handle_fiq; // FIQ

    init_cpu_mode_stacks(0);

    /* active hardware irq responser */
    gic_init();
    xizi_trap_driver.switch_hw_irqtbl((uint32_t*)&_vector_jumper);
}

static void _cpu_irq_enable(void)
{
    arm_set_interrupt_state(true);
}

static void _cpu_irq_disable(void)
{
    arm_set_interrupt_state(false);
}

static void _single_irq_enable(int irq, int cpu, int prio)
{
    gic_set_irq_priority(irq, prio);
    gic_set_irq_security(irq, false); // set IRQ as non-secure
    gic_set_cpu_target(irq, cpu, true);
    gic_enable_irq(irq, true);
}

static void _single_irq_disable(int irq, int cpu)
{
    gic_enable_irq(irq, false);
    gic_set_cpu_target(irq, cpu, false);
}

#define VBAR
static inline uint32_t* _switch_hw_irqtbl(uint32_t* new_tbl_base)
{
    // get old irq table base addr
    uint32_t old_tbl_base = 0;
    _ARM_MRC(15, 0, old_tbl_base, 12, 0, 0);

    // set new irq table base addr
    _ARM_MCR(15, 0, new_tbl_base, 12, 0, 0);

    // set sctlr to use VBAR
    uint32_t sctlr = 0;
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
    sctlr &= ~(1 << 13);
    _ARM_MCR(15, 0, sctlr, 1, 0, 0);

    return (uint32_t*)old_tbl_base;
}

static void _bind_irq_handler(int irq, irq_handler_t handler)
{
    xizi_trap_driver.sw_irqtbl[irq].handler = handler;
}

static bool _send_sgi(uint32_t irq, uint32_t bitmask, enum SgiFilterType type)
{
    if (bitmask > (1 << NR_CPU) - 1) {
        return false;
    }

    enum _gicd_sgi_filter sgi_filter;
    switch (type) {
    case SgiFilter_TargetList:
        sgi_filter = kGicSgiFilter_UseTargetList;
        break;
    case SgiFilter_AllOtherCPUs:
        sgi_filter = kGicSgiFilter_AllOtherCPUs;
        break;
    default:
        sgi_filter = kGicSgiFilter_OnlyThisCPU;
        break;
    }
    gic_send_sgi(irq, bitmask, sgi_filter);

    return true;
}

static uint32_t _hw_before_irq()
{

    uint32_t vectNum = gic_read_irq_ack();
    if (vectNum & 0x200) {
        gic_write_end_of_irq(vectNum);
        return 0;
    }
    return vectNum;
}

static uint32_t _hw_cur_int_num(uint32_t int_info)
{
    return int_info & 0x1FF;
}

static uint32_t _hw_cur_int_cpu(uint32_t int_info)
{
    return (int_info >> 10) & 0x7;
}

static void _hw_after_irq(uint32_t int_info)
{
    gic_write_end_of_irq(int_info);
}

static int _is_interruptable(void)
{
    uint32_t val;

    __asm__ __volatile__(
        "mrs %0, cpsr"
        : "=r"(val)
        :
        :);

    return !(val & DIS_INT);
}

static struct XiziTrapDriver xizi_trap_driver = {
    .sys_irq_init = _sys_irq_init,

    .cpu_irq_enable = _cpu_irq_enable,
    .cpu_irq_disable = _cpu_irq_disable,
    .single_irq_enable = _single_irq_enable,
    .single_irq_disable = _single_irq_disable,
    .switch_hw_irqtbl = _switch_hw_irqtbl,

    .bind_irq_handler = _bind_irq_handler,
    .send_sgi = _send_sgi,

    .is_interruptable = _is_interruptable,
    .hw_before_irq = _hw_before_irq,
    .hw_cur_int_num = _hw_cur_int_num,
    .hw_cur_int_cpu = _hw_cur_int_cpu,
    .hw_after_irq = _hw_after_irq,
};

struct XiziTrapDriver* hardkernel_intr_init(struct TraceTag* hardkernel_tag)
{
    xizi_trap_driver.sys_irq_init();
    xizi_trap_driver.cpu_irq_disable();
    return &xizi_trap_driver;
}