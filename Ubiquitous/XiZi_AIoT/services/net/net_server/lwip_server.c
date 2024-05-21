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

#include "libipc.h"
#include "libserial.h"
#include "usyscall.h"
#include "lwip_service.h"

#include "lwip/init.h"
#include "lwip/ip4_addr.h"
#include "lwip/netif.h"
#include "netif/ethernet.h"
#include "sys_arch.h"


int IPC_DO_SERVE_FUNC(Ipc_LWIP_test)(struct Session* session){
    printf("LWIP init success");
    return 1;
}


IPC_SERVER_INTERFACE(Ipc_LWIP_test, 1);
IPC_SERVER_REGISTER_INTERFACES(IpcLWIPServer, 1, Ipc_LWIP_test);

int main(int argc, char* argv[]){
    char lwip_ipaddr[4] = { 192, 168, 130, 77 };
    char lwip_netmask[4] = { 255, 255, 254, 0 };
    char lwip_gwaddr[4] = { 192, 168, 130, 1 };

    lwip_config_tcp(lwip_ipaddr, lwip_netmask, lwip_gwaddr);
    if (register_server("LWIPServer") < 0) {
        printf("register server name: %s failed.\n", "LWIPServer");
        exit(0);
    }
    ipc_server_loop(&IpcLWIPServer);
    // never reached
    exit(0);
}