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
 * @file actracer.c
 * @brief tracer implementation
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.08.25
 */
/*************************************************
File name: actracer.c
Description: tracer implementation
Others:
History:
1. Date: 2023-08-28
Author: AIIT XUOS Lab
Modification:
1. first version
*************************************************/
#include <stddef.h>
#include <string.h>

#include "trap_common.h"

#include "assert.h"
#include "multicores.h"
#include "spinlock.h"
#include "task.h"

#include "actracer.h"

#ifndef min
#define min(a, b) ((a) < (b) ? (a) : (b))
#endif

struct SysTracer sys_tracer;
char* tracer_space[TRACER_MEM_CHUNK_SIZE * NR_TRACER_MEM_CHUNKS];

struct TraceTag* const RequireRootTag()
{
    static struct TraceTag root_trace_tag = { NULL };
    return &root_trace_tag;
}

static inline int namecmp(const char* s, const char* t)
{
    return strncmp(s, t, RESOURCE_NAME_SIZE);
}

/// @brief alloc a trace meta to trace resource
static struct TraceMeta* alloc_trace_meta()
{
    int index = -1;

    spinlock_lock(&sys_tracer.trace_meta_bitmap_lock);
    for (uint32_t idx = 0; idx < BITS_TRACEMETA_BITMAP; idx++) {
        if (sys_tracer.trace_meta_bit_map[idx] == 0xFFFFFFFF) {
            continue;
        }
        uint32_t position = __builtin_ffs(~sys_tracer.trace_meta_bit_map[idx]) - 1;
        if (position != 31) {
            // found a free bit
            sys_tracer.trace_meta_bit_map[idx] |= (1 << (position));
            index = idx * 32 + position;
            break;
        }
    }
    spinlock_unlock(&sys_tracer.trace_meta_bitmap_lock);

    if (index == -1) {
        panic("Tracer no enough TracerMeta.");
    }

    sys_tracer.trace_meta_poll[index].index = index;
    return &sys_tracer.trace_meta_poll[index];
}

static bool dealloc_trace_meta(struct TraceMeta* meta)
{
    int index = meta->index;

    spinlock_lock(&sys_tracer.trace_meta_bitmap_lock);
    // clear bitmap
    uint32_t outer_index = index / 32;
    uint32_t inner_index = index % 32;
    sys_tracer.trace_meta_bit_map[outer_index] &= (uint32_t)(~(1 << inner_index));
    // clear meta
    sys_tracer.trace_meta_poll[index].type = TRACER_INVALID;
    spinlock_unlock(&sys_tracer.trace_meta_bitmap_lock);

    if (index == -1) {
        panic("Tracer no enough TracerMeta.");
    }

    sys_tracer.trace_meta_poll[index].index = index;
    return &sys_tracer.trace_meta_poll[index];
}

static tracer_mem_chunk_idx_t trace_meta_map_mem_chunk(struct TraceMeta* const p_trace_meta, tracer_mem_chunk_idx_t mem_chunk_num)
{
    tracer_mem_chunk_idx_t addr;
    /* direct mapping */
    if (mem_chunk_num < TRACEMETA_NR_DIRECT) {
        if ((addr = p_trace_meta->addr[mem_chunk_num]) == 0) {
            p_trace_meta->addr[mem_chunk_num] = addr = tracer_mem_chunk_alloc();
        }
        return addr;
    }

    /* indirect mapping */
    mem_chunk_num -= TRACEMETA_NR_DIRECT;
    int indirect_mem_chunk_id = mem_chunk_num / NR_ADDR_PER_MEM_CHUNK;
    if (indirect_mem_chunk_id < TRACEMETA_NR_INDIRECT) {
        if ((addr = p_trace_meta->addr[TRACEMETA_NR_DIRECT + indirect_mem_chunk_id]) == 0) {
            p_trace_meta->addr[TRACEMETA_NR_DIRECT + indirect_mem_chunk_id] = addr = tracer_mem_chunk_alloc();
        }
        mem_chunk_num -= indirect_mem_chunk_id * NR_ADDR_PER_MEM_CHUNK;
    } else {
        panic("tracer inode, bmap out of range");
        // no return
    }

    // index mem_chunk
    struct tracer_mem_chunk* tracer_mem_chunk = tracer_mem_chunk_read(addr);
    tracer_mem_chunk_idx_t* indirect_list = (tracer_mem_chunk_idx_t*)tracer_mem_chunk->data;

    if ((addr = indirect_list[mem_chunk_num]) == 0) {
        indirect_list[mem_chunk_num] = addr = tracer_mem_chunk_alloc();
        tracer_mem_chunk_write(tracer_mem_chunk);
    }

    tracer_mem_chunk_release(tracer_mem_chunk);
    return addr;
}

