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
#include <xiuos.h>
#include "board.h"
#include "sys_arch.h"
#include "lwip/udp.h"
#include <lwip/sockets.h>
#include "lwip/sys.h"


/*******************************************************************************
 * Definitions
 ******************************************************************************/

#define UDP_TASK_STACK_SIZE 4096
#define UDP_TASK_PRIO 15
#define PBUF_SIZE 27

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

static struct udp_pcb *udpecho_raw_pcb;
char udp_target[] = {192, 168, 250, 252};
char hello_str[] = {"hello world\r\n"};
char udp_send_msg[] = "\n\nThis one is UDP pkg. Congratulations on you.\n\n";

/*******************************************************************************
 * Code
 ******************************************************************************/

static void LwipUDPSendTask(void *arg)
{
    int cnt = LWIP_DEMO_TIMES;

    lw_print("udp_send_demo start.\n");

    int socket_fd = -1;
    socket_fd = socket(AF_INET, SOCK_DGRAM, 0);
    if (socket_fd < 0)
    {
        lw_print("Socket error\n");
        return;
    }

    struct sockaddr_in udp_sock;
    udp_sock.sin_family = AF_INET;
    udp_sock.sin_port = htons(LWIP_TARGET_PORT);
    udp_sock.sin_addr.s_addr = PP_HTONL(LWIP_MAKEU32(udp_target[0],udp_target[1],udp_target[2],udp_target[3]));
    memset(&(udp_sock.sin_zero), 0, sizeof(udp_sock.sin_zero));

    if (connect(socket_fd, (struct sockaddr *)&udp_sock, sizeof(struct sockaddr)))
    {
        lw_print("Unable to connect\n");
        goto __exit;
    }

    lw_print("UDP connect success, start to send.\n");
    lw_print("\n\nTarget Port:%d\n\n", udp_sock.sin_port);

    sendto(socket_fd, udp_send_msg, strlen(udp_send_msg), 0, (struct sockaddr*)&udp_sock, sizeof(struct sockaddr));
    lw_pr_info("Send UDP msg: %s ", udp_send_msg);

__exit:
    if (socket_fd >= 0)
    {
        closesocket(socket_fd);
    }

    return;
}

void *LwipUdpSendTest(int argc, char *argv[])
{
    int result = 0;
    sys_thread_t th_id;

    memset(udp_send_msg, 0, sizeof(udp_send_msg));

    if(argc == 1)
    {
        lw_print("lw: [%s] gw %d.%d.%d.%d\n", __func__, udp_target[0], udp_target[1], udp_target[2], udp_target[3]);
        strncpy(udp_send_msg, hello_str, strlen(hello_str));
    }
    else
    {
        strncpy(udp_send_msg, argv[1], strlen(argv[1]));
        strncat(udp_send_msg, "\r\n", 2);
        if(argc == 3)
        {
            sscanf(argv[2], "%d.%d.%d.%d", &udp_target[0], &udp_target[1], &udp_target[2], &udp_target[3]);
        }
    }
    lw_print("lw: [%s] gw %d.%d.%d.%d\n", __func__, udp_target[0], udp_target[1], udp_target[2], udp_target[3]);

    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    sys_thread_new("udp socket send", LwipUDPSendTask, NULL, LWIP_TASK_STACK_SIZE, LWIP_DEMO_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     UDPSend, LwipUdpSendTest, UDP send echo);

static void LwipUdpRecvTask(void *arg, struct udp_pcb *upcb, struct pbuf *p,
                 const ip_addr_t *addr, u16_t port)
{
    int udp_len;
    err_t err;
    struct pbuf* udp_buf;

    LWIP_UNUSED_ARG(arg);

    if (p == NULL)
    {
        return;
    }
    udp_len = p->tot_len;
    lw_pr_info("Receive data :%dB\r\n", udp_len);

    if(udp_len <= 80)
    {
        lw_pr_info("%.*s\r\n", udp_len, (char *)(p->payload));
    }

    udp_buf = pbuf_alloc(PBUF_TRANSPORT, PBUF_SIZE, PBUF_RAM);

    memset(udp_buf->payload, 0, PBUF_SIZE);

    err = pbuf_take(udp_buf, "Client receive success!\r\n", 27);

    /* send received packet back to sender */
    udp_sendto(upcb, udp_buf, addr, port);

    /* free the pbuf */
    pbuf_free(p);
    pbuf_free(udp_buf);
}

void LwipUdpRecvTest(void)
{
    err_t err;

    lwip_config_net(lwip_ipaddr, lwip_netmask, lwip_gwaddr);

    udpecho_raw_pcb = udp_new_ip_type(IPADDR_TYPE_ANY);
    if (udpecho_raw_pcb == NULL)
    {
        return;
    }

    err = udp_bind(udpecho_raw_pcb, IP_ANY_TYPE, LWIP_LOCAL_PORT);
    if (err == ERR_OK)
    {
        udp_recv(udpecho_raw_pcb, LwipUdpRecvTask, NULL);
    }
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
     UDPRecv, LwipUdpRecvTest, UDP server echo);

