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

static struct netif gnetif;

int IPC_DO_SERVE_FUNC(Ipc_LWIP_init)(char* ip, char* mask, char* gw){

    ip4_addr_t net_ipaddr, net_netmask, net_gw;
    IP4_ADDR(&net_ipaddr, ip[0], ip[1], ip[2], ip[3]);
    IP4_ADDR(&net_netmask, mask[0], mask[1], mask[2], mask[3]);
    IP4_ADDR(&net_gw, gw[0], gw[1], gw[2], gw[3]);

    lwip_init();

    // netif_add(&gnetif, &net_ipaddr, &net_netmask, &net_gw, NULL,
    //         &ethernetif_init, &ethernet_input);

    /* Registers the default network interface */
    netif_set_default(&gnetif);

    if (netif_is_link_up(&gnetif))
    {
    /*When the netif is fully configured this function must be called */
        netif_set_up(&gnetif);
    }
    else
    {
        /* When the netif link is down this function must be called */
        netif_set_down(&gnetif);
    }
    return 0;
}


IPC_SERVER_INTERFACE(Ipc_LWIP_init, 3);
IPC_SERVER_REGISTER_INTERFACES(IpcLWIPServer, 1, Ipc_LWIP_init);

int main(int argc, char* argv[]){
    if (register_server("LWIPServer") < 0) {
        printf("register server name: %s failed.\n", "LWIPServer");
        exit(0);
    }
    ipc_server_loop(&IpcLWIPServer);
    // never reached
    exit(0);
}