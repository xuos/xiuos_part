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
 * @file lwip_config_demo.c
 * @brief Demo for ping function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.12.15
 */


/*******************************************************************************
 * Includes
 ******************************************************************************/

#include "lwip/opt.h"

#if LWIP_IPV4 && LWIP_RAW

#include "ping.h"

#include "lwip/timeouts.h"
#include "lwip/init.h"
#include "netif/ethernet.h"

#include "board.h"
#include "pin_mux.h"
#include "clock_config.h"

#include <transform.h>
#include <sys_arch.h>
#include "connect_ethernet.h"
#include "lwip_demo.h"

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

static void *lwip_config_test(void *param)
{
    ETH_BSP_Config();
    lwip_config_net(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
}

void lwip_setip_thread(int argc, char *argv[])
{
    int result = 0;
    pthread_t th_id;
    pthread_attr_t attr;

    attr.schedparam.sched_priority = 15;
    attr.stacksize = 4096;

    if(argc >= 4)
    {
        lw_print("lw: [%s] ip %s mask %s gw %s\n", __func__, argv[1], argv[2], argv[3]);
        sscanf(argv[1], "%d.%d.%d.%d", &lwip_ipaddr[0], &lwip_ipaddr[1], &lwip_ipaddr[2], &lwip_ipaddr[3]);
        sscanf(argv[2], "%d.%d.%d.%d", &lwip_netmask[0], &lwip_netmask[1], &lwip_netmask[2], &lwip_netmask[3]);
        sscanf(argv[3], "%d.%d.%d.%d", &lwip_gwaddr[0], &lwip_gwaddr[1], &lwip_gwaddr[2], &lwip_gwaddr[3]);
    }
    else if(argc == 2)
    {
        lw_print("lw: [%s] ipaddr %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &lwip_ipaddr[0], &lwip_ipaddr[1], &lwip_ipaddr[2], &lwip_ipaddr[3]);
    }

    result = pthread_create(&th_id, &attr, lwip_config_test, NULL);
    if (0 == result) {
        lw_print("lwip_config_test %d successfully!\n", th_id);
    } else {
        lw_print("lwip_config_test failed! error code is %d\n", result);
    }
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     setip, lwip_setip_thread, SetIp [IP] [Netmask] [Gateway]);


void lwip_getip_thread(int argc, char *argv[])
{
    lw_pr_info("\r\n************************************************\r\n");
    lw_pr_info(" Network Configuration\r\n");
    lw_pr_info("************************************************\r\n");
    lw_pr_info(" IPv4 Address   : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_ipaddr)[0], ((u8_t *)&lwip_ipaddr)[1],
         ((u8_t *)&lwip_ipaddr)[2], ((u8_t *)&lwip_ipaddr)[3]);
    lw_pr_info(" IPv4 Subnet mask : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_netmask)[0], ((u8_t *)&lwip_netmask)[1],
         ((u8_t *)&lwip_netmask)[2], ((u8_t *)&lwip_netmask)[3]);
    lw_pr_info(" IPv4 Gateway   : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_gwaddr)[0], ((u8_t *)&lwip_gwaddr)[1],
         ((u8_t *)&lwip_gwaddr)[2], ((u8_t *)&lwip_gwaddr)[3]);
    lw_pr_info("************************************************\r\n");
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     showip, lwip_getip_thread, GetIp [IP] [Netmask] [Gateway]);

#endif
