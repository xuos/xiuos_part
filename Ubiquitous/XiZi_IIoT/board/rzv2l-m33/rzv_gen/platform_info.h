/***********************************************************************************************************************
 * Copyright [2020-2021] Renesas Electronics Corporation and/or its affiliates.  All Rights Reserved.
 *
 * This software and documentation are supplied by Renesas Electronics Corporation and/or its affiliates and may only
 * be used with products of Renesas Electronics Corp. and its affiliates ("Renesas").  No other uses are authorized.
 * Renesas products are sold pursuant to Renesas terms and conditions of sale.  Purchasers are solely responsible for
 * the selection and use of Renesas products and Renesas assumes no liability.  No license, express or implied, to any
 * intellectual property right is granted by Renesas.  This software is protected under all applicable laws, including
 * copyright laws. Renesas reserves the right to change or discontinue this software and/or this documentation.
 * THE SOFTWARE AND DOCUMENTATION IS DELIVERED TO YOU "AS IS," AND RENESAS MAKES NO REPRESENTATIONS OR WARRANTIES, AND
 * TO THE FULLEST EXTENT PERMISSIBLE UNDER APPLICABLE LAW, DISCLAIMS ALL WARRANTIES, WHETHER EXPLICITLY OR IMPLICITLY,
 * INCLUDING WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT, WITH RESPECT TO THE
 * SOFTWARE OR DOCUMENTATION.  RENESAS SHALL HAVE NO LIABILITY ARISING OUT OF ANY SECURITY VULNERABILITY OR BREACH.
 * TO THE MAXIMUM EXTENT PERMITTED BY LAW, IN NO EVENT WILL RENESAS BE LIABLE TO YOU IN CONNECTION WITH THE SOFTWARE OR
 * DOCUMENTATION (OR ANY PERSON OR ENTITY CLAIMING RIGHTS DERIVED FROM YOU) FOR ANY LOSS, DAMAGES, OR CLAIMS WHATSOEVER,
 * INCLUDING, WITHOUT LIMITATION, ANY DIRECT, CONSEQUENTIAL, SPECIAL, INDIRECT, PUNITIVE, OR INCIDENTAL DAMAGES; ANY
 * LOST PROFITS, OTHER ECONOMIC DAMAGE, PROPERTY DAMAGE, OR PERSONAL INJURY; AND EVEN IF RENESAS HAS BEEN ADVISED OF THE
 * POSSIBILITY OF SUCH LOSS, DAMAGES, CLAIMS OR COSTS.
 **********************************************************************************************************************/
/*
 * @file    platform_info.h
 * @brief   Platform specific configurations for OpenAMP and Shared memory
 * @date    2020.10.21
 * @author  Copyright (c) 2020, eForce Co., Ltd. All rights reserved.
 *
 ****************************************************************************
 * @par     History
 *          - rev 1.0 (2020.10.21) Imada
 *            Initial version for RZ/V2.
 ****************************************************************************
 */

#ifndef PLATFORM_INFO_H_
#define PLATFORM_INFO_H_

#include <openamp/rpmsg.h>
#include <openamp/remoteproc.h>
#include "open_amp_cfg.h"
#include "bsp_api.h"
#include <xizi.h>
#include "r_mhu_api.h"

#define DEV_BUS_NAME     "generic"
#define MBX_REG_PA      0x10400000
#define MBX_REG_VA      0x40400000
#define MBX_MAP_SIZE     0x00000800
#define MBX_INT_NUM     69            // MSG1_NS_IRQn
#define RSC_MAX_NUM      2

#define LPRINTF(format, ...)    (KPrintf(format, ## __VA_ARGS__))
#define LPERROR(format, ...)    (LPRINTF("ERROR: " format, ## __VA_ARGS__))

// Page size on Linux (Default: 4KB)
#define PAGE_SIZE       (0x01000U)     // 4KB page size as the dafault value

// Mailbox config
#define MBX_DEV_NAME    "0x10400000.mbox-uio"
#define MBX_NO          (0x0U)         /* Maibox number (0, 1, ..., or 7) this program uses */

struct ipi_info
{
    const char             * name;
    const char             * bus_name;
    struct metal_device    * dev;
    struct metal_io_region * io;
    uintptr_t                irq_info;
    int          registered;
    unsigned int mbx_chn[CFG_RPMSG_SVCNO];
    unsigned int chn_mask;             /**< IPI channel mask */
    int32 ipi_mutx_id[CFG_RPMSG_SVCNO];
};

struct shm_info
{
    const char             * name;
    const char             * bus_name;
    struct metal_device    * dev;      /**< pointer to shared memory device */
    struct metal_io_region * io;       /**< pointer to shared memory i/o region */
    struct remoteproc_mem    mem;      /**< shared memory */
};

struct vring_info
{
    struct shm_info rsc;
    struct shm_info ctl;
    struct shm_info shm;
};

struct remoteproc_priv
{
    unsigned int        notify_id;
    unsigned int        mbx_chn_id;
    struct vring_info * vr_info;
};

/**
 * platform_init - initialize the platform
 *
 * It will initialize the platform.
 *
 * @proc_id: processor id
 * @rsc_id: resource id
 * @platform: pointer to store the platform data pointer
 *
 * return 0 for success or negative value for failure
 */
int platform_init(unsigned long proc_id, unsigned long rsc_id, void ** platform);

/**
 * platform_create_rpmsg_vdev - create rpmsg vdev
 *
 * It will create rpmsg virtio device, and returns the rpmsg virtio
 * device pointer.
 *
 * @platform: pointer to the private data
 * @vdev_index: index of the virtio device, there can more than one vdev
 *              on the platform.
 * @role: virtio master or virtio slave of the vdev
 * @rst_cb: virtio device reset callback
 * @ns_bind_cb: rpmsg name service bind callback
 *
 * return pointer to the rpmsg virtio device
 */
struct rpmsg_device * platform_create_rpmsg_vdev(void           * platform,
                                                 unsigned int     vdev_index,
                                                 unsigned int     role,
                                                 void (         * rst_cb)(struct virtio_device * vdev),
                                                 rpmsg_ns_bind_cb ns_bind_cb);

/**
 * platform_poll - platform poll function
 *
 * @platform: pointer to the platform
 *
 * return negative value for errors, otherwise 0.
 */
int platform_poll(void * platform);

/**
 * platform_release_rpmsg_vdev - release rpmsg virtio device
 *
 * @platform: pointer to the platform
 * @rpdev: pointer to the rpmsg device
 */
void platform_release_rpmsg_vdev(void * platform, struct rpmsg_device * rpdev);

/**
 * platform_cleanup - clean up the platform resource
 *
 * @platform: pointer to the platform
 */
void platform_cleanup(void * platform);

#endif                                 /* PLATFORM_INFO_H_ */
