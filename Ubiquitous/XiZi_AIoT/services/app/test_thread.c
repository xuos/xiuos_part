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

#include "libserial.h"
#include "usyscall.h"

static int global_value;

int sub_thread_entry(int argc, char** argv)
{
    for (int i = 0; i < 1000; i++) {
        global_value++;
        printf("[gval]: %d\n", global_value);
    }
    exit(0);
    return 0;
}

int main(int argc, char** argv)
{
    global_value = 0;

    for (int i = 0; i < 10; i++) {
        global_value++;
        printf("|gval|: %d\n", global_value);
    }

    char* task_param[2] = { "add_gval", NULL };
    int tid = thread(sub_thread_entry, "add_gval", task_param);

    for (int i = 0; i < 1000; i++) {
        global_value++;
        printf("|gval|: %d\n", global_value);
    }

    exit(0);
    return 0;
}