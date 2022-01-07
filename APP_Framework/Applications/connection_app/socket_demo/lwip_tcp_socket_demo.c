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

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

char tcp_socket_ip[] = {192, 168, 250, 252};

#define TCP_BUF_SIZE 1024

/*******************************************************************************
 * Code
 ******************************************************************************/

static void tcp_recv_demo(void *arg)
{
    lw_print("tcp_recv_demo start.\n");

    int socket_fd = -1;
    char *recv_buf;
    struct sockaddr_in tcp_addr, server_addr;
    int recv_len;
    socklen_t addr_len;

    while(1)
    {
        recv_buf = (char *)malloc(TCP_BUF_SIZE);
        if (recv_buf == NULL)
        {
            lw_print("No memory\n");
            goto __exit;
        }

        socket_fd = socket(AF_INET, SOCK_STREAM, 0);
        if (socket_fd < 0)
        {
            lw_print("Socket error\n");
            goto __exit;
        }

        tcp_addr.sin_family = AF_INET;
        tcp_addr.sin_addr.s_addr = INADDR_ANY;
        tcp_addr.sin_port = htons(LOCAL_PORT_SERVER);
        memset(&(tcp_addr.sin_zero), 0, sizeof(tcp_addr.sin_zero));

        if (bind(socket_fd, (struct sockaddr *)&tcp_addr, sizeof(struct sockaddr)) == -1)
        {
            lw_print("Unable to bind\n");
            goto __exit;
        }

        lw_print("tcp bind sucess, start to receive.\n");
        lw_print("\n\nLocal Port:%d\n\n", LOCAL_PORT_SERVER);

        while(1)
        {
            memset(recv_buf, 0, TCP_BUF_SIZE);
            recv_len = recvfrom(socket_fd, recv_buf, TCP_BUF_SIZE, 0, (struct sockaddr *)&server_addr, &addr_len);
            lw_print("Receive from : %s\n", inet_ntoa(server_addr.sin_addr));
            lw_print("Receive data : %s\n\n", recv_buf);
            sendto(socket_fd, recv_buf, recv_len, 0, (struct sockaddr*)&server_addr, addr_len);
        }

    __exit:
        if (socket_fd >= 0)
            closesocket(socket_fd);

        if (recv_buf)
            free(recv_buf);
    }
}

void tcp_socket_recv_run(int argc, char *argv[])
{
    int result = 0;
    pthread_t th_id;
    pthread_attr_t attr;

    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &tcp_socket_ip[0], &tcp_socket_ip[1], &tcp_socket_ip[2], &tcp_socket_ip[3]);
    }

    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    sys_thread_new("tcp_recv_demo", tcp_recv_demo, NULL, 4096, 25);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     TcpSocketRecv, tcp_socket_recv_run, TCP recv echo);

static void tcp_send_demo(void *arg)
{
    int cnt = TEST_LWIP_TIMES;
    lw_print("tcp_send_demo start.\n");
    int fd = -1;
    char send_msg[128];

    memset(send_msg, 0, sizeof(send_msg));
    fd = socket(AF_INET, SOCK_STREAM, 0);
    if (fd < 0)
    {
        lw_print("Socket error\n");
        goto __exit;
    }

    struct sockaddr_in tcp_sock;
    tcp_sock.sin_family = AF_INET;
    tcp_sock.sin_port = htons(TARGET_PORT_CLIENT);
    tcp_sock.sin_addr.s_addr = PP_HTONL(LWIP_MAKEU32(tcp_socket_ip[0],tcp_socket_ip[1],tcp_socket_ip[2],tcp_socket_ip[3]));
    memset(&(tcp_sock.sin_zero), 0, sizeof(tcp_sock.sin_zero));

    if (connect(fd, (struct sockaddr *)&tcp_sock, sizeof(struct sockaddr)))
    {
        lw_print("Unable to connect\n");
        goto __exit;
    }

    lw_print("tcp connect success, start to send.\n");
    lw_print("\n\nTarget Port:%d\n\n", tcp_sock.sin_port);

    while (cnt --)
    {
        lw_print("Lwip client is running.\n");
        snprintf(send_msg, sizeof(send_msg), "TCP test package times %d\r\n", cnt);
        sendto(fd, send_msg, strlen(send_msg), 0, (struct sockaddr*)&tcp_sock, sizeof(struct sockaddr));
        lw_print("Send tcp msg: %s ", send_msg);
        MdelayKTask(1000);
    }

__exit:
    if (fd >= 0)
        closesocket(fd);

    return;
}


void tcp_socket_send_run(int argc, char *argv[])
{
    if(argc == 2)
    {
        lw_print("lw: [%s] gw %s\n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &tcp_socket_ip[0], &tcp_socket_ip[1], &tcp_socket_ip[2], &tcp_socket_ip[3]);
    }

    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    sys_thread_new("tcp socket", tcp_send_demo, NULL, 4096, 25);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     TCPSocketSend, tcp_socket_send_run, TCP send demo);

