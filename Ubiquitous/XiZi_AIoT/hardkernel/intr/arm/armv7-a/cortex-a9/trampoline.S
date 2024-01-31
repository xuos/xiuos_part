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
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */

/*************************************************
File name: trampoline.S.c
Description: trap in and out code
Others: 
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include "memlayout.h"

#include "core.h"

.globl trap_return 
.globl user_trap_swi_enter
.globl trap_irq_enter
.globl trap_reset_enter
.globl trap_iabort
.globl trap_dabort
.globl trap_undefined_instruction
.globl init_stack

trap_return:
	# restore context from trapframe
	ldm 	r13, 	{sp, lr}^ 
	add     r13, 	r13, #8
	ldmfd   r13!, 	{r14}         	
	ldmfd   r13!, 	{r2}          	
	msr     spsr_cxsf, r2
	ldr 	r0, [r13], #4
	ldr 	r1, [r13], #4
	ldr 	r2, [r13], #4
	ldr 	r3, [r13], #4
	ldr 	r4, [r13], #4
	ldr 	r5, [r13], #4
	ldr 	r6, [r13], #4
	ldr 	r7, [r13], #4
	ldr 	r8, [r13], #4
	ldr 	r9, [r13], #4
	ldr 	r10, [r13], #4
	ldr 	r11, [r13], #4
	ldr 	r12, [r13], #4
	ldm 	r13!, {pc}^

user_trap_swi_enter:
    # save trapframe to swi stack
    sub 	sp, sp, #56     
	str 	r14, [sp, #52]  
	str 	r12, [sp, #48] 
	str 	r11, [sp, #44] 
	str 	r10, [sp, #40]
	str 	r9, [sp, #36] 
	str 	r8, [sp, #32]  
	str 	r7, [sp, #28]  
	str 	r6, [sp, #24] 
	str 	r5, [sp, #20] 
	str 	r4, [sp, #16]
	str 	r3, [sp, #12]
	str 	r2, [sp, #8]
	str 	r1, [sp, #4]
	str 	r0, [sp]

	mrs     r2, 	spsr            
	stmfd   r13!, 	{r2}       
	stmfd   r13!, 	{r14}         	
	stmfd   r13, 	{sp, lr}^    
	sub     r13, 	r13, #8

    # call syscall handler
	mov     r0, 	r13    			
    bl		software_irq_dispatch
	b		trap_return

trap_irq_enter:
	# save context in irq stack
	sub     r14, 	r14, #4
	sub 	sp, sp, #16   
	str 	r14, [sp, #12]
	str 	r2, [sp, #8]
	str 	r1, [sp, #4] 
	str 	r0, [sp] 

	mrs     r1, 	spsr
	mov     r0, 	r13          	// irq stack stop
	add     r13,	r13, #16    	// reset IRQ stack

	# switch to the SVC mode
	mrs     r2, 	cpsr
	bic     r2, 	r2, #ARM_CPSR_MODE_MASK
	orr     r2, 	r2, #ARM_MODE_SVC
	msr     cpsr_cxsf, r2

	# build the trap frame
	ldr     r2, 	[r0, #12]
	stmfd   r13!, 	{r2}
	sub 	r13, r13, #40   
	str 	r12, [r13, #36] 
	str 	r11, [r13, #32]
	str 	r10, [r13, #28]
	str 	r9, [r13, #24]
	str 	r8, [r13, #20]
	str 	r7, [r13, #16]
	str 	r6, [r13, #12]
	str 	r5, [r13, #8]
	str 	r4, [r13, #4]
	str 	r3, [r13] 

	ldmfd   r0, 	{r3-r5}     	
	stmfd   r13!, 	{r3-r5}
	stmfd   r13!, 	{r1}  
	stmfd   r13!, 	{lr} 
	stmfd   r13, 	{sp, lr}^ 
	sub     r13, 	r13, #8

	mov     r0, 	r13           	// trapframe as parameters
	bl      intr_irq_dispatch
	b   	trap_return

trap_reset_enter:
	mov     r14, 	#0 
	sub 	r13, r13, #56
	str 	r14, [r13, #52]
	str 	r12, [r13, #48]
	str 	r11, [r13, #44]
	str 	r10, [r13, #40]
	str 	r9, [r13, #36]
	str 	r8, [r13, #32]
	str 	r7, [r13, #28]
	str 	r6, [r13, #24]
	str 	r5, [r13, #20]
	str 	r4, [r13, #16]
	str 	r3, [r13, #12]
	str 	r2, [r13, #8]
	str 	r1, [r13, #4]
	str 	r0, [r13]

	mrs     r2, 	spsr       
	stmfd   r13!, 	{r2}       	
	stmfd   r13!, 	{r14}      
	stmfd   r13, 	{sp, lr}^  
	sub     r13, 	r13, #8
	mov     r0, 	r13
	bl      _vector_jumper

trap_dabort:
	sub     r14, 	r14, #8
	sub 	r13, r13, #56
	str 	r14, [r13, #52]
	str 	r12, [r13, #48]
	str 	r11, [r13, #44]
	str 	r10, [r13, #40]
	str 	r9, [r13, #36]
	str 	r8, [r13, #32]
	str 	r7, [r13, #28]
	str 	r6, [r13, #24]
	str 	r5, [r13, #20]
	str 	r4, [r13, #16]
	str 	r3, [r13, #12]
	str 	r2, [r13, #8]
	str 	r1, [r13, #4]
	str 	r0, [r13]

	mrs     r2, 	spsr 
	stmfd   r13!, 	{r2}     
	stmfd   r13!, 	{r14} 
	stmfd   r13, 	{sp, lr}^ 
	sub     r13, 	r13, #8
	mov     r0, 	r13
	bl      dabort_handler

trap_iabort:
	sub     r14, 	r14, #4
	sub 	r13, r13, #56
	str 	r14, [r13, #52]
	str 	r12, [r13, #48]
	str 	r11, [r13, #44]
	str 	r10, [r13, #40]
	str 	r9, [r13, #36]
	str 	r8, [r13, #32]
	str 	r7, [r13, #28]
	str 	r6, [r13, #24]
	str 	r5, [r13, #20]
	str 	r4, [r13, #16]
	str 	r3, [r13, #12]
	str 	r2, [r13, #8]
	str 	r1, [r13, #4]
	str 	r0, [r13]

	mrs     r2, 	spsr
	stmfd   r13!, 	{r2}
	stmfd   r13!, 	{r14}
	stmfd   r13, 	{sp, lr}^
	sub     r13, 	r13, #8
	mov     r0, 	r13 
	bl      iabort_handler

trap_undefined_instruction:
	sub 	r13, r13, #56
	str 	r14, [r13, #52]
	str 	r12, [r13, #48]
	str 	r11, [r13, #44]
	str 	r10, [r13, #40]
	str 	r9, [r13, #36]
	str 	r8, [r13, #32]
	str 	r7, [r13, #28]
	str 	r6, [r13, #24]
	str 	r5, [r13, #20]
	str 	r4, [r13, #16]
	str 	r3, [r13, #12]
	str 	r2, [r13, #8]
	str 	r1, [r13, #4]
	str 	r0, [r13]

	mrs     r2, 	spsr 
	stmfd   r13!, 	{r2}
	stmfd   r13!, 	{r14}
	stmfd   r13, 	{sp, lr}^
	sub     r13, 	r13, #8
	mov     r0, 	r13
	bl      handle_undefined_instruction


init_stack:
	# set the stack for Other mode
	mrs     r2, 	cpsr
	bic     r2, 	r2, #ARM_CPSR_MODE_MASK
	orr     r2, 	r2, r0
	msr     cpsr_cxsf, r2

	# switch back to the SVC mode
	mov     sp, 	r1
	bic     r2, 	r2, #ARM_CPSR_MODE_MASK
	orr     r2, 	r2, #ARM_MODE_SVC
	msr     cpsr_cxsf, r2
	bx      lr