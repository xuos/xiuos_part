/**
 * Copyright (c) 2022 WIZnet Co.,Ltd
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/**
 * ----------------------------------------------------------------------------------------------------
 * Includes
 * ----------------------------------------------------------------------------------------------------
 */
#include <stdio.h>

#include "connect_ethernet.h"

#include "socket.h"

#include "netif/etharp.h"

#include <xs_kdbg.h>

#include <xizi.h>
/**
 * ----------------------------------------------------------------------------------------------------
 * Macros
 * ----------------------------------------------------------------------------------------------------
 */

/**
 * ----------------------------------------------------------------------------------------------------
 * Variables
 * ----------------------------------------------------------------------------------------------------
 */
uint8_t wiz_mac[6] = { 0x00, 0x08, 0xDC, 0x12, 0x34, 0x56 };

static uint8_t tx_frame[1542];
static const uint32_t ethernet_polynomial_le = 0xedb88320U;

/**
 * ----------------------------------------------------------------------------------------------------
 * Functions
 * ----------------------------------------------------------------------------------------------------
 */
void* ethernetif_config_enet_set(uint8_t enet_port)
{
    return NONE;
}

void Time_Update_LwIP(void)
{
    // no need to do
}

int32_t send_lwip(uint8_t sn, uint8_t* buf, uint16_t len)
{
    uint8_t tmp = 0;
    uint16_t freesize = 0;

    tmp = getSn_SR(sn);

    // freesize = getSn_TxMAX(sn);
    // freesize = getSn_TXBUF_SIZE(sn);
    freesize = getSn_TX_FSR(sn);

    SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] sending len: %d, free size: %d\n", __func__, len, freesize));
    if (len > freesize)
        len = freesize; // check size not to exceed MAX size.

    wiz_send_data(sn, buf, len);
    setSn_CR(sn, Sn_CR_SEND);
    while (getSn_CR(sn))
        ;

    while (1) {
        uint8_t IRtemp = getSn_IR(sn);
        if (IRtemp & Sn_IR_SENDOK) {
            setSn_IR(sn, Sn_IR_SENDOK);
            // printf("Packet sent ok\n");
            break;
        } else if (IRtemp & Sn_IR_TIMEOUT) {
            setSn_IR(sn, Sn_IR_TIMEOUT);
            // printf("Socket is closed\n");
            //  There was a timeout
            return -1;
        }
    }

    return (int32_t)len;
}

int32_t recv_lwip(uint8_t sn, uint8_t* buf, uint16_t len)
{
    uint8_t head[2];
    uint16_t pack_len = 0;

    pack_len = getSn_RX_RSR(sn);

    if (pack_len > 0) {
        wiz_recv_data(sn, head, 2);
        setSn_CR(sn, Sn_CR_RECV);

        // byte size of data packet (2byte)
        pack_len = head[0];
        pack_len = (pack_len << 8) + head[1];
        pack_len -= 2;

        if (pack_len > len) {
            // Packet is bigger than buffer - drop the packet
            // wiz_recv_ignore(sn, pack_len);
            // setSn_CR(sn, Sn_CR_RECV);
            // return 0;
            pack_len = len;
        }

        wiz_recv_data(sn, buf, pack_len); // data copy
        setSn_CR(sn, Sn_CR_RECV);
        SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] recved len: %d, len: %d\n", __func__, pack_len, len));
    }

    return (int32_t)pack_len;
}

err_t netif_output(struct netif* netif, struct pbuf* p)
{
    uint32_t send_len = 0;
    uint32_t tot_len = 0;

    memset(tx_frame, 0x00, sizeof(tx_frame));

    SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] pbuf len: %d, totlen: %d\n", __func__, p->len, p->tot_len));
    for (struct pbuf* q = p; q != NULL; q = q->next) {
        memcpy(tx_frame + tot_len, q->payload, q->len);

        tot_len += q->len;

        if (q->len == q->tot_len) {
            break;
        }
    }

    if (tot_len < 60) {
        // pad
        tot_len = 60;
    }

    uint32_t crc = ethernet_frame_crc(tx_frame, tot_len);

    send_len = send_lwip(0, tx_frame, tot_len);

    return ERR_OK;
}

