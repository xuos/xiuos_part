/****************************************************************************
 * arch/arm/src/hc32/hc32_irq.c
 *
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.  The
 * ASF licenses this file to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <nuttx/config.h>

#include <inttypes.h>
#include <stdint.h>
#include <assert.h>
#include <debug.h>

#include <nuttx/irq.h>
#include <nuttx/arch.h>
#include <arch/irq.h>
#include <arch/armv7-m/nvicpri.h>

#include "nvic.h"
#ifdef CONFIG_ARCH_RAMVECTORS
#  include "ram_vectors.h"
#endif
#include "arm_internal.h"
#include "hc32f4a0.h"
#include "hc32f4a0_interrupts.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

/* Get a 32-bit version of the default priority */

#define DEFPRIORITY32 \
  (NVIC_SYSH_PRIORITY_DEFAULT << 24 | \
   NVIC_SYSH_PRIORITY_DEFAULT << 16 | \
   NVIC_SYSH_PRIORITY_DEFAULT << 8  | \
   NVIC_SYSH_PRIORITY_DEFAULT)

/* Given the address of a NVIC ENABLE register, this is the offset to
 * the corresponding CLEAR ENABLE register.
 */

#define NVIC_ENA_OFFSET    (0)
#define NVIC_CLRENA_OFFSET (NVIC_IRQ0_31_CLEAR - NVIC_IRQ0_31_ENABLE)

/****************************************************************************
 * Public Data
 ****************************************************************************/

/* g_current_regs[] holds a references to the current interrupt level
 * register storage structure.  If is non-NULL only during interrupt
 * processing.  Access to g_current_regs[] must be through the macro
 * CURRENT_REGS for portability.
 */

volatile uint32_t *g_current_regs[1];

/* This is the address of the  exception vector table (determined by the
 * linker script).
 */

#if defined(__ICCARM__)
/* _vectors replaced on __vector_table for IAR C-SPY Simulator */

extern uint32_t __vector_table[];
#else
extern uint32_t _vectors[];
#endif

/****************************************************************************
 * Private Functions
 ****************************************************************************/

/****************************************************************************
 * Name: hc32_dumpnvic
 *
 * Description:
 *   Dump some interesting NVIC registers
 *
 ****************************************************************************/

#if defined(CONFIG_DEBUG_IRQ_INFO)
static void hc32_dumpnvic(const char *msg, int irq)
{
  irqstate_t flags;

  flags = enter_critical_section();

  irqinfo("NVIC (%s, irq=%d):\n", msg, irq);
  irqinfo("  INTCTRL:    %08x VECTAB:  %08x\n",
          getreg32(NVIC_INTCTRL), getreg32(NVIC_VECTAB));
#if 0
  irqinfo("  SYSH ENABLE MEMFAULT: %08x BUSFAULT: %08x USGFAULT: %08x "
          "SYSTICK: %08x\n",
          getreg32(NVIC_SYSHCON_MEMFAULTENA),
          getreg32(NVIC_SYSHCON_BUSFAULTENA),
          getreg32(NVIC_SYSHCON_USGFAULTENA),
          getreg32(NVIC_SYSTICK_CTRL_ENABLE));
#endif
  irqinfo("  IRQ ENABLE: %08x %08x %08x\n",
          getreg32(NVIC_IRQ0_31_ENABLE),
          getreg32(NVIC_IRQ32_63_ENABLE),
          getreg32(NVIC_IRQ64_95_ENABLE));
  irqinfo("  SYSH_PRIO:  %08x %08x %08x\n",
          getreg32(NVIC_SYSH4_7_PRIORITY),
          getreg32(NVIC_SYSH8_11_PRIORITY),
          getreg32(NVIC_SYSH12_15_PRIORITY));
  irqinfo("  IRQ PRIO:   %08x %08x %08x %08x\n",
          getreg32(NVIC_IRQ0_3_PRIORITY),
          getreg32(NVIC_IRQ4_7_PRIORITY),
          getreg32(NVIC_IRQ8_11_PRIORITY),
          getreg32(NVIC_IRQ12_15_PRIORITY));
  irqinfo("              %08x %08x %08x %08x\n",
          getreg32(NVIC_IRQ16_19_PRIORITY),
          getreg32(NVIC_IRQ20_23_PRIORITY),
          getreg32(NVIC_IRQ24_27_PRIORITY),
          getreg32(NVIC_IRQ28_31_PRIORITY));
  irqinfo("              %08x %08x %08x %08x\n",
          getreg32(NVIC_IRQ32_35_PRIORITY),
          getreg32(NVIC_IRQ36_39_PRIORITY),
          getreg32(NVIC_IRQ40_43_PRIORITY),
          getreg32(NVIC_IRQ44_47_PRIORITY));
  irqinfo("              %08x %08x %08x %08x\n",
          getreg32(NVIC_IRQ48_51_PRIORITY),
          getreg32(NVIC_IRQ52_55_PRIORITY),
          getreg32(NVIC_IRQ56_59_PRIORITY),
          getreg32(NVIC_IRQ60_63_PRIORITY));
  irqinfo("              %08x\n",
          getreg32(NVIC_IRQ64_67_PRIORITY));

  leave_critical_section(flags);
}
#else
#  define hc32_dumpnvic(msg, irq)
#endif

