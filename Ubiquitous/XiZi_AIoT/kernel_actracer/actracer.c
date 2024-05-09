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

#include "actracer.h"
#include "assert.h"

static struct SysTracer sys_tracer;
static char root_name[TRACER_NODE_NAME_LEN] = "ROOT\0";

static void tracer_init_node(TracerNode* node, char* name, tracemeta_ac_type type, void* p_resource)
{
    node->type = type;
    node->parent = NULL;
    if (name != NULL) {
        char* p_name = (char*)slab_alloc(&sys_tracer.node_name_allocator);
        strcpy(p_name, name);
        p_name[TRACER_NODE_NAME_LEN - 1] = '\0';
        node->name = p_name;
    }
    if (node->type == TRACER_OWNER) {
        doubleListNodeInit(&node->children_guard);
    } else {
        node->p_resource = p_resource;
    }
    doubleListNodeInit(&node->list_node);
}

void sys_tracer_init()
{
    // set sys_tracer resource identity
    tracer_init_node(&sys_tracer.root_node, NULL, TRACER_OWNER, NULL);
    sys_tracer.root_node.name = root_name;
    sys_tracer.sys_tracer_tag.meta = &sys_tracer.root_node;

    // init memory allocator
    slab_init(&sys_tracer.node_allocator, sizeof(TracerNode));
    slab_init(&sys_tracer.node_name_allocator, sizeof(char[TRACER_NODE_NAME_LEN]));
}

static char* parse_path(char* path, char* const name)
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
    if (len >= TRACER_NODE_NAME_LEN) {
        strncpy(name, cur_start, TRACER_NODE_NAME_LEN);
        name[TRACER_NODE_NAME_LEN - 1] = '\0';
    } else {
        strncpy(name, cur_start, len);
        name[len] = '\0';
    }

    return path;
}

static TracerNode* tracer_find_node_onestep(TracerNode* const owner, const char* const name)
{
    TracerNode* iter = NULL;
    assert(owner->type == TRACER_OWNER);
    DOUBLE_LIST_FOR_EACH_ENTRY(iter, &owner->children_guard, list_node)
    {
        if (iter->name == NULL) {
            continue;
        }

        if (strcmp(name, iter->name) == 0) {
            return iter;
        }
    }

    return NULL;
}

TraceTag* const RequireRootTag()
{
    return &sys_tracer.sys_tracer_tag;
}

bool AchieveResourceTag(TraceTag* target, TraceTag* owner, char* name)
{
    static char name_buffer[TRACER_NODE_NAME_LEN];

    TracerNode* inner_node = owner->meta;
    assert(inner_node != NULL && inner_node->type == TRACER_OWNER);
    while ((name = parse_path(name, name_buffer)) != NULL) {
        if ((inner_node = tracer_find_node_onestep(inner_node, name_buffer)) == NULL) {
            DEBUG("Tracer: No such object, owner: %s, child: %s\n", //
                owner->meta->name == NULL ? "NULL" : owner->meta->name, name == NULL ? "NULL" : name_buffer);
            return false;
        }
    }

    target->meta = inner_node;
    return true;
}

void* AchieveResource(TraceTag* tag)
{
    assert(tag != NULL);
    if (tag->meta == NULL || tag->meta->type == TRACER_OWNER) {
        return NULL;
    }

    return tag->meta->p_resource;
}

bool CreateResourceTag(TraceTag* new_tag, TraceTag* owner, char* name, tracemeta_ac_type type, void* p_resource)
{
    assert(new_tag != NULL && owner != NULL);
    if (owner->meta == NULL) {
        ERROR("Tracer: Empty owner\n");
        return false;
    }
    assert(owner->meta->type == TRACER_OWNER);
    TracerNode* new_node = (TracerNode*)slab_alloc(&sys_tracer.node_allocator);
    if (new_node == NULL) {
        ERROR("Tracer: No memory for new node\n");
        return false;
    }
    tracer_init_node(new_node, name, type, p_resource);

    // new node add to owner's children list
    doubleListAddOnHead(&new_node->list_node, &owner->meta->children_guard);
    new_node->parent = owner->meta;

    new_tag->meta = new_node;
    return true;
}

bool DeleteResource(TraceTag* target, TraceTag* owner)
{
    assert(target != NULL && owner != NULL);
    assert(owner->meta != NULL && owner->meta->type == TRACER_OWNER);
    if (target->meta == NULL) {
        ERROR("Tracer: Delete a empty resource\n");
        return false;
    }

    assert(target->meta->parent == owner->meta);
    doubleListDel(&target->meta->list_node);
    // delete name
    if (target->meta->name != NULL) {
        slab_free(&sys_tracer.node_name_allocator, target->meta->name);
    }
    // delete all children
    /// @attention currently donot allow multilevel resource deletion
    if (target->meta->type == TRACER_OWNER) {
        assert(IS_DOUBLE_LIST_EMPTY(&target->meta->children_guard));
    }
    slab_free(&sys_tracer.node_allocator, target->meta);
    target->meta = NULL;
    return true;
}