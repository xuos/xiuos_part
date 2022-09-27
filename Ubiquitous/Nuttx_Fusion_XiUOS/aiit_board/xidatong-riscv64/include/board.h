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
 * @file board.h
 * @brief xidatong-riscv64 board.h
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022.03.17
 */

#ifndef __BOARDS_RISCV_K210_XIDATONG_RISCV64_INCLUDE_BOARD_H
#define __BOARDS_RISCV_K210_XIDATONG_RISCV64_INCLUDE_BOARD_H

/****************************************************************************
 * Included Files
 ****************************************************************************/

#include <nuttx/config.h>

#ifndef __ASSEMBLY__
# include <stdint.h>
#endif

#include "k210.h"

#include "k210_fpioa.h"

/****************************************************************************
 * Pre-processor Definitions
 ****************************************************************************/

#define BOARD_LED_PAD     14 /* Connected to red led */

/* Map pad 14 to gpiohs io 0 */

#define BOARD_LED_IO_FUNC K210_IO_FUNC_GPIOHS0
#define BOARD_LED_IO      0

#define LED_STARTED       0  /* N/C */
#define LED_HEAPALLOCATE  1  /* N/C */
#define LED_IRQSENABLED   2  /* N/C */
#define LED_STACKCREATED  3  /* N/C */
#define LED_INIRQ         4  /* N/C */
#define LED_SIGNAL        5  /* N/C */
#define LED_ASSERTION     6  /* N/C */
#define LED_PANIC         7  /* blink */

/* GPIO pins used by the GPIO Subsystem */

#define BOARD_NGPIOOUT    3 /* Amount of GPIO Output pins */
#define BOARD_NGPIOINT    0 /* Amount of GPIO Input */

/****************************************************************************
 * Public Types
 ****************************************************************************/

#ifndef __ASSEMBLY__

/****************************************************************************
 * Public Data
 ****************************************************************************/

#undef EXTERN
#if defined(__cplusplus)
#define EXTERN extern "C"
extern "C"
{
#else
#define EXTERN extern
#endif


#define GPIO_CAN_RXD       18
#define GPIO_CAN_TXD       19

#define GPIO_EC200T_RXD     21
#define GPIO_EC200T_TXD     20

#define GPIO_CH376T_RXD      22
#define GPIO_CH376T_TXD      23


#define FPOA_USART1_RX        K210_IO_FUNC_UART1_RX
#define FPOA_USART1_TX        K210_IO_FUNC_UART1_TX

#define FPOA_USART2_RX        K210_IO_FUNC_UART2_RX
#define FPOA_USART2_TX        K210_IO_FUNC_UART2_TX

#define FPOA_USART3_RX        K210_IO_FUNC_UART3_RX
#define FPOA_USART3_TX        K210_IO_FUNC_UART3_TX

/****************************************************************************
 * Public Function Prototypes
 ****************************************************************************/

/****************************************************************************
 * Name: k210_boardinitialize
 ****************************************************************************/

void k210_boardinitialize(void);

#undef EXTERN
#if defined(__cplusplus)
}
#endif
#endif /* __ASSEMBLY__ */
#endif /* __BOARDS_RISC-V_K210_XIDATONG_RISCV64_INCLUDE_BOARD_H */
