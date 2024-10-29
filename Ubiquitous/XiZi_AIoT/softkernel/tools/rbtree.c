#include "rbtree.h"
#include "log.h"
#include "object_allocator.h"

struct RbtFactory {
    TraceTag tag;
    struct slab_allocator queue_ele_allocator;
    struct slab_allocator rbtnode_ele_allocator;
};

struct Queue {
    struct RbtNode* key;
    struct Queue* next;
};

static struct RbtFactory rbt_factory;

void module_rbt_factory_init(TraceTag* _softkernel_tag)
{
    CreateResourceTag(&rbt_factory.tag, _softkernel_tag, "GlobalRbtFactory", TRACER_SYSOBJECT, &rbt_factory);
    slab_init(&rbt_factory.queue_ele_allocator, sizeof(struct Queue));
    slab_init(&rbt_factory.rbtnode_ele_allocator, sizeof(struct RbtNode));
}

struct Queue* front = NULL;
struct Queue* rear = NULL;

struct RbtNode* pfront()
{
    struct RbtNode* key;
    key = front->key;
    return key;
}

int isempty()
{
    if (front == NULL)
        return 1;

    else
        return 0;
}

void dequeue()
{
    if (isempty())
        return;

    struct Queue* temp = front;
    front = front->next;
    slab_free(&rbt_factory.queue_ele_allocator, (void*)temp);
}

void enqueue(struct RbtNode* key)
{
    struct Queue* temp = (struct Queue*)slab_alloc(&rbt_factory.queue_ele_allocator);
    temp->key = key;
    temp->next = NULL;

    if (front == NULL && rear == NULL) {
        front = rear = temp;
        return;
    }

    rear->next = temp;
    rear = temp;
}

void levelorder(struct RbtNode* root)
{
    if (root == NULL)
        return;

    enqueue(root);

    while (!isempty()) {
        struct RbtNode* current = pfront();
        DEBUG("%d ", current->key);

        if (current->left != NULL)
            enqueue(current->left);

        if (current->right != NULL)
            enqueue(current->right);

        dequeue();
    }
}

void LeftRotate(struct RbtNode** T, struct RbtNode** x)
{
    struct RbtNode* y = (*x)->right;
    (*x)->right = y->left;

    if (y->left != NULL)
        y->left->parent = *x;

    y->parent = (*x)->parent;

    if ((*x)->parent == NULL)
        *T = y;

    else if (*x == (*x)->parent->left)
        (*x)->parent->left = y;

    else
        (*x)->parent->right = y;

    y->left = *x;

    (*x)->parent = y;
}
void RightRotate(struct RbtNode** T, struct RbtNode** x)
{
    struct RbtNode* y = (*x)->left;
    (*x)->left = y->right;

    if (y->right != NULL)
        y->right->parent = *x;

    y->parent = (*x)->parent;

    if ((*x)->parent == NULL)
        *T = y;

    else if ((*x) == (*x)->parent->left)
        (*x)->parent->left = y;

    else
        (*x)->parent->right = y;

    y->right = *x;
    (*x)->parent = y;
}

void RB_insert_fixup(struct RbtNode** T, struct RbtNode** z)
{
    struct RbtNode* grandparent = NULL;
    struct RbtNode* parentpt = NULL;

    while (((*z) != *T) && ((*z)->color != BLACK) && ((*z)->parent->color == RED)) {
        parentpt = (*z)->parent;
        grandparent = (*z)->parent->parent;

        if (parentpt == grandparent->left) {
            struct RbtNode* uncle = grandparent->right;

            if (uncle != NULL && uncle->color == RED) {
                grandparent->color = RED;
                parentpt->color = BLACK;
                uncle->color = BLACK;
                *z = grandparent;
            }

            else {
                if ((*z) == parentpt->right) {
                    LeftRotate(T, &parentpt);
                    (*z) = parentpt;
                    parentpt = (*z)->parent;
                }

                RightRotate(T, &grandparent);
                parentpt->color = BLACK;
                grandparent->color = RED;
                (*z) = parentpt;
            }
        }

        else {
            struct RbtNode* uncle = grandparent->left;

            if (uncle != NULL && uncle->color == RED) {
                grandparent->color = RED;
                parentpt->color = BLACK;
                uncle->color = BLACK;
                (*z) = grandparent;
            }

            else {
                if ((*z) == parentpt->left) {
                    RightRotate(T, &parentpt);
                    (*z) = parentpt;
                    parentpt = (*z)->parent;
                }

                LeftRotate(T, &grandparent);
                parentpt->color = BLACK;
                grandparent->color = RED;
                (*z) = parentpt;
            }
        }
    }
    (*T)->color = BLACK;
}

