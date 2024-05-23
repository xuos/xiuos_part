/*
* Copyright (c) 2001-2003 Swedish Institute of Computer Science.
* All rights reserved. 
* 
* Redistribution and use in source and binary forms, with or without modification, 
* are permitted provided that the following conditions are met:
*
* 1. Redistributions of source code must retain the above copyright notice,
*    this list of conditions and the following disclaimer.
* 2. Redistributions in binary form must reproduce the above copyright notice,
*    this list of conditions and the following disclaimer in the documentation
*    and/or other materials provided with the distribution.
* 3. The name of the author may not be used to endorse or promote products
*    derived from this software without specific prior written permission. 
*
* THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED 
* WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
* SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
* OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
* INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
* CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
* IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY 
* OF SUCH DAMAGE.
*
* This file is part of the lwIP TCP/IP stack.
* 
* Author: Adam Dunkels <adam@sics.se>
*
*/
#ifndef LWIP_LWIPOPTS_H
#define LWIP_LWIPOPTS_H

 /**
 * SYS_LIGHTWEIGHT_PROT==1: if you want inter-task protection for certain
 * critical regions during buffer allocation, deallocation and memory
 * allocation and deallocation.
 */
 #define SYS_LIGHTWEIGHT_PROT    1

 /**
 * NO_SYS==1: Provides VERY minimal functionality. Otherwise,
 * use lwIP facilities.
 */
 #define NO_SYS                  0

 /**
 * NO_SYS_NO_TIMERS==1: Drop support for sys_timeout when NO_SYS==1
 * Mainly for compatibility to old versions.
 */
 #define NO_SYS_NO_TIMERS        0

 /* ---------- Memory options ---------- */
 /* MEM_ALIGNMENT: should be set to the alignment of the CPU for which
 lwIP is compiled. 4 byte alignment -> define MEM_ALIGNMENT to 4, 2
 byte alignment -> define MEM_ALIGNMENT to 2. */
 #define MEM_ALIGNMENT           4

 /* MEM_SIZE: the size of the heap memory. If the application will send
 a lot of data that needs to be copied, this should be set high. */
 #define MEM_SIZE                (15*1024)

 /* MEMP_NUM_PBUF: the number of memp struct pbufs. If the application
 sends a lot of data out of ROM (or other static memory), this
 should be set high. */
 #define MEMP_NUM_PBUF           25
 /* MEMP_NUM_UDP_PCB: the number of UDP protocol control blocks. One
 per active UDP "connection". */
 #define MEMP_NUM_UDP_PCB        4
 /* MEMP_NUM_TCP_PCB: the number of simulatenously active TCP
 connections. */
 #define MEMP_NUM_TCP_PCB        6
 /* MEMP_NUM_TCP_PCB_LISTEN: the number of listening TCP
 connections. */
 #define MEMP_NUM_TCP_PCB_LISTEN 6
 /* MEMP_NUM_TCP_SEG: the number of simultaneously queued TCP
 segments. */
 #define MEMP_NUM_TCP_SEG        150
 /* MEMP_NUM_SYS_TIMEOUT: the number of simulateously active
 timeouts. */
 #define MEMP_NUM_SYS_TIMEOUT    6


 /* ---------- Pbuf options ---------- */
 /* PBUF_POOL_SIZE: the number of buffers in the pbuf pool. */
 #define PBUF_POOL_SIZE          45
 /* PBUF_POOL_BUFSIZE: the size of each pbuf in the pbuf pool. */
 #define PBUF_POOL_BUFSIZE    \
 LWIP_MEM_ALIGN_SIZE(TCP_MSS+40+PBUF_LINK_ENCAPSULATION_HLEN+PBUF_LINK_HLEN)

 /* ---------- TCP options ---------- */
 #define LWIP_TCP                1
 #define TCP_TTL                 255

 /* Controls if TCP should queue segments that arrive out of
 order. Define to 0 if your device is low on memory. */
 #define TCP_QUEUE_OOSEQ         0

 /* TCP Maximum segment size. */
 #define TCP_MSS                 (1500 - 40)

 /* TCP sender buffer space (bytes). */
 #define TCP_SND_BUF             (10*TCP_MSS)

 /*  TCP_SND_QUEUELEN: TCP sender buffer space (pbufs). This must be at least
 as much as (2 * TCP_SND_BUF/TCP_MSS) for things to work. */

 #define TCP_SND_QUEUELEN        (8* TCP_SND_BUF/TCP_MSS)

 /* TCP receive window. */
 #define TCP_WND                 (11*TCP_MSS)


 /* ---------- ICMP options ---------- */
 #define LWIP_ICMP                       1


 /* ---------- DHCP options ---------- */
 /* Define LWIP_DHCP to 1 if you want DHCP configuration of
 interfaces. DHCP is not implemented in lwIP 0.5.1, however, so
 turning this on does currently not work. */
 #define LWIP_DHCP               1


 /* ---------- UDP options ---------- */
 #define LWIP_UDP                1
 #define UDP_TTL                 255


 /* ---------- Statistics options ---------- */
 #define LWIP_STATS 0
 #define LWIP_PROVIDE_ERRNO 1

 /* ---------- link callback options ---------- */
 /* LWIP_NETIF_LINK_CALLBACK==1: Support a callback function from an interface
 * whenever the link changes (i.e., link down)
 */
 #define LWIP_NETIF_LINK_CALLBACK        0
 /*
     --------------------------------------
     ---------- Checksum options ----------
     --------------------------------------
 */

 /* The STM32F4x7 allows computing and verifying the IP,
     UDP, TCP and ICMP checksums by hardware:
 - To use this feature let the following define uncommented.
 - To disable it and process by CPU comment the  the checksum.
 */
 #define CHECKSUM_BY_HARDWARE

 #ifdef CHECKSUM_BY_HARDWARE
 /* CHECKSUM_GEN_IP==0: Generate checksums by hardware for outgoing IP packets.*/
 #define CHECKSUM_GEN_IP                 0
 /* CHECKSUM_GEN_UDP==0: Generate checksums by hardware for outgoing UDP packets.*/
 #define CHECKSUM_GEN_UDP                0
 /* CHECKSUM_GEN_TCP==0: Generate checksums by hardware for outgoing TCP packets.*/
 #define CHECKSUM_GEN_TCP                0
 /* CHECKSUM_CHECK_IP==0: Check checksums by hardware for incoming IP packets.*/
 #define CHECKSUM_CHECK_IP               0
 /* CHECKSUM_CHECK_UDP==0: Check checksums by hardware for incoming UDP packets.*/
 #define CHECKSUM_CHECK_UDP              0
 /* CHECKSUM_CHECK_TCP==0: Check checksums by hardware for incoming TCP packets.*/
 #define CHECKSUM_CHECK_TCP              0
 /*CHECKSUM_CHECK_ICMP==0: Check checksums by hardware for incoming ICMP packets.*/
 #define CHECKSUM_GEN_ICMP               0
 #else
 /* CHECKSUM_GEN_IP==1: Generate checksums in software for outgoing IP packets.*/
 #define CHECKSUM_GEN_IP                 1
 /* CHECKSUM_GEN_UDP==1: Generate checksums in software for outgoing UDP packets.*/
 #define CHECKSUM_GEN_UDP                1
 /* CHECKSUM_GEN_TCP==1: Generate checksums in software for outgoing TCP packets.*/
 #define CHECKSUM_GEN_TCP                1
 /* CHECKSUM_CHECK_IP==1: Check checksums in software for incoming IP packets.*/
 #define CHECKSUM_CHECK_IP               1
 /* CHECKSUM_CHECK_UDP==1: Check checksums in software for incoming UDP packets.*/
 #define CHECKSUM_CHECK_UDP              1
 /* CHECKSUM_CHECK_TCP==1: Check checksums in software for incoming TCP packets.*/
 #define CHECKSUM_CHECK_TCP              1
 /*CHECKSUM_CHECK_ICMP==1: Check checksums by hardware for incoming ICMP packets.*/
 #define CHECKSUM_GEN_ICMP               1
 #endif

 /*
     ----------------------------------------------
     ---------- Sequential layer options ----------
     ----------------------------------------------
 */
 /**
 * LWIP_NETCONN==1: Enable Netconn API (require to use api_lib.c)
 */
 #define LWIP_NETCONN                    1

 /*
     ------------------------------------
     ---------- Socket options ----------
     ------------------------------------
 */
 /**
 * LWIP_SOCKET==1: Enable Socket API (require to use sockets.c)
 */
 #define LWIP_SOCKET                     1

 /*
     ---------------------------------
     ---------- OS options ----------
     ---------------------------------
 */

 #define DEFAULT_UDP_RECVMBOX_SIZE       10
 #define DEFAULT_TCP_RECVMBOX_SIZE       10
 #define DEFAULT_ACCEPTMBOX_SIZE         10
 #define DEFAULT_THREAD_STACKSIZE        1024

 #define TCPIP_THREAD_NAME              "lwip"
 #define TCPIP_THREAD_STACKSIZE          512
 #define TCPIP_MBOX_SIZE                 8
 #define TCPIP_THREAD_PRIO               3

