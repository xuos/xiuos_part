// Copyright (c) 2006-2018 Frans Kaashoek, Robert Morris, Russ Cox, Massachusetts Institute of Technology

// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

/**
 * @file fs.c
 * @brief support read and write the fs.img
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2024-01-25
 */

/*************************************************
File name: fs.c
Description: support read and write the fs.img
Others: take ARM_XV6 kernel/fs.c for references
                https://github.com/KingofHamyang/ARM_xv6
History:
1. Date: 2024-01-25
Author: AIIT XUOS Lab
Modification:
1. support inode create and delete
3. remove inode lock and unlock
4. remove inode cache
5. rename function names(DirInodeAddEntry,DirInodeLookup, InodeAlloc, InodeFree, PathElementExtract, InodeBlockMapping, Seek, InodeSeek, InodeParentSeek, InodeRead, InodeWrite) to fit XIZI_AIoT use sceneries
*************************************************/

#include <string.h>

#include "block_io.h"
#include "fs.h"
#include "libserial.h"

static void Error(char* s)
{
    printf("Error: %s\n", s);
    for (;;)
        ;
}

#define min(a, b) ((a) < (b) ? (a) : (b))

static int DirInodeAddEntry(struct Inode* dp, char* name, uint32_t inum);
static struct Inode* DirInodeLookup(struct Inode* dp, char* name, uint32_t* poff);
static struct Inode* InodeAlloc(short type);
static int InodeFree(struct Inode* ip);
static int InodeFreeRecursive(struct Inode* dp);
static char* PathElementExtract(char* path, char* name);
static uint32_t InodeBlockMapping(struct Inode* ip, uint32_t block_num);

#define MAX_SUPPORT_FD 1024
static struct FileDescriptor fd_table[MAX_SUPPORT_FD];

struct MemFsRange MemFsRange;

/// @brief Using syscall to get fs.img real location in the memory
void MemFsInit(uintptr_t _binary_fs_img_start, uint32_t fs_img_len)
{
    MemFsRange.memfs_start = _binary_fs_img_start;
    MemFsRange.memfs_nr_blocks = fs_img_len / BLOCK_SIZE;
}

/// @brief Read the super block.
void ReadSuperBlock(struct SuperBlock* sb)
{
    uint8_t* data = BlockRead(ROOT_INUM);
    memmove(sb, data, sizeof(*sb));
}

/// @brief Get a existed Inode by inum
struct Inode* InodeGet(uint32_t inum)
{
    struct Inode* ip;
    uint8_t* data = BlockRead(BLOCK_INDEX(inum));
    ip = (struct Inode*)data + INODE_INDEX(inum);
    return ip;
}

/// @brief Alloc a new Inode using type
static struct Inode* InodeAlloc(short type)
{
    int inum;
    struct Inode* ip;
    struct SuperBlock sb;

    ReadSuperBlock(&sb);
    for (inum = 1; inum < sb.ninodes; inum++) {
        uint8_t* data = BlockRead(BLOCK_INDEX(inum));
        ip = (struct Inode*)data + INODE_INDEX(inum);
        if (ip->type == 0) {
            memset(ip, 0, sizeof(*ip));
            ip->inum = inum;
            ip->type = type;
            ip->nlink = 1;
            ip->size = 0;
            return ip;
        }
    }

    Error("InodeAlloc: no inodes");
    return NULL;
}

/// @brief Free the existed Inode
static int InodeFree(struct Inode* ip)
{
    uint8_t* data = BlockRead(BLOCK_INDEX(ip->inum));
    struct Inode* dip = (struct Inode*)data + INODE_INDEX(ip->inum);
    dip->type = 0;

    return 0;
}

