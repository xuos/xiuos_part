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
#ifndef __UA_API_H__
#define __UA_API_H__

#include "open62541.h"

#define OPC_SERVER "opc.tcp://192.168.250.5:4840"

#define ua_print //printf
#define ua_trace() //printf("ua: [%s] line %d checked!\n", __func__, __LINE__)
#define ua_pr_info KPrintf
#define ua_debug

int ua_server_connect(void);
int ua_get_server_info(UA_Client *client);
void ua_browser_objects(UA_Client *client);
void ua_browser_nodes(UA_Client *client);
void ua_read_time(UA_Client *client);
int16 ua_test(void);


int ua_open(void *dev); // open and connect PLC device
void ua_close(void* dev); // close and disconnect PLC device
int ua_read(void* dev, void *buf, size_t len); // read data from PLC
int ua_write(void* dev, const void *buf, size_t len); // write data from PLC
int ua_ioctl(void* dev, int cmd, void *arg); // send control command to PLC

#endif
