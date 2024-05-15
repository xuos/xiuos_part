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
#include "lwip_service.h"
#include <string.h>

IPC_INTERFACE(Ipc_LWIP_init, 3, ip, mask, gw, sizeof(char[4]), sizeof(char[4]), sizeof(char[4]))
void LWIP_init(struct Session* session, char* ip, char* mask, char* gw){
    IPC_CALL(Ipc_LWIP_init)(session, ip, mask, gw);
}

