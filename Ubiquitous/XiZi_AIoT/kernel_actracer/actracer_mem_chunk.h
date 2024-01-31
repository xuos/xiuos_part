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
 * @file actracer_mem_chunk.h
 * @brief tracer mem chunk header
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */
/*************************************************
File name: actracer_mem_chunk.h
Description: tracer mem chunk header
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#pragma once
#include <stdint.h>

#include "list.h"

#define NR_MEM_CHUNK_CACHE 128

typedef enum {
    TRACER_MEM_CHUNK_BUSY = 0x1,
    TRACER_MEM_CHUNK_VALID = 0x2,
} tracer_mem_chunk_flag;

struct tracer_mem_chunk {
    tracer_mem_chunk_flag flag;
    uint32_t chunk_id;
    struct double_list_node list_node;
    uint8_t* data;
};

void mem_chunk_synchronizer_init(uintptr_t mem_chunk_base, uint32_t mem_chunk_size, uint32_t nr_mem_chunks);
struct tracer_mem_chunk* tracer_mem_chunk_read(uint32_t chunk_id);
void tracer_mem_chunk_write(struct tracer_mem_chunk* b);
void tracer_mem_chunk_release(struct tracer_mem_chunk* b);

uint32_t tracer_mem_chunk_alloc();
void tracer_mem_chunk_free(uint32_t chunk_id);