/****************************************************************************
 * Name: hc32_nmi, hc32_busfault, hc32_usagefault, hc32_pendsv,
 *       hc32_dbgmonitor, hc32_pendsv, hc32_reserved
 *
 * Description:
 *   Handlers for various exceptions.  None are handled and all are fatal
 *   error conditions.  The only advantage these provided over the default
 *   unexpected interrupt handler is that they provide a diagnostic output.
 *
 ****************************************************************************/


static int hc32_svc(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! SVC received\n");
  PANIC();
#endif
  SVC_Handler();
  return 0;
}

static int hc32_hardfault(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! HardFault received\n");
  PANIC();
#endif
  HardFault_Handler();
  return 0;
}

#ifdef CONFIG_DEBUG_FEATURES
static int hc32_nmi(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! NMI received\n");
  PANIC();
#endif
  NMI_Handler();
  return 0;
}

#ifdef CONFIG_ARM_MPU

static int hc32_memfault(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! MemFault received\n");
  PANIC();
#endif
  MemManage_Handler();
  return 0;
}

static int hc32_busfault(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! Bus fault received: %08" PRIx32 "\n",
       getreg32(NVIC_CFAULTS));
  PANIC();
#endif
  BusFault_Handler();
  return 0;
}

static int hc32_usagefault(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! Usage fault received: %08" PRIx32 "\n",
       getreg32(NVIC_CFAULTS));
  PANIC();
#endif
  UsageFault_Handler();
  return 0;
}

static int hc32_pendsv(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! PendSV received\n");
  PANIC();
#endif
  PendSV_Handler();
  return 0;
}

static int hc32_dbgmonitor(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! Debug Monitor received\n");
  PANIC();
#endif
  DebugMon_Handler();
  return 0;
}

static int hc32_reserved(int irq, FAR void *context, FAR void *arg)
{
  up_irq_save();
#ifdef CONFIG_DEBUG_FEATURES
  _err("PANIC!!! Reserved interrupt\n");
  PANIC();
#endif
  return 0;
}
#endif
#endif
static int hc32_irq000(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ000_Handler();
    return 0;
}

static int hc32_irq001(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ001_Handler();
    return 0;
}

static int hc32_irq002(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ002_Handler();
    return 0;
}

static int hc32_irq003(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ003_Handler();
    return 0;
}

static int hc32_irq004(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ004_Handler();
    return 0;
}

static int hc32_irq005(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ005_Handler();
    return 0;
}

static int hc32_irq006(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ006_Handler();
    return 0;
}

static int hc32_irq007(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ007_Handler();
    return 0;
}

static int hc32_irq008(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ008_Handler();
    return 0;
}

static int hc32_irq009(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ009_Handler();
    return 0;
}

static int hc32_irq010(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ010_Handler();
    return 0;
}

static int hc32_irq011(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ011_Handler();
    return 0;
}

static int hc32_irq012(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ012_Handler();
    return 0;
}

static int hc32_irq013(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ013_Handler();
    return 0;
}

static int hc32_irq014(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ014_Handler();
    return 0;
}

static int hc32_irq015(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ015_Handler();
    return 0;
}

static int hc32_irq016(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ016_Handler();
    return 0;
}

static int hc32_irq017(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ017_Handler();
    return 0;
}

static int hc32_irq018(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ018_Handler();
    return 0;
}

static int hc32_irq019(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ019_Handler();
    return 0;
}

static int hc32_irq020(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ020_Handler();
    return 0;
}

static int hc32_irq021(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ021_Handler();
    return 0;
}

static int hc32_irq022(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ022_Handler();
    return 0;
}

static int hc32_irq023(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ023_Handler();
    return 0;
}

static int hc32_irq024(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ024_Handler();
    return 0;
}

static int hc32_irq025(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ025_Handler();
    return 0;
}

static int hc32_irq026(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ026_Handler();
    return 0;
}

static int hc32_irq027(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ027_Handler();
    return 0;
}

static int hc32_irq028(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ028_Handler();
    return 0;
}

static int hc32_irq029(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ029_Handler();
    return 0;
}

static int hc32_irq030(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ030_Handler();
    return 0;
}

static int hc32_irq031(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ031_Handler();
    return 0;
}

static int hc32_irq032(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ032_Handler();
    return 0;
}

static int hc32_irq033(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ033_Handler();
    return 0;
}

static int hc32_irq034(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ034_Handler();
    return 0;
}

static int hc32_irq035(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ035_Handler();
    return 0;
}

static int hc32_irq036(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ036_Handler();
    return 0;
}

static int hc32_irq037(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ037_Handler();
    return 0;
}

static int hc32_irq038(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ038_Handler();
    return 0;
}

static int hc32_irq039(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ039_Handler();
    return 0;
}

static int hc32_irq040(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ040_Handler();
    return 0;
}

static int hc32_irq041(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ041_Handler();
    return 0;
}

static int hc32_irq042(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ042_Handler();
    return 0;
}

static int hc32_irq043(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ043_Handler();
    return 0;
}

static int hc32_irq044(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ044_Handler();
    return 0;
}

static int hc32_irq045(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ045_Handler();
    return 0;
}

static int hc32_irq046(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ046_Handler();
    return 0;
}

static int hc32_irq047(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ047_Handler();
    return 0;
}

static int hc32_irq048(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ048_Handler();
    return 0;
}

static int hc32_irq049(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ049_Handler();
    return 0;
}

static int hc32_irq050(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ050_Handler();
    return 0;
}

static int hc32_irq051(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ051_Handler();
    return 0;
}

static int hc32_irq052(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ052_Handler();
    return 0;
}

static int hc32_irq053(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ053_Handler();
    return 0;
}