static uint16_t wiz_sendFrame(uint8_t* buf, uint16_t len)
{
    // Wait for space in the transmit buffer
    // while (1) {
    //     SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] looping for freesize, sock state: %x\n", __func__, getSn_SR(0)));
    //     uint16_t freesize = getSn_TX_FSR(0);

    //     if (len <= freesize) {
    //         break;
    //     }
    // };

    wiz_send_data(0, buf, len);
    setSn_CR(0, Sn_CR_SEND);

    while (1) {
        SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] looping for sendok\n", __func__));
        uint8_t tmp = getSn_IR(0);
        if (tmp & Sn_IR_SENDOK) {
            setSn_IR(0, Sn_IR_SENDOK);
            // Packet sent ok
            break;
        } else if (tmp & Sn_IR_TIMEOUT) {
            setSn_IR(0, Sn_IR_TIMEOUT);
            // There was a timeout
            return -1;
        }
    }

    return len;
}

// void ethernetif_input(void* netif_arg)
// {
//     struct netif* netif = (struct netif*)netif_arg;
//     struct pbuf* p;
//     uint16_t pack_len = 0;
//     uint8_t* pack = malloc(ETHERNET_MTU);
//     while (1) {
//         wiz_getsockopt(SOCKET_MACRAW, SO_RECVBUF, &pack_len);
//         if (pack_len > 0) {
//             pack_len = recv_lwip(SOCKET_MACRAW, (uint8_t*)pack, pack_len);
//             if (pack_len) {
//                 p = pbuf_alloc(PBUF_RAW, pack_len, PBUF_POOL);
//                 pbuf_take(p, pack, pack_len);
//                 free(pack);
//                 pack = malloc(ETHERNET_MTU);
//             } else {
//                 printf(" No packet received\n");
//             }
//             if (pack_len && p != NULL) {
//                 LINK_STATS_INC(link.recv);
//                 if (netif->input(p, netif) != ERR_OK) {
//                     pbuf_free(p);
//                 }
//             }
//         }
//     }
// }

void netif_link_callback(struct netif* netif)
{
    printf("netif link status changed %s\n", netif_is_link_up(netif) ? "up" : "down");
}

void netif_status_callback(struct netif* netif)
{
    printf("netif status changed %s\n", ip4addr_ntoa(netif_ip4_addr(netif)));
}

static void wiz_transmit_pbuf(struct pbuf* p)
{

    SYS_KDEBUG_LOG(WIZNET_DEBUG, ("+++++++"));
    uint16_t freeSize = getSn_TX_FSR(0);
    SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] max tx len: %d, current tx len: %d\n", __func__, getSn_TxMAX(0), freeSize));
    uint16_t length = p->tot_len;

    if (freeSize < length) {
        /* TODO: Handle insufficent space in buffer */
        SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] max tx len: %d, current tx len: %d\n", __func__, getSn_TxMAX(0), freeSize));
        setSn_CR(0, Sn_CR_SEND);
        return;
    }
    while (1) {
        SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] pbuf len: %d, totlen: %d\n", __func__, p->len, p->tot_len));
        // wiz_send_data(0, p->payload, p->len);
        wiz_sendFrame((uint8_t*)p->payload, p->len);
        if (p->len == p->tot_len)
            break;
        p = p->next;
    }
    setSn_CR(0, Sn_CR_SEND);
}

