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
#include "board.h"
#include <lwip/altcp.h>
#include "open62541.h"
#include "ua_api.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/
//#define ua_print KPrintf
#define ua_trace() KPrintf("ua: [%s] %d pass!\n", __func__, __LINE__)

#define TCP_LOCAL_PORT 4840

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

const char *test_uri = "opc.tcp://192.168.250.5:4840";
const char *test_cb_str = "tcp client connected\r\n";

char test_ua_gw[] = {192, 168, 250, 5};

static pthread_t eth_input_id = 0;
static pthread_t ua_demo_id;

/*******************************************************************************
 * Code
 ******************************************************************************/

void *test_ua_get_server_info(void *param);

static void test_ua_connect(void *arg)
{
    struct netif net;
    UA_StatusCode retval;

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
    }

    ua_print("ua: [%s] start Ua Test!\n", __func__);
    UA_Client_disconnect(client);
    UA_Client_delete(client);
}

void test_ua_connect_thr(void *arg)
{
    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, test_ua_gw);
    test_ua_connect(NULL);
}

void test_sh_ua_connect(void)
{
    int result = 0;
    pthread_t th_id;
    pthread_attr_t attr;
    sys_thread_new("ua test", test_ua_connect_thr, NULL, 4096, 15);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
                 UaConnect, test_sh_ua_connect, Test Opc UA connection);

void *test_ua_get_server_info(void *param)
{
    UA_Client *client = UA_Client_new();

    ua_print("ua: [%s] start ...\n", __func__);

    if (client == NULL)
    {
        ua_print("ua: [%s] tcp client null\n", __func__);
        return NULL;
    }

    UA_ClientConfig *config = UA_Client_getConfig(client);
    UA_ClientConfig_setDefault(config);

    UA_StatusCode retval = UA_Client_connect(client, OPC_SERVER);
    if(retval != UA_STATUSCODE_GOOD) {
        ua_print("ua: [%s] connect failed %#x\n", __func__, retval);
        UA_Client_delete(client);
        return NULL;
    }

    ua_print("ua: [%s] connect ok!\n", __func__);

    ua_read_time(client);
    ua_get_server_info(client);

    /* Clean up */
    UA_Client_disconnect(client);
    UA_Client_delete(client); /* Disconnects the client internally */
}

void *test_ua_get_server_info_thr(void *arg)
{
    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, test_ua_gw);
    test_ua_get_server_info(NULL);
}

void *test_sh_ua_get_server_info(void *param)
{
    int result = 0;
    pthread_attr_t attr;

    attr.schedparam.sched_priority = 15;
    attr.stacksize = 4096;

    result = pthread_create(&ua_demo_id, &attr, test_ua_get_server_info_thr, NULL);
    if (0 == result) {
        lw_print("test_ua_get_server_info %d successfully!\n", __func__, ua_demo_id);
    } else {
        lw_print("test_ua_get_server_info failed! error code is %d\n", __func__, result);
    }
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
                 UaGetInfo, test_sh_ua_get_server_info, Get information from OpcUA server);