static int hc32_irq054(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ054_Handler();
    return 0;
}

static int hc32_irq055(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ055_Handler();
    return 0;
}

static int hc32_irq056(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ056_Handler();
    return 0;
}

static int hc32_irq057(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ057_Handler();
    return 0;
}

static int hc32_irq058(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ058_Handler();
    return 0;
}

static int hc32_irq059(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ059_Handler();
    return 0;
}

static int hc32_irq060(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ060_Handler();
    return 0;
}

static int hc32_irq061(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ061_Handler();
    return 0;
}

static int hc32_irq062(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ062_Handler();
    return 0;
}

static int hc32_irq063(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ063_Handler();
    return 0;
}

static int hc32_irq064(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ064_Handler();
    return 0;
}

static int hc32_irq065(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ065_Handler();
    return 0;
}

static int hc32_irq066(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ066_Handler();
    return 0;
}

static int hc32_irq067(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ067_Handler();
    return 0;
}

static int hc32_irq068(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ068_Handler();
    return 0;
}

static int hc32_irq069(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ069_Handler();
    return 0;
}

static int hc32_irq070(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ070_Handler();
    return 0;
}

static int hc32_irq071(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ071_Handler();
    return 0;
}

static int hc32_irq072(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ072_Handler();
    return 0;
}

static int hc32_irq073(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ073_Handler();
    return 0;
}

static int hc32_irq074(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ074_Handler();
    return 0;
}

static int hc32_irq075(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ075_Handler();
    return 0;
}

static int hc32_irq076(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ076_Handler();
    return 0;
}

static int hc32_irq077(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ077_Handler();
    return 0;
}

static int hc32_irq078(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ078_Handler();
    return 0;
}

static int hc32_irq079(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ079_Handler();
    return 0;
}

static int hc32_irq080(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ080_Handler();
    return 0;
}

static int hc32_irq081(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ081_Handler();
    return 0;
}

static int hc32_irq082(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ082_Handler();
    return 0;
}

static int hc32_irq083(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ083_Handler();
    return 0;
}

static int hc32_irq084(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ084_Handler();
    return 0;
}

static int hc32_irq085(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ085_Handler();
    return 0;
}

static int hc32_irq086(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ086_Handler();
    return 0;
}

static int hc32_irq087(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ087_Handler();
    return 0;
}

static int hc32_irq088(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ088_Handler();
    return 0;
}

static int hc32_irq089(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ089_Handler();
    return 0;
}

static int hc32_irq090(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ090_Handler();
    return 0;
}

static int hc32_irq091(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ091_Handler();
    return 0;
}

static int hc32_irq092(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ092_Handler();
    return 0;
}

static int hc32_irq093(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ093_Handler();
    return 0;
}

static int hc32_irq094(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ094_Handler();
    return 0;
}

static int hc32_irq095(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ095_Handler();
    return 0;
}

static int hc32_irq096(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ096_Handler();
    return 0;
}

static int hc32_irq097(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ097_Handler();
    return 0;
}

static int hc32_irq098(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ098_Handler();
    return 0;
}

static int hc32_irq099(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ099_Handler();
    return 0;
}

static int hc32_irq100(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ100_Handler();
    return 0;
}

static int hc32_irq101(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ101_Handler();
    return 0;
}

static int hc32_irq102(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ102_Handler();
    return 0;
}

static int hc32_irq103(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ103_Handler();
    return 0;
}

static int hc32_irq104(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ104_Handler();
    return 0;
}

static int hc32_irq105(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ105_Handler();
    return 0;
}

static int hc32_irq106(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ106_Handler();
    return 0;
}

static int hc32_irq107(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ107_Handler();
    return 0;
}

static int hc32_irq108(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ108_Handler();
    return 0;
}

static int hc32_irq109(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ109_Handler();
    return 0;
}

static int hc32_irq110(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ110_Handler();
    return 0;
}

static int hc32_irq111(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ111_Handler();
    return 0;
}

static int hc32_irq112(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ112_Handler();
    return 0;
}

static int hc32_irq113(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ113_Handler();
    return 0;
}

static int hc32_irq114(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ114_Handler();
    return 0;
}

static int hc32_irq115(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ115_Handler();
    return 0;
}

static int hc32_irq116(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ116_Handler();
    return 0;
}

static int hc32_irq117(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ117_Handler();
    return 0;
}

static int hc32_irq118(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ118_Handler();
    return 0;
}

static int hc32_irq119(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ119_Handler();
    return 0;
}

static int hc32_irq120(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ120_Handler();
    return 0;
}

static int hc32_irq121(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ121_Handler();
    return 0;
}

static int hc32_irq122(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ122_Handler();
    return 0;
}

static int hc32_irq123(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ123_Handler();
    return 0;
}

static int hc32_irq124(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ124_Handler();
    return 0;
}

static int hc32_irq125(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ125_Handler();
    return 0;
}

static int hc32_irq126(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ126_Handler();
    return 0;
}

static int hc32_irq127(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ127_Handler();
    return 0;
}

static int hc32_irq128(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ128_Handler();
    return 0;
}

static int hc32_irq129(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ129_Handler();
    return 0;
}

static int hc32_irq130(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ130_Handler();
    return 0;
}

static int hc32_irq131(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ131_Handler();
    return 0;
}

static int hc32_irq132(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ132_Handler();
    return 0;
}

static int hc32_irq133(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ133_Handler();
    return 0;
}

static int hc32_irq134(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ134_Handler();
    return 0;
}

static int hc32_irq135(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ135_Handler();
    return 0;
}

static int hc32_irq136(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ136_Handler();
    return 0;
}

