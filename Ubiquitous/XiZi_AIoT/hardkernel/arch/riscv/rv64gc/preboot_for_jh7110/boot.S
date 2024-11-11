/*
 * Copyright (c) 2020 AIIT XUOS Lab
 * XiUOS is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 *    http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */

#include <asm/csr.h>
#include "core.h"
#include "memlayout.h"

#define HCR_VALUE (1 << 31)
#define SPSR_EL2_VALUE (7 << 6) | (5 << 0)
#define SCTLR_EL1_VALUE (0x30D00800)

.section ".text", "ax"
.globl _boot_start
.globl primary_cpu_init


_boot_start:
    /* Mask all interrupts */
    csrw CSR_IE, zero
    csrw CSR_IP, zero

    csrr t0, sstatus
    srli t0, t0, 8
    andi t0, t0, 1
    beqz t0, switch_to_s_mode

    j continue_execution

    switch_to_s_mode:
    li t2, 0x100
    csrw sstatus, t2

    j continue_execution

continue_execution:
    j primary_cpu_init

primary_cpu_init:
    la t0, boot_start_addr
    la t1, boot_end_addr
    li t2, 0

clear_bss_sec:
    bge t0, t1, clear_bss_sec_done
    sb t2, 0(t0)
    addi t0, t0, 4
    j clear_bss_sec

clear_bss_sec_done:

	/* Clear BSS for flat non-ELF images */
	la a3, __bss_start
	la a4, __bss_end
	ble a4, a3, clear_bss_done
clear_bss:
	sd zero, (a3)
	add a3, a3, RISCV_SZPTR
	blt a3, a4, clear_bss

clear_bss_done:

    j bootmain

/*
.global enable_mmu_relocate
enable_mmu_relocate:
    la a2, boot_l2pgdir
    srl a2, a2, PAGE_SHIFT
    li a1, SATP_MODE
    or a2, a2, a1
    sfence.vma
    csrw CSR_SATP, a2
    ret
*/
