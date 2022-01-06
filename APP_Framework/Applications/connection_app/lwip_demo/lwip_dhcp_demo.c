/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2019 NXP
 * All rights reserved.
 *
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include "lwip/opt.h"

#if LWIP_IPV4 && LWIP_DHCP

#include "lwip/timeouts.h"
#include "lwip/ip_addr.h"
#include "lwip/init.h"
#include "lwip/dhcp.h"
#include "lwip/prot/dhcp.h"
#include "netif/ethernet.h"
#include "enet_ethernetif.h"

#include "board.h"

#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_gpio.h"
#include "fsl_iomuxc.h"
#include "sys_arch.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
/* IP address configuration. */
#define configIP_ADDR0 192
#define configIP_ADDR1 168
#define configIP_ADDR2 0
#define configIP_ADDR3 102

/* Netmask configuration. */
#define configNET_MASK0 255
#define configNET_MASK1 255
#define configNET_MASK2 255
#define configNET_MASK3 0

/* Gateway address configuration. */
#define configGW_ADDR0 192
#define configGW_ADDR1 168
#define configGW_ADDR2 0
#define configGW_ADDR3 100

/* MAC address configuration. */
#define configMAC_ADDR                     \
    {                                      \
        0x02, 0x12, 0x13, 0x10, 0x15, 0x11 \
    }

/* Address of PHY interface. */
#define EXAMPLE_PHY_ADDRESS BOARD_ENET0_PHY_ADDRESS

/* System clock name. */
#define EXAMPLE_CLOCK_NAME kCLOCK_CoreSysClk


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
 * @brief Prints DHCP status of the interface when it has changed from last status.
 *
 * @param netif network interface structure
 */
int print_dhcp_state(struct netif *netif)
{
    static u8_t dhcp_last_state = DHCP_STATE_OFF;
    struct dhcp *dhcp           = netif_dhcp_data(netif);

    if (dhcp == NULL)
    {
        dhcp_last_state = DHCP_STATE_OFF;
    }
    else if (dhcp_last_state != dhcp->state)
    {
        dhcp_last_state = dhcp->state;

        lw_pr_info(" DHCP state       : ");
        switch (dhcp_last_state)
        {
            case DHCP_STATE_OFF:
                lw_pr_info("OFF");
                break;
            case DHCP_STATE_REQUESTING:
                lw_pr_info("REQUESTING");
                break;
            case DHCP_STATE_INIT:
                lw_pr_info("INIT");
                break;
            case DHCP_STATE_REBOOTING:
                lw_pr_info("REBOOTING");
                break;
            case DHCP_STATE_REBINDING:
                lw_pr_info("REBINDING");
                break;
            case DHCP_STATE_RENEWING:
                lw_pr_info("RENEWING");
                break;
            case DHCP_STATE_SELECTING:
                lw_pr_info("SELECTING");
                break;
            case DHCP_STATE_INFORMING:
                lw_pr_info("INFORMING");
                break;
            case DHCP_STATE_CHECKING:
                lw_pr_info("CHECKING");
                break;
            case DHCP_STATE_BOUND:
                lw_pr_info("BOUND");
                break;
            case DHCP_STATE_BACKING_OFF:
                lw_pr_info("BACKING_OFF");
                break;
            default:
                lw_pr_info("%u", dhcp_last_state);
                assert(0);
                break;
        }
        lw_pr_info("\r\n");

        if (dhcp_last_state == DHCP_STATE_BOUND)
        {
            lw_pr_info("\r\n IPv4 Address     : %s\r\n", ipaddr_ntoa(&netif->ip_addr));
            lw_pr_info(" IPv4 Subnet mask : %s\r\n", ipaddr_ntoa(&netif->netmask));
            lw_pr_info(" IPv4 Gateway     : %s\r\n\r\n", ipaddr_ntoa(&netif->gw));
            return 1;
        }
    }
    return 0;
}

/*!
 * @brief Main function.
 */
void lwip_dhcp_test(void)
{
    static int flag = 0;
    struct netif fsl_netif0;
    ip4_addr_t fsl_netif0_ipaddr, fsl_netif0_netmask, fsl_netif0_gw;
    ethernetif_config_t fsl_enet_config0 = {
        .phyAddress = EXAMPLE_PHY_ADDRESS,
        .clockName  = EXAMPLE_CLOCK_NAME,
        .macAddress = configMAC_ADDR,
    };
    char ip_addr[4] = {0, 0, 0, 0};

    ETH_BSP_Config();

//    IP4_ADDR(&fsl_netif0_ipaddr, 0U, 0U, 0U, 0U);
//    IP4_ADDR(&fsl_netif0_netmask, 0U, 0U, 0U, 0U);
//    IP4_ADDR(&fsl_netif0_gw, 0U, 0U, 0U, 0U);

//    if(flag == 0)
//    {
//        lwip_init();
//        netif_add(&fsl_netif0, &fsl_netif0_ipaddr, &fsl_netif0_netmask, &fsl_netif0_gw, &fsl_enet_config0,
//            ethernetif0_init, ethernet_input);
//        netif_set_default(&fsl_netif0);
//        flag = 1;
//    }

//    netif_set_up(&fsl_netif0);
    lwip_config_net(ip_addr, ip_addr, ip_addr);
    is_lwip_test = 1;

    dhcp_start(&gnetif);

    lw_pr_info("\r\n************************************************\r\n");
    lw_pr_info(" DHCP example\r\n");
    lw_pr_info("************************************************\r\n");

    while (1)
    {
        /* Poll the driver, get any outstanding frames */
        ethernetif_input(&gnetif);

        /* Handle all system timeouts for all core protocols */
        sys_check_timeouts();

        /* Print DHCP progress */
        if(print_dhcp_state(&gnetif))
        {
            break;
        }
    }

    is_lwip_test = 0;
}


SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     DHCPTest, lwip_dhcp_test, DHCP_Test);

#endif