static int hc32_irq137(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ137_Handler();
    return 0;
}

static int hc32_irq138(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ138_Handler();
    return 0;
}

static int hc32_irq139(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ139_Handler();
    return 0;
}

static int hc32_irq140(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ140_Handler();
    return 0;
}

static int hc32_irq141(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ141_Handler();
    return 0;
}

static int hc32_irq142(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ142_Handler();
    return 0;
}

static int hc32_irq143(int irq, FAR void *context, FAR void *arg)
{
    up_irq_save();
    IRQ143_Handler();
    return 0;
}


/****************************************************************************
 * Name: hc32_prioritize_syscall
 *
 * Description:
 *   Set the priority of an exception.  This function may be needed
 *   internally even if support for prioritized interrupts is not enabled.
 *
 ****************************************************************************/

#ifdef CONFIG_ARMV7M_USEBASEPRI
static inline void hc32_prioritize_syscall(int priority)
{
  uint32_t regval;

  /* SVCALL is system handler 11 */

  regval  = getreg32(NVIC_SYSH8_11_PRIORITY);
  regval &= ~NVIC_SYSH_PRIORITY_PR11_MASK;
  regval |= (priority << NVIC_SYSH_PRIORITY_PR11_SHIFT);
  putreg32(regval, NVIC_SYSH8_11_PRIORITY);
}
#endif

/****************************************************************************
 * Name: hc32_irqinfo
 *
 * Description:
 *   Given an IRQ number, provide the register and bit setting to enable or
 *   disable the irq.
 *
 ****************************************************************************/

static int hc32_irqinfo(int irq, uintptr_t *regaddr, uint32_t *bit,
                         uintptr_t offset)
{
  int n;

  DEBUGASSERT(irq >= HC32_IRQ_NMI && irq < NR_IRQS);

  /* Check for external interrupt */

  if (irq >= HC32_IRQ_FIRST)
    {
      n        = irq - HC32_IRQ_FIRST;
      *regaddr = NVIC_IRQ_ENABLE(n) + offset;
      *bit     = (uint32_t)1 << (n & 0x1f);
    }

  /* Handle processor exceptions.  Only a few can be disabled */

  else
    {
      *regaddr = NVIC_SYSHCON;
      if (irq == HC32_IRQ_MEMFAULT)
        {
          *bit = NVIC_SYSHCON_MEMFAULTENA;
        }
      else if (irq == HC32_IRQ_BUSFAULT)
        {
          *bit = NVIC_SYSHCON_BUSFAULTENA;
        }
      else if (irq == HC32_IRQ_USAGEFAULT)
        {
          *bit = NVIC_SYSHCON_USGFAULTENA;
        }
      else if (irq == HC32_IRQ_SYSTICK)
        {
          *regaddr = NVIC_SYSTICK_CTRL;
          *bit = NVIC_SYSTICK_CTRL_ENABLE;
        }
      else
        {
          return ERROR; /* Invalid or unsupported exception */
        }
    }

  return OK;
}

/****************************************************************************
 * Public Functions
 ****************************************************************************/

