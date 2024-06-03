/* SPDX-License-Identifier: BSD-3-Clause */
/*
 * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
 */

#include "hal_bsp.h"
#include "rk3568.h"
#include "soc.h"
#include "hal_gmac.h"

const struct HAL_GMAC_DEV g_gmac0Dev =
{
    .pReg = GMAC0,
    .clkID = CLK_MAC0_2TOP,
    .clkGateID = CLK_MAC0_2TOP_GATE,
    .pclkID = PCLK_PHP,
    .pclkGateID = PCLK_GMAC0_GATE,
    .irqNum = GMAC0_IRQn,
};

const struct HAL_GMAC_DEV g_gmac1Dev =
{
    .pReg = GMAC1,
    .clkID = CLK_MAC1_2TOP,
    .clkGateID = CLK_MAC1_2TOP_GATE,
    .pclkID = PCLK_USB,
    .pclkGateID = PCLK_GMAC1_GATE,
    .irqNum = GMAC1_IRQn,
};

void BSP_Init(void)
{
}
