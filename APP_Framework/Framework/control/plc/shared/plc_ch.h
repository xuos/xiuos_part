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
* @file plc_ch.h
* @brief define plc bus and drv function using bus driver framework
* @version 1.0
* @author AIIT XUOS Lab
* @date 2022-01-24
*/

#ifndef __PLC_CH_H_
#define __PLC_CH_H_

#include "channel.h"

#ifdef __cplusplus
extern "C" {
#endif

struct PlcDriver
{
    struct ChDrv driver;
    uint32 (*configure) (void *drv, struct ChConfigInfo *cfg);
};

struct PlcChannel
{
    struct Channel ch;
    void *private_data;
};

/*Register the plc bus*/
int PlcChannelInit(struct PlcChannel *plc_ch, const char *ch_name);

/*Register the plc driver*/
int PlcDriverInit(struct PlcDriver *plc_driver, const char *driver_name);

/*Release the plc device*/
int PlcReleaseChannel(struct PlcChannel *plc_ch);

/*Register the plc driver to the plc bus*/
int PlcDriverAttachToChannel(const char *drv_name, const char *ch_name);

/*Register the driver, manage with the double linklist*/
int PlcDriverRegister(struct ChDrv *driver);

/*Find the register driver*/
ChDrvType PlcDriverFind(const char *drv_name, enum ChDrvType_e drv_type);

#ifdef __cplusplus
}
#endif

#endif
