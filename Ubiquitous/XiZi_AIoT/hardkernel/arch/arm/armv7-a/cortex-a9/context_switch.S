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
.global context_switch

context_switch:
	# store original context to stack
	str lr, [r13, #-4]!
	str r12, [r13, #-4]!
	str r11, [r13, #-4]!
	str r10, [r13, #-4]!
	str r9, [r13, #-4]!
	str r8, [r13, #-4]!
	str r7, [r13, #-4]!
	str r6, [r13, #-4]!
	str r5, [r13, #-4]!
	str r4, [r13, #-4]!

	# switch the stack
	str     r13, 	[r0]          	// save current sp to the old PCB (**old)
	mov     r13, 	r1            	// load the next stack

	# restore context from stack
	ldr r4, [r13], #4
	ldr r5, [r13], #4
	ldr r6, [r13], #4
	ldr r7, [r13], #4
	ldr r8, [r13], #4
	ldr r9, [r13], #4
	ldr r10, [r13], #4
	ldr r11, [r13], #4
	ldr r12, [r13], #4
	ldr lr, [r13], #4

	# return to the caller
	bx      lr
