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

#define TCP_LOCAL_PORT 4840
#define UA_URL_SIZE 100

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

char test_ua_ip[] = {192, 168, 250, 5};

/*******************************************************************************
 * Code
 ******************************************************************************/

static void test_ua_connect(void *arg)
{
    struct netif net;
    UA_StatusCode retval;
    char ua_uri[UA_URL_SIZE];

    memset(ua_uri, 0, sizeof(ua_uri));

    UA_Client *client = UA_Client_new();

    if (client == NULL)
    {
        ua_print("ua: [%s] tcp client null\n", __func__);
        return;
    }

    UA_ClientConfig *config = UA_Client_getConfig(client);
    UA_ClientConfig_setDefault(config);

    snprintf(ua_uri, UA_URL_SIZE, "opc.tcp://%d.%d.%d.%d:4840",
        test_ua_ip[0], test_ua_ip[1], test_ua_ip[2], test_ua_ip[3]);

    retval = UA_Client_connect(client, ua_uri);
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
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, test_ua_ip);
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

void test_ua_browser_objects(void *param)
{
    UA_Client *client = UA_Client_new();

    ua_pr_info("ua: [%s] start ...\n", __func__);

    if (client == NULL)
    {
        ua_print("ua: [%s] tcp client null\n", __func__);
        return;
    }

    UA_ClientConfig *config = UA_Client_getConfig(client);
    UA_ClientConfig_setDefault(config);

    UA_StatusCode retval = UA_Client_connect(client, OPC_SERVER);
    if(retval != UA_STATUSCODE_GOOD) {
        ua_print("ua: [%s] connect failed %#x\n", __func__, retval);
        UA_Client_delete(client);
        return;
    }

    ua_print("ua: [%s] connect ok!\n", __func__);
    ua_pr_info("--- start read time ---\n", __func__);

    ua_read_time(client);

    ua_pr_info("--- get server info ---\n", __func__);
    ua_browser_objects(client);

    /* Clean up */
    UA_Client_disconnect(client);
    UA_Client_delete(client); /* Disconnects the client internally */
}

void *test_sh_ua_brower_objects(int argc, char *argv[])
{
    if(argc == 2)
    {
        if(isdigit(argv[1][0]))
        {
            if(sscanf(argv[1], "%d.%d.%d.%d", &test_ua_ip[0], &test_ua_ip[1], &test_ua_ip[2], &test_ua_ip[3]) == EOF)
            {
                lw_pr_info("input wrong ip\n");
                return NULL;
            }
        }
    }

    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, test_ua_ip);
    sys_thread_new("ua object", test_ua_browser_objects, NULL, 4096, 15);
    return NULL;
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
                 UaObj, test_sh_ua_brower_objects, UaObj [IP]);

void test_ua_get_info(void *param)
{
    UA_Client *client = UA_Client_new();

    ua_pr_info("ua: [%s] start ...\n", __func__);

    if (client == NULL)
    {
        ua_print("ua: [%s] tcp client null\n", __func__);
        return;
    }

    UA_ClientConfig *config = UA_Client_getConfig(client);
    UA_ClientConfig_setDefault(config);

    UA_StatusCode retval = UA_Client_connect(client, OPC_SERVER);
    if(retval != UA_STATUSCODE_GOOD) {
        ua_print("ua: [%s] connect failed %#x\n", __func__, retval);
        UA_Client_delete(client);
        return;
    }

    ua_print("ua: [%s] connect ok!\n", __func__);
    ua_pr_info("--- get server info ---\n", __func__);
    ua_get_server_info(client);

    /* Clean up */
    UA_Client_disconnect(client);
    UA_Client_delete(client); /* Disconnects the client internally */
}

void *test_sh_ua_get_info(int argc, char *argv[])
{
    if(argc == 2)
    {
        if(isdigit(argv[1][0]))
        {
            if(sscanf(argv[1], "%d.%d.%d.%d", &test_ua_ip[0], &test_ua_ip[1], &test_ua_ip[2], &test_ua_ip[3]) == EOF)
            {
                lw_pr_info("input wrong ip\n");
                return NULL;
            }
        }
    }

    ETH_BSP_Config();
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, test_ua_ip);
    sys_thread_new("ua object", test_ua_get_info, NULL, 4096, 15);
    return NULL;
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
                 UaInfo, test_sh_ua_get_info, UaInfo [IP]);

