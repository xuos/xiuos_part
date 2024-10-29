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

struct RbtNode* rbt_insert(struct RbtNode* T, uintptr_t key, void* data);
struct RbtNode* rbt_delete(struct RbtNode* T, struct RbtNode* z);
struct RbtNode* rbt_search(struct RbtNode* root, int x);

void preorder(struct RbtNode* root);
void levelorder(struct RbtNode* root);

void module_rbt_factory_init(TraceTag* _softkernel_tag);