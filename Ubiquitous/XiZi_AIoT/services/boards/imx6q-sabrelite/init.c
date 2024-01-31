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
// init: The initial user-level program
#include <stdbool.h>

#include "fs_service.h"
#include "libserial.h"
#include "usyscall.h"

int main(int argc, char* argv[])
{
    struct Session session;
    connect_session(&session, "MemFS", 8092);

    int fd;
    char* shell_task_param[2] = { "/shell", 0 };
    if ((fd = open(&session, shell_task_param[0])) < 0) {
        printf("Open %s failed\n", shell_task_param[0]);
        exit();
    }

    if (spawn(&session, fd, read, shell_task_param[0], shell_task_param) < 0) {
        printf("Syscall Spawn shell failed\n");
    }

    close(&session, fd);

    exit();
    return 0;
}
