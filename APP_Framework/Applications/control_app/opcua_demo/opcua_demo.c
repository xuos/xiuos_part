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
 * @file ua_demo.c
 * @brief Demo for OpcUa function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.11.11
 */

#include <list.h>
#include <transform.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <sys/types.h>
#include <lwip/altcp.h>
#include <fsl_gpio.h>
#include <fsl_iomuxc.h>

#include "netif/ethernet.h"
#include "enet_ethernetif.h"
#include "connect_ethernet.h"

typedef unsigned int nfds_t;
#include "../../../../APP_Framework/Framework/control/plc/interoperability/opcua/open62541.h"

#define ua_print printf
#define ua_trace() printf("ua: [%s] %d pass!\n", __func__, __LINE__)

#define TCP_LOCAL_PORT 4840

/* IP address configuration. */
#define configIP_ADDR0 192
#define configIP_ADDR1 168
#define configIP_ADDR2 250
#define configIP_ADDR3 253

/* Netmask configuration. */
#define configNET_MASK0 255
#define configNET_MASK1 255
#define configNET_MASK2 255
#define configNET_MASK3 0

/* Gateway address configuration. */
#define configGW_ADDR0 192
#define configGW_ADDR1 168
#define configGW_ADDR2 250
#define configGW_ADDR3 252

/* MAC address configuration. */
#define configMAC_ADDR { 0x02, 0x12, 0x13, 0x10, 0x15, 0x11}

/* ENET PHY address. */
#define BOARD_ENET0_PHY_ADDRESS (0x02U) /* Phy address of enet port 0. */

/* Address of PHY interface. */
#define EXAMPLE_PHY_ADDRESS BOARD_ENET0_PHY_ADDRESS

/* System clock name. */
#define EXAMPLE_CLOCK_NAME kCLOCK_CoreSysClk

//#define sourceClock CLOCK_GetFreq(kCLOCK_CoreSysClk)

const char *test_uri = "opc.tcp://192.168.250.5:4840";
const char *test_cb_str = "tcp client connected\r\n";


void ua_ip_init(void)
{
    struct netif fsl_netif0;
#if defined(FSL_FEATURE_SOC_LPC_ENET_COUNT) && (FSL_FEATURE_SOC_LPC_ENET_COUNT > 0)
    mem_range_t non_dma_memory[] = NON_DMA_MEMORY_ARRAY;
#endif /* FSL_FEATURE_SOC_LPC_ENET_COUNT */
    ip4_addr_t fsl_netif0_ipaddr, fsl_netif0_netmask, fsl_netif0_gw;
    ethernetif_config_t fsl_enet_config0 = {
        .phyAddress = EXAMPLE_PHY_ADDRESS,
        .clockName  = EXAMPLE_CLOCK_NAME,
        .macAddress = configMAC_ADDR,
#if defined(FSL_FEATURE_SOC_LPC_ENET_COUNT) && (FSL_FEATURE_SOC_LPC_ENET_COUNT > 0)
        .non_dma_memory = non_dma_memory,
#endif /* FSL_FEATURE_SOC_LPC_ENET_COUNT */
    };

    gpio_pin_config_t gpio_config = {kGPIO_DigitalOutput, 0, kGPIO_NoIntmode};

    ua_print("lw: [%s] start ...\n", __func__);

    IP4_ADDR(&fsl_netif0_ipaddr, configIP_ADDR0, configIP_ADDR1, configIP_ADDR2, configIP_ADDR3);
    IP4_ADDR(&fsl_netif0_netmask, configNET_MASK0, configNET_MASK1, configNET_MASK2, configNET_MASK3);
    IP4_ADDR(&fsl_netif0_gw, configGW_ADDR0, configGW_ADDR1, configGW_ADDR2, configGW_ADDR3);

    lwip_init();

    netif_add(&fsl_netif0, &fsl_netif0_ipaddr, &fsl_netif0_netmask, &fsl_netif0_gw, &fsl_enet_config0, ethernetif0_init,
              ethernet_input);
    netif_set_default(&fsl_netif0);
    netif_set_up(&fsl_netif0);

//    ping_init(&fsl_netif0_gw);

    ua_print("\r\n************************************************\r\n");
    ua_print(" PING example\r\n");
    ua_print("************************************************\r\n");
    ua_print(" IPv4 Address     : %u.%u.%u.%u\r\n", ((u8_t *)&fsl_netif0_ipaddr)[0], ((u8_t *)&fsl_netif0_ipaddr)[1],
           ((u8_t *)&fsl_netif0_ipaddr)[2], ((u8_t *)&fsl_netif0_ipaddr)[3]);
    ua_print(" IPv4 Subnet mask : %u.%u.%u.%u\r\n", ((u8_t *)&fsl_netif0_netmask)[0], ((u8_t *)&fsl_netif0_netmask)[1],
           ((u8_t *)&fsl_netif0_netmask)[2], ((u8_t *)&fsl_netif0_netmask)[3]);
    ua_print(" IPv4 Gateway     : %u.%u.%u.%u\r\n", ((u8_t *)&fsl_netif0_gw)[0], ((u8_t *)&fsl_netif0_gw)[1],
           ((u8_t *)&fsl_netif0_gw)[2], ((u8_t *)&fsl_netif0_gw)[3]);
    ua_print("************************************************\r\n");

}

