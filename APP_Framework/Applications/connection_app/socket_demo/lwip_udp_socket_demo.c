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
* @file lwip_udp_demo.c
* @brief One UDP demo based on LwIP
* @version 1.0
* @author AIIT XUOS Lab
* @date 2021-05-29
*/
#include <transform.h>
#include <xiuos.h>
#include "board.h"
#include "sys_arch.h"
#include "udp_socket.h"
#include "lwip/udp.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

static struct udp_pcb *udpecho_raw_pcb;
char udp_socket_ip[] = {192, 168, 250, 252};

/*******************************************************************************
 * Code
 ******************************************************************************/

static void lwip_udp_socket_thread(void* param)
{
    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    UdpSocketInit();
}

void lwip_udp_socket_run(int argc, char *argv[])
{
    int result = 0;
    pthread_t th_id;
    pthread_attr_t attr;

    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &udp_socket_ip[0], &udp_socket_ip[1], &udp_socket_ip[2], &udp_socket_ip[3]);
    }

    sys_thread_new("udp socket", lwip_udp_socket_thread, NULL, 4096, 15);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     UDPSocket, lwip_udp_socket_run, UDP send echo);

