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
 * @file wifi_demo.c
 * @brief Demo for wifi function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.04.22
 */

#include <at_agent.h>
#include <adapter.h>

void SendWiftMsg(int argc, char *argv[])
{
    char wifi_msg[128];
    int len;
    if (argc >= 1) {
        memset(wifi_msg, 0, 128);
        strncpy(wifi_msg, argv[1], (len = strlen(argv[1])));
        printf("SendWiftMsg(%s).\n", wifi_msg);
    }

    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);
    if (!adapter) {
        printf("ATAdapterFind failed .\n");
    }
    AdapterDeviceOpen(adapter);

    AdapterDeviceSend(adapter, wifi_msg, len);
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN)|SHELL_CMD_PARAM_NUM(0), SendWiftMsg, SendWiftMsg, SendWiftMsg);

void RecvWifiMsg()
{
    char wifi_recv_msg[128];
    memset(wifi_recv_msg, 0, sizeof(wifi_recv_msg));
    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);
    if (!adapter) {
        printf("ATAdapterFind failed .\n");
    }

    AdapterDeviceOpen(adapter);

    while (1) {
        memset(wifi_recv_msg, 0, sizeof(wifi_recv_msg));
        if (EOK == AdapterDeviceRecv(adapter, wifi_recv_msg, 128)) {
            printf("wifi_recv_msg (%s)\n", wifi_recv_msg);
        } else {
            printf("wifi_recv_msg failed .\n");
        }
    }
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0), RecvWifiMsg, RecvWifiMsg, RecvWifiMsg);

void SetUpWifi()
{
    char wifi_recv_msg[128];
    int baud_rate = BAUD_RATE_57600;
    memset(wifi_recv_msg, 0, sizeof(wifi_recv_msg));
    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);
    if (!adapter) {
        printf("ATAdapterFind failed .\n");
    }

    printf("Waiting for msg...\n");
    AdapterDeviceOpen(adapter);
    AdapterDeviceControl(adapter, OPE_INT, &baud_rate);
    if (EOK == AdapterDeviceSetUp(adapter)) {
        printf("SetUpWifi success \n");
    } else {
        printf("SetUpWifi failed \n");
    }
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0), SetUpWifi, SetUpWifi, SetUpWifi);

void SetDownWifi()
{
    char wifi_recv_msg[128];
    memset(wifi_recv_msg, 0, sizeof(wifi_recv_msg));
    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);
    if (!adapter) {
        printf("ATAdapterFind failed .\n");
    }

    printf("Waiting for msg...\n");

    AdapterDeviceOpen(adapter);

    if (EOK == AdapterDeviceSetDown(adapter)) {
        printf("SetDownWifi success \n");
    } else {
        printf("SetDownWifi failed \n");
    }
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0), SetDownWifi, SetDownWifi, SetDownWifi);

void SetAddrWifi()
{
    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);
    if (!adapter) {
        printf("ATAdapterFind failed .\n");
    }

    printf("Waiting for msg...\n");

    AdapterDeviceOpen(adapter);

    if(EOK == AdapterDeviceSetAddr(adapter, "192.168.66.253", "255.255.255.0", "192.168.66.1")){
        printf("SetAddrWifi success \n");
    } else {
        printf("SetAddrWifi failed \n");
    }
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0), SetAddrWifi, SetAddrWifi, SetAddrWifi);

void PingWifi()
{
    char wifi_recv_msg[128];
    memset(wifi_recv_msg, 0, sizeof(wifi_recv_msg));

    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);
    if (!adapter) {
        printf("ATAdapterFind failed .\n");
    }

    printf("Waiting for msg...\n");
    //www.baidu.com
    char *ip_str = "36.152.44.95";

    AdapterDeviceOpen(adapter);

    if (EOK == AdapterDevicePing(adapter, ip_str)) {
        printf("PingWifi success \n");
    } else {
        printf("PingWifi failed \n");
    }
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0), PingWifi, PingWifi, PingWifi);

void NetstatWifi()
{
    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);
    if (!adapter) {
        printf("ATAdapterFind failed .\n");
    }

    printf("Waiting for msg...\n");

    AdapterDeviceOpen(adapter);

    if (EOK == AdapterDeviceNetstat(adapter)) {
        printf("NetstatWifi success \n");
    } else {
        printf("NetstatWifi failed \n");
    }
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0), NetstatWifi, NetstatWifi, NetstatWifi);

int ConnectWifi()
{
    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);

    const char *ip = "192.168.66.33";
    const char *port = "12345";
    enum NetRoleType net_role = CLIENT;
    enum IpType ip_type = IPV4;

    if (!adapter) {
        printf("ATAdapterFind failed .\n");
    }

    printf("Waiting for msg...\n");

    AdapterDeviceOpen(adapter);

    if (EOK == AdapterDeviceConnect(adapter, net_role, ip, port, ip_type)) {
        printf("ConnectWifi success \n");
    } else {
        printf("ConnectWifi failed \n");
    }
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0), ConnectWifi, ConnectWifi, ConnectWifi);

void AtTestCmdWifi(int argc, char *argv[])
{
    char cmd[64];
    if (argc >= 1) {
        memset(cmd, 0, sizeof(cmd));
        strncpy(cmd, argv[1], strlen(argv[1]));
        printf("AT cmd send(%s).\n", cmd);
    }

    strcat(cmd,"\r");
    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);
    // AdapterDeviceOpen(adapter);

    printf("Waiting for msg...\n");

    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "+++");
    UserTaskDelay(100);

    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "a");

    UserTaskDelay(2500);

    ATOrderSend(adapter->agent,REPLY_TIME_OUT, NULL,cmd);
    UserTaskDelay(2500);

    ATOrderSend(adapter->agent,REPLY_TIME_OUT, NULL,"AT+Z\r");
    UserTaskDelay(5000);
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN)|SHELL_CMD_PARAM_NUM(0), AtTestCmdWifi, AtTestCmdWifi, AtTestCmdWifi);
