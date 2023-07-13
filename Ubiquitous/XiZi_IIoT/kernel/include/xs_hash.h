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
* @file:    xs_hash.h
* @brief:   hash table
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2023/7/10
*
*/

#include <stdio.h>
#include <stdint.h>
#include<stdlib.h>
#include "xs_base.h"

#define REMAINDER 11

typedef struct element
{
	uint8_t key;
	uint8_t value;
	uint8_t hash;
}Element;


typedef struct Pnode
{
	Element *data;
	struct Pnode *next;
}Node;


typedef struct hash_table
{
	uint8_t size;
	uint8_t length;
	struct Pnode *head;
}Hash_table;


Hash_table* Creat_Table(int table_size)
{
	Hash_table *h = (Hash_table *)malloc(sizeof(Hash_table));
	h->size = REMAINDER;
	h->head = (Node *)malloc((h->size)*sizeof(Node));
	h->length = 0;
	int i = 0;
	for(i=0 ; i<h->size ; i++)
	{
		h->head[i].next = NULL;
	}
	return h;
}

int hash(int value)
{
	return value%REMAINDER;
}

Node *lookup(Hash_table *h , int key)
{
	int i;
	i = hash(key);
	Node * p = h->head[i].next;
	while(p && key != p->data->key)
	{
		p = p->next;
	}

	return p;
}



void Insert(Hash_table *h , Element k)
{
	Node * p = lookup(h,k.key);
	if(!p)
	{
		Node *q = (Node *)malloc(sizeof(Node));
		q->data = (Element *)malloc(sizeof(Element));
		(q->data)->key = k.key;
		(q->data)->value = k.value;
		int position;
		position = (q->data)->hash  = hash(k.key);
		q->next = h->head[position].next;
		h->head[position].next = q;
		
		h->length += 1; 
		return ;
	}
	else
	{
		printf("The keys is exist !\n");
		return ;
	}
}

void Destroy_Table(Hash_table *h)
{
	int i;
	Node *p , *q;
	for(i=0 ; i<h->size ; i++)
	{
		p = h->head[i].next;
		while(p)
		{
			q=p->next;
			free(p);
			p=q;
		}
	}
	free(h->head);
	free(h);
}


void print_Table(Hash_table *h)
{
	int i = 0; 
	for (i = 0; i < h->size ; i++)
    {
        Node * p = h->head[i].next;
        while (p)
        {
            printf("[%d-%d] ",p->data->key, p->data->value);
            p = p->next;
        }
        printf("NULL\n");
    }
}


