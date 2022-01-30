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
* @file plc_dev.c
* @brief register plc dev function using bus driver framework
* @version 1.0
* @author AIIT XUOS Lab
* @date 2021-04-24
*/

#include "plc_bus.h"
#include "plc_dev.h"

static DoubleLinklistType plcdev_linklist;

/*Create the plc device linklist*/
static void PlcHardwareDevLinkInit()
{
    InitDoubleLinkList(&plcdev_linklist);
}

static uint32 PlcHardwareDevOpen(void *dev)
{
    NULL_PARAM_CHECK(dev);

    PlcHardwareDevConfigureCs(dev, 1, 0);

    return EOK;
}

static uint32 PlcHardwareDevClose(void *dev)
{
    NULL_PARAM_CHECK(dev);

    PlcHardwareDevConfigureCs(dev, 0, 1);

    return EOK;
}

static uint32 PlcHardwareDevWrite(void *dev, struct BusBlockWriteParam *write_param)
{
    NULL_PARAM_CHECK(dev);
    NULL_PARAM_CHECK(write_param);

    int ret;
    struct PlcHardwareDevice *plc_dev = (struct PlcHardwareDevice *)dev;
    struct PlcDataStandard *plc_msg;

    plc_msg = (struct PlcDataStandard *)x_malloc(sizeof(struct PlcDataStandard));
    if (NONE == plc_msg) {
        KPrintf("PlcHardwareDevWrite x_malloc msg error\n");
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

    ret = plc_dev->plc_dev_done->dev_write(plc_dev, plc_msg);
    x_free(plc_msg);

    return ret;
}

static uint32 PlcHardwareDevRead(void *dev, struct BusBlockReadParam *read_param)
{
    NULL_PARAM_CHECK(dev);
    NULL_PARAM_CHECK(read_param);

    int ret;
    struct PlcHardwareDevice *plc_dev = (struct PlcHardwareDevice *)dev;
    struct PlcDataStandard *plc_msg;

    plc_msg = (struct PlcDataStandard *)x_malloc(sizeof(struct PlcDataStandard));
    if (NONE == plc_msg) {
        KPrintf("PlcHardwareDevRead x_malloc msg error\n");
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

    ret = plc_dev->plc_dev_done->dev_read(plc_dev, plc_msg);
    x_free(plc_msg);

    return ret;
}

static const struct HalDevDone dev_done =
{
    .open = PlcHardwareDevOpen,
    .close = PlcHardwareDevClose,
    .write = PlcHardwareDevWrite,
    .read = PlcHardwareDevRead,
};

HardwareDevType PlcHardwareDevFind(const char *dev_name, enum DevType dev_type)
{
    NULL_PARAM_CHECK(dev_name);

    struct HardwareDev *device = NONE;

    DoubleLinklistType *node = NONE;
    DoubleLinklistType *head = &plcdev_linklist;

    for (node = head->node_next; node != head; node = node->node_next) {
        device = SYS_DOUBLE_LINKLIST_ENTRY(node, struct HardwareDev, dev_link);
        if ((!strcmp(device->dev_name, dev_name)) && (dev_type == device->dev_type)) {
            return device;
        }
    }

    KPrintf("PlcHardwareDevFind cannot find the %s device.return NULL\n", dev_name);
    return NONE;
}

int PlcHardwareDevRegister(struct PlcHardwareDevice *plc_device, void *plc_param, const char *device_name)
{
    NULL_PARAM_CHECK(plc_device);
    NULL_PARAM_CHECK(device_name);

    x_err_t ret = EOK;
    static x_bool dev_link_flag = RET_FALSE;

    if (!dev_link_flag) {
        PlcHardwareDevLinkInit();
        dev_link_flag = RET_TRUE;
    }

    if (DEV_INSTALL != plc_device->haldev.dev_state) {
        strncpy(plc_device->haldev.dev_name, device_name, NAME_NUM_MAX);
        plc_device->haldev.dev_type = TYPE_PLC_DEV;
        plc_device->haldev.dev_state = DEV_INSTALL;

        //only plc bus dev need to register dev_done
        if (RET_TRUE != plc_device->plc_dev_flag) {
            plc_device->haldev.dev_done = &dev_done;
        }

        plc_device->haldev.private_data = plc_param;

        DoubleLinkListInsertNodeAfter(&plcdev_linklist, &(plc_device->haldev.dev_link));
    } else {
        KPrintf("PlcHardwareDevRegister device has been register state%u\n", plc_device->haldev.dev_state);
    }

    return ret;
}

int PlcHardwareDevAttachToBus(const char *dev_name, const char *bus_name)
{
    NULL_PARAM_CHECK(dev_name);
    NULL_PARAM_CHECK(bus_name);

    x_err_t ret = EOK;

    struct Bus *bus;
    struct HardwareDev *device;

    bus = BusFind(bus_name);
    if (NONE == bus) {
        KPrintf("PlcHardwareDevAttachToBus find plc bus error!name %s\n", bus_name);
        return ERROR;
    }

    if (TYPE_PLC_BUS == bus->bus_type) {
        device = PlcHardwareDevFind(dev_name, TYPE_PLC_DEV);
        if (NONE == device) {
            KPrintf("PlcHardwareDevAttachToBus find plc device error!name %s\n", dev_name);
            return ERROR;
        }

        if (TYPE_PLC_DEV == device->dev_type) {
            ret = DeviceRegisterToBus(bus, device);
            if (EOK != ret) {
                KPrintf("PlcHardwareDevAttachToBus DeviceRegisterToBus error %u\n", ret);
                return ERROR;
            }
        }
    }

    return EOK;
}

int PlcHardwareDevConfigureCs(struct HardwareDev *dev, uint8 plc_chip_select, uint8 plc_cs_release)
{
    NULL_PARAM_CHECK(dev);

    int ret;
    struct PlcHardwareDevice *plc_dev = (struct PlcHardwareDevice *)dev;
    struct PlcDataStandard *msg;

    msg = (struct PlcDataStandard *)x_malloc(sizeof(struct PlcDataStandard));
    if (NONE == msg) {
        KPrintf("PlcHardwareDevConfigureCs x_malloc msg error\n");
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

    ret = plc_dev->plc_dev_done->dev_write(plc_dev, msg);

    x_free(msg);
    return ret;
}
