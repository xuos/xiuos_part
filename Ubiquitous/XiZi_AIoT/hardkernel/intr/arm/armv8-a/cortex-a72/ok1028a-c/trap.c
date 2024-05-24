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
#include <assert.h>
#include <stdio.h>

#include "core.h"
#include "exception_registers.h"
#include "multicores.h"
#include "syscall.h"
#include "task.h"

extern void dabort_handler(struct trapframe* r);
extern void iabort_handler(struct trapframe* r);

void kernel_abort_handler(struct trapframe* tf)
{
    uint64_t esr = r_esr_el1();
    switch ((esr & 0x3F) >> 26) {
    case 0b100100:
    case 0b100101:
        dabort_handler(tf);
    case 0b100000:
    case 0b100001:
        iabort_handler(tf);
    default:
        panic("Unimplemented Error Occured.\n");
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
    uint64_t ec = (r_esr_el1() >> 0x1A) & 0x3F;
    w_esr_el1(0);
    if (ec == 0b010101) {
        software_irq_dispatch(tf);
    } else {
        printf("USYSCALL: unexpected ec %p", r_esr_el1());
        printf("          elr=%p far=%p\n", r_elr_el1(), r_far_el1());
        // kill error task
        xizi_enter_kernel();
        assert(cur_cpu()->task == NULL);
        sys_exit(cur_cpu()->task);
        context_switch(&cur_cpu()->task->thread_context.context, cur_cpu()->scheduler);
        panic("dabort end should never be reashed.\n");
    }
}