// tcp client callback
static err_t TcpClientCallback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
    uint32_t i;

    if (p != NULL)
    {
        struct pbuf *ptmp = p;

        ua_print("get msg from %d:%d:%d:%d port:%d:\r\n",
                 *((uint8_t *)&tpcb->remote_ip.addr),
                 *((uint8_t *)&tpcb->remote_ip.addr + 1),
                 *((uint8_t *)&tpcb->remote_ip.addr + 2),
                 *((uint8_t *)&tpcb->remote_ip.addr + 3),
                 tpcb->remote_port);

        while (ptmp != NULL)
        {
            for (i = 0; i < p->len; i++)
            {
                ua_print("%c", *((char *)p->payload + i));
            }

            ptmp = p->next;
        }
        ua_print("\r\n");
        tcp_recved(tpcb, p->tot_len);
        pbuf_free(p);
    }
    else if (err == ERR_OK)
    {
        ua_print("tcp: tcp client closed\r\n");
        tcp_recved(tpcb, p->tot_len);
        return tcp_close(tpcb);
    }

    return ERR_OK;
}

// connect callback function
static err_t TcpClientConnected(void *arg, struct tcp_pcb *tpcb, err_t err)
{
    ua_print(test_cb_str);
    tcp_write(tpcb, test_cb_str, strlen(test_cb_str), 0);
    tcp_recv(tpcb, TcpClientCallback);
    return ERR_OK;
}

void ua_set_ip(void *param)
{
    struct tcp_pcb *tpcb = NULL;
    err_t err;

    ua_print("ua: [%s] start test\n", __func__);

    ua_ip_init();

    tpcb = tcp_new();
    if (tpcb == NULL)
    {
        ua_print("ua: [%s] tcp pcb null\n", __func__);
        return;
    }

    ua_print("ua: [%s] tcp bind port %d\n", __func__, TCP_LOCAL_PORT);

    /* bind local port and ip addresss*/
    err = tcp_bind(tpcb, IP_ADDR_ANY, TCP_LOCAL_PORT);

    if (err != ERR_OK)
    {
        memp_free(MEMP_TCP_PCB, tpcb);
        ua_print("ua: [%s] can not bind pcb\n", __func__);
        return;
    }

    ua_print("ua: [%s] start tcp...\n", __func__);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
                 UaSetIp, ua_set_ip, ua_set_ip);

void TestUaConnect(int argc, char *argv[])
{
    UA_StatusCode retval;

    char ua_msg[128];
    int len;
    if (argc >= 1)
    {
        memset(ua_msg, 0, 128);
        strncpy(ua_msg, argv[1], (len = strlen(argv[1])));
        ua_print("ua: [%s] start\n", __func__);
    }

    ua_set_ip(NULL);

    UA_Client *client = UA_Client_new();

    if (client == NULL)
    {
        ua_print("ua: [%s] tcp client null\n", __func__);
        return;
    }

    UA_ClientConfig *config = UA_Client_getConfig(client);
    UA_ClientConfig_setDefault(config);

    retval = UA_Client_connect(client, test_uri);
    if (retval != UA_STATUSCODE_GOOD)
    {
        ua_print("ua: [%s] ret %x\n", __func__, retval);
        UA_Client_delete(client);
        return;
    }
    ua_print("ua: [%s] start Ua Test!\n", __func__);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
                 UaConnect, TestUaConnect, TestUaConnect);


