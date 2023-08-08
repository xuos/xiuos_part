/*
* Copyright (c) 2022 AIIT XUOS Lab
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
* @date 2022-03-21
*/
#include "board.h"
#include "sys_arch.h"
#include "lwip/udp.h"
#include <shell.h>
#include <sys.h>
#include <xizi.h>
#include "lwip/sockets.h"


#define PBUF_SIZE 27

static struct udp_pcb *udpecho_raw_pcb;

char udp_server_ip[] = {192, 168, 130, 2};
u16_t udp_server_port = LWIP_TARGET_PORT;
int32 udp_send_num = 0;
int8 udp_send_task_on = 0;
uint32 udp_interval = 50;

char hello_str[] = {"hello world\r\n"};
char udp_demo_msg[] = "\nThis one is UDP package!!!\n";

/******************************************************************************/

static void LwipUDPSendTask(void *arg)
{
    int cnt = LWIP_DEMO_TIMES;

    KPrintf("udp_send_demo start.\n");

    int socket_fd = -1;
    socket_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if (socket_fd < 0) {
        KPrintf("Socket error\n");
        return;
    }

    struct sockaddr_in udp_sock;
    udp_sock.sin_family = AF_INET;
    udp_sock.sin_port = htons(udp_server_port);
    udp_sock.sin_addr.s_addr = PP_HTONL(LWIP_MAKEU32(udp_server_ip[0], udp_server_ip[1], udp_server_ip[2], udp_server_ip[3]));
    memset(&(udp_sock.sin_zero), 0, sizeof(udp_sock.sin_zero));

    if (connect(socket_fd, (struct sockaddr *)&udp_sock, sizeof(struct sockaddr))) {
        KPrintf("Unable to connect\n");
        closesocket(socket_fd);
        return;
    }

    KPrintf("UDP connect success, start to send.\n");
    KPrintf("\n\nTarget Port:%d\n\n", udp_sock.sin_port);
    udp_send_task_on = 1;

    while(udp_send_num > 0 || udp_send_num == -1) {
        sendto(socket_fd, udp_demo_msg, strlen(udp_demo_msg), 0, (struct sockaddr*)&udp_sock, sizeof(struct sockaddr));
        KPrintf("Send UDP msg: %s \n", udp_demo_msg);
        MdelayKTask(udp_interval);
        udp_send_num--;
    }
    closesocket(socket_fd);
    udp_send_task_on = 0;
    return;
}

void *LwipUdpSendTest(int argc, char *argv[])
{
    if(udp_send_task_on) {
        udp_send_num = 0;
        printf("waitting send task exit...\n");
        while(udp_send_task_on){
            MdelayKTask(1000);
        }
        udp_send_num = 1;
    }

    uint8_t enet_port = 0; ///< test enet port 0
    memset(udp_demo_msg, 0, sizeof(udp_demo_msg));

    if(argc == 1) {
        KPrintf("lw: [%s] gw %d.%d.%d.%d:%d\n", __func__, udp_server_ip[0], udp_server_ip[1], udp_server_ip[2], udp_server_ip[3], udp_server_port);
        strncpy(udp_demo_msg, hello_str, strlen(hello_str));
        udp_send_num = 10;
        udp_interval = 100;
    } else {
        strncpy(udp_demo_msg, argv[1], strlen(argv[1]));
        strncat(udp_demo_msg, "\r\n", 3);
        if(argc >= 3) {
            sscanf(argv[2], "%d.%d.%d.%d:%d", &udp_server_ip[0], &udp_server_ip[1], &udp_server_ip[2], &udp_server_ip[3], &udp_server_port);
        }
        if(argc > 3) {
            sscanf(argv[3], "%d", &udp_send_num);
            sscanf(argv[4], "%d", &udp_interval);
        }
    }

    KPrintf("lw: [%s] gw %d.%d.%d.%d:%d send time %d udp_interval %d\n", __func__, udp_server_ip[0], udp_server_ip[1], udp_server_ip[2], udp_server_ip[3], udp_server_port, udp_send_num, udp_interval);

    //init lwip and net dirver
    lwip_config_net(enet_port, lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    sys_thread_new("udp send", LwipUDPSendTask, NULL, LWIP_TASK_STACK_SIZE, LWIP_DEMO_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(5),
     UDPSend, LwipUdpSendTest, UDPSend msg [ip:port [num [interval]]]);

void LwipUdpRecvTest(void)
{
    uint8_t enet_port = 0; ///< test enet port 0

    //init lwip and net dirver
    lwip_config_net(enet_port, lwip_ipaddr, lwip_netmask, lwip_gwaddr);

    uint8_t *recv_data;
    socklen_t sin_size;
    int sock = -1, connected, bytes_received, i;
    struct sockaddr_in server_addr, client_addr;
    fd_set readset;
    struct timeval timeout;

    sock = socket(PF_INET, SOCK_DGRAM, 0);
    if (sock < 0) {
        KPrintf("[%s:%d] Socket error!\n", __FILE__, __LINE__);
        goto __exit;
    }

    recv_data = (uint8_t *)malloc(128);
    if (recv_data == NULL) {
        KPrintf("No memory!\n");
        goto __exit;
    }

    //configure udp server param
    server_addr.sin_family = PF_INET;
    server_addr.sin_port = htons(udp_server_port);
    server_addr.sin_addr.s_addr = INADDR_ANY;
    memset(&(server_addr.sin_zero), 0x0, sizeof(server_addr.sin_zero));

    if (bind(sock, (struct sockaddr *)&server_addr, sizeof(struct sockaddr)) == -1) {
        KPrintf("Unable to bind!\n");
        goto __exit;
    }

    timeout.tv_sec = 30;
    timeout.tv_usec = 0;

    if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, &timeout, sizeof(timeout)) == -1) {
        KPrintf("setsockopt failed!");
        goto __exit;
    }

    while (1) {
        bytes_received = recvfrom(sock, recv_data, 128, 0, (struct sockaddr *)&client_addr, (socklen_t*)&sin_size);
        if (bytes_received == 0) {
            KPrintf("client disconnected (%s, %d)\n",
                inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));
            break;
        } else if (bytes_received < 0) {
            KPrintf("recv error, client: (%s, %d)\n",
                inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));
            break;
        } else {
            KPrintf("new client connected from (%s, %d)\n",
                inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));
            KPrintf("recv data length %d Bytes\n", bytes_received);
            for (i = 0; i < bytes_received; i ++) {
                KPrintf("data 0x%x\n", recv_data[i]);
            }
            if (i = bytes_received) {
                KPrintf("\r\n");
                memset(recv_data, 0, sizeof(recv_data));
            }
        }
    }

__exit:
    if (sock >= 0) closesocket(sock);
    if (recv_data) free(recv_data);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     UDPRecv, LwipUdpRecvTest, UDP Receive echo);

