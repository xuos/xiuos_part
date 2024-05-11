/*
 * Copyright (c) 2011-2012, Freescale Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*!
 * @file enet_test.c
 * @brief Test for the ethernet interface through the ENET + PHY.
 *
 * @ingroup diag_enet
 */
#include <stddef.h>
#include <string.h>

#include "enet.h"
#include "soc_memory_map.h"

#include "libserial.h"
#include "usyscall.h"

typedef enum _test_return {
    TEST_NOT_STARTED = -3, // present in the menu, but not run
    TEST_NOT_IMPLEMENTED = -2, // present in the menu, but not functional
    TEST_FAILED = -1,
    TEST_PASSED = 0,
    TEST_BYPASSED = 2, // user elected to exit the test before it was run
    TEST_NOT_PRESENT = 3, // not present in the menu.
    TEST_CONTINUE = 4 // proceed with the test. opposite of TEST_BYPASSED
} test_return_t;

#define ENET_PHY_ADDR 6

static imx_enet_priv_t enet0;
static unsigned char pkt_send[2048], pkt_recv[2048];
static unsigned char mac_addr0[6] = { 0x00, 0x04, 0x9f, 0x00, 0x00, 0x01 };

extern int imx_enet_mii_type(imx_enet_priv_t* dev, enum imx_mii_type mii_type);
extern void imx_enet_iomux(void);
#ifdef BOARD_SABRE_LITE
extern void imx_enet_iomux_reconfig(void);
#endif
extern void imx_enet_phy_reset(void);
static void pkt_fill(unsigned char* packet, unsigned char* eth_addr, unsigned char seed, int length)
{
    unsigned char* pkt = packet;
    unsigned char eth_type[2] = { 0x08, 0x00 };
    int i;
    memset(pkt, 0xff, 6);
    pkt += 6;
    memcpy(pkt, eth_addr, 6);
    pkt += 6;
    memcpy(pkt, eth_type, 2);
    pkt += 2;

    for (i = 0; i < (length - 14); i++)
        *pkt++ = (seed + i) & 0xff;

    return;
}

static int pkt_compare(unsigned char* packet1, unsigned char* packet2, int length)
{
    int i = 0;
    unsigned char *pkt1 = packet1, *pkt2 = packet2;

    for (i = 0; i < length; i++) {
        if (*(pkt1 + i) != *(pkt2 + i))
            break;
    }

    if (i < length)
        return TEST_FAILED;
    else
        return 0;
}

/*!
 * This test performs a loopback transfer on the RGMII interface through
 * an external AR8031 giga ethernet PHY.
 *
 * @return TEST_PASSED or TEST_FAILED
 */
