/**
* @file boot_for_ota.h
* @brief support bootloader function
* @version 2.0 
* @author AIIT XUOS Lab
* @date 2023-11-20
*/

#ifndef __MCUBOOT_H__
#define __MCUBOOT_H__

#include "fsl_common.h"
#include "board.h"
#include "pin_mux.h"
#include "fsl_iomuxc.h"
#include "fsl_gpio.h"
#include "fsl_lpuart.h"
#include "common.h"

void mcuboot_bord_init(void);
void mcuboot_reset(void);
void mcuboot_jump(void);
void mcuboot_delay(uint32_t ms);

#endif