/*
   ----------------------------------------
   ---------- Lwip Debug options ----------
   ----------------------------------------
*/
#ifndef LWIP_DEBUG
#define LWIP_DEBUG 1
#define LWIP_SOCKET_DEBUG
#define LWIP_SOCKETS_DEBUG
#define LWIP_TCPIP_DEBUG
#define LWIP_MEMP_DEBUG
#define LWIP_PBUF_DEBUG
#define LWIP_TCP_INPUT_DEBUG
#define LWIP_TCP_OUTPUT_DEBUG
#define LWIP_NETIF_DEBUG
#define LWIP_ETHARP_DEBUG
#define LWIP_API_MSG_DEBUG
#endif

#ifdef LWIP_DEBUG
#ifdef LWIP_SYS_DEBUG
#define SYS_DEBUG LWIP_DBG_ON
#else
#define SYS_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_ETHARP_DEBUG
#define ETHARP_DEBUG LWIP_DBG_ON
#else
#define ETHARP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_PPP_DEBUG
#define PPP_DEBUG LWIP_DBG_ON
#else
#define PPP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_MEM_DEBUG
#define MEM_DEBUG LWIP_DBG_ON
#else
#define MEM_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_MEMP_DEBUG
#define MEMP_DEBUG LWIP_DBG_ON
#else
#define MEMP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_PBUF_DEBUG
#define PBUF_DEBUG LWIP_DBG_ON
#else
#define PBUF_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_API_LIB_DEBUG
#define API_LIB_DEBUG LWIP_DBG_ON
#else
#define API_LIB_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_API_MSG_DEBUG
#define API_MSG_DEBUG LWIP_DBG_ON
#else
#define API_MSG_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCPIP_DEBUG
#define TCPIP_DEBUG LWIP_DBG_ON
#else
#define TCPIP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_NETIF_DEBUG
#define NETIF_DEBUG LWIP_DBG_ON
#else
#define NETIF_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_SOCKETS_DEBUG
#define SOCKETS_DEBUG LWIP_DBG_ON
#else
#define SOCKETS_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_DNS_DEBUG
#define DNS_DEBUG LWIP_DBG_ON
#else
#define DNS_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_AUTOIP_DEBUG
#define AUTOIP_DEBUG LWIP_DBG_ON
#else
#define AUTOIP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_DHCP_DEBUG
#define DHCP_DEBUG LWIP_DBG_ON
#else
#define DHCP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_IP_DEBUG
#define IP_DEBUG LWIP_DBG_ON
#else
#define IP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_IP_REASS_DEBUG
#define IP_REASS_DEBUG LWIP_DBG_ON
#else
#define IP_REASS_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_ICMP_DEBUG
#define ICMP_DEBUG LWIP_DBG_ON
#else
#define ICMP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_IGMP_DEBUG
#define IGMP_DEBUG LWIP_DBG_ON
#else
#define IGMP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_UDP_DEBUG
#define UDP_DEBUG LWIP_DBG_ON
#else
#define UDP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_DEBUG
#define TCP_DEBUG LWIP_DBG_ON
#else
#define TCP_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_INPUT_DEBUG
#define TCP_INPUT_DEBUG LWIP_DBG_ON
#else
#define TCP_INPUT_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_OUTPUT_DEBUG
#define TCP_OUTPUT_DEBUG LWIP_DBG_ON
#else
#define TCP_OUTPUT_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_RTO_DEBUG
#define TCP_RTO_DEBUG LWIP_DBG_ON
#else
#define TCP_RTO_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_CWND_DEBUG
#define TCP_CWND_DEBUG LWIP_DBG_ON
#else
#define TCP_CWND_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_WND_DEBUG
#define TCP_WND_DEBUG LWIP_DBG_ON
#else
#define TCP_WND_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_FR_DEBUG
#define TCP_FR_DEBUG LWIP_DBG_ON
#else
#define TCP_FR_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_QLEN_DEBUG
#define TCP_QLEN_DEBUG LWIP_DBG_ON
#else
#define TCP_QLEN_DEBUG LWIP_DBG_OFF
#endif

#ifdef LWIP_TCP_RST_DEBUG
#define TCP_RST_DEBUG LWIP_DBG_ON
#else
#define TCP_RST_DEBUG LWIP_DBG_OFF
#endif

#endif /* LWIP_DEBUG */
#endif /* LWIP_LWIPOPTS_H */
