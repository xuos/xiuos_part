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
#include "core.h"

#define HCR_VALUE (1 << 31)
#define SPSR_EL2_VALUE (7 << 6) | (5 << 0)
#define SCTLR_EL1_VALUE (0x30D00800)

.section ".text", "ax"
.globl _boot_start
.globl primary_cpu_init


_boot_start:

    j     primary_cpu_init

    j      .

primary_cpu_init:

    j bootmain



