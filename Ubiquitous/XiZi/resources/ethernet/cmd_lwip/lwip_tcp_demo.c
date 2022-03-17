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
#include <xizi.h>
#include "board.h"
#include "sys_arch.h"
#include <lwip/sockets.h>
#include "lwip/sys.h"
#include "tcpecho_raw.h"

#define MSG_SIZE 128

// this is for test in shell, in fact, shell restrict the length of input string, which is less then 128
char tcp_send_msg[MSG_SIZE] = {0};
char tcp_target[] = {192, 168, 250, 252};

/******************************************************************************/

static void LwipTcpSendTask(void *arg)
{
    lw_print("LwipTcpSendTask start.\n");

    int fd = -1;
    fd = socket(AF_INET, SOCK_STREAM, 0);
    if (fd < 0)
    {
        lw_print("Socket error\n");
        return;
    }

    struct sockaddr_in tcp_sock;
    tcp_sock.sin_family = AF_INET;
    tcp_sock.sin_port = htons(LWIP_TARGET_PORT);
    tcp_sock.sin_addr.s_addr = PP_HTONL(LWIP_MAKEU32(tcp_target[0], tcp_target[1], tcp_target[2], tcp_target[3]));
    memset(&(tcp_sock.sin_zero), 0, sizeof(tcp_sock.sin_zero));

    if (connect(fd, (struct sockaddr *)&tcp_sock, sizeof(struct sockaddr)))
    {
        lw_print("Unable to connect\n");
        goto __exit;
    }

    lw_print("tcp connect success, start to send.\n");
    lw_print("\n\nTarget Port:%d\n\n", tcp_sock.sin_port);

    sendto(fd, tcp_send_msg, strlen(tcp_send_msg), 0, (struct sockaddr*)&tcp_sock, sizeof(struct sockaddr));

    lw_print("Send tcp msg: %s ", tcp_send_msg);

__exit:
    if (fd >= 0)
        closesocket(fd);

    return;
}

void LwipTcpSendTest(int argc, char *argv[])
{
    memset(tcp_send_msg, 0, MSG_SIZE);
    if(argc >= 2)
    {
        strncpy(tcp_send_msg, argv[1], strlen(argv[1]));
    }
    else
    {
        strncpy(tcp_send_msg, "hello world", strlen("hello world"));
    }
    strcat(tcp_send_msg, "\r\n");

    if(argc >= 3)
    {
        sscanf(argv[2], "%d.%d.%d.%d", &tcp_target[0], &tcp_target[1], &tcp_target[2], &tcp_target[3]);
    }

    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    sys_thread_new("tcp send", LwipTcpSendTask, NULL, LWIP_TASK_STACK_SIZE, LWIP_DEMO_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     TCPSend, LwipTcpSendTest, TCP Send message);

void LwipTcpRecvTest(void)
{
    lwip_config_net(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    tcpecho_raw_init();
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
    TCPRecv, LwipTcpRecvTest, TCP Recv message);

