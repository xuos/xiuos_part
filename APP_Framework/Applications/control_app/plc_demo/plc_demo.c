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
 * @file ua_demo.c
 * @brief Demo for OpcUa function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.11.11
 */

#include "open62541.h"
#include "ua_api.h"
#include "sys_arch.h"
#include "plc_bus.h"
#include "plc_dev.h"

#define PLC_BUS_NAME "PLC"
#define PLC_DRV_NAME "OPCUA"
#define PLC_DEV_NAME "PLC_1"

#define PLC_BUF_LEN 1000

#define PLC_STACK_SIZE  4096
#define PLC_TASK_PRIO   15

struct PlcBus plc_demo_bus;
struct PlcDriver plc_demo_drv;
struct PlcDevice plc_demo_dev;

char plc_demo_ip[] = {192, 168, 250, 5};

/******************************************************************************/

void PlcTestInit(void)
{
    lwip_config_tcp(lwip_ipaddr, lwip_netmask, plc_demo_ip);

    PlcBusInit(&plc_demo_bus, PLC_BUS_NAME);
    PlcDriverInit(&plc_demo_drv, PLC_DRV_NAME);
    PlcDriverAttachToBus(PLC_DRV_NAME, PLC_BUS_NAME);

    // register plc device
    plc_demo_dev.state = DEV_INIT;
    PlcDevRegister(&plc_demo_dev, NULL, PLC_DEV_NAME);

    PlcDeviceAttachToBus(PLC_DEV_NAME, PLC_BUS_NAME);
}

void PlcReadUATask(void *arg)
{
    int ret = 0;
    struct PlcOps *ops = NULL;
    char buf[PLC_BUF_LEN];

    plc_demo_dev.priv_data = (ua_dev_t *)malloc(sizeof(ua_dev_t));
    ua_dev_t *ua_ptr = plc_demo_dev.priv_data;
    memset(ua_ptr, 0, sizeof(ua_dev_t));
    strcpy(ua_ptr->ua_remote_ip, OPC_SERVER);

    PlcTestInit();
    plc_demo_dev.net = PLC_IND_ENET_OPCUA;
    ops = plc_demo_dev.ops;
    ret = ops->open(&plc_demo_dev);
    if(EOK != ret)
    {
        plc_print("plc: [%s] open failed %#x\n", __func__, ret);
        free(plc_demo_dev.priv_data);
        return;
    }
    ret = ops->read(&plc_demo_dev, buf, PLC_BUF_LEN);
    if(EOK != ret)
    {
        plc_print("plc: [%s] read failed\n", __func__);
        free(plc_demo_dev.priv_data);
        return;
    }
    free(plc_demo_dev.priv_data);
    ops->close(&plc_demo_dev);
}

void PlcReadTest(int argc, char *argv[])
{
    sys_thread_new("plc read", PlcReadUATask, NULL, PLC_STACK_SIZE, PLC_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     plc, PlcReadTest, test PLC);

