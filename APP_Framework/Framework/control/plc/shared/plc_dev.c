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

#include "ua_api.h"
#include "plc_bus.h"
#include "plc_dev.h"

static DoubleLinklistType plcdev_list;

/******************************************************************************/

/*Create the plc device linklist*/
static void PlcDeviceLinkInit()
{
    InitDoubleLinkList(&plcdev_list);
}

static int PlcDeviceOpen(void *dev)
{
    NULL_PARAM_CHECK(dev);

    struct PlcDevice *plc_dev = (struct PlcDevice *)dev;

    if(plc_dev->net == PLC_IND_ENET_OPCUA)
    {
        return ua_open(plc_dev->priv_data);
    }

    return EOK;
}

static void PlcDeviceClose(void *dev)
{
    NULL_PARAM_CHECK(dev);

    struct PlcDevice *plc_dev = (struct PlcDevice *)dev;

    if(plc_dev->net == PLC_IND_ENET_OPCUA)
    {
        ua_close(plc_dev->priv_data);
    }
}

static int PlcDeviceWrite(void *dev, const void *buf, size_t len)
{
    NULL_PARAM_CHECK(dev);
    NULL_PARAM_CHECK(buf);

    int ret;
    struct PlcDevice *plc_dev = (struct PlcDevice *)dev;

    if(plc_dev->net == PLC_IND_ENET_OPCUA)
    {
        ret = ua_write(plc_dev->priv_data, buf, len);
    }

    return ret;
}

static int PlcDeviceRead(void *dev, void *buf, size_t len)
{
    NULL_PARAM_CHECK(dev);
    NULL_PARAM_CHECK(buf);

    int ret;
    struct PlcDevice *plc_dev = (struct PlcDevice *)dev;

    if(plc_dev->net == PLC_IND_ENET_OPCUA)
    {
        ret = ua_read(plc_dev->priv_data, buf, len);
    }

    return ret;
}

static struct PlcOps plc_done =
{
    .open = PlcDeviceOpen,
    .close = PlcDeviceClose,
    .write = PlcDeviceWrite,
    .read = PlcDeviceRead,
};

/* find PLC device with device name */
struct HardwareDev *PlcDevFind(const char *dev_name)
{
    NULL_PARAM_CHECK(dev_name);

    struct PlcDevice *device = NONE;
    struct HardwareDev *haldev = NONE;

    DoubleLinklistType *node = NONE;
    DoubleLinklistType *head = &plcdev_list;

    for (node = head->node_next; node != head; node = node->node_next) {
        device = SYS_DOUBLE_LINKLIST_ENTRY(node, struct PlcDevice, link);
        if (!strcmp(device->name, dev_name)) {
            haldev = &device->haldev;
            return haldev;
        }
    }

    plc_print("plc: [%s] cannot find the %s device\n", __func__, dev_name);
    return NONE;
}

int PlcDevRegister(struct PlcDevice *plc_device, void *plc_param, const char *device_name)
{
    NULL_PARAM_CHECK(plc_device);
    NULL_PARAM_CHECK(device_name);

    x_err_t ret = EOK;
    static x_bool dev_link_flag = RET_FALSE;

    if (!dev_link_flag) {
        PlcDeviceLinkInit();
        dev_link_flag = RET_TRUE;
    }

    if (DEV_INSTALL != plc_device->state) {
        strncpy(plc_device->haldev.dev_name, device_name, NAME_NUM_MAX);
        plc_device->haldev.dev_type = TYPE_PLC_DEV;
        plc_device->haldev.dev_state = DEV_INSTALL;

        strncpy(plc_device->name, device_name, strlen(device_name));
        plc_device->ops = &plc_done;

        DoubleLinkListInsertNodeAfter(&plcdev_list, &(plc_device->link));
        plc_device->state = DEV_INSTALL;
    } else {
        KPrintf("PlcDevRegister device has been register state%u\n", plc_device->type);
    }

    return ret;
}

int PlcDeviceAttachToBus(const char *dev_name, const char *bus_name)
{
    NULL_PARAM_CHECK(dev_name);
    NULL_PARAM_CHECK(bus_name);

    x_err_t ret = EOK;

    struct Bus *bus;
    struct HardwareDev *device;

    bus = BusFind(bus_name);
    if (NONE == bus) {
        KPrintf("PlcDeviceAttachToBus find plc bus error!name %s\n", bus_name);
        return ERROR;
    }

    if (TYPE_PLC_BUS == bus->bus_type) {
        device = PlcDevFind(dev_name);
        if (NONE == device) {
            KPrintf("PlcDeviceAttachToBus find plc device error!name %s\n", dev_name);
            return ERROR;
        }

        if (TYPE_PLC_DEV == device->dev_type) {
            ret = DeviceRegisterToBus(bus, device);
            if (EOK != ret) {
                KPrintf("PlcDeviceAttachToBus DeviceRegisterToBus error %u\n", ret);
                return ERROR;
            }
        }
    }

    return EOK;
}