void hc32_attach_irqs(void)
{
    irq_attach(HC32_IRQ_FIRST + Int000_IRQn, hc32_irq000, NULL);
    irq_attach(HC32_IRQ_FIRST + Int001_IRQn, hc32_irq001, NULL);
    irq_attach(HC32_IRQ_FIRST + Int002_IRQn, hc32_irq002, NULL);
    irq_attach(HC32_IRQ_FIRST + Int003_IRQn, hc32_irq003, NULL);
    irq_attach(HC32_IRQ_FIRST + Int004_IRQn, hc32_irq004, NULL);
    irq_attach(HC32_IRQ_FIRST + Int005_IRQn, hc32_irq005, NULL);
    irq_attach(HC32_IRQ_FIRST + Int006_IRQn, hc32_irq006, NULL);
    irq_attach(HC32_IRQ_FIRST + Int007_IRQn, hc32_irq007, NULL);
    irq_attach(HC32_IRQ_FIRST + Int008_IRQn, hc32_irq008, NULL);
    irq_attach(HC32_IRQ_FIRST + Int009_IRQn, hc32_irq009, NULL);

    irq_attach(HC32_IRQ_FIRST + Int010_IRQn, hc32_irq010, NULL);
    irq_attach(HC32_IRQ_FIRST + Int011_IRQn, hc32_irq011, NULL);
    irq_attach(HC32_IRQ_FIRST + Int012_IRQn, hc32_irq012, NULL);
    irq_attach(HC32_IRQ_FIRST + Int013_IRQn, hc32_irq013, NULL);
    irq_attach(HC32_IRQ_FIRST + Int014_IRQn, hc32_irq014, NULL);
    irq_attach(HC32_IRQ_FIRST + Int015_IRQn, hc32_irq015, NULL);
    irq_attach(HC32_IRQ_FIRST + Int016_IRQn, hc32_irq016, NULL);
    irq_attach(HC32_IRQ_FIRST + Int017_IRQn, hc32_irq017, NULL);
    irq_attach(HC32_IRQ_FIRST + Int018_IRQn, hc32_irq018, NULL);
    irq_attach(HC32_IRQ_FIRST + Int019_IRQn, hc32_irq019, NULL);

    irq_attach(HC32_IRQ_FIRST + Int020_IRQn, hc32_irq020, NULL);
    irq_attach(HC32_IRQ_FIRST + Int021_IRQn, hc32_irq021, NULL);
    irq_attach(HC32_IRQ_FIRST + Int022_IRQn, hc32_irq022, NULL);
    irq_attach(HC32_IRQ_FIRST + Int023_IRQn, hc32_irq023, NULL);
    irq_attach(HC32_IRQ_FIRST + Int024_IRQn, hc32_irq024, NULL);
    irq_attach(HC32_IRQ_FIRST + Int025_IRQn, hc32_irq025, NULL);
    irq_attach(HC32_IRQ_FIRST + Int026_IRQn, hc32_irq026, NULL);
    irq_attach(HC32_IRQ_FIRST + Int027_IRQn, hc32_irq027, NULL);
    irq_attach(HC32_IRQ_FIRST + Int028_IRQn, hc32_irq028, NULL);
    irq_attach(HC32_IRQ_FIRST + Int029_IRQn, hc32_irq029, NULL);

    irq_attach(HC32_IRQ_FIRST + Int030_IRQn, hc32_irq030, NULL);
    irq_attach(HC32_IRQ_FIRST + Int031_IRQn, hc32_irq031, NULL);
    irq_attach(HC32_IRQ_FIRST + Int032_IRQn, hc32_irq032, NULL);
    irq_attach(HC32_IRQ_FIRST + Int033_IRQn, hc32_irq033, NULL);
    irq_attach(HC32_IRQ_FIRST + Int034_IRQn, hc32_irq034, NULL);
    irq_attach(HC32_IRQ_FIRST + Int035_IRQn, hc32_irq035, NULL);
    irq_attach(HC32_IRQ_FIRST + Int036_IRQn, hc32_irq036, NULL);
    irq_attach(HC32_IRQ_FIRST + Int037_IRQn, hc32_irq037, NULL);
    irq_attach(HC32_IRQ_FIRST + Int038_IRQn, hc32_irq038, NULL);
    irq_attach(HC32_IRQ_FIRST + Int039_IRQn, hc32_irq039, NULL);

    irq_attach(HC32_IRQ_FIRST + Int040_IRQn, hc32_irq040, NULL);
    irq_attach(HC32_IRQ_FIRST + Int041_IRQn, hc32_irq041, NULL);
    irq_attach(HC32_IRQ_FIRST + Int042_IRQn, hc32_irq042, NULL);
    irq_attach(HC32_IRQ_FIRST + Int043_IRQn, hc32_irq043, NULL);
    irq_attach(HC32_IRQ_FIRST + Int044_IRQn, hc32_irq044, NULL);
    irq_attach(HC32_IRQ_FIRST + Int045_IRQn, hc32_irq045, NULL);
    irq_attach(HC32_IRQ_FIRST + Int046_IRQn, hc32_irq046, NULL);
    irq_attach(HC32_IRQ_FIRST + Int047_IRQn, hc32_irq047, NULL);
    irq_attach(HC32_IRQ_FIRST + Int048_IRQn, hc32_irq048, NULL);
    irq_attach(HC32_IRQ_FIRST + Int049_IRQn, hc32_irq049, NULL);

    irq_attach(HC32_IRQ_FIRST + Int050_IRQn, hc32_irq050, NULL);
    irq_attach(HC32_IRQ_FIRST + Int051_IRQn, hc32_irq051, NULL);
    irq_attach(HC32_IRQ_FIRST + Int052_IRQn, hc32_irq052, NULL);
    irq_attach(HC32_IRQ_FIRST + Int053_IRQn, hc32_irq053, NULL);
    irq_attach(HC32_IRQ_FIRST + Int054_IRQn, hc32_irq054, NULL);
    irq_attach(HC32_IRQ_FIRST + Int055_IRQn, hc32_irq055, NULL);
    irq_attach(HC32_IRQ_FIRST + Int056_IRQn, hc32_irq056, NULL);
    irq_attach(HC32_IRQ_FIRST + Int057_IRQn, hc32_irq057, NULL);
    irq_attach(HC32_IRQ_FIRST + Int058_IRQn, hc32_irq058, NULL);
    irq_attach(HC32_IRQ_FIRST + Int059_IRQn, hc32_irq059, NULL);

    irq_attach(HC32_IRQ_FIRST + Int060_IRQn, hc32_irq060, NULL);
    irq_attach(HC32_IRQ_FIRST + Int061_IRQn, hc32_irq061, NULL);
    irq_attach(HC32_IRQ_FIRST + Int062_IRQn, hc32_irq062, NULL);
    irq_attach(HC32_IRQ_FIRST + Int063_IRQn, hc32_irq063, NULL);
    irq_attach(HC32_IRQ_FIRST + Int064_IRQn, hc32_irq064, NULL);
    irq_attach(HC32_IRQ_FIRST + Int065_IRQn, hc32_irq065, NULL);
    irq_attach(HC32_IRQ_FIRST + Int066_IRQn, hc32_irq066, NULL);
    irq_attach(HC32_IRQ_FIRST + Int067_IRQn, hc32_irq067, NULL);
    irq_attach(HC32_IRQ_FIRST + Int068_IRQn, hc32_irq068, NULL);
    irq_attach(HC32_IRQ_FIRST + Int069_IRQn, hc32_irq069, NULL);

    irq_attach(HC32_IRQ_FIRST + Int070_IRQn, hc32_irq070, NULL);
    irq_attach(HC32_IRQ_FIRST + Int071_IRQn, hc32_irq071, NULL);
    irq_attach(HC32_IRQ_FIRST + Int072_IRQn, hc32_irq072, NULL);
    irq_attach(HC32_IRQ_FIRST + Int073_IRQn, hc32_irq073, NULL);
    irq_attach(HC32_IRQ_FIRST + Int074_IRQn, hc32_irq074, NULL);
    irq_attach(HC32_IRQ_FIRST + Int075_IRQn, hc32_irq075, NULL);
    irq_attach(HC32_IRQ_FIRST + Int076_IRQn, hc32_irq076, NULL);
    irq_attach(HC32_IRQ_FIRST + Int077_IRQn, hc32_irq077, NULL);
    irq_attach(HC32_IRQ_FIRST + Int078_IRQn, hc32_irq078, NULL);
    irq_attach(HC32_IRQ_FIRST + Int079_IRQn, hc32_irq079, NULL);

    irq_attach(HC32_IRQ_FIRST + Int080_IRQn, hc32_irq080, NULL);
    irq_attach(HC32_IRQ_FIRST + Int081_IRQn, hc32_irq081, NULL);
    irq_attach(HC32_IRQ_FIRST + Int082_IRQn, hc32_irq082, NULL);
    irq_attach(HC32_IRQ_FIRST + Int083_IRQn, hc32_irq083, NULL);
    irq_attach(HC32_IRQ_FIRST + Int084_IRQn, hc32_irq084, NULL);
    irq_attach(HC32_IRQ_FIRST + Int085_IRQn, hc32_irq085, NULL);
    irq_attach(HC32_IRQ_FIRST + Int086_IRQn, hc32_irq086, NULL);
    irq_attach(HC32_IRQ_FIRST + Int087_IRQn, hc32_irq087, NULL);
    irq_attach(HC32_IRQ_FIRST + Int088_IRQn, hc32_irq088, NULL);
    irq_attach(HC32_IRQ_FIRST + Int089_IRQn, hc32_irq089, NULL);

    irq_attach(HC32_IRQ_FIRST + Int090_IRQn, hc32_irq090, NULL);
    irq_attach(HC32_IRQ_FIRST + Int091_IRQn, hc32_irq091, NULL);
    irq_attach(HC32_IRQ_FIRST + Int092_IRQn, hc32_irq092, NULL);
    irq_attach(HC32_IRQ_FIRST + Int093_IRQn, hc32_irq093, NULL);
    irq_attach(HC32_IRQ_FIRST + Int094_IRQn, hc32_irq094, NULL);
    irq_attach(HC32_IRQ_FIRST + Int095_IRQn, hc32_irq095, NULL);
    irq_attach(HC32_IRQ_FIRST + Int096_IRQn, hc32_irq096, NULL);
    irq_attach(HC32_IRQ_FIRST + Int097_IRQn, hc32_irq097, NULL);
    irq_attach(HC32_IRQ_FIRST + Int098_IRQn, hc32_irq098, NULL);
    irq_attach(HC32_IRQ_FIRST + Int099_IRQn, hc32_irq099, NULL);

    irq_attach(HC32_IRQ_FIRST + Int100_IRQn, hc32_irq100, NULL);
    irq_attach(HC32_IRQ_FIRST + Int101_IRQn, hc32_irq101, NULL);
    irq_attach(HC32_IRQ_FIRST + Int102_IRQn, hc32_irq102, NULL);
    irq_attach(HC32_IRQ_FIRST + Int103_IRQn, hc32_irq103, NULL);
    irq_attach(HC32_IRQ_FIRST + Int104_IRQn, hc32_irq104, NULL);
    irq_attach(HC32_IRQ_FIRST + Int105_IRQn, hc32_irq105, NULL);
    irq_attach(HC32_IRQ_FIRST + Int106_IRQn, hc32_irq106, NULL);
    irq_attach(HC32_IRQ_FIRST + Int107_IRQn, hc32_irq107, NULL);
    irq_attach(HC32_IRQ_FIRST + Int108_IRQn, hc32_irq108, NULL);
    irq_attach(HC32_IRQ_FIRST + Int109_IRQn, hc32_irq109, NULL);

    irq_attach(HC32_IRQ_FIRST + Int110_IRQn, hc32_irq110, NULL);
    irq_attach(HC32_IRQ_FIRST + Int111_IRQn, hc32_irq111, NULL);
    irq_attach(HC32_IRQ_FIRST + Int112_IRQn, hc32_irq112, NULL);
    irq_attach(HC32_IRQ_FIRST + Int113_IRQn, hc32_irq113, NULL);
    irq_attach(HC32_IRQ_FIRST + Int114_IRQn, hc32_irq114, NULL);
    irq_attach(HC32_IRQ_FIRST + Int115_IRQn, hc32_irq115, NULL);
    irq_attach(HC32_IRQ_FIRST + Int116_IRQn, hc32_irq116, NULL);
    irq_attach(HC32_IRQ_FIRST + Int117_IRQn, hc32_irq117, NULL);
    irq_attach(HC32_IRQ_FIRST + Int118_IRQn, hc32_irq118, NULL);
    irq_attach(HC32_IRQ_FIRST + Int119_IRQn, hc32_irq119, NULL);

    irq_attach(HC32_IRQ_FIRST + Int120_IRQn, hc32_irq120, NULL);
    irq_attach(HC32_IRQ_FIRST + Int121_IRQn, hc32_irq121, NULL);
    irq_attach(HC32_IRQ_FIRST + Int122_IRQn, hc32_irq122, NULL);
    irq_attach(HC32_IRQ_FIRST + Int123_IRQn, hc32_irq123, NULL);
    irq_attach(HC32_IRQ_FIRST + Int124_IRQn, hc32_irq124, NULL);
    irq_attach(HC32_IRQ_FIRST + Int125_IRQn, hc32_irq125, NULL);
    irq_attach(HC32_IRQ_FIRST + Int126_IRQn, hc32_irq126, NULL);
    irq_attach(HC32_IRQ_FIRST + Int127_IRQn, hc32_irq127, NULL);
    irq_attach(HC32_IRQ_FIRST + Int128_IRQn, hc32_irq128, NULL);
    irq_attach(HC32_IRQ_FIRST + Int129_IRQn, hc32_irq129, NULL);

    irq_attach(HC32_IRQ_FIRST + Int130_IRQn, hc32_irq130, NULL);
    irq_attach(HC32_IRQ_FIRST + Int131_IRQn, hc32_irq131, NULL);
    irq_attach(HC32_IRQ_FIRST + Int132_IRQn, hc32_irq132, NULL);
    irq_attach(HC32_IRQ_FIRST + Int133_IRQn, hc32_irq133, NULL);
    irq_attach(HC32_IRQ_FIRST + Int134_IRQn, hc32_irq134, NULL);
    irq_attach(HC32_IRQ_FIRST + Int135_IRQn, hc32_irq135, NULL);
    irq_attach(HC32_IRQ_FIRST + Int136_IRQn, hc32_irq136, NULL);
    irq_attach(HC32_IRQ_FIRST + Int137_IRQn, hc32_irq137, NULL);
    irq_attach(HC32_IRQ_FIRST + Int138_IRQn, hc32_irq138, NULL);
    irq_attach(HC32_IRQ_FIRST + Int139_IRQn, hc32_irq139, NULL);

    irq_attach(HC32_IRQ_FIRST + Int140_IRQn, hc32_irq140, NULL);
    irq_attach(HC32_IRQ_FIRST + Int141_IRQn, hc32_irq141, NULL);
    irq_attach(HC32_IRQ_FIRST + Int142_IRQn, hc32_irq142, NULL);
    irq_attach(HC32_IRQ_FIRST + Int143_IRQn, hc32_irq143, NULL);
}