/// @brief write trace info by trace meta
static int trace_write_info(struct TraceMeta* const p_trace_meta, char* src, uint32_t off, uint32_t n)
{
    if (p_trace_meta->type == TRACER_INVALID) {
        return -1;
    }

    // fast path
    if (off == 0 && n <= sizeof(uintptr_t)) {
        p_trace_meta->reserved = *(uintptr_t*)src;
        return n;
    }

    if (UNLIKELY(off > p_trace_meta->size || off + n > VFS_FILE_MAXSIZE * TRACER_MEM_CHUNK_SIZE || off + n < off)) {
        return -1;
    }

    struct tracer_mem_chunk* tracer_mem_chunk;
    uint32_t m;
    for (uint32_t tot = 0; tot < n; tot += m, off += m, src += m) {
        tracer_mem_chunk = tracer_mem_chunk_read(trace_meta_map_mem_chunk(p_trace_meta, off / TRACER_MEM_CHUNK_SIZE));
        m = min(n - tot, TRACER_MEM_CHUNK_SIZE - off % TRACER_MEM_CHUNK_SIZE);
        memmove(tracer_mem_chunk->data + off % TRACER_MEM_CHUNK_SIZE, src, m);
        tracer_mem_chunk_write(tracer_mem_chunk);
        tracer_mem_chunk_release(tracer_mem_chunk);
    }

    if (n > 0 && off > p_trace_meta->size) {
        p_trace_meta->size = off;
    }

    return n;
}

/// @brief read trace info by trace meta
static int trace_read_info(struct TraceMeta* const p_trace_meta, char* dst, uint32_t off, uint32_t n)
{
    if (p_trace_meta->type == TRACER_INVALID) {
        return -1;
    }

    if (off == 0 && n <= sizeof(uintptr_t)) {
        *(uintptr_t*)dst = p_trace_meta->reserved;
        return n;
    }

    if (UNLIKELY(off > p_trace_meta->size || off + n < off)) {
        return -1;
    }
    if (UNLIKELY(off + n > p_trace_meta->size)) {
        n = p_trace_meta->size - off;
    }

    static struct tracer_mem_chunk* tracer_mem_chunk;
    uint32_t m;
    for (uint32_t tot = 0; tot < n; tot += m, off += m, dst += m) {
        tracer_mem_chunk = tracer_mem_chunk_read(trace_meta_map_mem_chunk(p_trace_meta, off / TRACER_MEM_CHUNK_SIZE));
        m = min(n - tot, TRACER_MEM_CHUNK_SIZE - off % TRACER_MEM_CHUNK_SIZE);
        memmove(dst, tracer_mem_chunk->data + off % TRACER_MEM_CHUNK_SIZE, m);
        tracer_mem_chunk_release(tracer_mem_chunk);
    }

    return n;
}

static struct TraceMeta* tracer_find_meta_onestep(struct TraceMeta* const p_owner, char* name, uint32_t* poff)
{
    struct TraceResourceEntry resource_entry;

    if (p_owner->type != TRACER_OWNER) {
        ERROR("tracer_find_meta_onestep, not a dir, index: %d\n", p_owner->index);
        return NULL;
    }

    for (uint32_t off = 0; off < p_owner->size; off += sizeof(resource_entry)) {
        if (trace_read_info(p_owner, (char*)&resource_entry, off, sizeof(resource_entry)) != sizeof(resource_entry)) {
            panic("tracer_find_meta_onestep: read trace owner's resources failed\n");
        }

        if (resource_entry.index == 0) {
            continue;
        }

        if (namecmp(name, resource_entry.name) == 0) {
            if (poff) {
                *poff = off;
            }
            uint32_t vindex = resource_entry.index;
            assert(vindex >= 0 && vindex < NR_MAX_TRACEMETA);
            return &sys_tracer.trace_meta_poll[vindex];
        }
    }

    return NULL;
}

// Write a new vdirectory entry (name, index) into the vdirectory dp.
static int tracer_append_meta(struct TraceMeta* p_owner, char* name, uint32_t index)
{
    struct TraceResourceEntry resource_entry;

    int offset = 0;
    for (offset = 0; offset < p_owner->size; offset += sizeof(resource_entry)) {
        if (trace_read_info(p_owner, (char*)&resource_entry, offset, sizeof(resource_entry)) != sizeof(resource_entry)) {
            ERROR("tracer_append_meta failed, read owner's resources failed.\n");
            return -1;
        }
        if (resource_entry.index == 0) {
            break;
        }
    }

    strncpy(resource_entry.name, name, RESOURCE_NAME_SIZE);
    resource_entry.index = index;
    if (trace_write_info(p_owner, (char*)&resource_entry, offset, sizeof(resource_entry)) != sizeof(resource_entry)) {
        ERROR("tracer_append_meta failed, append resource to owner failed.\n");
        return -1;
    }

    return 0;
}

