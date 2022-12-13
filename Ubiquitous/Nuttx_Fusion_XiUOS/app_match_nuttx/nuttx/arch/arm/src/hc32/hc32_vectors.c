/****************************************************************************
 * arch/arm/src/armv7-m/arm_vectors.c
 *
 *   Copyright (C) 2012 Michael Smith. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name NuttX nor the names of its contributors may be
 *    used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <nuttx/config.h>

#include "chip.h"
#include "arm_internal.h"
#include "hc32f4a0_interrupts.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

#define IDLE_STACK      ((unsigned)&_ebss+CONFIG_IDLETHREAD_STACKSIZE)

#ifndef ARMV7M_PERIPHERAL_INTERRUPTS
#  error ARMV7M_PERIPHERAL_INTERRUPTS must be defined to the number of I/O interrupts to be supported
#endif

/****************************************************************************
 * Public Functions
 ****************************************************************************/

/* Chip-specific entrypoint */

extern void __start(void);

/* Common exception entrypoint */

extern void exception_common(void);

/****************************************************************************
 * Public data
 ****************************************************************************/

/* The v7m vector table consists of an array of function pointers, with the
 * first slot (vector zero) used to hold the initial stack pointer.
 *
 * As all exceptions (interrupts) are routed via exception_common, we just
 * need to fill this array with pointers to it.
 *
 * Note that the [ ... ] designated initializer is a GCC extension.
 */