/****************************************************************************
 * Name: up_irqinitialize
 ****************************************************************************/

void up_irqinitialize(void)
{
  uint32_t regaddr;
  int num_priority_registers;
  int i;

  /* Disable all interrupts */

  for (i = 0; i < NR_IRQS - HC32_IRQ_FIRST; i += 32)
    {
      putreg32(0xffffffff, NVIC_IRQ_CLEAR(i));
    }

  /* The standard location for the vector table is at the beginning of FLASH
   * at address 0x0000:0000.  If we are using the HC32 bootloader,
   * then the vector table will be offset to a different location in FLASH
   * and we will need to set the NVIC vector location to this alternative
   * location.
   */

#if defined(__ICCARM__)
  putreg32((uint32_t)__vector_table, NVIC_VECTAB);
#else
  putreg32((uint32_t)_vectors, NVIC_VECTAB);
#endif

#ifdef CONFIG_ARCH_RAMVECTORS
  /* If CONFIG_ARCH_RAMVECTORS is defined, then we are using a RAM-based
   * vector table that requires special initialization.
   */

  arm_ramvec_initialize();
#endif

  /* Set all interrupts (and exceptions) to the default priority */

  putreg32(DEFPRIORITY32, NVIC_SYSH4_7_PRIORITY);
  putreg32(DEFPRIORITY32, NVIC_SYSH8_11_PRIORITY);
  putreg32(DEFPRIORITY32, NVIC_SYSH12_15_PRIORITY);

  /* The NVIC ICTR register (bits 0-4) holds the number of interrupt
   * lines that the NVIC supports:
   *
   *  0 -> 32 interrupt lines,  8 priority registers
   *  1 -> 64 "       " "   ", 16 priority registers
   *  2 -> 96 "       " "   ", 32 priority registers
   *  ...
   */

  num_priority_registers = (getreg32(NVIC_ICTR) + 1) * 8;

  /* Now set all of the interrupt lines to the default priority */

  regaddr = NVIC_IRQ0_3_PRIORITY;
  while (num_priority_registers--)
    {
      putreg32(DEFPRIORITY32, regaddr);
      regaddr += 4;
    }

  /* currents_regs is non-NULL only while processing an interrupt */

  CURRENT_REGS = NULL;

  /* Attach the SVCall and Hard Fault exception handlers.  The SVCall
   * exception is used for performing context switches; The Hard Fault
   * must also be caught because a SVCall may show up as a Hard Fault
   * under certain conditions.
   */

  irq_attach(HC32_IRQ_SVCALL, hc32_svc, NULL);
  irq_attach(HC32_IRQ_HARDFAULT, hc32_hardfault, NULL);

  /* Set the priority of the SVCall interrupt */

#ifdef CONFIG_ARCH_IRQPRIO
  /* up_prioritize_irq(HC32_IRQ_PENDSV, NVIC_SYSH_PRIORITY_MIN); */
#endif
#ifdef CONFIG_ARMV7M_USEBASEPRI
  hc32_prioritize_syscall(NVIC_SYSH_SVCALL_PRIORITY);
#endif

  /* If the MPU is enabled, then attach and enable the Memory Management
   * Fault handler.
   */

#ifdef CONFIG_ARM_MPU
  irq_attach(HC32_IRQ_MEMFAULT, hc32_memfault, NULL);
  up_enable_irq(HC32_IRQ_MEMFAULT);
#endif

#if defined(CONFIG_RTC) && !defined(CONFIG_RTC_EXTERNAL)
  /* RTC was initialized earlier but IRQs weren't ready at that time */

  hc32_rtc_irqinitialize();
#endif

  /* Attach all other processor exceptions (except reset and sys tick) */

#ifdef CONFIG_DEBUG_FEATURES
  irq_attach(HC32_IRQ_NMI, hc32_nmi, NULL);
#ifndef CONFIG_ARM_MPU
  irq_attach(HC32_IRQ_MEMFAULT, hc32_memfault, NULL);
#endif
  irq_attach(HC32_IRQ_BUSFAULT, hc32_busfault, NULL);
  irq_attach(HC32_IRQ_USAGEFAULT, hc32_usagefault, NULL);
  irq_attach(HC32_IRQ_PENDSV, hc32_pendsv, NULL);
  irq_attach(HC32_IRQ_DBGMONITOR, hc32_dbgmonitor, NULL);
  irq_attach(HC32_IRQ_RESERVED, hc32_reserved, NULL);
#endif

  hc32_attach_irqs();

  hc32_dumpnvic("initial", NR_IRQS);

#ifndef CONFIG_SUPPRESS_INTERRUPTS

  /* And finally, enable interrupts */

  up_irq_enable();
#endif
}

