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
#include "debug.h"

#include <lwip/arch.h>
#include <lwip/opt.h>

#include "lwip/dhcp.h"
#include "lwip/init.h"
#include "lwip/netif.h"
#include "lwip/sio.h"
#include "tcpip.h"
#include "tcpip_priv.h"
#include <lwip/debug.h>
#include <lwip/stats.h>
#include <lwip/sys.h>

#if !NO_SYS
#include "sys_arch.h"
#include "libserial.h"
#include "usyscall.h"
#endif

#include "ethernetif.h"

#define SYS_THREAD_MAX 4

static char sem_server_name[] = "DefaultSemaphoreServer";

void sys_init(void)
{
    // do nothing
}

u32_t sys_jiffies(void)
{
    return 1;
}

u32_t sys_now(void)
{   
  return 1;
}


sys_prot_t sys_arch_protect(void)
{
    return 1;
}

void sys_arch_unprotect(sys_prot_t pval)
{
}

#if !NO_SYS

err_t sys_sem_new(sys_sem_t* sem, u8_t count)
{
    struct  Session sem_session;
    sem_t semaphore;
    connect_session(&sem_session, sem_server_name, 4096);
    sem_create(&sem_session, &semaphore, (int)count);
    sem->sem = semaphore;
    sem->sess = sem_session;
    #if SYS_STATS
    ++lwip_stats.sys.sem.used;
    if (lwip_stats.sys.sem.max < lwip_stats.sys.sem.used) {
        lwip_stats.sys.sem.max = lwip_stats.sys.sem.used;
    }
#endif /* SYS_STATS */

    if (sem->sem >= 0)
        return ERR_OK;
    else {
#if SYS_STATS
        ++lwip_stats.sys.sem.err;
#endif /* SYS_STATS */
        printf("[sys_arch]:new sem fail!\n");
        return ERR_MEM;
    }
}

void sys_sem_free(sys_sem_t* sem)
{
#if SYS_STATS
    --lwip_stats.sys.sem.used;
#endif /* SYS_STATS */
    sem_delete(&sem->sess, &sem->sem); 
    free_session(&sem->sess);
    free(sem);
    sem = SYS_SEM_NULL;
}

int sys_sem_valid(sys_sem_t* sem)
{
    return (sem->sem >= 0);
}

void sys_sem_set_invalid(sys_sem_t* sem)
{
    sem->sem = -1;
}

u32_t sys_arch_sem_wait(sys_sem_t* sem, u32_t timeout)
{
    s32_t wait_time = 0;

    if (sem->sem < 0)
        return SYS_ARCH_TIMEOUT;

    sem_wait(&sem->sess, &sem->sem, 0);
    return 0;
}

void sys_sem_signal(sys_sem_t* sem)
{
    sem_signal(&sem->sess, &sem->sem);
}

err_t sys_mutex_new(sys_mutex_t* mutex)
{
    return sys_sem_new(mutex, 1);
}

void sys_mutex_free(sys_mutex_t* mutex)
{
    sys_sem_free(mutex);
}

void sys_mutex_set_invalid(sys_mutex_t* mutex)
{
    sys_sem_set_invalid(mutex);
}
void sys_mutex_lock(sys_mutex_t* mutex)
{
    sys_arch_sem_wait(mutex, 0);
}

void sys_mutex_unlock(sys_mutex_t* mutex)
{
    sys_sem_signal(mutex);
}

sys_thread_t sys_thread_new(const char* name, lwip_thread_fn function, void* arg, int stacksize, int prio)
{
    sys_thread_t handle = -1;
    char* task_param[] = { arg, NULL };
    handle = thread(function, name, task_param);
    return handle;
}

