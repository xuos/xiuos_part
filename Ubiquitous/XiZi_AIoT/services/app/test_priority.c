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

// test_priority: Test the priority scheduler of task
#include <assert.h>
#include <stdbool.h>

#include "libserial.h"
#include "usyscall.h"

static void count_down()
{
    int time = 500000000;
    while (time >= 0) {
        if (time % 10000000 == 0) {
            printf("Priority-based preempting, time remained %d\n", time);
        }
        time--;
    }
    return;
}

int main(int argc, char* argv[])
{
    // set priority
    sys_state_info info;
    info.priority = 0;
    set_priority(&info);

    // test function
    count_down();

    exit(0);
    return 0;
}