/****************************************************************************
 * Name: up_disable_irq
 *
 * Description:
 *   Disable the IRQ specified by 'irq'
 *
 ****************************************************************************/

void up_disable_irq(int irq)
{
  uintptr_t regaddr;
  uint32_t regval;
  uint32_t bit;

  if (hc32_irqinfo(irq, &regaddr, &bit, NVIC_CLRENA_OFFSET) == 0)
    {
      /* Modify the appropriate bit in the register to disable the interrupt.
       * For normal interrupts, we need to set the bit in the associated
       * Interrupt Clear Enable register.  For other exceptions, we need to
       * clear the bit in the System Handler Control and State Register.
       */

      if (irq >= HC32_IRQ_FIRST)
        {
          uint32_t act_irq = irq - HC32_IRQ_FIRST;
          NVIC_DisableIRQ(act_irq);
        }
      else
        {
          regval  = getreg32(regaddr);
          regval &= ~bit;
          putreg32(regval, regaddr);
        }
    }
}

/****************************************************************************
 * Name: up_enable_irq
 *
 * Description:
 *   Enable the IRQ specified by 'irq'
 *
 ****************************************************************************/

void up_enable_irq(int irq)
{
  uintptr_t regaddr;
  uint32_t regval;
  uint32_t bit;

  if (hc32_irqinfo(irq, &regaddr, &bit, NVIC_ENA_OFFSET) == 0)
    {
      /* Modify the appropriate bit in the register to enable the interrupt.
       * For normal interrupts, we need to set the bit in the associated
       * Interrupt Set Enable register.  For other exceptions, we need to
       * set the bit in the System Handler Control and State Register.
       */

      if (irq >= HC32_IRQ_FIRST)
        {
          uint32_t act_irq = irq - HC32_IRQ_FIRST;
          NVIC_ClearPendingIRQ(act_irq);
          NVIC_SetPriority(act_irq, DDL_IRQ_PRIORITY_00);
          NVIC_EnableIRQ(act_irq);
        }
      else
        {
          regval  = getreg32(regaddr);
          regval |= bit;
          putreg32(regval, regaddr);
        }
    }
}

