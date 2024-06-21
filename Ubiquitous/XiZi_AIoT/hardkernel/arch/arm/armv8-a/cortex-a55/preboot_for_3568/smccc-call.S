/*
 * Copyright (c) 2015, Linaro Limited
 *
 * SPDX-License-Identifier:	GPL-2.0
 */
.global __arm_smccc_smc
	.macro SMCCC instr
	.cfi_startproc
	\instr	#0
	ldr	x4, [sp]
	stp	x0, x1, [x4, #0]
	stp	x2, x3, [x4, #16]
	ldr	x4, [sp, #8]
	cbz	x4, 1f /* no quirk structure */
	ldr	x9, [x4, #0]
	cmp	x9, #1
	b.ne	1f
	str	x6, [x4, 8]
1:	ret
	.cfi_endproc
	.endm

/*
 * void arm_smccc_smc(unsigned long a0, unsigned long a1, unsigned long a2,
 *		  unsigned long a3, unsigned long a4, unsigned long a5,
 *		  unsigned long a6, unsigned long a7, struct arm_smccc_res *res,
 *		  struct arm_smccc_quirk *quirk)
 */
    .func __arm_smccc_smc
__arm_smccc_smc:
	SMCCC	smc
    .endfunc
    