#if 0
unsigned _vectors[] locate_data(".vectors") =
{
  /* Initial stack */

  IDLE_STACK,

  /* Reset exception handler */

  (unsigned)&__start,

  /* Vectors 2 - n point directly at the generic handler */

  [2 ... (15 + ARMV7M_PERIPHERAL_INTERRUPTS)] = (unsigned)&exception_common
};
#else
unsigned _vectors[] locate_data(".vectors") =
{
  /* Initial stack */

  IDLE_STACK,

  /* Reset exception handler */

  (unsigned)&__start,
  (unsigned)&NMI_Handler,
  (unsigned)&HardFault_Handler,
  (unsigned)&MemManage_Handler,
  (unsigned)&BusFault_Handler,
  (unsigned)&UsageFault_Handler,
  (unsigned)&exception_common,
  (unsigned)&exception_common,
  (unsigned)&exception_common,
  (unsigned)&exception_common,
  (unsigned)&SVC_Handler,        /* SVC                          */
  (unsigned)&DebugMon_Handler,   /* DebugMon                     */
  (unsigned)&exception_common,
  (unsigned)&PendSV_Handler,
  (unsigned)&SysTick_Handler,    /* SysTick                      */
  (unsigned)&IRQ000_Handler,
  (unsigned)&IRQ001_Handler,
  (unsigned)&IRQ002_Handler,
  (unsigned)&IRQ003_Handler,
  (unsigned)&IRQ004_Handler,
  (unsigned)&IRQ005_Handler,
  (unsigned)&IRQ006_Handler,
  (unsigned)&IRQ007_Handler,
  (unsigned)&IRQ008_Handler,
  (unsigned)&IRQ009_Handler,
  (unsigned)&IRQ010_Handler,
  (unsigned)&IRQ011_Handler,
  (unsigned)&IRQ012_Handler,
  (unsigned)&IRQ013_Handler,
  (unsigned)&IRQ014_Handler,
  (unsigned)&IRQ015_Handler,
  (unsigned)&IRQ016_Handler,
  (unsigned)&IRQ017_Handler,
  (unsigned)&IRQ018_Handler,
  (unsigned)&IRQ019_Handler,
  (unsigned)&IRQ020_Handler,
  (unsigned)&IRQ021_Handler,
  (unsigned)&IRQ022_Handler,
  (unsigned)&IRQ023_Handler,
  (unsigned)&IRQ024_Handler,
  (unsigned)&IRQ025_Handler,
  (unsigned)&IRQ026_Handler,
  (unsigned)&IRQ027_Handler,
  (unsigned)&IRQ028_Handler,
  (unsigned)&IRQ029_Handler,
  (unsigned)&IRQ030_Handler,
  (unsigned)&IRQ031_Handler,
  (unsigned)&IRQ032_Handler,
  (unsigned)&IRQ033_Handler,
  (unsigned)&IRQ034_Handler,
  (unsigned)&IRQ035_Handler,
  (unsigned)&IRQ036_Handler,
  (unsigned)&IRQ037_Handler,
  (unsigned)&IRQ038_Handler,
  (unsigned)&IRQ039_Handler,
  (unsigned)&IRQ040_Handler,
  (unsigned)&IRQ041_Handler,
  (unsigned)&IRQ042_Handler,
  (unsigned)&IRQ043_Handler,
  (unsigned)&IRQ044_Handler,
  (unsigned)&IRQ045_Handler,
  (unsigned)&IRQ046_Handler,
  (unsigned)&IRQ047_Handler,
  (unsigned)&IRQ048_Handler,
  (unsigned)&IRQ049_Handler,
  (unsigned)&IRQ050_Handler,
  (unsigned)&IRQ051_Handler,
  (unsigned)&IRQ052_Handler,
  (unsigned)&IRQ053_Handler,
  (unsigned)&IRQ054_Handler,
  (unsigned)&IRQ055_Handler,
  (unsigned)&IRQ056_Handler,
  (unsigned)&IRQ057_Handler,
  (unsigned)&IRQ058_Handler,
  (unsigned)&IRQ059_Handler,
  (unsigned)&IRQ060_Handler,
  (unsigned)&IRQ061_Handler,
  (unsigned)&IRQ062_Handler,
  (unsigned)&IRQ063_Handler,
  (unsigned)&IRQ064_Handler,
  (unsigned)&IRQ065_Handler,
  (unsigned)&IRQ066_Handler,
  (unsigned)&IRQ067_Handler,
  (unsigned)&IRQ068_Handler,
  (unsigned)&IRQ069_Handler,
  (unsigned)&IRQ070_Handler,
  (unsigned)&IRQ071_Handler,
  (unsigned)&IRQ072_Handler,
  (unsigned)&IRQ073_Handler,
  (unsigned)&IRQ074_Handler,
  (unsigned)&IRQ075_Handler,
  (unsigned)&IRQ076_Handler,
  (unsigned)&IRQ077_Handler,
  (unsigned)&IRQ078_Handler,
  (unsigned)&IRQ079_Handler,
  (unsigned)&IRQ080_Handler,
  (unsigned)&IRQ081_Handler,
  (unsigned)&IRQ082_Handler,
  (unsigned)&IRQ083_Handler,
  (unsigned)&IRQ084_Handler,
  (unsigned)&IRQ085_Handler,
  (unsigned)&IRQ086_Handler,
  (unsigned)&IRQ087_Handler,
  (unsigned)&IRQ088_Handler,
  (unsigned)&IRQ089_Handler,
  (unsigned)&IRQ090_Handler,
  (unsigned)&IRQ091_Handler,
  (unsigned)&IRQ092_Handler,
  (unsigned)&IRQ093_Handler,
  (unsigned)&IRQ094_Handler,
  (unsigned)&IRQ095_Handler,
  (unsigned)&IRQ096_Handler,
  (unsigned)&IRQ097_Handler,
  (unsigned)&IRQ098_Handler,
  (unsigned)&IRQ099_Handler,
  (unsigned)&IRQ100_Handler,
  (unsigned)&IRQ101_Handler,
  (unsigned)&IRQ102_Handler,
  (unsigned)&IRQ103_Handler,
  (unsigned)&IRQ104_Handler,
  (unsigned)&IRQ105_Handler,
  (unsigned)&IRQ106_Handler,
  (unsigned)&IRQ107_Handler,
  (unsigned)&IRQ108_Handler,
  (unsigned)&IRQ109_Handler,
  (unsigned)&IRQ110_Handler,
  (unsigned)&IRQ111_Handler,
  (unsigned)&IRQ112_Handler,
  (unsigned)&IRQ113_Handler,
  (unsigned)&IRQ114_Handler,
  (unsigned)&IRQ115_Handler,
  (unsigned)&IRQ116_Handler,
  (unsigned)&IRQ117_Handler,
  (unsigned)&IRQ118_Handler,
  (unsigned)&IRQ119_Handler,
  (unsigned)&IRQ120_Handler,
  (unsigned)&IRQ121_Handler,
  (unsigned)&IRQ122_Handler,
  (unsigned)&IRQ123_Handler,
  (unsigned)&IRQ124_Handler,
  (unsigned)&IRQ125_Handler,
  (unsigned)&IRQ126_Handler,
  (unsigned)&IRQ127_Handler,
  (unsigned)&IRQ128_Handler,
  (unsigned)&IRQ129_Handler,
  (unsigned)&IRQ130_Handler,
  (unsigned)&IRQ131_Handler,
  (unsigned)&IRQ132_Handler,
  (unsigned)&IRQ133_Handler,
  (unsigned)&IRQ134_Handler,
  (unsigned)&IRQ135_Handler,
  (unsigned)&IRQ136_Handler,
  (unsigned)&IRQ137_Handler,
  (unsigned)&IRQ138_Handler,
  (unsigned)&IRQ139_Handler,
  (unsigned)&IRQ140_Handler,
  (unsigned)&IRQ141_Handler,
  (unsigned)&IRQ142_Handler,
  (unsigned)&IRQ143_Handler

//  [2 ... (15 + ARMV7M_PERIPHERAL_INTERRUPTS)] = (unsigned)&exception_common
};
#endif