/****************************************************************************
 * Name: arm_ack_irq
 *
 * Description:
 *   Acknowledge the IRQ
 *
 ****************************************************************************/

void arm_ack_irq(int irq)
{
}

/****************************************************************************
 * Name: up_prioritize_irq
 *
 * Description:
 *   Set the priority of an IRQ.
 *
 *   Since this API is not supported on all architectures, it should be
 *   avoided in common implementations where possible.
 *
 ****************************************************************************/

#ifdef CONFIG_ARCH_IRQPRIO
int up_prioritize_irq(int irq, int priority)
{
  uint32_t regaddr;
  uint32_t regval;
  int shift;

  DEBUGASSERT(irq >= HC32_IRQ_MEMFAULT && irq < NR_IRQS &&
              (unsigned)priority <= NVIC_SYSH_PRIORITY_MIN);

  if (irq < HC32_IRQ_FIRST)
    {
      /* NVIC_SYSH_PRIORITY() maps {0..15} to one of three priority
       * registers (0-3 are invalid)
       */

      regaddr = NVIC_SYSH_PRIORITY(irq);
      irq    -= 4;
    }
  else
    {
      /* NVIC_IRQ_PRIORITY() maps {0..} to one of many priority registers */

      irq    -= HC32_IRQ_FIRST;
      regaddr = NVIC_IRQ_PRIORITY(irq);
    }

  regval      = getreg32(regaddr);
  shift       = ((irq & 3) << 3);
  regval     &= ~(0xff << shift);
  regval     |= (priority << shift);
  putreg32(regval, regaddr);

  hc32_dumpnvic("prioritize", irq);
  return OK;
}
#endif
