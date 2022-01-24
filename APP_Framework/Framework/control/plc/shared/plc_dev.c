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
* @file dev_plc.c
* @brief register plc dev function using bus driver framework
* @version 1.0
* @author AIIT XUOS Lab
* @date 2022-01-24
*/

#include "transform.h"
#include "plc.h"
#include "plc_bus.h"
#include "plc_dev.h"

static DoublelistType plcdev_linklist;

/*Create the plc device linklist*/
static void PlcDeviceLinkInit()
{
    AppInitDoubleList(&plcdev_linklist);
}

static uint32 PlcDeviceOpen(void *dev)
{
    NULL_PARAM_CHECK(dev);

    PlcDevConfigureCs(dev, 1, 0);

    return EOK;
}

static uint32 PlcDeviceClose(void *dev)
{
    NULL_PARAM_CHECK(dev);

    PlcDevConfigureCs(dev, 0, 1);

    return EOK;
}

static uint32 PlcDeviceWrite(void *dev, struct BusBlockWriteParam *write_param)
{
    NULL_PARAM_CHECK(dev);
    NULL_PARAM_CHECK(write_param);

    int ret;
    struct PlcDevice *plc_dev = (struct PlcDevice *)dev;
    struct PlcDataStandard *plc_msg;

    plc_msg = (struct PlcDataStandard *)x_malloc(sizeof(struct PlcDataStandard));
    if (NONE == plc_msg) {
        KPrintf("PlcDeviceWrite x_malloc msg error\n");
        x_free(plc_msg);
        return ERROR;
    }

    //memset(plc_msg, 0, sizeof(struct PlcDataStandard));

    plc_msg->tx_buff = (uint8 *)write_param->buffer;
    plc_msg->rx_buff = NONE;
    plc_msg->length = write_param->size;
    plc_msg->plc_chip_select = 0;
    plc_msg->plc_cs_release = 0;
    plc_msg->next = NONE;

    ret = plc_dev->ops.write(plc_dev, plc_msg, plc_msg->length);
    x_free(plc_msg);

    return ret;
}

static uint32 PlcDeviceRead(void *dev, struct BusBlockReadParam *read_param)
{
    NULL_PARAM_CHECK(dev);
    NULL_PARAM_CHECK(read_param);

    int ret;
    struct PlcDevice *plc_dev = (struct PlcDevice *)dev;
    struct PlcDataStandard *plc_msg;

    plc_msg = (struct PlcDataStandard *)x_malloc(sizeof(struct PlcDataStandard));
    if (NONE == plc_msg) {
        KPrintf("PlcDeviceRead x_malloc msg error\n");
        x_free(plc_msg);
        return ERROR;
    }

    //memset(plc_msg, 0, sizeof(struct PlcDataStandard));

    plc_msg->tx_buff = NONE;
    plc_msg->rx_buff = (uint8 *)read_param->buffer;
    plc_msg->length = read_param->size;
    plc_msg->plc_chip_select = 0;
    plc_msg->plc_cs_release = 0;
    plc_msg->next = NONE;

    ret = plc_dev->ops.read(plc_dev, plc_msg, plc_msg->length);
    x_free(plc_msg);

    return ret;
}

static const struct HalDevDone dev_done =
{
    .open = PlcDeviceOpen,
    .close = PlcDeviceClose,
    .write = PlcDeviceWrite,
    .read = PlcDeviceRead,
};

struct PlcDevice *PlcDeviceFind(const char *dev_name, enum PlcCtlType ctl_type)
{
    NULL_PARAM_CHECK(dev_name);

    struct PlcDevice *plc_dev = NONE;

    DoublelistType *node = NONE;
    DoublelistType *head = &plcdev_linklist;

    for (node = head->node_next; node != head; node = node->node_next) {
        plc_dev = SYS_DOUBLE_LINKLIST_ENTRY(node, struct PlcDevice, link);
        if ((!strcmp(plc_dev->name, dev_name)) && (ctl_type == plc_dev->type)) {
            return plc_dev;
        }
    }

    KPrintf("PlcDeviceFind cannot find the %s device.return NULL\n", dev_name);
    return NONE;
}

int PlcDeviceRegister(struct PlcDevice *plc_device, void *plc_param, const char *device_name)
{
    NULL_PARAM_CHECK(plc_device);
    NULL_PARAM_CHECK(device_name);

    x_err_t ret = EOK;
    static x_bool dev_link_flag = RET_FALSE;

    if (!dev_link_flag) {
        PlcDeviceLinkInit();
        dev_link_flag = RET_TRUE;
    }

    if ("" != plc_device->name) {
        strncpy(plc_device->name, device_name, PLC_NAME_SIZE);
//        plc_device->haldev.dev_type = TYPE_SPI_DEV;
//        plc_device->haldev.dev_state = DEV_INSTALL;
//
//        //only plc bus dev need to register dev_done
//        if (RET_TRUE != plc_device->plc_dev_flag) {
//            plc_device->haldev.dev_done = &dev_done;
//        }
//
//        plc_device->haldev.private_data = plc_param;

        AppDoubleListInsertNodeAfter(&plcdev_linklist, &(plc_device->link));
    } else {
//        KPrintf("PlcDeviceRegister device has been register state%u\n", plc_device->haldev.dev_state);
    }

    return ret;
}

int PlcDeviceAttachToBus(const char *dev_name, const char *bus_name)
{
    NULL_PARAM_CHECK(dev_name);
    NULL_PARAM_CHECK(bus_name);

    x_err_t ret = EOK;

    struct Bus *bus;
    struct PlcDevice *device;
    struct HardwareDev *hard_dev;

    bus = BusFind(bus_name);
    if (NONE == bus) {
        KPrintf("PlcDeviceAttachToBus find plc bus error!name %s\n", bus_name);
        return ERROR;
    }

//    if (TYPE_PLC_BUS == bus->bus_type) {
        device = PlcDeviceFind(dev_name, PLC_ABILITY_HSC);
        if (NONE == device) {
            KPrintf("PlcDeviceAttachToBus find plc device error!name %s\n", dev_name);
            return ERROR;
        }

        if (PLC_ABILITY_HSC == device->type) {
            ret = DeviceRegisterToBus(bus, hard_dev);
            if (EOK != ret) {
                KPrintf("PlcDeviceAttachToBus DeviceRegisterToBus error %u\n", ret);
                return ERROR;
            }
        }
//    }

    return EOK;
}

int PlcDevConfigureCs(struct PlcDevice *dev, uint8 plc_chip_select, uint8 plc_cs_release)
{
    NULL_PARAM_CHECK(dev);

    int ret;
    struct PlcDevice *plc_dev = (struct PlcDevice *)dev;
    struct PlcDataStandard *msg;

    msg = (struct PlcDataStandard *)x_malloc(sizeof(struct PlcDataStandard));
    if (NONE == msg) {
        KPrintf("PlcDevConfigureCs x_malloc msg error\n");
        x_free(msg);
        return ERROR;
    }

    //memset(msg, 0, sizeof(struct PlcDataStandard));
    msg->length = 0;
    msg->rx_buff = NONE;
    msg->tx_buff = NONE;
    msg->next = NONE;
    msg->plc_chip_select = plc_chip_select;
    msg->plc_cs_release = plc_cs_release;

    ret = plc_dev->ops.write(plc_dev, msg, msg->length);

    x_free(msg);
    return ret;
}

