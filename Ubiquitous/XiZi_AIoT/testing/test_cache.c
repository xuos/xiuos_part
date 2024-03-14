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

/**
* @file:    test_cache.h
* @brief:   test the function of cache
* @version: 3.0
* @author:  AIIT XUOS Lab
* @date:    2023/4/27
*
*/

/*************************************************
File name: l1_cache.h
Description: test the function of cache
Others: 
History: 
1. Date: 2023-04-27
Author: AIIT XUOS Lab
Modification: 
1、test the function of cache
*************************************************/

#include "irq_numbers.h"
#include "trap_common.h"

#include "cache_common_ope.h"
#include "log.h"
#include "kalloc.h"

int system_tick = 0;
extern struct ICacheDone icache_done;
extern struct DCacheDone dcache_done;

void test_cache(void)
{
    int* block = (int*)kalloc(200000 * sizeof(int));

    int size = 100000;
    xizi_trap_driver.cpu_irq_disable();
    icache_done.enable();
    dcache_done.enable();
    xizi_trap_driver.cpu_irq_enable();

    for (int i = 0; i < 2; i++) {
        LOG("start.\n");
        int temp = 0;

        int tick0 = system_tick;
        for (int i = 0; i < size; ++i) {
            block[i] = 0;
            temp += block[i];
        }

        int tick1 = system_tick;
        LOG("tick1:%d.\n", tick1 - tick0);

        temp = 0;
        tick1 = system_tick;
        for (int i = 0; i < size; ++i)
            temp += block[i];
        int tick2 = system_tick;
        LOG("tick2:%d.\n", tick2 - tick1);

        xizi_trap_driver.cpu_irq_disable();
        dcache_done.flushall();
        xizi_trap_driver.cpu_irq_enable();
        LOG("ok.\n");
    }
}