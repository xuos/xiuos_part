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
 * @file actracer.h
 * @brief tracer header
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */
/*************************************************
File name: actracer.h
Description: tracer header
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#pragma once
#include <stdbool.h>
#include <stdint.h>

#include "actracer_mem_chunk.h"
#include "spinlock.h"

typedef enum {
    TRACER_INVALID = 0,
    TRACER_OWNER,
    TRACER_HARDKERNEL_AC_RESOURCE,
    TRACER_TASK_DESCRIPTOR_AC_RESOURCE,
    TRACER_SERVER_IDENTITY_AC_RESOURCE,
    TRACER_MEM_FROM_BUDDY_AC_RESOURCE,
} tracemeta_ac_type;

typedef uint16_t tracer_mem_chunk_idx_t;
#define TRACEMETA_NR_DIRECT 5
#define TRACEMETA_NR_INDIRECT 4
#define NR_ADDR_PER_MEM_CHUNK TRACER_MEM_CHUNK_SIZE / sizeof(tracer_mem_chunk_idx_t)
#define VFS_FILE_MAXSIZE (TRACEMETA_NR_DIRECT + (TRACEMETA_NR_INDIRECT * NR_ADDR_PER_MEM_CHUNK))
struct TraceMeta {
    uint32_t size;
    tracemeta_ac_type type; // TRACER_OWNER, etc.
    uintptr_t reserved; // fast path to store pointer if content is a pointer
    uint16_t index;
    tracer_mem_chunk_idx_t addr[TRACEMETA_NR_DIRECT + TRACEMETA_NR_INDIRECT]; // 指向data mem_chunks, TRACER_OWNER 用于存放 dir entries, VT_FS用于存放bind
} __attribute__((aligned(32)));

/// @brief tag for other module to reference trace meta
struct TraceTag {
    struct TraceMeta* meta;
    short type; // TRACER_OWNER, etc.
};

#define RESOURCE_NAME_SIZE 14
struct TraceResourceEntry {
    uint16_t index;
    char name[RESOURCE_NAME_SIZE];
};

struct SysTracer {
#define NR_TRACER_MEM_CHUNKS 256
#define TRACER_MEM_CHUNK_SIZE sizeof(struct TraceMeta)
#define BITS_MEM_CHUNK_BITMAP (NR_TRACER_MEM_CHUNKS / 32)
    uint32_t mem_chunks_bit_map[BITS_MEM_CHUNK_BITMAP];
    struct spinlock mem_chunk_bitmap_lock;

#define NR_MAX_TRACEMETA 128
#define BITS_TRACEMETA_BITMAP (NR_MAX_TRACEMETA / 32)
    uint32_t trace_meta_bit_map[BITS_TRACEMETA_BITMAP];
    struct spinlock trace_meta_bitmap_lock;
    struct TraceMeta trace_meta_poll[NR_MAX_TRACEMETA];
};

void tracer_init(void);

extern struct SysTracer sys_tracer;
extern struct TraceTag root_tracetag;

struct TraceTag* const RequireRootTag();
bool AchieveResourceTag(struct TraceTag* target, struct TraceTag* owner, char* name);
void* AchieveResource(struct TraceTag* target);
bool CreateResourceTag(struct TraceTag* new_tag, struct TraceTag* owner, char* name, tracemeta_ac_type type, void* p_resource);
bool DeleteResource(struct TraceTag* target, struct TraceTag* owner);
