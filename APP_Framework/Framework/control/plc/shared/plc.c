/*
* Copyright (c) 2021 AIIT XUOS Lab
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
 * @file plc.c
 * @brief plc relative activities
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.12.15
 */

//#include "open62541.h"
#include "plc.h"
#include "plc_bus.h"
#include "plc_dev.h"

#define PLC_BUS_NAME "plc bus"
#define PLC_DRV_NAME "plc driver"

struct PlcDevice plc_device;
struct PlcBus plc_bus;
struct PlcDriver plc_drv;


// open and connect PLC device
void plc_open(struct PlcDevice *pdev)
{

}

// close and disconnect PLC device
void plc_close(struct PlcDevice *pdev)
{
}

// read data from PLC
void plc_read(struct PlcDevice *pdev, void *buf, size_t len)
{
}

// write data from PLC
void plc_write(struct PlcDevice *pdev, const void *buf, size_t len)
{
}

// send control command to PLC
void plc_ioctl(struct PlcDevice *pdev, int cmd, void *arg)
{
}


void plc_init(struct PlcDevice *plc_dev)
{
    PlcBusInit(&plc_bus, PLC_BUS_NAME);
    PlcDriverInit(&plc_drv, PLC_DRV_NAME);
}

void test_plc_bus(int argc, char *argv[])
{
    plc_init(NULL);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     plc, test_plc_bus, test PLC);

