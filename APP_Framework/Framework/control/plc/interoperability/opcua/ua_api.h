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
#define ua_print printf

int ua_server_connect(void);
int ua_get_server_info(UA_Client *client);
void ua_read_time(UA_Client *client);
int16 ua_test(void);

#endif
