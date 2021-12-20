/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2019 NXP
 * All rights reserved.
 *
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*
 * Copyright (c) 2021 AIIT XUOS Lab
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
 * @file lwip_ping_demo.c
 * @brief Demo for ping function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.12.15
 */


/*******************************************************************************
 * Includes
 ******************************************************************************/


#if LWIP_IPV4 && LWIP_RAW

#include "ping.h"

#include "lwip/opt.h"
#include "lwip/timeouts.h"
#include "lwip/init.h"
#include "netif/ethernet.h"

#include "board.h"

#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_gpio.h"
#include "fsl_iomuxc.h"

#include <transform.h>
#include <sys_arch.h>
#include "connect_ethernet.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
/* IP address configuration. */
#define TEST_IP_ADDR0 192
#define TEST_IP_ADDR1 168
#define TEST_IP_ADDR2 250
#define TEST_IP_ADDR3 253

/* Netmask configuration. */
#define TEST_NET_MASK0 255
#define TEST_NET_MASK1 255
#define TEST_NET_MASK2 255
#define TEST_NET_MASK3 0

/* Gateway address configuration. */
#define TEST_GW_ADDR0 192
#define TEST_GW_ADDR1 168
#define TEST_GW_ADDR2 250
#define TEST_GW_ADDR3 252

/* MAC address configuration. */
#define TEST_MAC_ADDR {0x02, 0x12, 0x13, 0x10, 0x15, 0x11}

/* Address of PHY interface. */
#define TEST_PHY_ADDR 0x02U

/* System clock name. */
#define TEST_CLOCK_NAME kCLOCK_CoreSysClk


/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

/*******************************************************************************
 * Code
 ******************************************************************************/

/*!
 * @brief Main function.
 */
int lwip_ping_test(void)
{
    struct netif fsl_netif0;
#if defined(FSL_FEATURE_SOC_LPC_ENET_COUNT) && (FSL_FEATURE_SOC_LPC_ENET_COUNT > 0)
    mem_range_t non_dma_memory[] = NON_DMA_MEMORY_ARRAY;
#endif /* FSL_FEATURE_SOC_LPC_ENET_COUNT */
    ip4_addr_t fsl_netif0_ipaddr, fsl_netif0_netmask, fsl_netif0_gw;
    ethernetif_config_t fsl_enet_config0 = {
        .phyAddress = TEST_PHY_ADDR,
        .clockName  = TEST_CLOCK_NAME,
        .macAddress = TEST_MAC_ADDR,
#if defined(FSL_FEATURE_SOC_LPC_ENET_COUNT) && (FSL_FEATURE_SOC_LPC_ENET_COUNT > 0)
        .non_dma_memory = non_dma_memory,
#endif /* FSL_FEATURE_SOC_LPC_ENET_COUNT */
    };

    lw_print("lw: [%s] start ...\n", __func__);

    ETH_BSP_Config();

    IP4_ADDR(&fsl_netif0_ipaddr, TEST_IP_ADDR0, TEST_IP_ADDR1, TEST_IP_ADDR2, TEST_IP_ADDR3);
    IP4_ADDR(&fsl_netif0_netmask, TEST_NET_MASK0, TEST_NET_MASK1, TEST_NET_MASK2, TEST_NET_MASK3);
    IP4_ADDR(&fsl_netif0_gw, TEST_GW_ADDR0, TEST_GW_ADDR1, TEST_GW_ADDR2, TEST_GW_ADDR3);

    lwip_init();

    netif_add(&fsl_netif0, &fsl_netif0_ipaddr, &fsl_netif0_netmask, &fsl_netif0_gw, &fsl_enet_config0,
              ethernetif0_init,
              ethernet_input);
    netif_set_default(&fsl_netif0);
    netif_set_up(&fsl_netif0);

    ping_init(&fsl_netif0_gw);

    lw_print("\r\n************************************************\r\n");
    lw_print(" PING example\r\n");
    lw_print("************************************************\r\n");
    lw_print(" IPv4 Address     : %u.%u.%u.%u\r\n", ((u8_t *)&fsl_netif0_ipaddr)[0], ((u8_t *)&fsl_netif0_ipaddr)[1],
           ((u8_t *)&fsl_netif0_ipaddr)[2], ((u8_t *)&fsl_netif0_ipaddr)[3]);
    lw_print(" IPv4 Subnet mask : %u.%u.%u.%u\r\n", ((u8_t *)&fsl_netif0_netmask)[0], ((u8_t *)&fsl_netif0_netmask)[1],
           ((u8_t *)&fsl_netif0_netmask)[2], ((u8_t *)&fsl_netif0_netmask)[3]);
    lw_print(" IPv4 Gateway     : %u.%u.%u.%u\r\n", ((u8_t *)&fsl_netif0_gw)[0], ((u8_t *)&fsl_netif0_gw)[1],
           ((u8_t *)&fsl_netif0_gw)[2], ((u8_t *)&fsl_netif0_gw)[3]);
    lw_print("************************************************\r\n");

    while (1)
    {
        /* Poll the driver, get any outstanding frames */
        ethernetif_input(&fsl_netif0);
        sys_check_timeouts(); /* Handle all system timeouts for all core protocols */
    }
}


SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
                 LwPingTest, lwip_ping_test, lwip_ping_test);

#endif
