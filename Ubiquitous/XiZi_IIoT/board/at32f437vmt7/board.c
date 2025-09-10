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
 * @file board.c
 * @brief support at32f437 board init configure and start-up
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2025-09-05
 */

#include <board.h>
#include <xizi.h>
#include <device.h>
#include "at32f435_437_clock.h"
#include "at32f435_437_conf.h"
#include "board.h"
#include "connect_usart.h"


/** @addtogroup AT32F435_437_board
  * @{
  */

#define MS_TICK                          (system_core_clock / 1000U)

/**
  * @brief  config systick and enable interrupt.
  * @param  none
  * @retval none
  */
static uint32_t systick_interrupt_config(uint32_t ticks)
{
  if ((ticks - 1UL) > SysTick_LOAD_RELOAD_Msk)
  {
    return (1UL);
  }

  SysTick->LOAD  = (uint32_t)(ticks - 1UL);
  NVIC_SetPriority (SysTick_IRQn, (1UL << __NVIC_PRIO_BITS) - 1UL);
  SysTick->VAL   = 0UL;
  SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk |
                   SysTick_CTRL_ENABLE_Msk;
  return (0UL);
}

/**
  * @brief  This function will initial your board.
  * @param  none
  * @retval none
 */
void InitBoardHardware(void)
{
  system_clock_config();

  systick_clock_source_config(SYSTICK_CLOCK_SOURCE_AHBCLK_NODIV);
  systick_interrupt_config(MS_TICK);

  InitBoardMemory((void *)MEMORY_START_ADDRESS, (void *)MEMORY_END_ADDRESS);

#ifdef BSP_USING_UART
  HwUsartInit();
  InstallConsole(CONSOLE_BUS_NAME, CONSOLE_DRV_NAME, CONSOLE_DEVICE_NAME_0);
  KPrintf("\nAT32F437 board console\n");
#endif

  KPrintf("RAM start=%08x end=%08x\n", MEMORY_START_ADDRESS, MEMORY_END_ADDRESS);
}
