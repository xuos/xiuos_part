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

#include <stdint.h>
#include <xs_base.h>
#include "flash.h"
#include "mcuboot.h"
#include "ymodem.h"
#include "common.h"

#ifdef MCUBOOT_BOOTLOADER
extern void ImxrtMsDelay(uint32 ms);

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

static void jump_to_application(void)
{
    SCB->VTOR = (uint32_t)0x60100000;

    asm volatile("LDR   R0, = 0x60100000");
    asm volatile("LDR   R0, [R0]");
    asm volatile("MOV   SP, R0");
    
    asm volatile("LDR   R0, = 0x60100000+4");
    asm volatile("LDR   R0, [R0]");
    asm volatile("BX  R0");
}

void BootLoaderJumpApp(void)
{
    uint8_t ch1, ch2;
    uint32_t ret;
    uint32_t timeout = 500;

    BOARD_ConfigMPU();
    BOARD_InitPins();
    BOARD_BootClockRUN();
    UartConfig();
    SysTick_Config(SystemCoreClock / TICK_PER_SECOND);

    Serial_PutString("Please press 'space' key into menu in 5s !!!\r\n");
    
    while(timeout)
    { 
        ret = (SerialKeyPressed((uint8_t*)&ch1));
        if(ret) break;
        timeout--;
        ImxrtMsDelay(10);
    }

    while(1)
    {
        if((ret)&&(ch1 == 0x20))
        {
            Serial_PutString("\r\nPlease slecet:");
            Serial_PutString("\r\n 1:run app");
            Serial_PutString("\r\n 2:update app");
            Serial_PutString("\r\n 3:reboot \r\n");

            ch2 = GetKey();
            switch(ch2)
            {
                case 0x31:
                    jump_to_application();
                    break;
                case 0x32:
                    FLASH_Init();
                    SerialDownload();
                    FLASH_DeInit();
                    break;
                case 0x33:
                    __set_FAULTMASK(1);
                    NVIC_SystemReset();
                default:
                    break;
            }
        }
        else
        {
            jump_to_application();
        } 
    }
}
#endif