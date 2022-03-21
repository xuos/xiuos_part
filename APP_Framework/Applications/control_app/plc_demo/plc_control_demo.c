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
 * @file plc_control_demo.c
 * @brief Demo for PLC control
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022.2.22
 */

#include "transform.h"
#include "open62541.h"
#include "ua_api.h"
#include "sys_arch.h"
#include "plc_demo.h"

#define PLC_NS_FORMAT "n%d,%s"

struct PlcChannel plc_demo_ch;
struct PlcDriver plc_demo_drv;
struct PlcDevice plc_demo_dev;

PlcCtrlParamType plc_ctrl_param;

UA_NodeId test_nodeid = {4, UA_NODEIDTYPE_NUMERIC, 5};

/******************************************************************************/

void PlcDemoChannelDrvInit(void)
{
    static uint8_t init_flag = 0;
    if(init_flag)
        return;
    init_flag = 1;

    lwip_config_tcp(lwip_ipaddr, lwip_netmask, test_ua_ip);
    PlcChannelInit(&plc_demo_ch, PLC_CH_NAME);
    if(PlcDriverInit(&plc_demo_drv, PLC_DRV_NAME) == EOK)
    {
        PlcDriverAttachToChannel(PLC_DRV_NAME, PLC_CH_NAME);
    }
    memset(&plc_demo_dev, 0, sizeof(plc_demo_dev));
}

static void PlcCtrlDemoInit(void)
{
    static uint8_t init_flag = 0;

    PlcDemoChannelDrvInit();
    // register plc device
    plc_demo_dev.state = CHDEV_INIT;
    strcpy(plc_demo_dev.name, "UA Demo");
    plc_demo_dev.info.product = "CPU 1215C";
    plc_demo_dev.info.vendor = "SIEMENS";
    plc_demo_dev.info.model = "S7-1200";
    plc_demo_dev.info.id = 123;
    plc_demo_dev.net = PLC_IND_ENET_OPCUA;

    // register UA parameter
    if(!plc_demo_dev.priv_data)
    {
        plc_demo_dev.priv_data = (UaParamType*)malloc(sizeof(UaParamType));
    }
    UaParamType* ua_ptr = plc_demo_dev.priv_data;
    memset(ua_ptr, 0, sizeof(UaParamType));
    strcpy(ua_ptr->ua_remote_ip, opc_server_url);
    ua_ptr->act = UA_ACT_ATTR;
    memcpy(&ua_ptr->ua_id, &test_nodeid, sizeof(test_nodeid));

    if(init_flag)
        return;
    init_flag = 1;

    if(PlcDevRegister(&plc_demo_dev, NULL, plc_demo_dev.name) != EOK)
    {
        return;
    }
    PlcDeviceAttachToChannel(plc_demo_dev.name, PLC_CH_NAME);
}

void PlcReadUATask(void* arg)
{
    int ret = 0;
    struct PlcOps* ops = NULL;
    char buf[PLC_BUF_SIZE];
    memset(buf, 0, sizeof(buf));
    PlcCtrlDemoInit();
    ops = plc_demo_dev.ops;
    ret = ops->open(&plc_demo_dev);

    if(EOK != ret)
    {
        plc_print("plc: [%s] open failed %#x\n", __func__, ret);
        return;
    }

    ret = ops->read(&plc_demo_dev, buf, PLC_BUF_SIZE);

    if(EOK != ret)
    {
        plc_print("plc: [%s] read failed %x\n", __func__, ret);
    }

    ops->close(&plc_demo_dev);
}

void PlcReadTest(int argc, char* argv[])
{
    static char node_str[UA_NODE_LEN];
    memset(node_str, 0, sizeof(node_str));

    if(argc > 1)
    {
        plc_print("plc: arg %s\n", argv[1]);

        if(sscanf(argv[1], PLC_NS_FORMAT, &test_nodeid.namespaceIndex, node_str) != EOF)
        {
            if(isdigit(node_str[0]))
            {
                test_nodeid.identifierType = UA_NODEIDTYPE_NUMERIC;
                test_nodeid.identifier.numeric = atoi(node_str);
                plc_print("ns %d num %d\n", test_nodeid.namespaceIndex, test_nodeid.identifier.numeric);
            }
            else
            {
                test_nodeid.identifierType = UA_NODEIDTYPE_STRING;
                test_nodeid.identifier.string.length = strlen(node_str);
                test_nodeid.identifier.string.data = node_str;
                plc_print("ns %d str %s\n", test_nodeid.namespaceIndex, test_nodeid.identifier.string.data);
            }
        }
    }

    sys_thread_new("plc read", PlcReadUATask, NULL, PLC_STACK_SIZE, PLC_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
                 PlcRead, PlcReadTest, Read PLC);

void PlcWriteUATask(void* arg)
{
    int ret = 0;
    struct PlcOps* ops = NULL;
    char buf[PLC_BUF_SIZE];
    memset(buf, 0, sizeof(buf));

    PlcCtrlDemoInit();
    ops = plc_demo_dev.ops;
    ret = ops->open(&plc_demo_dev);

    if(EOK != ret)
    {
        plc_print("plc: [%s] open failed %#x\n", __func__, ret);
        return;
    }

    ret = ops->write(&plc_demo_dev, arg, PLC_BUF_SIZE);

    if(EOK != ret)
    {
        plc_print("plc: [%s] read failed\n", __func__);
    }

    ops->close(&plc_demo_dev);
}

void PlcWriteTest(int argc, char* argv[])
{
    static char node_str[UA_NODE_LEN];
    static char val_param[UA_NODE_LEN];
    memset(node_str, 0, sizeof(node_str));
    memset(val_param, 0, sizeof(val_param));

    if(argc > 1)
    {
        plc_print("plc: arg %s\n", argv[1]);

        if(sscanf(argv[1], PLC_NS_FORMAT, &test_nodeid.namespaceIndex, node_str) != EOF)
        {
            if(isdigit(node_str[0]))
            {
                test_nodeid.identifierType = UA_NODEIDTYPE_NUMERIC;
                test_nodeid.identifier.numeric = atoi(node_str);
                plc_print("ns %d num %d\n", test_nodeid.namespaceIndex, test_nodeid.identifier.numeric);
            }
            else
            {
                test_nodeid.identifierType = UA_NODEIDTYPE_STRING;
                test_nodeid.identifier.string.length = strlen(node_str);
                test_nodeid.identifier.string.data = node_str;
                plc_print("ns %d str %s\n", test_nodeid.namespaceIndex, test_nodeid.identifier.string.data);
            }
        }

        if(argc > 2)
        {
            strcpy(val_param, argv[2]);
            plc_print("write value %s\n", val_param);
        }
    }

    sys_thread_new("plc write", PlcWriteUATask, val_param, PLC_STACK_SIZE, PLC_TASK_PRIO);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
                 PlcWrite, PlcWriteTest, Read PLC);

