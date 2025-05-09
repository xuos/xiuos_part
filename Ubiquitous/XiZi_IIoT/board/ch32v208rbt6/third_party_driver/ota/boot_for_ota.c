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
* @file boot_for_ota.c
* @brief support bootloader function
* @version 2.0 
* @author AIIT XUOS Lab
* @date 2023-11-20
*/

#include <stdint.h>
#include <xs_base.h>
#include "boot_for_ota.h"
#include "flash_for_ota.h"

#include "board.h"

#include <ModuleConfig.h>
#include <device.h>
#include <stdint.h>
#include <xizi.h>

#include "HAL.h"
#include "adc.h"
#include "ch32v20x.h"
#include "connect_ble.h"
#include "connect_can.h"
#include "connect_ether.h"
#include "connect_lte.h"
#include "connect_rs485.h"
#include "connect_uart.h"
#include "core_riscv.h"
#include "config.h"
#include "xsconfig.h"


#ifdef TOOL_USING_OTA

#define jumpApp    ((void (*)(void))((int *)(IMAGE_A_START_ADD-0x08000000)))


static uint32_t _SysTick_Config(uint32_t ticks) {
    // SystemCoreClockUpdate();
    NVIC_SetPriority(SysTicK_IRQn, 0x01);
    NVIC_SetPriority(Software_IRQn, 0xf0);
    NVIC_EnableIRQ(SysTicK_IRQn);
    NVIC_EnableIRQ(Software_IRQn);
    SysTick->CTLR = 0;
    SysTick->SR = 0;
    SysTick->CNT = 0;
    SysTick->CMP = ticks - 1;
    SysTick->CTLR = 0xF;
    return 0;
}

void mcuboot_bord_init(void)
{
    DISABLE_INTERRUPT();
	/* system irq table must be inited before initialization of Hardware irq  */
	SysInitIsrManager();

//    InitBoardHardware();
//    XiUOSStartup();

    Delay_Init();
    USART_Printf_Init(115200);
    /* System Tick Configuration */
	extern uint32_t SystemCoreClock;
    _SysTick_Config(SystemCoreClock / TICK_PER_SECOND);
    /* initialize memory system */
    InitBoardMemory(MEMORY_START_ADDRESS, (void *)MEMORY_END_ADDRESS);

#ifdef BSP_USING_UART
    InitHwUart();
    InstallConsole("uart1", SERIAL_DRV_NAME_1, SERIAL_1_DEVICE_NAME_0);
    KPrintf("\nboot console init completed.\n");
    KPrintf("boot compiled on: %s at %s\n", __DATE__, __TIME__);
#endif

    void readRomConfiguration(void);
    readRomConfiguration();  // 读取配置信息到外部变量CFG中

    KPrintf("mcuboot board initialization......\n");

    /*
    BOARD_ConfigMPU();
    BOARD_InitPins();
    BOARD_BootClockRUN();
    UartConfig();
    SysTick_Config(SystemCoreClock / TICK_PER_SECOND);*/
}

void mcuboot_reset(void)
{
    /*
    __set_FAULTMASK(1);
    NVIC_SystemReset();*/
}

void mcuboot_jump(void)
{
    KPrintf("boot jumpApp\n");
    jumpApp();
    /*
    uint32_t addr = XIUOS_FLAH_ADDRESS;

    SCB->VTOR = addr;
    asm volatile("LDR R0, %0" : : "m"(addr));
    asm volatile("LDR   R0, [R0]");
    asm volatile("MOV   SP, R0");
    
    addr += 4;
    asm volatile("LDR R0, %0" : : "m"(addr));
    asm volatile("LDR   R0, [R0]");
    asm volatile("BX  R0");*/
}

void mcuboot_delay(uint32_t ms)
{
/*    ImxrtMsDelay(ms);*/
}

#endif