int enet_test()
{

    imx_enet_priv_t* dev0 = &enet0;
    int pkt_len_send = 0, pkt_len_recv = 0, ret = 0, i;
    unsigned int enet_events = 0;
    unsigned char try = 100;

    // Enet loopback test
    printf("\nWould you like to run the Ethernet loopback test?\n \
           (Please note that in order to run the test, you need to\n \
           first plug in a loopback cable to the Ethernet port) \n");

    // setup iomux for ENET
    imx_enet_iomux();
    imx_enet_phy_reset();
#ifdef BOARD_SABRE_LITE
    imx_enet_iomux_reconfig();
#endif
    // init enet0
    imx_enet_init(dev0, ENET_BASE_ADDR, ENET_PHY_ADDR);
    imx_enet_mii_type(dev0, RGMII);
    // init phy0.
    imx_enet_phy_init(dev0);

    while (try--) {
        uint32_t status = imx_enet_get_phy_status(dev0);
        if (status & ENET_STATUS_LINK_ON) {
            printf("Ethernet link is up!\n");
            break;
        }
        yield(SYS_TASK_YIELD_NO_REASON);
    }

    imx_enet_phy_enable_external_loopback(dev0);

    printf("ENET %0d: [ %s ] [ %s ] [ %s ]:\n", dev0->phy_addr,
        (dev0->status & ENET_STATUS_FULL_DPLX) ? "FULL_DUPLEX" : "HALF_DUPLEX",
        (dev0->status & ENET_STATUS_LINK_ON) ? "connected" : "disconnected",
        (dev0->status & ENET_STATUS_1000M) ? "1000M bps" : (dev0->status & ENET_STATUS_100M) ? "100M bps"
                                                                                             : "10M bps");

    // check phy status
    if (!(dev0->status & ENET_STATUS_LINK_ON)) {
        printf("ENET link status check fail\n");
        return TEST_FAILED;
    }

    imx_enet_start(dev0, mac_addr0);

    // send packet
    printf("send packet\n");
    pkt_len_send = 1500;
    pkt_fill(pkt_send, mac_addr0, 0x23, pkt_len_send);
    imx_enet_send(dev0, pkt_send, pkt_len_send, 1);
    enet_events = 0;

    for (i = 0; i < 100; i++) {
        enet_events = imx_enet_poll(dev0);

        if (ENET_EVENT_TX & enet_events) {
            printf("enet_events = %08x\n", enet_events);
            break;
        }

        hal_delay_us(100);
    }

    if (!(ENET_EVENT_TX & enet_events)) {
        printf("ENET tx fail\n");
        return TEST_FAILED;
    }

    if (!(ENET_EVENT_RX & enet_events)) {
        printf("ENET rx fail\n");
        return TEST_FAILED;
    }

    pkt_len_recv = 0;
    imx_enet_recv(dev0, pkt_recv, &pkt_len_recv);

    if (pkt_len_recv != pkt_len_send) {
        printf("ENET rx length check fail \n");
        return TEST_FAILED;
    }

    ret = pkt_compare(pkt_send, pkt_recv, pkt_len_send);

    if (ret != 0) {
        printf("ENET rx packet check fail \n");
        return TEST_FAILED;
    }
#ifdef DEBUG_PRINT
    printf("ENET rx ok\n");
#endif

    printf(" ENET loopback test pass\n");

    imx_enet_stop(dev0);
    return TEST_PASSED;
}

char enet_server_name[] = "EnetServer";
char timer_server_name[] = "TimerServer";
struct Session timer_session;
int main(int argc, char** argv)
{
    if (connect_session(&timer_session, timer_server_name, 4096) < 0) {
        printf("%s connect server: %s failed\n", enet_server_name, timer_server_name);
        exit();
    }

    printf("%s: Mapping %x(size: %x) to %x\n", enet_server_name, AIPS1_ARB_PHY_BASE_ADDR, AIPS1_ARB_END_ADDR - AIPS1_ARB_BASE_ADDR, AIPS1_ARB_BASE_ADDR);
    if (!mmap(AIPS1_ARB_BASE_ADDR, AIPS1_ARB_PHY_BASE_ADDR, AIPS1_ARB_END_ADDR - AIPS1_ARB_BASE_ADDR, true)) {
        printf("%s: mmap AIPS1 ARB(%x) failed\n", enet_server_name, AIPS1_ARB_PHY_BASE_ADDR);
        exit();
    }

    printf("%s: Mapping %x(size: %x) to %x\n", enet_server_name, AIPS2_ARB_PHY_BASE_ADDR, AIPS2_ARB_END_ADDR - AIPS2_ARB_BASE_ADDR, AIPS2_ARB_BASE_ADDR);
    if (!mmap(AIPS2_ARB_BASE_ADDR, AIPS2_ARB_PHY_BASE_ADDR, AIPS2_ARB_END_ADDR - AIPS2_ARB_BASE_ADDR, true)) {
        printf("%s: mmap AIPS1 ARB(%x) failed\n", enet_server_name, AIPS2_ARB_PHY_BASE_ADDR);
        exit();
    }

    enet_test();

    exit();
}