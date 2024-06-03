/* SPDX-License-Identifier: BSD-3-Clause */
/*
 * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
 */

#ifndef __BSP_H__
#define __BSP_H__

#include "hal_base.h"

/***************************** MACRO Definition ******************************/

/***************************** Structure Definition **************************/

#define SYS_TIMER TIMER5
extern const struct HAL_GMAC_DEV g_gmac0Dev;
extern const struct HAL_GMAC_DEV g_gmac1Dev;

/***************************** Function Declare ******************************/
void BSP_Init(void);

#endif