err_t sys_mbox_new(sys_mbox_t* mbox, int size)
{
    
    mbox->first = mbox->last = 0;

    sys_sem_t not_empty;
    sys_sem_new(&not_empty, 0);
    mbox->not_empty = &not_empty;

    sys_sem_t not_full;
    sys_sem_new(&not_full, 0);
    mbox->not_full = &not_full;

    sys_sem_t mutex;
    sys_sem_new(&mutex, 1);
    mbox->mutex = &mutex;
    
    mbox->wait_send = 0;

#if SYS_STATS
    ++lwip_stats.sys.mbox.used;
    if (lwip_stats.sys.mbox.max < lwip_stats.sys.mbox.used) {
        lwip_stats.sys.mbox.max = lwip_stats.sys.mbox.used;
    }
#endif /* SYS_STATS */
    if (mbox == SYS_MBOX_NULL) {
        printf("lw: [%s] alloc %d mbox %p failed\n", __func__, size, mbox);
        return ERR_MEM;
    }

    printf("lw: [%s] alloc %d mbox %p ok!\n", __func__, size, mbox);
    return ERR_OK;  
}
void sys_mbox_free(sys_mbox_t* mbox)
{
    if (mbox != SYS_MBOX_NULL){
        sys_arch_sem_wait(mbox->mutex, 0);
        sys_sem_free(mbox->not_empty);
        sys_sem_free(mbox->not_full);
        sys_sem_free(mbox->mutex);
        mbox->not_empty = mbox->not_full = mbox->mutex = NULL;
        free(mbox);
        mbox = NULL;
    }
}

int sys_mbox_valid(sys_mbox_t* mbox)
{
    return (mbox != SYS_MBOX_NULL);
}

void sys_mbox_set_invalid(sys_mbox_t* mbox)
{
    mbox = SYS_MBOX_NULL;
}

void sys_mbox_post(sys_mbox_t* q, void* msg)
{
    u8_t first;
    if (q == NULL)
        printf("lw: [%s] alloc %d mbox %p failed\n", __func__, q);
    
    sys_arch_sem_wait(q->mutex, 0);
    
    printf("sys_mbox_post: mbox %p msg %p\n", (void *)q, (void *)msg);
    
    while ((q->last + 1) >= (q->first + SYS_MBOX_SIZE)) {
        q->wait_send++;
        sys_sem_signal(q->mutex);
        sys_arch_sem_wait(q->not_full, 0);
        sys_arch_sem_wait(q->mutex, 0);
        q->wait_send--;
    }

    q->msgs[q->last % SYS_MBOX_SIZE] = msg;

    if (q->last == q->first) {
        first = 1;
    } else {
        first = 0;
    }

    q->last++;

    if (first) {
        sys_sem_signal(q->not_empty);
    }
    sys_sem_signal(q->mutex);
}

err_t sys_mbox_trypost(sys_mbox_t* q, void* msg)
{
    u8_t first;
    if (q == NULL)
        printf("lw: [%s] alloc %d mbox %p failed\n", __func__, q);

    sys_arch_sem_wait(q->mutex, 0);

    printf("sys_mbox_trypost: mbox %p msg %p\n",(void *)q, (void *)msg);

    if ((q->last + 1) >= (q->first + SYS_MBOX_SIZE)) {
        sys_sem_signal(q->mutex);
        return ERR_MEM;
    }

    q->msgs[q->last % SYS_MBOX_SIZE] = msg;

    if (q->last == q->first) {
        first = 1;
    } else {
        first = 0;
    }

    q->last++;

    if (first) {
        sys_sem_signal(q->not_empty);
    }

    sys_sem_signal(q->mutex);

    return ERR_OK;
}

err_t sys_mbox_trypost_fromisr(sys_mbox_t* q, void* msg)
{
    return sys_mbox_trypost(q, msg);
}

