/*
* Copyright (c) 2022 AIIT XUOS Lab
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
* @file plc_ch.c
* @brief register plc channel function using channel driver framework
* @version 1.0
* @author AIIT XUOS Lab
* @date 2022-01-24
*/

#include "string.h"
#include "plc_ch.h"
#include "plc_dev.h"

/******************************************************************************/

int PlcChannelInit(struct PlcChannel* plc_ch, const char* ch_name)
{
    CHECK_CH_PARAM(plc_ch);
    CHECK_CH_PARAM(ch_name);
    int ret = EOK;

    if(CHANNEL_INSTALL != plc_ch->ch.ch_state)
    {
        strncpy(plc_ch->ch.ch_name, ch_name, NAME_NUM_MAX);
        plc_ch->ch.ch_type = CH_PLC_TYPE;
        plc_ch->ch.ch_state = CHANNEL_INSTALL;
        plc_ch->ch.private_data = plc_ch->private_data;
        ret = ChannelRegister(&plc_ch->ch);

        if(EOK != ret)
        {
            KPrintf("PlcChannelInit ChannelRegister error %u\n", ret);
            return ret;
        }
    }
    else
    {
        KPrintf("PlcChannelInit ChannelRegister channel has been register state %u\n",
                plc_ch->ch.ch_state);
    }

    return ret;
}

int PlcDriverInit(struct PlcDriver* plc_driver, const char* driver_name)
{
    CHECK_CH_PARAM(plc_driver);
    CHECK_CH_PARAM(driver_name);
    int ret = EOK;

    if(CHDRV_INSTALL != plc_driver->driver.driver_state)
    {
        plc_driver->driver.driver_type = CHDRV_PLC_TYPE;
        plc_driver->driver.driver_state = CHDRV_INSTALL;
        strncpy(plc_driver->driver.drv_name, driver_name, NAME_NUM_MAX);
        plc_driver->driver.configure = plc_driver->configure;
        ret = PlcDriverRegister(&plc_driver->driver);

        if(EOK != ret)
        {
            KPrintf("PlcDriverInit DriverRegister error %u\n", ret);
            return ret;
        }
    }
    else
    {
        KPrintf("PlcDriverInit Driver %s has been register state %u\n",
                driver_name, plc_driver->driver.driver_state);
    }

    return ret;
}

int PlcReleaseChannel(struct PlcChannel* plc_ch)
{
    CHECK_CH_PARAM(plc_ch);
    return ChannelRelease(&plc_ch->ch);
}

int PlcDriverAttachToChannel(const char* drv_name, const char* ch_name)
{
    CHECK_CH_PARAM(drv_name);
    CHECK_CH_PARAM(ch_name);
    int ret = EOK;
    struct Channel* ch;
    struct ChDrv* driver;
    ch = ChannelFind(ch_name);

    if(NONE == ch)
    {
        KPrintf("PlcDriverAttachToChannel find plc channel error!name %s\n", ch_name);
        return ERROR;
    }

    if(CH_PLC_TYPE == ch->ch_type)
    {
        driver = PlcDriverFind(drv_name, CHDRV_PLC_TYPE);

        if(NONE == driver)
        {
            KPrintf("PlcDriverAttachToChannel find plc driver error!name %s\n", drv_name);
            return ERROR;
        }

        if(CHDRV_PLC_TYPE == driver->driver_type)
        {
            ret = DriverRegisterToChannel(ch, driver);

            if(EOK != ret)
            {
                KPrintf("PlcDriverAttachToChannel DriverRegisterToBus error %u\n", ret);
                return ERROR;
            }
        }
    }

    return ret;
}
