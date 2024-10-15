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

.macro savereg

.endm

.macro restorereg

.endm

.macro usavereg

.endm

.macro urestorereg

.endm


.global alltraps
.balign 0x800
alltraps:
// Current EL with sp0
  j badtrap
.balign 0x80
  j badtrap
.balign 0x80
  j badtrap
.balign 0x80
  j badtrap

// Current EL with spx
.balign 0x80
  j el1sync
.balign 0x80
  j el1irq
.balign 0x80
  j badtrap
.balign 0x80
  j badtrap

// Lower EL using aarch64
.balign 0x80
  j el0sync
.balign 0x80
  j el0irq
.balign 0x80
  j badtrap
.balign 0x80
  j badtrap

// Lower EL using aarch32
.balign 0x80
  j badtrap
.balign 0x80
  j badtrap
.balign 0x80
  j badtrap
.balign 0x80
  j badtrap

badtrap:
        j   .

el1sync:
        j   .
      
el1irq:
        ret
      
el0sync:

        ret

el0irq:
        jal intr_irq_dispatch
      
.global trap_return
trap_return:
        ret
