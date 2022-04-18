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
 * @file ua_api.h
 * @brief API for OpcUa function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.11.11
 */

#ifndef __UA_API_H__
#define __UA_API_H__

#include "open62541.h"

#define UA_DEV_IP_LEN 48
#define UA_NODE_LEN 32

enum UaAction_e
{
    UA_ACT_ATTR,
    UA_ACT_OBJ,
};

typedef struct UaParam
{
    enum UaAction_e act;
    UA_NodeId ua_id;
    char ua_remote_ip[UA_DEV_IP_LEN];
    char ua_node[UA_NODE_LEN];
    UA_Client *client;
}UaParamType;

#define ua_print //KPrintf
#define ua_trace() //KPrintf("ua: [%s] line %d checked!\n", __func__, __LINE__)
#define ua_notice KPrintf
#define ua_debug //KPrintf
#define ua_error KPrintf

extern const char *opc_server_url;
extern char test_ua_ip[];

int ua_server_connect(void);
void ua_browser_nodes(UA_Client *client);
void ua_browser_id(UA_Client *client, UA_NodeId id);
void ua_read_time(UA_Client *client);
void ua_add_nodes(UA_Client *client);

int ua_open(void *dev); // open and connect PLC device
void ua_close(void* dev); // close and disconnect PLC device
int ua_read(void* dev, void *buf, size_t len); // read data from PLC
int ua_write(void* dev, const void *buf, size_t len); // write data from PLC
int ua_ioctl(void* dev, int cmd, void *arg); // send control command to PLC

char *ua_get_nodeid_str(UA_NodeId *node_id);
void ua_read_nodeid_value(UA_Client *client, UA_NodeId id, UA_Int32 *value);
void ua_write_nodeid_value(UA_Client *client, UA_NodeId id, char* value);
void ua_test_attr(UA_Client *client);
UA_StatusCode ua_read_array_value(UA_Client *client, int array_size, UA_ReadValueId *array);
void ua_test_browser_objects(UA_Client *client);
int ua_test_interact_server(UA_Client *client);

#endif
