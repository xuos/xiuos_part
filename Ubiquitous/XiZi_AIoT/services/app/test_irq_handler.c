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

IPC_SERVICES(IpcSwIntrHandler, Ipc_intr_3);

enum {
    SW_INTERRUPT_3 = 3,
};

void sgi_test_handler(void)
{
    printf("TEST_SW_HDLR: In %s()\n", __func__);
}

int IPC_DO_SERVE_FUNC(Ipc_intr_3)(void* useless)
{
    sgi_test_handler();
    return 0;
}

IPC_SERVER_INTERFACE(Ipc_intr_3, 1);
IPC_SERVER_REGISTER_INTERFACES(IpcSwIntrHandler, 1, Ipc_intr_3);
int main()
{
    register_irq(SW_INTERRUPT_3, Ipc_intr_3);
    ipc_server_loop(&IpcSwIntrHandler);

    exit();
}