static struct TraceMeta* tracer_new_meta(struct TraceMeta* p_owner, char* name, short type)
{
    struct TraceMeta* p_trace_meta;

    // check if owner entry exists
    uint32_t offset;
    if ((p_trace_meta = tracer_find_meta_onestep(p_owner, name, &offset)) != 0) {
        LOG("create resource(trace meta) failed, %s is existed\n", name);
        return NULL;
    }

    if ((p_trace_meta = alloc_trace_meta()) == 0) {
        ERROR("create resource(trace meta) failed, cache is no free\n");
        return NULL;
    }

    p_trace_meta->type = type;
    p_trace_meta->size = 0;

    // update parent directory
    tracer_append_meta(p_owner, name, p_trace_meta->index);

    // update "." and ".." for vfs inode
    if (p_trace_meta->type == TRACER_OWNER) {
        tracer_append_meta(p_trace_meta, ".", p_trace_meta->index);
        tracer_append_meta(p_trace_meta, "..", p_owner->index);
    }

    return p_trace_meta;
}

static char* parse_path(char* path, char* name)
{
    // skip extra '/'
    while (*path == '/') {
        path++;
    }
    if (*path == '\0') {
        return NULL;
    }

    // start of current name
    char* cur_start = path;
    while (*path != '/' && *path != '\0') {
        path++;
    }

    // handle current name
    int len = path - cur_start;
    if (len >= RESOURCE_NAME_SIZE) {
        strncpy(name, cur_start, RESOURCE_NAME_SIZE);
    } else {
        strncpy(name, cur_start, len);
        name[len] = '\0';
    }

    return path;
}

static struct TraceMeta* tracer_find_meta(struct TraceMeta* const p_owner, char* path, int nameiparent, char* name)
{
    struct TraceMeta* p_owner_inside = p_owner;
    struct TraceMeta* vnp;

    /* traverse TRACER_OWNER */
    while ((path = parse_path(path, name)) != 0) {
        if (p_owner_inside->type != TRACER_OWNER) {
            return NULL;
        }
        if (nameiparent && *path == '\0') {
            return p_owner_inside;
        }
        if ((vnp = tracer_find_meta_onestep(p_owner_inside, name, NULL)) == 0) {
            ERROR("Not such object: %s\n", path);
            return NULL;
        }
        p_owner_inside = vnp;
    }

    if (nameiparent) {
        return NULL;
    }
    return p_owner_inside;
}

int tracer_write_trace(struct TraceTag* const p_trace_tag, char* src, uint32_t off, uint32_t n)
{
    if (src == NULL || p_trace_tag == NULL || p_trace_tag->meta == NULL) {
        return -1;
    }
    return trace_write_info(p_trace_tag->meta, src, off, n);
}

int tracer_read_trace(struct TraceTag* const p_trace_tag, char* dst, uint32_t off, uint32_t n)
{
    if (dst == NULL || p_trace_tag == NULL || p_trace_tag->meta == NULL) {
        return -1;
    }
    return trace_read_info(p_trace_tag->meta, dst, off, n);
}

/// @brief
static void trace_locate_inner(struct TraceTag* target, struct TraceTag* const p_trace_tag, char* path, bool parent)
{
    char name[RESOURCE_NAME_SIZE];
    struct TraceMeta* p_trace_meta = tracer_find_meta(p_trace_tag->meta, path, parent, name);
    // p_trace_meta: TRACER_OWNER, VT_FS or other.
    //      TRACER_OWNER: path: "", name: "dir name"
    //      other:  path: "", name: "file name"
    if (!p_trace_meta) {
        DEBUG("trace_locate, not found\n");
    }
    target->type = p_trace_meta->type;
    target->meta = p_trace_meta;
}

static inline void trace_locate(struct TraceTag* target, struct TraceTag* const p_trace_tag, char* path)
{
    trace_locate_inner(target, p_trace_tag, path, 0);
}

static inline void trace_locate_parent(struct TraceTag* target, struct TraceTag* const p_trace_tag, char* path)
{
    trace_locate_inner(target, p_trace_tag, path, 1);
}

bool tracer_create_trace(struct TraceTag* target, struct TraceTag* p_trace_tag, char* path, short type)
{
    struct TraceMeta *p_trace_meta, *p_owner;

    // find parent vfs inode
    if ((p_owner = p_trace_tag->meta) == 0) {
        LOG("create tracemeta failed, parent is null\n");
        target->meta = NULL;
        return false;
    }

    p_trace_meta = tracer_new_meta(p_owner, path, type);
    target->meta = p_trace_meta;
    return true;
}

