#pragma once

#include <stddef.h>
#include <stdint.h>

#include "actracer.h"

// CLRS
// Insertion and Deletion in a Red Black Tree
enum rbt_type {
    RED,
    BLACK
};

typedef struct RbtNode {
    uintptr_t key;
    void* data;
    struct RbtNode* left;
    struct RbtNode* right;
    struct RbtNode* parent;
    enum rbt_type color;
} RbtNode;

typedef struct RbtTree {
    RbtNode* root;
} RbtTree;

void rbtree_init(RbtTree* tree);
int rbt_insert(RbtTree* tree, uintptr_t key, void* data);
RbtNode* rbt_search(RbtTree* tree, uintptr_t key);
int rbt_delete(RbtTree* tree, uintptr_t key);

void module_rbt_factory_init(TraceTag* _softkernel_tag);