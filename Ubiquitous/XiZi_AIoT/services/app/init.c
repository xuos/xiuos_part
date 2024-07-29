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

#include "libfs.h"
#include "libserial.h"
#include "usyscall.h"

int main(int argc, char* argv[])
{
    struct Session session;
    printf("init: connecting MemFS\n");
    while (connect_session(&session, "MemFS", 8092) < 0)
        ;
    printf("init: connect MemFS success\n");

    int fd;
    char* shell_task_param[2] = { "/shell", 0 };
    if ((fd = open(&session, shell_task_param[0])) < 0) {
        printf("Open %s failed\n", shell_task_param[0]);
        exit(1);
    }

    if (spawn(&session, fd, read, fsize, shell_task_param[0], shell_task_param) < 0) {
        printf("Syscall Spawn shell failed\n");
    }

    close(&session, fd);

    exit(0);
    return 0;
}
