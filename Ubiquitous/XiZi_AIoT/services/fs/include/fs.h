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

#pragma once

#include <stdint.h>

#include "block_io.h"

// memory file system memlayout.
// [ block 0 ]  [  block 1  ]  [block 2] [...]  [  block 28  ]   [ ... ]
// [ unused  ]  [super block]  [Inode bit map]  [block bit map]  [data blocks]

#define NR_DIRECT_BLOCKS 5 // direct block number
#define NR_INDIRECT_BLOCKS 8 // indirect block number
#define ROOT_INUM 1 // root inode number

#define MAX_INDIRECT_BLOCKS (BLOCK_SIZE / sizeof(uint32_t)) // Mmaximum number of indirect blocks mapped per block
#define MAX_FILE_SIZE (NR_DIRECT_BLOCKS + (NR_INDIRECT_BLOCKS * MAX_INDIRECT_BLOCKS)) // maximum size of a file

// memory fs range
struct MemFsRange {
    uintptr_t memfs_start;
    uint32_t memfs_nr_blocks;
};

// current state of the Inode
enum INODE_STATE {
    I_RESERVED = 0,
    I_BUSY,
    I_VALID
};

// memfs file type
enum FILE_TYPE {
    T_RESERVED = 0,
    T_DIR, // Directory
    T_FILE, // File
    T_DEV, // Device
};

// File system super block
struct SuperBlock {
    uint32_t size; // Number of total blocks of file system image
    uint32_t nblocks; // Number of data blocks
    uint32_t ninodes; // Number of inodes.
};

// state of the Inode
struct State {
    short type; // Type of file
    int dev; // File system's disk device
    uint32_t ino; // Inode number
    short nlink; // Number of links to file
    uint32_t size; // Size of file in bytes
};

// Inode structure
struct Inode {
    uint32_t inum; // Inode number
    short type; // File type
    short nlink; // Number of links to Inode in file system
    uint32_t size; // Size of file (bytes)
    uint32_t addrs[NR_DIRECT_BLOCKS + NR_INDIRECT_BLOCKS]; // Data block addresses
};

// directory entry
#define DIR_NAME_SIZE 14
struct DirectEntry {
    uint16_t inum;
    char name[DIR_NAME_SIZE];
};

// file descriptor definition
#define MAX_PATH_LEN 128
struct FileDescriptor {
    char path[MAX_PATH_LEN];
    void* data;
    struct State st;
};

// range of memory fs
extern struct MemFsRange MemFsRange;

void MemFsInit(uintptr_t _binary_fs_img_start, uint32_t fs_img_len);
void ReadSuperBlock(struct SuperBlock*);

// fs Inode ops
struct Inode* InodeGet(uint32_t inum);
struct Inode* InodeCreate(struct Inode*, char*, short, short, short);
int InodeDelete(struct Inode*, char*);
int InodeRead(struct Inode*, char*, int, int);
int InodeWrite(struct Inode*, char*, uint32_t, uint32_t);
struct Inode* InodeSeek(struct Inode*, char*);
struct Inode* InodeParentSeek(struct Inode*, char*, char*);
void InodeStateGet(struct Inode*, struct State*);

// fs fd ops
struct FileDescriptor* GetFileDescriptor(int fd);
void FreeFileDescriptor(int fd);
int AllocFileDescriptor(void);
