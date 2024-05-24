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
.global init_stack

trap_return:
    // Restore registers
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
    // Build trapframe. 
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

    //Call trap(struct trapframe*)
    mov x0, sp
    bl      intr_irq_dispatch
    b  trap_return



// Help forkret to call trap_return in an expected way
//usertrapret:
    // Overlay stack pointer in trap_return
//    mov sp, x0
//    b   trap_return


init_stack:
    mrs     x2,  spsr_el1
    bic     x2,  x2, #SPSR_MODE_MASK
    orr     x2,  x2, x0
    msr     spsr_el1, x2
    mov     sp,  x1
    bic     x2,  x2, #SPSR_MODE_MASK
    orr     x2,  x2, #ARM_MODE_EL1_t
    msr     spsr_el1, x2
    ret

.section ".text"

.macro savereg
        msr daifset, #0xf
        // make room to save registers.
        sub sp, sp, #272

        // save the registers.
        stp x0, x1, [sp, #16 * 0]
        stp x2, x3, [sp, #16 * 1]
        stp x4, x5, [sp, #16 * 2]
        stp x6, x7, [sp, #16 * 3]
        stp x8, x9, [sp, #16 * 4]
        stp x10, x11, [sp, #16 * 5]
        stp x12, x13, [sp, #16 * 6]
        stp x14, x15, [sp, #16 * 7]
        stp x16, x17, [sp, #16 * 8]
        stp x18, x19, [sp, #16 * 9]
        stp x20, x21, [sp, #16 * 10]
        stp x22, x23, [sp, #16 * 11]
        stp x24, x25, [sp, #16 * 12]
        stp x26, x27, [sp, #16 * 13]
        stp x28, x29, [sp, #16 * 14]
        mrs x9, elr_el1
        mrs x10, spsr_el1
        add x11, sp, #272
        stp x30, x9, [sp, #16 * 15]
        stp x10, x11, [sp, #16 * 16]
.endm

.macro restorereg
        ldp x30, x9, [sp, #16 * 15]
        ldp x10, x11, [sp, #16 * 16]

        msr elr_el1, x9
        msr spsr_el1, x10

        ldp x0, x1, [sp, #16 * 0]
        ldp x2, x3, [sp, #16 * 1]
        ldp x4, x5, [sp, #16 * 2]
        ldp x6, x7, [sp, #16 * 3]
        ldp x8, x9, [sp, #16 * 4]
        ldp x10, x11, [sp, #16 * 5]
        ldp x12, x13, [sp, #16 * 6]
        ldp x14, x15, [sp, #16 * 7]
        ldp x16, x17, [sp, #16 * 8]
        ldp x18, x19, [sp, #16 * 9]
        ldp x20, x21, [sp, #16 * 10]
        ldp x22, x23, [sp, #16 * 11]
        ldp x24, x25, [sp, #16 * 12]
        ldp x26, x27, [sp, #16 * 13]
        ldp x28, x29, [sp, #16 * 14]
        add sp, sp, #272
.endm

.macro usavereg
        msr daifset, #0xf
        sub sp, sp, #272

        stp x0, x1, [sp, #16 * 0]
        stp x2, x3, [sp, #16 * 1]
        stp x4, x5, [sp, #16 * 2]
        stp x6, x7, [sp, #16 * 3]
        stp x8, x9, [sp, #16 * 4]
        stp x10, x11, [sp, #16 * 5]
        stp x12, x13, [sp, #16 * 6]
        stp x14, x15, [sp, #16 * 7]
        stp x16, x17, [sp, #16 * 8]
        stp x18, x19, [sp, #16 * 9]
        stp x20, x21, [sp, #16 * 10]
        stp x22, x23, [sp, #16 * 11]
        stp x24, x25, [sp, #16 * 12]
        stp x26, x27, [sp, #16 * 13]
        stp x28, x29, [sp, #16 * 14]

        mrs x9, elr_el1
        mrs x10, spsr_el1
        mrs x11, sp_el0

        stp x30, x9, [sp, #16 * 15]
        stp x10, x11, [sp, #16 * 16]
.endm

.macro urestorereg
        ldp x30, x9, [sp, #16 * 15]
        ldp x10, x11, [sp, #16 * 16]

        msr elr_el1, x9
        msr spsr_el1, x10
        msr sp_el0, x11

        ldp x0, x1, [sp, #16 * 0]
        ldp x2, x3, [sp, #16 * 1]
        ldp x4, x5, [sp, #16 * 2]
        ldp x6, x7, [sp, #16 * 3]
        ldp x8, x9, [sp, #16 * 4]
        ldp x10, x11, [sp, #16 * 5]
        ldp x12, x13, [sp, #16 * 6]
        ldp x14, x15, [sp, #16 * 7]
        ldp x16, x17, [sp, #16 * 8]
        ldp x18, x19, [sp, #16 * 9]
        ldp x20, x21, [sp, #16 * 10]
        ldp x22, x23, [sp, #16 * 11]
        ldp x24, x25, [sp, #16 * 12]
        ldp x26, x27, [sp, #16 * 13]
        ldp x28, x29, [sp, #16 * 14]

        add sp, sp, #272
.endm


.global alltraps
.balign 0x800
alltraps:
// Current EL with sp0
  b .
.balign 0x80
  b .
.balign 0x80
  b .
.balign 0x80
  b .

// Current EL with spx
.balign 0x80
  b el1sync
.balign 0x80
  b el1irq
.balign 0x80
  b .
.balign 0x80
  b .

// Lower EL using aarch64
.balign 0x80
  b el0sync
.balign 0x80
  b el0irq
.balign 0x80
  b .
.balign 0x80
  b .

// Lower EL using aarch32
.balign 0x80
  b .
.balign 0x80
  b .
.balign 0x80
  b .
.balign 0x80
  b .

el1sync:
        savereg
        
        mov x0, sp
        bl kernel_abort_handler 
      
        restorereg
      
        eret
el1irq:
        savereg
        
        mov x0, sp
        # this should never happen by design
        bl kernel_intr_handler
      
        restorereg
      
        eret
      
el0sync:
        usavereg
      
        mov x0, sp
        bl syscall_arch_handler
      
        urestorereg
      
        eret
el0irq:
        usavereg
      
        mov x0, sp
        bl intr_irq_dispatch
      
trapret:
        urestorereg

        eret

.global usertrapret
usertrapret:
        mov sp, x0
        b trapret
