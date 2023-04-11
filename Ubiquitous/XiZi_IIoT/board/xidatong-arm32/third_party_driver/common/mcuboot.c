/*
 * Copyright 2018-2020 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/**
* @file mucboot.c
* @brief support bootloader function
* @version 2.0 
* @author AIIT XUOS Lab
* @date 2023-04-03
*/
 
#include "flash.h"
#include "stdint.h"
#include "mcuboot.h"

#ifdef MCUBOOT_BOOTLOADER
static void JumpToApp(void)
{
    asm volatile("LDR   R0, = 0x60100000");
    asm volatile("LDR   R0, [R0]");
    asm volatile("MOV   SP, R0");
    
    asm volatile("LDR   R0, = 0x60100000+4");
    asm volatile("LDR   R0, [R0]");
    asm volatile("BX  R0");
}

static uint32_t UartSrcFreq(void)
{
    uint32_t freq;

    /* To make it simple, we assume default PLL and divider settings, and the only variable
       from application is use PLL3 source or OSC source */
    if (CLOCK_GetMux(kCLOCK_UartMux) == 0) /* PLL3 div6 80M */ {
        freq = (CLOCK_GetPllFreq(kCLOCK_PllUsb1) / 6U) / (CLOCK_GetDiv(kCLOCK_UartDiv) + 1U);
    } else {
        freq = CLOCK_GetOscFreq() / (CLOCK_GetDiv(kCLOCK_UartDiv) + 1U);
    }

    return freq;
}

static void UartConfig(void)
{
    lpuart_config_t config;
    LPUART_GetDefaultConfig(&config);
    config.baudRate_Bps = 115200u;
    config.enableTx = true;
    config.enableRx = true;

    LPUART_Init(LPUART1, &config, UartSrcFreq());
}

static void SerialPutC(uint8_t c)
{
    LPUART_WriteByte(LPUART1, c);
    while(!(kLPUART_TxDataRegEmptyFlag & LPUART_GetStatusFlags(LPUART1))) 
    {
    }
}

static void SerialPutString(uint8_t *s)
{
    while (*s != '\0') {
        SerialPutC(*s);
        s++;
    }
}

void BootLoaderJumpApp(void)
{
    BOARD_ConfigMPU();
    BOARD_InitPins();
    BOARD_BootClockRUN();

    UartConfig();
    
    SerialPutString("BOOTLOADER START AND JUMP TO APP[0x60100000]\n");
    SCB->VTOR = (uint32_t)0x60100000;
    JumpToApp();
}
#endif