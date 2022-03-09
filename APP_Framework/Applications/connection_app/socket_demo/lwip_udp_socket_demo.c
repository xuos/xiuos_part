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
* @file lwip_udp_socket_demo.c
* @brief One UDP demo based on LwIP
* @version 1.0
* @author AIIT XUOS Lab
* @date 2021-05-29
*/
#include <transform.h>
#include <xizi.h>
#include "board.h"
#include "sys_arch.h"
#include "lwip/udp.h"
#include "lwip/opt.h"
#include <lwip/sockets.h>
#include "lwip/sys.h"

#define UDP_BUF_SIZE 65536

extern char udp_target[];
static struct udp_pcb *udpecho_raw_pcb;
char udp_socket_ip[] = {192, 168, 250, 252};

/******************************************************************************/

static void UdpSocketRecvTask(void *arg)
{
    lw_print("UdpSocketRecvTask start.\n");

    int socket_fd = -1;
    char *recv_buf;
    struct sockaddr_in udp_addr, server_addr;
    int recv_len;
    socklen_t addr_len;

    while(1)
    {
        recv_buf = (char *)malloc(UDP_BUF_SIZE);
        if(recv_buf == NULL)
        {
            lw_print("No memory\n");
            goto __exit;
        }

        socket_fd = socket(AF_INET, SOCK_DGRAM, 0);
        if(socket_fd < 0)
        {
            lw_print("Socket error\n");
            goto __exit;
        }

        udp_addr.sin_family = AF_INET;
        udp_addr.sin_addr.s_addr = INADDR_ANY;
        udp_addr.sin_port = htons(LWIP_LOCAL_PORT);
        memset(&(udp_addr.sin_zero), 0, sizeof(udp_addr.sin_zero));

        if(bind(socket_fd, (struct sockaddr *)&udp_addr, sizeof(struct sockaddr)) == -1)
        {
            lw_print("Unable to bind\n");
            goto __exit;
        }

        lw_print("UDP bind sucess, start to receive.\n");
        lw_print("\n\nLocal Port:%d\n\n", LWIP_LOCAL_PORT);

        while(1)
        {
            memset(recv_buf, 0, UDP_BUF_SIZE);
            recv_len = recvfrom(socket_fd, recv_buf, UDP_BUF_SIZE, 0, (struct sockaddr *)&server_addr, &addr_len);
            lw_pr_info("Receive from : %s\n", inet_ntoa(server_addr.sin_addr));
            lw_pr_info("Receive data : %s\n\n", recv_buf);
            sendto(socket_fd, recv_buf, recv_len, 0, (struct sockaddr*)&server_addr, addr_len);
        }

    __exit:
        if(socket_fd >= 0)
        {
            closesocket(socket_fd);
        }

        if(recv_buf)
        {
            free(recv_buf);
        }
    }
}

void UdpSocketRecvTask(int argc, char *argv[])
{
    int result = 0;
    pthread_t th_id;
    pthread_attr_t attr;

    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &udp_socket_ip[0], &udp_socket_ip[1], &udp_socket_ip[2], &udp_socket_ip[3]);
    }

    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    sys_thread_new("UdpSocketRecvTask", UdpSocketRecvTask, NULL, LWIP_TASK_STACK_SIZE, LWIP_DEMO_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     UDPSocketRecv, UdpSocketRecvTask, UDP recv echo);

static void UdpSocketSendTask(void *arg)
{
    int cnt = LWIP_DEMO_TIMES;
    char send_str[128];

    lw_print("UdpSocketSendTask start.\n");

    int socket_fd = -1;
    memset(send_str, 0, sizeof(send_str));

    socket_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if(socket_fd < 0)
    {
        lw_print("Socket error\n");
        goto __exit;
    }

    struct sockaddr_in udp_sock;
    udp_sock.sin_family = AF_INET;
    udp_sock.sin_port = htons(LWIP_TARGET_PORT);
    udp_sock.sin_addr.s_addr = PP_HTONL(LWIP_MAKEU32(udp_target[0], udp_target[1], udp_target[2], udp_target[3]));
    memset(&(udp_sock.sin_zero), 0, sizeof(udp_sock.sin_zero));

    if(connect(socket_fd, (struct sockaddr *)&udp_sock, sizeof(struct sockaddr)))
    {
        lw_print("Unable to connect\n");
        goto __exit;
    }

    lw_print("UDP connect success, start to send.\n");
    lw_print("\n\nTarget Port:%d\n\n", udp_sock.sin_port);

    while (cnt --)
    {
        snprintf(send_str, sizeof(send_str), "UDP test package times %d\r\n", cnt);
        sendto(socket_fd, send_str, strlen(send_str), 0, (struct sockaddr*)&udp_sock, sizeof(struct sockaddr));
        lw_pr_info("Send UDP msg: %s ", send_str);
        MdelayKTask(1000);
    }

__exit:
    if(socket_fd >= 0)
    {
        closesocket(socket_fd);
    }

    return;
}

void UdpSocketSendTest(int argc, char *argv[])
{
    int result = 0;
    pthread_t th_id;
    pthread_attr_t attr;

    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &udp_socket_ip[0], &udp_socket_ip[1], &udp_socket_ip[2], &udp_socket_ip[3]);
    }

    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    sys_thread_new("UdpSocketSendTask", UdpSocketSendTask, NULL, LWIP_TASK_STACK_SIZE, LWIP_DEMO_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     UDPSocketSend, UdpSocketSendTest, UDP send echo);

