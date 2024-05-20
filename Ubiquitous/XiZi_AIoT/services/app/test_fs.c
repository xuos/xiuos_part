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

// test_fs: Test the file io control of fs
#include <assert.h>
#include <stdbool.h>
#include <string.h>

#include "libfs.h"
#include "libserial.h"
#include "usyscall.h"

#define BLOCK_SIZE 256
int main(int argc, char* argv[])
{
    printf("file system test\n");

    struct Session session;
    connect_session(&session, "MemFS", 4096);

    int fd;
    char* fd_path = "/readme.txt";
    fd = open(&session, fd_path);
    /// @todo support malloc for user
    char buffer[BLOCK_SIZE] = { 0 };
    read(&session, fd, buffer, 0, BLOCK_SIZE);
    printf("file content: %s\n", buffer);

    char* write_data = "hello world\n";
    write(&session, fd, write_data, 0, strlen(write_data) + 1);
    memset(buffer, 0, BLOCK_SIZE);
    read(&session, fd, buffer, 0, BLOCK_SIZE);
    printf("file content: %s\n", buffer);

    close(&session, fd);
    free_session(&session);

    printf("file test done.\n");
    printf("Test memry error %s.\n", 0x50000000);
    printf("After error computing.\n");

    exit(0);
    return 0;
}
