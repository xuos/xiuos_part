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

// test_net: Test the lwip network stack

#include "libserial.h"
#include "lwip_service.h"
#include "usyscall.h"

int main(int argc, char* argv[])
{
    printf("lwip network stack test \n");

    struct Session sess;
    connect_session(&sess, "LWIPServer", 4096);

    char lwip_ipaddr[4] = { 192, 168, 130, 77 };
    char lwip_netmask[4] = { 255, 255, 254, 0 };
    char lwip_gwaddr[4] = { 192, 168, 130, 1 };
    LWIP_init(&sess, lwip_ipaddr, lwip_netmask, lwip_ipaddr);
    
    free_session(&sess);

    exit(0);
    return 0;
}