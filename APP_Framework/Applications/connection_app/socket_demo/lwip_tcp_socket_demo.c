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

/*******************************************************************************
 * Definitions
 ******************************************************************************/

#define TCP_DEMO_BUF_SIZE 65535

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

char tcp_socket_ip[] = {192, 168, 250, 252};

/*******************************************************************************
 * Code
 ******************************************************************************/

static void TCPSocketRecvTask(void *arg)
{
    int fd = -1, clientfd;
    int recv_len;
    char *recv_buf;
    struct sockaddr_in tcp_addr;
    socklen_t addr_len;

    while(1)
    {
        recv_buf = (char *)malloc(TCP_DEMO_BUF_SIZE);
        if (recv_buf == NULL)
        {
            lw_print("No memory\n");
            goto __exit;
        }

        fd = socket(AF_INET, SOCK_STREAM, 0);
        if (fd < 0)
        {
            lw_print("Socket error\n");
            goto __exit;
        }

        tcp_addr.sin_family = AF_INET;
        tcp_addr.sin_addr.s_addr = INADDR_ANY;
        tcp_addr.sin_port = htons(LWIP_LOCAL_PORT);
        memset(&(tcp_addr.sin_zero), 0, sizeof(tcp_addr.sin_zero));

        if (bind(fd, (struct sockaddr *)&tcp_addr, sizeof(struct sockaddr)) == -1)
        {
            lw_print("Unable to bind\n");
            goto __exit;
        }

        lw_print("tcp bind success, start to receive.\n");
        lw_pr_info("\n\nLocal Port:%d\n\n", LWIP_LOCAL_PORT);

        // setup socket fd as listening mode
        if (listen(fd, 5) != 0 )
        {
            lw_print("Unable to listen\n");
            goto __exit;
        }

        // accept client connection
        clientfd = accept(fd, (struct sockaddr *)&tcp_addr, (socklen_t*)&addr_len);
        lw_pr_info("client %s connected\n", inet_ntoa(tcp_addr.sin_addr));

        while(1)
        {
            memset(recv_buf, 0, TCP_DEMO_BUF_SIZE);
            recv_len = recvfrom(clientfd, recv_buf, TCP_DEMO_BUF_SIZE, 0, (struct sockaddr *)&tcp_addr, &addr_len);
            if(recv_len > 0)
            {
                lw_pr_info("Receive from : %s\n", inet_ntoa(tcp_addr.sin_addr));
                lw_pr_info("Receive data : %d - %s\n\n", recv_len, recv_buf);
            }
            sendto(clientfd, recv_buf, recv_len, 0, (struct sockaddr*)&tcp_addr, addr_len);
        }

    __exit:
        if (fd >= 0)
            closesocket(fd);

        if (recv_buf)
            free(recv_buf);
    }
}

void TCPSocketRecvTest(int argc, char *argv[])
{
    int result = 0;
    pthread_t th_id;
    pthread_attr_t attr;

    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &tcp_socket_ip[0], &tcp_socket_ip[1], &tcp_socket_ip[2], &tcp_socket_ip[3]);
    }

    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    sys_thread_new("TCPSocketRecvTask", TCPSocketRecvTask, NULL, LWIP_TASK_STACK_SIZE, LWIP_DEMO_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     TCPSocketRecv, TCPSocketRecvTest, TCP recv echo);

static void TCPSocketSendTask(void *arg)
{
    int cnt = LWIP_DEMO_TIMES;
    int fd = -1;
    char send_msg[128];

    lw_print("%s start\n", __func__);

    memset(send_msg, 0, sizeof(send_msg));
    fd = socket(AF_INET, SOCK_STREAM, 0);
    if (fd < 0)
    {
        lw_print("Socket error\n");
        goto __exit;
    }

    struct sockaddr_in tcp_sock;
    tcp_sock.sin_family = AF_INET;
    tcp_sock.sin_port = htons(LWIP_TARGET_PORT);
    tcp_sock.sin_addr.s_addr = PP_HTONL(LWIP_MAKEU32(tcp_socket_ip[0], tcp_socket_ip[1], tcp_socket_ip[2], tcp_socket_ip[3]));
    memset(&(tcp_sock.sin_zero), 0, sizeof(tcp_sock.sin_zero));

    if (connect(fd, (struct sockaddr *)&tcp_sock, sizeof(struct sockaddr)))
    {
        lw_print("Unable to connect\n");
        goto __exit;
    }

    lw_print("tcp connect success, start to send.\n");
    lw_pr_info("\n\nTarget Port:%d\n\n", LWIP_TARGET_PORT);

    while (cnt --)
    {
        lw_print("Lwip client is running.\n");
        snprintf(send_msg, sizeof(send_msg), "TCP test package times %d\r\n", cnt);
        sendto(fd, send_msg, strlen(send_msg), 0, (struct sockaddr*)&tcp_sock, sizeof(struct sockaddr));
        lw_pr_info("Send tcp msg: %s ", send_msg);
        MdelayKTask(1000);
    }

__exit:
    if (fd >= 0)
        closesocket(fd);

    return;
}


void TCPSocketSendTest(int argc, char *argv[])
{
    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &tcp_socket_ip[0], &tcp_socket_ip[1], &tcp_socket_ip[2], &tcp_socket_ip[3]);
    }

    lwip_config_tcp(lwip_ipaddr, lwip_netmask, tcp_socket_ip);
    sys_thread_new("tcp socket", TCPSocketSendTask, NULL, LWIP_TASK_STACK_SIZE, LWIP_DEMO_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     TCPSocketSend, TCPSocketSendTest, TCP send demo);

