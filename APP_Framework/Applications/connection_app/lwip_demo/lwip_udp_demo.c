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
* @file tcp_echo_socket_demo.c
* @brief One UDP demo based on LwIP
* @version 1.0
* @author AIIT XUOS Lab
* @date 2021-05-29
*/
#include <transform.h>
#include <xiuos.h>
#include "board.h"
#include "sys_arch.h"
#include "udp_echo.h"
#include "lwip/udp.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

#define UDP_TASK_STACK_SIZE 4096
#define UDP_TASK_PRIO 15

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

static struct udp_pcb *udpecho_raw_pcb;
char udp_target[] = {192, 168, 250, 252};

/*******************************************************************************
 * Code
 ******************************************************************************/

static void *lwip_udp_test(void* param)
{
    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    UdpEchoInit();
}

void lwip_udp_thread(int argc, char *argv[])
{
    int result = 0;
    pthread_t th_id;
    pthread_attr_t attr;

    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &udp_target[0], &udp_target[1], &udp_target[2], &udp_target[3]);
    }

    attr.schedparam.sched_priority = UDP_TASK_PRIO;
    attr.stacksize = UDP_TASK_STACK_SIZE;

    result = pthread_create(&th_id, &attr, lwip_udp_test, NULL);
    if (0 == result) {
        lw_print("lwip_udp_test successfully!\n");
    } else {
        lw_print("lwip_udp_test failed! error code is %d\n", result);
    }
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     LwUdpEcho, lwip_udp_thread, UDP send echo);

static void
udpecho_raw_recv(void *arg, struct udp_pcb *upcb, struct pbuf *p,
                 const ip_addr_t *addr, u16_t port)
{
  LWIP_UNUSED_ARG(arg);
  if (p != NULL) {
    /* send received packet back to sender */
    udp_sendto(upcb, p, addr, port);
    /* free the pbuf */
    pbuf_free(p);
  }
}

void
udpecho_raw_init(void)
{
  udpecho_raw_pcb = udp_new_ip_type(IPADDR_TYPE_ANY);
  if (udpecho_raw_pcb != NULL) {
    err_t err;

    err = udp_bind(udpecho_raw_pcb, IP_ANY_TYPE, LOCAL_PORT_SERVER);
    if (err == ERR_OK) {
      udp_recv(udpecho_raw_pcb, udpecho_raw_recv, NULL);
    } else {
      /* abort? output diagnostic? */
    }
  } else {
    /* abort? output diagnostic? */
  }
}

void lwip_udp_server(void)
{
    ETH_BSP_Config();
    lwip_config_net(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    udpecho_raw_init();
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     LwUdpServer, lwip_udp_server, UDP server echo);