u32_t sys_arch_mbox_fetch(sys_mbox_t* q, void** msg, u32_t timeout)
{
    if (q == NULL)
        printf("lw: [%s] alloc %d mbox %p failed\n", __func__, q);
    
    sys_arch_sem_wait(q->mutex, 0);

    while (q->first == q->last) {
        sys_sem_signal(q->mutex);
        sys_arch_sem_wait(q->not_empty, 0);
        sys_arch_sem_wait(q->mutex, 0);
  }

    if (msg != NULL) {
        printf("sys_mbox_fetch: mbox %p msg %p\n", (void *)q, *msg);
        *msg = q->msgs[q->first % SYS_MBOX_SIZE];
    }
    else{
        printf("sys_mbox_fetch: mbox %p, null msg\n", (void *)q);
    }

    q->first++;

    if (q->wait_send) {
        sys_sem_signal(q->not_full);
    }

    sys_sem_signal(q->mutex);

    return 0;
}
u32_t sys_arch_mbox_tryfetch(sys_mbox_t* q, void** msg)
{
    if (q == NULL)
        printf("lw: [%s] alloc %d mbox %p failed\n", __func__, q);
    
    sys_arch_sem_wait(q->mutex, 0);

    if (q->first == q->last) {
        sys_sem_signal(q->mutex);
        return SYS_MBOX_EMPTY;
    }

    if (msg != NULL) {
        printf("sys_mbox_tryfetch: mbox %p msg %p\n", (void *)q, *msg);
        *msg = q->msgs[q->first % SYS_MBOX_SIZE];
    }
    else{
        printf("sys_mbox_tryfetch: mbox %p, null msg\n", (void *)q);
    }

    q->first++;

    if (q->wait_send) {
        sys_sem_signal(q->not_full);
    }

    sys_sem_signal(q->mutex);

    return 0;
}

#if LWIP_NETCONN_SEM_PER_THREAD
#error LWIP_NETCONN_SEM_PER_THREAD==1 not supported
#endif /* LWIP_NETCONN_SEM_PER_THREAD */

#endif /* !NO_SYS */

/* Variables Initialization */
ip4_addr_t net_ipaddr;
ip4_addr_t net_netmask;
ip4_addr_t net_gw;
struct netif gnetif;

int lwip_config_tcp(char* ip, char* mask, char* gw)
{
    printf("lw: [%s] start ...\n", __func__);
    IP4_ADDR(&net_ipaddr, ip[0], ip[1], ip[2], ip[3]);
    IP4_ADDR(&net_netmask, mask[0], mask[1], mask[2], mask[3]);
    IP4_ADDR(&net_gw, gw[0], gw[1], gw[2], gw[3]);

    tcpip_init(NULL, NULL);

#ifndef NETIF_ENET_INIT_FUNC
        printf("Not Netif driver for Eport 0\n");
        return 0;
#endif

#ifdef NETIF_ENET_INIT_FUNC
    netif_add(&gnetif, &net_ipaddr, &net_netmask, &net_gw, NULL,
            NETIF_ENET_INIT_FUNC, &tcpip_input);

    /* Registers the default network interface */
    netif_set_default(&gnetif);

    if (netif_is_link_up(&gnetif))
    {
    /*When the netif is fully configured this function must be called */
        netif_set_up(&gnetif);
    }
    else
    {
        /* When the netif link is down this function must be called */
        netif_set_down(&gnetif);
        return -1;
    }
    printf("\r\n************************************************\r\n");
    printf(" Network Configuration\r\n");
    printf("************************************************\r\n");
    printf(" IPv4 Address   : %u.%u.%u.%u\r\n", ((u8_t*)&net_ipaddr)[0], ((u8_t*)&net_ipaddr)[1],
            ((u8_t*)&net_ipaddr)[2], ((u8_t*)&net_ipaddr)[3]);
    printf(" IPv4 Subnet mask : %u.%u.%u.%u\r\n", ((u8_t*)&net_netmask)[0], ((u8_t*)&net_netmask)[1],
            ((u8_t*)&net_netmask)[2], ((u8_t*)&net_netmask)[3]);
    printf(" IPv4 Gateway   : %u.%u.%u.%u\r\n", ((u8_t*)&net_gw)[0], ((u8_t*)&net_gw)[1],
            ((u8_t*)&net_gw)[2], ((u8_t*)&net_gw)[3]);
    printf("************************************************\r\n");
    return 0;
#endif
}