static int wiz_read_receive_pbuf(struct pbuf** buf)
{
    //  uint8_t header[6];
    uint16_t length;
    //  uint16_t readlen;
    uint16_t framelen;
    //  struct pbuf * p;

    if (*buf != NULL)
        return 1;

    // uint16_t rxRd = getSn_RX_RD(0);

    length = getSn_RX_RSR(0);
    if (length < 4) {
        /* This could be indicative of a crashed (brown-outed?) controller */
        goto end;
    }

    wiz_recv_data(0, (uint8_t*)&framelen, 2);
    setSn_CR(0, Sn_CR_RECV);
    //__bswap16(framelen); //!< didn't work for me
    framelen = (framelen << 8) | (framelen >> 8);

    /* workaround for https://savannah.nongnu.org/bugs/index.php?50040 */
    if (framelen > 32000) {
        wiz_recv_ignore(0, framelen);
        setSn_CR(0, Sn_CR_RECV);
        goto end;
    }

    framelen -= 2;

    *buf = pbuf_alloc(PBUF_RAW, (framelen), PBUF_RAM);

    if (*buf == NULL) {
        goto end;
    }

    wiz_recv_data(0, (*buf)->payload, framelen);
    setSn_CR(0, Sn_CR_RECV);

    SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] recved data: framelen: %d\n", __func__, framelen));

end:
    return (*buf == NULL) ? 2 : 0;
}

void spi_if_clr(void)
{
    setSn_IR(0, 0x1F);
    setSIR(0);
}

void ethernetif_input(void* netif_arg)
{
    struct netif* netif = (struct netif*)netif_arg;
    struct pbuf* p = NULL;
    uint8_t res = 0;
    uint16_t epktcnt;
    for (;;) {
        spi_if_clr();
        p = NULL;
        res = wiz_read_receive_pbuf(&p);
        if (p != NULL) {
            LWIP_DEBUGF(NETIF_DEBUG, ("incoming: %d packages, first read into %x\n", epktcnt, (uintptr_t)(p)));
            if (ERR_OK != netif->input(p, netif)) {
                pbuf_free(p);
                p = NULL;
            } else {
                p = NULL;
            }
        } else {
            // LWIP_DEBUGF(NETIF_DEBUG, ("didn't receive.\n"));
        }
    }
}

static err_t spi_if_linkoutput(struct netif* netif, struct pbuf* p)
{
    while (!(getSn_SR(0) & SOCK_MACRAW))
        ; /* TODO: Implement wait timeout */

    SYS_KDEBUG_LOG(WIZNET_DEBUG, ("[%s] data output, len: %d\n", __func__, p->tot_len));
    wiz_transmit_pbuf(p);
    LWIP_DEBUGF(NETIF_DEBUG, ("sent %d bytes.\n", p->tot_len));
    /* TODO: Set up result value */
    return ERR_OK;
}

err_t netif_initialize(struct netif* netif)
{
    netif->linkoutput = spi_if_linkoutput;
    // netif->linkoutput = netif_output;
    netif->output = etharp_output;
    netif->mtu = ETHERNET_MTU;
    netif->flags = NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP | NETIF_FLAG_ETHERNET | NETIF_FLAG_IGMP | NETIF_FLAG_MLD6;
    netif->flags |= NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP | NETIF_FLAG_LINK_UP;
    SMEMCPY(netif->hwaddr, wiz_mac, sizeof(netif->hwaddr));
    netif->hwaddr_len = sizeof(netif->hwaddr);
    netif->name[0] = 'e';
    netif->name[1] = '0';
    return ERR_OK;
}

static uint32_t ethernet_frame_crc(const uint8_t* data, int length)
{
    uint32_t crc = 0xffffffff; /* Initial value. */

    while (--length >= 0) {
        uint8_t current_octet = *data++;

        for (int bit = 8; --bit >= 0; current_octet >>= 1) {
            if ((crc ^ current_octet) & 1) {
                crc >>= 1;
                crc ^= ethernet_polynomial_le;
            } else
                crc >>= 1;
        }
    }

    return ~crc;
}