/// @brief Delete the dir and all files or dirs under the dir.
static int InodeFreeRecursive(struct Inode* dp)
{
    uint32_t off;
    struct Inode* ip;
    struct DirectEntry de;

    for (off = 0; off < dp->size; off += sizeof(de)) {
        if (InodeRead(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
            Error("inode_delete_dir failed: read directory entry failed");
        }

        // unlink dir
        if (de.inum == 0 || strcmp(de.name, "..") == 0 || strcmp(de.name, ".") == 0) {
            continue;
        }

        ip = InodeGet(de.inum);
        if (ip->type == T_DIR) {
            if (InodeFreeRecursive(ip) < 0) {
                return -1;
            }
        } else if (ip->type == T_FILE) {
            InodeFree(ip);
        }

        // delete the dir entry
        de.inum = 0;
        if (InodeWrite(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
            printf("InodeDelete failed: clear directory entry failed");
            return -1;
        }
    }
    return 0;
}

/// @brief Delete a file Inode or a dir Inode
int InodeDelete(struct Inode* dp, char* name)
{
    uint32_t off;
    struct Inode* ip;
    struct DirectEntry de;

    if ((ip = DirInodeLookup(dp, name, &off)) == 0) {
        Error("Inode delete failed, file not exsit");
        return -1;
    }

    InodeFree(ip);
    if (ip->type == T_DIR) {
        // recursive free alloced Inode
        if (InodeFreeRecursive(ip) < 0) {
            return -1;
        }
    }

    // delete the dir entry
    de.inum = 0;
    if (InodeWrite(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
        printf("InodeDelete failed: clear directory entry failed");
        return -1;
    }
    return 0;
}

/// @brief Create a new Inode under the parent Inode
struct Inode* InodeCreate(struct Inode* dp, char* name, short type, short major, short minor)
{
    uint32_t off;
    struct Inode* ip;

    if ((ip = DirInodeLookup(dp, name, &off)) != 0) {
        if (type == T_FILE && ip->type == T_FILE) {
            return ip;
        }
        return 0;
    }

    if ((ip = InodeAlloc(type)) == 0) {
        Error("InodeCreate: create Inode failed\n");
    }

    if (type == T_DIR) {
        dp->nlink++;
        if (DirInodeAddEntry(ip, ".", ip->inum) < 0 || DirInodeAddEntry(ip, "..", dp->inum) < 0) {
            Error("InodeCreate: create dots");
        }
    }

    if (DirInodeAddEntry(dp, name, ip->inum) < 0) {
        Error("InodeCreate: DirInodeAddEntry failed");
    }

    return ip;
}

/// @brief Mapping the direct block addrs or indirect block addrs of the Inode using the block_num
static uint32_t InodeBlockMapping(struct Inode* ip, uint32_t block_num)
{
    uint32_t addr;
    // block is in range of direct mapping
    if (block_num < NR_DIRECT_BLOCKS) {
        if ((addr = ip->addrs[block_num]) == 0) {
            ip->addrs[block_num] = addr = BlockAlloc();
        }
        return addr;
    }

    // alloc a new indirect indexing block
    block_num -= NR_DIRECT_BLOCKS;
    int indirect_block_id = block_num / MAX_INDIRECT_BLOCKS;
    if (indirect_block_id < NR_INDIRECT_BLOCKS) {
        if ((addr = ip->addrs[NR_DIRECT_BLOCKS + indirect_block_id]) == 0) {
            ip->addrs[NR_DIRECT_BLOCKS + indirect_block_id] = addr = BlockAlloc();
        }
        block_num -= indirect_block_id * MAX_INDIRECT_BLOCKS;
    } else {
        Error("InodeBlockMapping: out of range");
        return 0;
    }

    // alloc a new indirect block
    uint32_t* indirect_block = (uint32_t*)BlockRead(addr);
    if ((addr = indirect_block[block_num]) == 0) {
        indirect_block[block_num] = addr = BlockAlloc();
    }

    return addr;
}

/// @brief Look up the directory Inode for searching the target Inode
static struct Inode* DirInodeLookup(struct Inode* dp, char* name, uint32_t* poff)
{
    uint32_t off, inum;
    struct DirectEntry de;

    if (dp->type != T_DIR) {
        Error("DirInodeLookup not DIR");
    }

    for (off = 0; off < dp->size; off += sizeof(de)) {
        if (InodeRead(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
            Error("DirInodeAddEntry read");
        }

        if (de.inum == 0) {
            continue;
        }

        if (strncmp((const char*)name, (const char*)de.name, DIR_NAME_SIZE) == 0) {
            if (poff) {
                *poff = off;
            }
            inum = de.inum;
            return InodeGet(inum);
        }
    }

    return 0;
}

/// @brief Add a new directory entry for dir Inode
static int DirInodeAddEntry(struct Inode* dp, char* name, uint32_t inum)
{
    int off;
    struct DirectEntry de;
    struct Inode* ip;

    // Check that direct entry is existed.
    if ((ip = DirInodeLookup(dp, name, 0)) != 0) {
        return -1;
    }

    // Look for an empty dir entry.
    for (off = 0; off < dp->size; off += sizeof(de)) {
        if (InodeRead(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
            Error("DirInodeAddEntry: read failed");
        }

        if (de.inum == 0) {
            break;
        }
    }

    // build a new direct entry.
    strncpy(de.name, name, DIR_NAME_SIZE);
    de.inum = inum;
    if (InodeWrite(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
        Error("DirInodeAddEntry: write failed");
    }

    return 0;
}

static struct Inode* Seek(struct Inode* ip, char* path, int nameiparent, char* name)
{
    if (ip->size == 0) {
        Error("Inode is not sync\n");
    }

    struct Inode* next;
    while ((path = PathElementExtract(path, name)) != 0) {
        if (ip->type != T_DIR) {
            return NULL;
        }
        if (nameiparent && *path == '\0') {
            return ip;
        }
        if ((next = DirInodeLookup(ip, name, 0)) == 0) {
            return NULL;
        }
        ip = next;
    }

    if (nameiparent) {
        return NULL;
    }
    return ip;
}

/// @brief Find target Inode from source Inode
struct Inode* InodeSeek(struct Inode* source, char* path)
{
    char name[DIR_NAME_SIZE] = { 0 };
    return Seek(source, path, 0, name);
}

/// @brief Find target parent Inode from source Inode
struct Inode* InodeParentSeek(struct Inode* source, char* path, char* name)
{
    return Seek(source, path, 1, name);
}

/// @brief Read data from the Inode to the dst buffer.
int InodeRead(struct Inode* ip, char* dst, int off, int n)
{
    uint32_t tot, m;

    if (off > ip->size || off + n < off) {
        return -1;
    }

    if (off + n > ip->size) {
        n = ip->size - off;
    }

    for (tot = 0; tot < n; tot += m, off += m, dst += m) {
        uint8_t* data = BlockRead(InodeBlockMapping(ip, off / BLOCK_SIZE));
        m = min(n - tot, BLOCK_SIZE - off % BLOCK_SIZE);
        memmove(dst, data + off % BLOCK_SIZE, m);
    }

    return n;
}

/// @brief Write data from src buffer to the Inode, then increase the Inode size if neccessary.
int InodeWrite(struct Inode* ip, char* src, uint32_t off, uint32_t n)
{
    uint32_t tot, m;

    if (off > ip->size || off + n < off) {
        return -1;
    }

    if (off + n > MAX_FILE_SIZE * BLOCK_SIZE) {
        return -1;
    }

    for (tot = 0; tot < n; tot += m, off += m, src += m) {
        uint8_t* data = BlockRead(InodeBlockMapping(ip, off / BLOCK_SIZE));
        m = min(n - tot, BLOCK_SIZE - off % BLOCK_SIZE);
        memmove(data + off % BLOCK_SIZE, src, m);
    }

    if (n > 0 && off > ip->size) {
        ip->size = off;
    }

    return n;
}

// Paths process
static char* PathElementExtract(char* path, char* name)
{
    // Skip leading slashes
    while (*path == '/')
        path++;

    // Check for end of path
    if (*path == 0)
        return NULL;

    // Extract element
    char* start = path;
    while (*path != '/' && *path != 0)
        path++;

    // Calculate length and copy to 'name'
    int len = path - start;
    if (len >= DIR_NAME_SIZE)
        len = DIR_NAME_SIZE - 1;
    strncpy(name, start, len);
    name[len] = 0;

    // Skip trailing slashes
    while (*path == '/')
        path++;

    return path;
}

struct FileDescriptor* GetFileDescriptor(int fd)
{
    if (fd < 0 || fd > MAX_SUPPORT_FD) {
        printf("fd invlid.\n");
        return NULL;
    }
    return &fd_table[fd];
}

void FreeFileDescriptor(int fd)
{
    if (fd < 0 || fd > MAX_SUPPORT_FD) {
        printf("fd invlid.\n");
        return;
    }
    fd_table[fd].data = 0;
    return;
}

int AllocFileDescriptor(void)
{
    int free_idx = -1;
    for (int i = 0; i < MAX_SUPPORT_FD; i++) {
        // found free fd
        if (free_idx == -1 && fd_table[i].data == 0) {
            free_idx = i;
        }
    }
    if (free_idx == -1) {
        return -1;
    }
    return free_idx;
}
