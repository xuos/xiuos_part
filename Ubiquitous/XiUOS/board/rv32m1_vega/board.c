
/**
* @file board.c
* @brief support rvstar init configure and start-up
* @version 1.0 
* @author AIIT XUOS Lab
* @date 2021-09-02
*/

#include <board.h>
#include <xiuos.h>
#include <device.h>

#include "pin_mux.h"
#include "clock_config.h"

#include <fsl_clock.h>
#include <fsl_intmux.h>

extern int InitHwUart();

void LPIT0_IRQHandler(void)
{
    TickAndTaskTimesliceUpdate();

    SystemClearSystickFlag();
}

int InitHwTick(void)
{
    CLOCK_SetIpSrc(kCLOCK_Lpit0, kCLOCK_IpSrcFircAsync);

    SystemSetupSystick (TICK_PER_SECOND, 0);
    SystemClearSystickFlag();

    return 0;
}

const scg_lpfll_config_t g_appScgLpFllConfig_BOARD_BootClockRUN = {
    .enableMode = kSCG_LpFllEnable, /* LPFLL clock disabled */
    .div1 = kSCG_AsyncClkDivBy1,    /* Low Power FLL Clock Divider 1: Clock output is disabled */
    .div2 = kSCG_AsyncClkDisable,   /* Low Power FLL Clock Divider 2: Clock output is disabled */
    .div3 = kSCG_AsyncClkDisable,   /* Low Power FLL Clock Divider 3: Clock output is disabled */
    .range = kSCG_LpFllRange72M,    /* LPFLL is trimmed to 72MHz */
    .trimConfig = NULL,
};

void InitBoardHardware(void)
{
    BOARD_InitPins();
    BOARD_BootClockRUN();
    /* Init LPFLL */
    CLOCK_InitLpFll(&g_appScgLpFllConfig_BOARD_BootClockRUN);

    INTMUX_Init(INTMUX0);
    INTMUX_EnableInterrupt(INTMUX0, 0, PORTC_IRQn);

    /* initialize hardware interrupt */
    InitHwTick();

    InitBoardMemory(MEMORY_START_ADDRESS, MEMORY_END_ADDRESS);

    InitHwUart();
    InstallConsole("uart0", "uart0_drv", "uart0_dev");

	KPrintf("console init completed.\n");
    KPrintf("board initialization......\n");
    
    // InitHwTick();
    KPrintf("memory address range: [0x%08x - 0x%08x], size: %d\n", (x_ubase) MEMORY_START_ADDRESS, (x_ubase) MEMORY_END_ADDRESS, RV32M1VEGA_SRAM_SIZE);
    /* initialize memory system */
	
    KPrintf("board init done.\n");
	KPrintf("start kernel...\n");
}
