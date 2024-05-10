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
 * @file trampoline.S
 * @brief trap in and out code
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024-04-22
 */

/*************************************************
File name: trampoline.S
Description: trap in and out code
Others: 
History:
1. Date: 2024-04-22
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/

#include "memlayout.h"

#include "core.h"

.global trap_irq_enter
.global trap_return
.global usertrapret

trap_return:
    /* Restore registers. */
    ldp x1, x2, [sp], #16
    ldp x3, x0, [sp], #16
    msr sp_el0, x1
    msr spsr_el1, x2
    msr elr_el1, x3

    ldp x1, x2, [sp], #16
    ldp x3, x4, [sp], #16
    ldp x5, x6, [sp], #16
    ldp x7, x8, [sp], #16
    ldp x9, x10, [sp], #16
    ldp x11, x12, [sp], #16
    ldp x13, x14, [sp], #16
    ldp x15, x16, [sp], #16
    ldp x17, x18, [sp], #16
    ldp x19, x20, [sp], #16
    ldp x21, x22, [sp], #16
    ldp x23, x24, [sp], #16
    ldp x25, x26, [sp], #16
    ldp x27, x28, [sp], #16
    ldp x29, x30, [sp], #16

    eret

user_trap_swi_enter:
    // Save trapframe to swi stack
    stp x29, x30, [sp, #-16]!
    stp x27, x28, [sp, #-16]!
    stp x25, x26, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    stp x19, x20, [sp, #-16]!
    stp x17, x18, [sp, #-16]!
    stp x15, x16, [sp, #-16]!
    stp x13, x14, [sp, #-16]!
    stp x11, x12, [sp, #-16]!
    stp x9, x10, [sp, #-16]!
    stp x7, x8, [sp, #-16]!
    stp x5, x6, [sp, #-16]!
    stp x3, x4, [sp, #-16]!
    stp x1, x2, [sp, #-16]!

    // mrs  x2,    spsr_el1
    //str     x2, [sp, #-8]       
    //str     x30, [sp, #-8]
    //stp sp, elr_el1, [sp, #-16]!         	
    //str     sp, [sp, #-8] 

    // Call syscall handler
    mov 	x0, sp
    bl		software_irq_dispatch
    b		trap_return

trap_irq_enter:
    /* Build trapframe. */
    stp x29, x30, [sp, #-16]!
    stp x27, x28, [sp, #-16]!
    stp x25, x26, [sp, #-16]!
    stp x23, x24, [sp, #-16]!
    stp x21, x22, [sp, #-16]!
    stp x19, x20, [sp, #-16]!
    stp x17, x18, [sp, #-16]!
    stp x15, x16, [sp, #-16]!
    stp x13, x14, [sp, #-16]!
    stp x11, x12, [sp, #-16]!
    stp x9, x10, [sp, #-16]!
    stp x7, x8, [sp, #-16]!
    stp x5, x6, [sp, #-16]!
    stp x3, x4, [sp, #-16]!
    stp x1, x2, [sp, #-16]!

    mrs x3, elr_el1
    mrs x2, spsr_el1
    mrs x1, sp_el0
    stp x3, x0, [sp, #-16]!
    stp x1, x2, [sp, #-16]!

    /* Call trap(struct trapframe*). */
    mov x0, sp
    bl      intr_irq_dispatch
    b  trap_return



/* Help forkret to call trap_return in an expected way. */
usertrapret:
    /* Overlay stack pointer in trap_return. */
    mov sp, x0
    b   trap_return
