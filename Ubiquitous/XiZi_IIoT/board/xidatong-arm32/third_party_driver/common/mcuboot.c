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
#include "imxrt_ota.h"
#include "common.h"

#ifdef MCUBOOT_BOOTLOADER
extern void ImxrtMsDelay(uint32 ms);

void jump_to_application(void)
{
    SCB->VTOR = (uint32_t)XIUOS_FLAH_ADDRESS;

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
                    UpdateApplication();
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