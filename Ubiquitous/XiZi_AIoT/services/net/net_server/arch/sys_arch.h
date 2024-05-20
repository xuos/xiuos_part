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

#ifndef LWIP_ARCH_SYS_ARCH_H
#define LWIP_ARCH_SYS_ARCH_H

#include <lwip/opt.h>
#include <lwip/arch.h>
#include <lwip/netif.h>
// #include "tcpip.h"

/* LWIP task parameter */
#define LWIP_LOCAL_PORT             4840
#define LWIP_TARGET_PORT            LWIP_LOCAL_PORT

#define LWIP_DEMO_TIMES             10
#define LWIP_TASK_STACK_SIZE        4096
#define LWIP_DEMO_TASK_PRIO         20

// /* MAC address configuration. */
// #define configMAC_ADDR {0x02, 0x12, 0x13, 0x10, 0x15, 0x11}
// #define configMAC_ADDR_ETH1 {0x02, 0x12, 0x13, 0x10, 0x15, 0x12}

/* USER CODE END 0 */
#define SYS_MBOX_NULL  -1
#define SYS_SEM_NULL   -1
#define SYS_MRTEX_NULL SYS_SEM_NULL

typedef s32_t sys_sem_t;
typedef s32_t sys_mutex_t;
typedef s32_t sys_mbox_t;
typedef s32_t sys_thread_t;
typedef s64_t sys_prot_t;

#define MS_PER_SYSTICK (float)(1000 / TICK_PER_SECOND)
#define TICKS_PER_MS (TICK_PER_SECOND / 1000)

//debug rtos with IRQ
//#define FSL_RTOS_XIUOS

extern char lwip_flag;

#define LWIP_INIT_FLAG (1 << 0)
#define LWIP_PRINT_FLAG (1 << 1)

#define set_lwip_bit(__bit) lwip_flag |= (__bit)
#define clr_lwip_bit(__bit) lwip_flag &= ~(__bit)
#define chk_lwip_bit(__bit) ((lwip_flag & (__bit)) == (__bit))

extern char lwip_ipaddr[];
extern char lwip_netmask[];
extern char lwip_gwaddr[];

extern char lwip_eth0_ipaddr[];
extern char lwip_eth0_netmask[];
extern char lwip_eth0_gwaddr[];

extern char lwip_eth1_ipaddr[];
extern char lwip_eth1_netmask[];
extern struct netif gnetif;
extern sys_sem_t* get_eth_recv_sem();
extern struct netif gnetif2;
extern sys_sem_t* get_eth_recv_sem2();

void lwip_tcp_init(void);
void lwip_config_net(uint8_t enet_port, char *ip, char *mask, char *gw);
void lwip_config_tcp(uint8_t enet_port, char *ip, char *mask, char *gw);


#endif /* LWIP_ARCH_SYS_ARCH_H */

