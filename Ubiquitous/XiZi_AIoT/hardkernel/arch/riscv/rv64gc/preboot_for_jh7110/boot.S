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

/* #include <asm/csr.h> */
#include "core.h"

#define HCR_VALUE (1 << 31)
#define SPSR_EL2_VALUE (7 << 6) | (5 << 0)
#define SCTLR_EL1_VALUE (0x30D00800)

.section ".text", "ax"
.globl _boot_start
.globl primary_cpu_init


_boot_start:
    j primary_cpu_init
    j .

primary_cpu_init:
    la t0, boot_start_addr
    la t1, boot_end_addr
    li t2, 0
  
clear_loop:
    bge t0, t1, clear_done
    sb t2, 0(t0)
    addi t0, t0, 4
    j clear_loop
  
clear_done:
    j bootmain
