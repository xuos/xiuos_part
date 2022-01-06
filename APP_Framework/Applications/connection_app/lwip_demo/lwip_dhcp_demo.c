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
    char ip_addr[4] = {0, 0, 0, 0};

    ETH_BSP_Config();

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
            sscanf(ipaddr_ntoa(&gnetif.ip_addr), "%d.%d.%d.%d", &lwip_ipaddr[0], &lwip_ipaddr[1],
                &lwip_ipaddr[2], &lwip_ipaddr[3]);

            sscanf(ipaddr_ntoa(&gnetif.netmask), "%d.%d.%d.%d", &lwip_netmask[0], &lwip_netmask[1],
                &lwip_netmask[2], &lwip_netmask[3]);

            sscanf(ipaddr_ntoa(&gnetif.gw), "%d.%d.%d.%d", &lwip_gwaddr[0], &lwip_gwaddr[1],
                &lwip_gwaddr[2], &lwip_gwaddr[3]);

            break;
        }
    }

    is_lwip_test = 0;
}


SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     getip, lwip_dhcp_test, DHCP_Test);

#endif
