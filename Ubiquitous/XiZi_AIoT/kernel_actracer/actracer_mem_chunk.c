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
 * @file actracer_mem_chunk.c
 * @brief tracer mem chunk implememntation
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */
/*************************************************
File name: actracer_mem_chunk.c
Description: tracer mem chunk implementation
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <string.h>

#include "assert.h"
#include "spinlock.h"
#include "actracer.h"
#include "actracer_mem_chunk.h"

/// @brief to assert that a mem_chunk of memory will only write by one object
struct mem_chunk_synchronizer {
    uintptr_t mem_chunk_base;
    uint32_t mem_chunk_size;
    uint32_t nr_mem_chunks;
    struct spinlock lock;
    struct tracer_mem_chunk mem_chunk_access_list[NR_MEM_CHUNK_CACHE];
    struct double_list_node head;
};

static struct mem_chunk_synchronizer tracer_mem_chunk_syner;

static void tracer_mem_chunk_sync(struct tracer_mem_chunk* b)
{
    if (!(b->flag & TRACER_MEM_CHUNK_BUSY)) {
        panic("mem_chunk_sync: buf not busy");
    }

    if (b->chunk_id >= tracer_mem_chunk_syner.nr_mem_chunks) {
        panic("mem_chunk_sync: sector out of range");
    }

    b->data = (uint8_t*)(tracer_mem_chunk_syner.mem_chunk_base + b->chunk_id * tracer_mem_chunk_syner.mem_chunk_size);
    b->flag |= TRACER_MEM_CHUNK_VALID;
}

void mem_chunk_synchronizer_init(uintptr_t mem_chunk_base, uint32_t mem_chunk_size, uint32_t nr_mem_chunks)
{
    spinlock_init(&tracer_mem_chunk_syner.lock, "tracer_mem_chunk_syner");
    tracer_mem_chunk_syner.mem_chunk_base = mem_chunk_base;
    tracer_mem_chunk_syner.mem_chunk_size = mem_chunk_size;
    tracer_mem_chunk_syner.nr_mem_chunks = nr_mem_chunks;

    // Create linked list of buffers
    doubleListNodeInit(&tracer_mem_chunk_syner.head);
    for (struct tracer_mem_chunk* b = tracer_mem_chunk_syner.mem_chunk_access_list; b < tracer_mem_chunk_syner.mem_chunk_access_list + NR_MEM_CHUNK_CACHE; b++) {
        doubleListNodeInit(&b->list_node);
        doubleListAddOnHead(&b->list_node, &tracer_mem_chunk_syner.head);
    }
}

static struct tracer_mem_chunk* tracer_get_mem_chunk_cache(uint32_t chunk_id)
{
    // cached mem_chunk cache
    struct tracer_mem_chunk* b;
    DOUBLE_LIST_FOR_EACH_ENTRY(b, &tracer_mem_chunk_syner.head, list_node)
    {
        if (b->chunk_id == chunk_id) {
            if (!(b->flag & TRACER_MEM_CHUNK_BUSY)) {
                b->flag |= TRACER_MEM_CHUNK_BUSY;
                return b;
            }
        }
    }

    // Non-cached mem_chunk cache
    DOUBLE_LIST_FOR_EACH_ENTRY_REVERSE(b, &tracer_mem_chunk_syner.head, list_node)
    {
        if ((b->flag & TRACER_MEM_CHUNK_BUSY) == 0) {
            b->chunk_id = chunk_id;
            b->flag = TRACER_MEM_CHUNK_BUSY;
            return b;
        }
    }

    panic("tracer_get_mem_chunk_cache: no cache");
    return NULL;
}

// Return a TRACER_MEM_CHUNK_BUSY buf with the contents of the indicated disk sector.
struct tracer_mem_chunk* tracer_mem_chunk_read(uint32_t chunk_id)
{
    struct tracer_mem_chunk* b = tracer_get_mem_chunk_cache(chunk_id);
    if (!(b->flag & TRACER_MEM_CHUNK_VALID)) {
        tracer_mem_chunk_sync(b);
        b->flag |= TRACER_MEM_CHUNK_VALID;
    }
    return b;
}

void tracer_mem_chunk_write(struct tracer_mem_chunk* b)
{
    if ((b->flag & TRACER_MEM_CHUNK_BUSY) == 0) {
        panic("tracer mem_chunk write a no busy mem_chunk");
    }
    tracer_mem_chunk_sync(b);
}

void tracer_mem_chunk_release(struct tracer_mem_chunk* b)
{
    if ((b->flag & TRACER_MEM_CHUNK_BUSY) == 0) {
        panic("tracer mem_chunk release but it's not busy occupied");
    }

    // move mem_chunk that just used to the head of cache list
    doubleListDel(&b->list_node);
    doubleListAddOnHead(&b->list_node, &tracer_mem_chunk_syner.head);
    b->flag &= ~TRACER_MEM_CHUNK_BUSY;
}

static void tracer_mem_chunk_zero(uint32_t chunk_id)
{
    assert(chunk_id >= 0 && chunk_id < tracer_mem_chunk_syner.nr_mem_chunks);
    struct tracer_mem_chunk* tracer_mem_chunk = NULL;
    tracer_mem_chunk = tracer_mem_chunk_read(chunk_id);
    memset(tracer_mem_chunk->data, 0, tracer_mem_chunk_syner.mem_chunk_size);
    tracer_mem_chunk_write(tracer_mem_chunk);
    tracer_mem_chunk_release(tracer_mem_chunk);
}

/// @return mem_chunk_idx in bit_map
static uint32_t find_first_free_mem_chunk()
{
    /// @todo another mem_chunk
    for (uint32_t idx = 0; idx < BITS_MEM_CHUNK_BITMAP; idx++) {
        if (sys_tracer.mem_chunks_bit_map[idx] == 0xFFFFFFFF) {
            continue;
        }
        uint32_t position = __builtin_ffs(~sys_tracer.mem_chunks_bit_map[idx]);
        if (position != 32) {
            sys_tracer.mem_chunks_bit_map[idx] |= (1 << (position - 1));
            return idx * 32 + position;
        }
    }
    panic("Tracer no enough space.");
    return 0;
}

uint32_t tracer_mem_chunk_alloc()
{
    tracer_mem_chunk_idx_t idx = find_first_free_mem_chunk();
    tracer_mem_chunk_zero(idx);
    return idx;
}

void tracer_mem_chunk_free(uint32_t chunk_id)
{
    assert(chunk_id >= 0 && chunk_id < NR_TRACER_MEM_CHUNKS);
    uint32_t idx = chunk_id % 32;
    uint32_t inner_mem_chunk_bit = chunk_id / 32;
    // assert mem_chunk is allocated
    assert((sys_tracer.mem_chunks_bit_map[idx] & (1 << inner_mem_chunk_bit)) != 0);
    sys_tracer.mem_chunks_bit_map[idx] &= (uint32_t)(~(1 << inner_mem_chunk_bit));
}