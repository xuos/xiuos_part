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

#include "libfs.h"
#include "libsemaphore.h"
#include "libserial.h"
#include "usyscall.h"

static int global_value;
static sem_t sem;
static char sem_server_name[] = "SemTestServer";

int sub_thread_entry(int argc, char** argv)
{
    for (int i = 0; i < 100; i++) {
        global_value++;
    }

    /// @warning session is single threaded, so that each thread cannot share a common session.
    // sub thread connect to semaphore server
    struct Session sem_session;
    while (connect_session(&sem_session, sem_server_name, 4096) < 0) {
        yield(SYS_TASK_YIELD_NO_REASON);
    }

    printf("Thread signal sem.\n");
    sem_signal(&sem_session, &sem);

    exit(0);
    return 0;
}

static char sem_file_name[] = "/semaphore_server";
int main(int argc, char** argv)
{
    global_value = 0;

    printf("Test Create Semaphore.\n");
    struct Session sem_session;
    bool spawn_sem_server = false;
    while (connect_session(&sem_session, sem_server_name, 4096) < 0) {
        if (!spawn_sem_server) {
            struct Session fs_session;
            printf("Connect FS.\n");
            if (connect_session(&fs_session, "MemFS", 8192) < 0) {
                printf("Connect FS failed.\n");
                exit(1);
            }

            printf("Loading semaphore server.\n");
            int fd = -1;
            if ((fd = open(&fs_session, sem_file_name)) < 0) {
                printf("Open %s failed.\n", sem_file_name);
                free_session(&fs_session);
                exit(1);
            }

            printf("Spawn semaphore server.\n");
            char* sem_server_params[] = { sem_server_name, sem_server_name, NULL };
            if (spawn(&fs_session, fd, read, fsize, sem_server_name, sem_server_params) < 0) {
                printf("Spawn %s failed.\n", sem_file_name);
                free_session(&fs_session);
                exit(1);
            }

            spawn_sem_server = true;
            free_session(&fs_session);
        }
    }
    printf("Create new sem.\n");
    sem_create(&sem_session, &sem, 0);

    printf("Create new thread.\n");
    char* task_param[2] = { "add_gval", NULL };
    int nr_thread = 0;
    for (int i = 0; i < 128; i++) {
        int tid = thread(sub_thread_entry, "add_gval", task_param);
        if (tid > 0) {
            nr_thread++;
        }
    }

    printf("Main thread waiting for sem for %d times.\n", nr_thread);
    for (int i = 0; i < nr_thread; i++) {
        int sem_wait_ret = sem_wait(&sem_session, &sem, 0);
    }
    printf("Main thread sem %d wait return, global val: %d.\n", sem, global_value);

    sem_delete(&sem_session, &sem);
    free_session(&sem_session);
    exit(0);
    return 0;
}