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
* @file plc_bus.c
* @brief register plc bus function using bus driver framework
* @version 1.0 
* @author AIIT XUOS Lab
* @date 2021-04-24
*/

#include "plc_bus.h"
#include "plc_dev.h"

int PlcBusInit(struct PlcBus *plc_bus, const char *bus_name)
{
    NULL_PARAM_CHECK(plc_bus);
    NULL_PARAM_CHECK(bus_name);

    x_err_t ret = EOK;

    if (BUS_INSTALL != plc_bus->bus.bus_state) {
        strncpy(plc_bus->bus.bus_name, bus_name, NAME_NUM_MAX);

        plc_bus->bus.bus_type = TYPE_PLC_BUS;
        plc_bus->bus.bus_state = BUS_INSTALL;
        plc_bus->bus.private_data = plc_bus->private_data;

        ret = BusRegister(&plc_bus->bus);
        if (EOK != ret) {
            KPrintf("PlcBusInit BusRegister error %u\n", ret);
            return ret;
        }
    } else {
        KPrintf("PlcBusInit BusRegister bus has been register state%u\n", plc_bus->bus.bus_state);        
    }

    return ret;
}

int PlcDriverInit(struct PlcDriver *plc_driver, const char *driver_name)
{
    NULL_PARAM_CHECK(plc_driver);
    NULL_PARAM_CHECK(driver_name);

    x_err_t ret = EOK;

    if (DRV_INSTALL != plc_driver->driver.driver_state) {
        plc_driver->driver.driver_type = TYPE_PLC_DRV;
        plc_driver->driver.driver_state = DRV_INSTALL;

        strncpy(plc_driver->driver.drv_name, driver_name, NAME_NUM_MAX);

        plc_driver->driver.configure = plc_driver->configure;

        ret = PlcDriverRegister(&plc_driver->driver);
        if (EOK != ret) {
            KPrintf("PlcDriverInit DriverRegister error %u\n", ret);
            return ret;
        }
    } else {
        KPrintf("PlcDriverInit DriverRegister driver has been register state%u\n", plc_driver->driver.driver_state);
    }

    return ret;
}

int PlcReleaseBus(struct PlcBus *plc_bus)
{
    NULL_PARAM_CHECK(plc_bus);

    return BusRelease(&plc_bus->bus);
}

int PlcDriverAttachToBus(const char *drv_name, const char *bus_name)
{
    NULL_PARAM_CHECK(drv_name);
    NULL_PARAM_CHECK(bus_name);
    
    x_err_t ret = EOK;

    struct Bus *bus;
    struct Driver *driver;

    bus = BusFind(bus_name);
    if (NONE == bus) {
        KPrintf("PlcDriverAttachToBus find plc bus error!name %s\n", bus_name);
        return ERROR;
    }

    if (TYPE_PLC_BUS == bus->bus_type) {
        driver = PlcDriverFind(drv_name, TYPE_PLC_DRV);
        if (NONE == driver) {
            KPrintf("PlcDriverAttachToBus find plc driver error!name %s\n", drv_name);
            return ERROR;
        }

        if (TYPE_PLC_DRV == driver->driver_type) {
            ret = DriverRegisterToBus(bus, driver);
            if (EOK != ret) {
                KPrintf("PlcDriverAttachToBus DriverRegisterToBus error %u\n", ret);
                return ERROR;
            }
        }
    }

    return ret;
}