struct RbtNode* rbt_insert(struct RbtNode* T, uintptr_t key, void* data)
{
    struct RbtNode* z = (struct RbtNode*)slab_alloc(&rbt_factory.rbtnode_ele_allocator);
    z->key = key;
    z->data = data;
    z->left = NULL;
    z->right = NULL;
    z->parent = NULL;
    z->color = RED;

    struct RbtNode* y = NULL;
    struct RbtNode* x = T; // root

    while (x != NULL) {
        y = x;
        if (z->key < x->key)
            x = x->left;

        else
            x = x->right;
    }
    z->parent = y;

    if (y == NULL)
        T = z;

    else if (z->key < y->key)
        y->left = z;

    else
        y->right = z;

    RB_insert_fixup(&T, &z);

    return T;
}

void preorder(struct RbtNode* root)
{
    if (root == NULL)
        return;

    DEBUG("%d ", root->key);
    preorder(root->left);
    preorder(root->right);
}

struct RbtNode* Tree_minimum(struct RbtNode* RbtNode)
{
    while (RbtNode->left != NULL)
        RbtNode = RbtNode->left;

    return RbtNode;
}

void RB_delete_fixup(struct RbtNode** T, struct RbtNode** x)
{
    while ((*x) != *T && (*x)->color == BLACK) {
        if ((*x) == (*x)->parent->left) {
            struct RbtNode* w = (*x)->parent->right;

            if (w->color == RED) {
                w->color = BLACK;
                (*x)->parent->color = BLACK;
                LeftRotate(T, &((*x)->parent));
                w = (*x)->parent->right;
            }

            if (w->left->color == BLACK && w->right->color == BLACK) {
                w->color = RED;
                (*x) = (*x)->parent;
            }

            else {
                if (w->right->color == BLACK) {
                    w->left->color = BLACK;
                    w->color = RED;
                    RightRotate(T, &w);
                    w = (*x)->parent->right;
                }

                w->color = (*x)->parent->color;
                (*x)->parent->color = BLACK;
                w->right->color = BLACK;
                LeftRotate(T, &((*x)->parent));
                (*x) = *T;
            }
        }

        else {
            struct RbtNode* w = (*x)->parent->left;

            if (w->color == RED) {
                w->color = BLACK;
                (*x)->parent->color = BLACK;
                RightRotate(T, &((*x)->parent));
                w = (*x)->parent->left;
            }

            if (w->right->color == BLACK && w->left->color == BLACK) {
                w->color = RED;
                (*x) = (*x)->parent;
            }

            else {
                if (w->left->color == BLACK) {
                    w->right->color = BLACK;
                    w->color = RED;
                    LeftRotate(T, &w);
                    w = (*x)->parent->left;
                }

                w->color = (*x)->parent->color;
                (*x)->parent->color = BLACK;
                w->left->color = BLACK;
                RightRotate(T, &((*x)->parent));
                (*x) = *T;
            }
        }
    }
    (*x)->color = BLACK;
}

void RB_transplat(struct RbtNode** T, struct RbtNode** u, struct RbtNode** v)
{
    if ((*u)->parent == NULL)
        *T = *v;

    else if ((*u) == (*u)->parent->left)
        (*u)->parent->left = *v;
    else
        (*u)->parent->right = *v;

    if ((*v) != NULL)
        (*v)->parent = (*u)->parent;
}

struct RbtNode* rbt_delete(struct RbtNode* T, struct RbtNode* z)
{
    struct RbtNode* y = z;
    enum rbt_type yoc;
    yoc = z->color; // y's original color

    struct RbtNode* x;

    if (z->left == NULL) {
        x = z->right;
        RB_transplat(&T, &z, &(z->right));
    }

    else if (z->right == NULL) {
        x = z->left;
        RB_transplat(&T, &z, &(z->left));
    }

    else {
        y = Tree_minimum(z->right);
        yoc = y->color;
        x = y->right;

        if (y->parent == z)
            x->parent = y;

        else {
            RB_transplat(&T, &y, &(y->right));
            y->right = z->right;
            y->right->parent = y;
        }

        RB_transplat(&T, &z, &y);
        y->left = z->left;
        y->left->parent = y;
        y->color = z->color;
    }

    if (yoc == BLACK)
        RB_delete_fixup(&T, &x);

    slab_free(&rbt_factory.rbtnode_ele_allocator, (void*)z);
    return T;
}

struct RbtNode* rbt_search(struct RbtNode* root, int x)
{
    if (root == NULL || root->key == x)
        return root;

    if (root->key > x)
        return rbt_search(root->left, x);
    else
        return rbt_search(root->right, x);
}