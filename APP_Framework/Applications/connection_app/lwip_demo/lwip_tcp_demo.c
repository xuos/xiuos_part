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
#include <lwip/sockets.h>
#include "lwip/sys.h"
#include "tcpecho_raw.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

char tcp_target[] = {192, 168, 250, 252};
char* tcp_send_msg = "\n\nThis one is TCP pkg. Congratulations on you.\n\n";

/*******************************************************************************
 * Code
 ******************************************************************************/

static void lwip_tcp_send_thread(void *arg)
{
  int cnt = 5;
  lw_print("lwip_tcp_send_thread start.\n");

  int sock_tcp_send_once = -1;
  sock_tcp_send_once = socket(AF_INET, SOCK_STREAM, 0);
  if (sock_tcp_send_once < 0)
  {
    lw_print("Socket error\n");
    goto __exit;
  }

  struct sockaddr_in tcp_sock;
  tcp_sock.sin_family = AF_INET;
  tcp_sock.sin_port = htons(TARGET_PORT_CLIENT);
  tcp_sock.sin_addr.s_addr = PP_HTONL(LWIP_MAKEU32(tcp_target[0],tcp_target[1],tcp_target[2],tcp_target[3]));
  memset(&(tcp_sock.sin_zero), 0, sizeof(tcp_sock.sin_zero));

  if (connect(sock_tcp_send_once, (struct sockaddr *)&tcp_sock, sizeof(struct sockaddr)))
  {
    lw_print("Unable to connect\n");
    goto __exit;
  }

  lw_print("tcp connect success, start to send.\n");
  lw_print("\n\nTarget Port:%d\n\n", tcp_sock.sin_port);

  while (cnt --)
  {
    lw_print("Lwip client is running.\n");

    sendto(sock_tcp_send_once,tcp_send_msg,
     strlen(tcp_send_msg),0,
     (struct sockaddr*)&tcp_sock,
     sizeof(struct sockaddr));

    lw_print("Send tcp msg: %s ", tcp_send_msg);

    MdelayKTask(1000);
  }
  return;

__exit:
  if (sock_tcp_send_once >= 0) closesocket(sock_tcp_send_once);

  return;
}

void
lwip_tcp_send_init(void)
{
    sys_thread_new("tcp send", lwip_tcp_send_thread, NULL, 4096, 25);
}


void lwip_tcp_client_run(int argc, char *argv[])
{
    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &tcp_target[0], &tcp_target[1], &tcp_target[2], &tcp_target[3]);
    }

    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    lwip_tcp_send_init();
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     LwTcpClient, lwip_tcp_client_run, TCP Client);


void lwip_tcp_server_run(void)
{
    ETH_BSP_Config();
    lwip_config_net(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    tcpecho_raw_init();
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     LwTcpServer, lwip_tcp_server_run, TCP server);

