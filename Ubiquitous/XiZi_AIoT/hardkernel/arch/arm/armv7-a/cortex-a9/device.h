/*
 * Copyright (c) 2022 AIIT XUOS Lab
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
 * @file l2cc_pl310.c
 * @brief PLC inovance am401 app
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.8.10
 */

#include <stdint.h>

struct uart_desc {
    uint32_t  RXD_ADDR;
    uint32_t TXD_ADDR;
};

struct arch_desc {
    struct gic_desc {
        uint32_t GICC_ADDR;
        uint32_t GICD_ADDR;

    } gic;

};


struct page_pool {
    uint32_t node;
    uint32_t base;
    uint32_t size;
    uint32_t free;
    uint32_t last;

};

struct mem_region {
    uint32_t base;
    uint32_t size;
    struct page_pool page_pool;
};






struct  board_desc{

    uint32_t cpu_num;
    uint32_t region_num;
    struct mem_region *regions;

    struct {
        uint32_t base_addr;
    } console;

    uint32_t uart_num;
    struct uart_desc *uarts;

    struct arch_desc arch;
};