bool tracer_delete_trace(struct TraceTag* target, struct TraceTag* owner)
{
    if (target->meta == NULL || owner->type != TRACER_OWNER) {
        return false;
    }
    struct TraceMeta* p_trace_meta = target->meta;
    struct TraceMeta* p_owner_meta = owner->meta;
    assert(p_trace_meta->type != TRACER_INVALID);

    if (p_trace_meta->type == TRACER_OWNER) {
        /// @todo support recursive delete
    }

    struct TraceResourceEntry resource_entry;
    bool is_owned = false;
    for (uint32_t off = 0; off < p_owner_meta->size; off += sizeof(resource_entry)) {
        if (trace_read_info(p_owner_meta, (char*)&resource_entry, off, sizeof(resource_entry)) != sizeof(resource_entry)) {
            panic("tracer_find_meta_onestep: read trace owner's resources failed\n");
        }

        if (resource_entry.index == 0) {
            continue;
        }

        if (resource_entry.index == p_trace_meta->index) {
            resource_entry.index = 0;
            trace_write_info(owner->meta, (char*)&resource_entry, off, sizeof(resource_entry));
            is_owned = true;
            break;
        }
    }

    if (!is_owned) {
        ERROR("delete trace(%d) not owned by given owner(%d).\n", target->meta->index, owner->meta->index);
        return false;
    }
    dealloc_trace_meta(p_trace_meta);

    return true;
}

static struct spinlock ac_tracer_lock;
void tracer_init(void)
{
    /* init sys_tracer, the manager */
    spinlock_init(&ac_tracer_lock, "tracerlock");
    spinlock_init(&sys_tracer.mem_chunk_bitmap_lock, "tracer_mem_chunk_bitmap");
    spinlock_init(&sys_tracer.trace_meta_bitmap_lock, "tracer_meta_bitmap");
    memset(sys_tracer.mem_chunks_bit_map, 0, sizeof(sys_tracer.mem_chunk_bitmap_lock));
    memset(sys_tracer.trace_meta_bit_map, 0, sizeof(sys_tracer.trace_meta_bit_map));

    assert((TRACER_MEM_CHUNK_SIZE % sizeof(struct TraceMeta)) == 0);
    assert((TRACER_MEM_CHUNK_SIZE % sizeof(struct TraceResourceEntry)) == 0);
    // mem_chunk space, fit with mem_chunk_bit_map
    mem_chunk_synchronizer_init((uintptr_t)tracer_space, TRACER_MEM_CHUNK_SIZE, NR_TRACER_MEM_CHUNKS);

    /* build root inode */
    alloc_trace_meta(); // inode as guard.

    /* build root trace_meta */
    struct TraceMeta* root_tracemeta = alloc_trace_meta();
    assert(root_tracemeta->index == 1);
    root_tracemeta->type = TRACER_OWNER;
    root_tracemeta->size = 0;

    tracer_append_meta(root_tracemeta, ".", root_tracemeta->index);
    tracer_append_meta(root_tracemeta, "..", root_tracemeta->index);

    RequireRootTag()->meta = root_tracemeta;
}

/// @brief find resource tag
void tracer_find_tag(struct TraceTag* target, struct TraceTag* const source, char* path)
{
    target->meta = NULL;
    struct TraceTag* p_trace_tag;

    if (*path == '/' || source == NULL) {
        p_trace_tag = RequireRootTag();
    } else {
        p_trace_tag = source;
    }
    if (p_trace_tag == NULL || p_trace_tag->meta == NULL) {
        return;
    }
    trace_locate(target, p_trace_tag, path);
}

bool AchieveResourceTag(struct TraceTag* target, struct TraceTag* owner, char* name)
{
    tracer_find_tag(target, owner, name);
    if (target->meta == NULL) {
        return false;
    }
    return true;
}

void* AchieveResource(struct TraceTag* target)
{
    if (target->type == TRACER_OWNER) {
        return NULL;
    }
    void* p_resource = NULL;
    tracer_read_trace(target, (char*)&p_resource, 0, sizeof(void*));
    assert(p_resource != NULL);
    return p_resource;
}

bool CreateResourceTag(struct TraceTag* new_tag, struct TraceTag* owner, char* name, tracemeta_ac_type type, void* p_resource)
{
    new_tag->type = type;
    if (type == TRACER_OWNER) {
        return tracer_create_trace(new_tag, owner, name, type);
    }

    // handle ac resource types
    if (p_resource == NULL) {
        return false;
    }

    if (!tracer_create_trace(new_tag, owner, name, type)) {
        return false;
    }
    bool ret = tracer_write_trace(new_tag, (char*)&p_resource, 0, sizeof(void*)) == sizeof(void*);
    return ret;
}

bool DeleteResource(struct TraceTag* target, struct TraceTag* owner)
{
    return tracer_delete_trace(target, owner);
}