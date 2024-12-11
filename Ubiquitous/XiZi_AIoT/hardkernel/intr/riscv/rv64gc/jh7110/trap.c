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
 * @file trap.c
 * @brief trap interface of hardkernel
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2023.05.06
 */

/*************************************************
File name: trap.c
Description: trap interface of hardkernel
Others:
History:
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <stdint.h>

#include "exception_registers.h"

#include "assert.h"
#include "core.h"
#include "multicores.h"
#include "syscall.h"
#include "task.h"

#include "mmu.h"

#include "asm/csr.h"
#include "ptrace.h"


extern void dabort_handler(struct trapframe* r);
extern void iabort_handler(struct trapframe* r);

void kernel_abort_handler(struct trapframe* tf)
{
    uint64_t esr = r_esr_el1();
    switch ((esr >> 0x1A) & 0x3F) {
    case 0b100100:
    case 0b100101:
        dabort_handler(tf);
        break;
    case 0b100000:
    case 0b100001:
        iabort_handler(tf);
        break;
    default: {
        uint64_t ec = (esr >> 26) & 0x3f;
        uint64_t iss = esr & 0x1ffffff;
        ERROR("esr:  %016lx %016lx %016lx\n", esr, ec, iss);
        ERROR("elr = %016lx far = %016lx\n", r_elr_el1(), r_far_el1());
        ERROR("Current Task: %s.\n", cur_cpu()->task->name);
        panic("Unimplemented Error Occured.\n");
    }
    }
    panic("Return from abort handler.\n");
}

void kernel_intr_handler(struct trapframe* tf)
{
    panic("Intr at kernel mode should never happen by design.\n");
}

extern void context_switch(struct context**, struct context*);
void syscall_arch_handler(struct trapframe* tf)
{

    uint64_t esr = r_esr_el1();
    uint64_t ec = (esr >> 0x1A) & 0x3F;
    switch (ec) {
    case 0B010101:
        software_irq_dispatch(tf);
        break;
    case 0b100100:
    case 0b100101:
        dabort_handler(tf);
        break;
    case 0b100000:
    case 0b100001:
        iabort_handler(tf);
        break;
    default: {
        ERROR("USYSCALL: unexpected\n");
        ERROR("          esr: %016lx\n", esr);
        ERROR("          elr = %016lx far = %016lx\n", r_elr_el1(), r_far_el1());
        w_esr_el1(0);
        extern void dump_tf(struct trapframe * tf);
        dump_tf(tf);

        uint32_t sctlr = 0;
        SCTLR_R(sctlr);
        DEBUG("SCTLR: %x\n", sctlr);
        uint32_t spsr = 0;
//        __asm__ volatile("mrs %0, spsr_el1" : "=r"(spsr)::"memory");
        DEBUG("SPSR: %x\n", spsr);
        uint64_t tcr = 0;
//        __asm__ volatile("mrs %0, tcr_el1" : "=r"(tcr)::"memory");
        DEBUG("TCR: %x\n", tcr);
        uint64_t mair = 0;
//        __asm__ volatile("mrs %0, mair_el1" : "=r"(mair)::"memory");
        DEBUG("MAIR: %x\n", mair);

        // kill error task
        xizi_enter_kernel();
        assert(cur_cpu()->task != NULL);
        ERROR("Error Task: %s\n", cur_cpu()->task->name);
        sys_exit(cur_cpu()->task);
        context_switch(&cur_cpu()->task->thread_context.context, cur_cpu()->scheduler);
        panic("dabort end should never be reashed.\n");
    }
    }
}



static void do_trap_error(struct pt_regs *regs, const char *str)
{
    printk("Oops: %s\n", str);
    printk("sstatus: 0x%016lx, sbadaddr: 0x%016lx, scause: 0x%016lx\n",
           regs->status, regs->badaddr, regs->cause);
    panic("Fatal exception\n");
}

#define DO_ERROR_INFO(name) \
static int name(struct pt_regs *regs, const char *str) \
{ \
    do_trap_error(regs, str); \
    return 0; \
}

DO_ERROR_INFO(do_trap_unknown);
DO_ERROR_INFO(do_trap_insn_misaligned);
DO_ERROR_INFO(do_trap_insn_fault);
DO_ERROR_INFO(do_trap_insn_illegal);
DO_ERROR_INFO(do_trap_load_misaligned);
DO_ERROR_INFO(do_trap_load_fault);
DO_ERROR_INFO(do_trap_store_misaligned);
DO_ERROR_INFO(do_trap_store_fault);
DO_ERROR_INFO(do_trap_ecall_u);
DO_ERROR_INFO(do_trap_ecall_s);
DO_ERROR_INFO(do_trap_break);
DO_ERROR_INFO(do_page_fault);

struct fault_info {
    int (*fn)(struct pt_regs *regs, const char *name);
    const char *name;
};

static const struct fault_info fault_inf[] = {
    {do_trap_insn_misaligned, "Instruction address misaligned"},
    {do_trap_insn_fault, "Instruction access fault"},
    {do_trap_insn_illegal, "Illegal instruction"},
    {do_trap_break, "Breakpoint"},
    {do_trap_load_misaligned, "Load address misaligned"},
    {do_trap_load_fault, "Load access fault"},
    {do_trap_store_misaligned, "Store/AMO address misaligned"},
    {do_trap_store_fault, "Store/AMO access fault"},
    {do_trap_ecall_u, "Environment call from U-mode"},
    {do_trap_ecall_s, "Environment call from S-mode"},
    {do_trap_unknown, "unknown 10"},
    {do_trap_unknown, "unknown 11"},
    {do_page_fault, "Instruction page fault"},
    {do_page_fault, "Load page fault"},
    {do_trap_unknown, "unknown 14"},
    {do_page_fault, "Store/AMO page fault"},
};


/*
void delegate_traps(void)
{
    unsigned long interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;

    unsigned long exceptions = (1UL << CAUSE_MISALIGNED_FETCH) |
                               (1UL << CAUSE_FETCH_PAGE_FAULT) |
                               (1UL << CAUSE_BREAKPOINT) |
                               (1UL << CAUSE_LOAD_PAGE_FAULT) |
                               (1UL << CAUSE_STORE_PAGE_FAULT) |
                               (1UL << CAUSE_USER_ECALL) |
                               (1UL << CAUSE_LOAD_ACCESS_FAULT) |
                               (1UL << CAUSE_STORE_ACCESS_FAULT);

    csr_write(mideleg, interrupts);
    csr_write(medeleg, exceptions);
}
*/


struct fault_info * ec_to_fault_info(unsigned long scause)
{
    struct fault_info *inf;
    if (scause >= (sizeof(fault_inf)/sizeof(fault_inf[0]))) {
        printk("The cause is out of range Exception Code, scause=0x%lx\n", scause);
        panic("Fatal exception\n");
    }
    inf = &fault_inf[scause];
    return inf;
}
extern void do_exception_vector(void);
void trap_init(void)
{
    csr_write(stvec, do_exception_vector);
    //printk("stvec=0x%lx, do_exception_vector=0x%lx\n", csr_read(stvec), (unsigned long)do_exception_vector);
    csr_write(sie, 0);
}

void do_exception(struct pt_regs *regs, unsigned long scause)
{
    const struct fault_info *inf;

    printk("%s, scause: 0x%lx\n", __func__, scause);

    if (scause & CAUSE_IRQ_FLAG) {
        // TODO: 处理中断
    }
    else {
        inf = ec_to_fault_info(scause);
        if (!inf->fn(regs, inf->name)) {
            return;
        }
    }
}
