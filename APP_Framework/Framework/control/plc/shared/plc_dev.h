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
* @file dev_plc.h
* @brief define plc dev function using bus driver framework
* @version 1.0
* @author AIIT XUOS Lab
* @date 2022-01-24
*/

#ifndef DEV_PLC_H
#define DEV_PLC_H

#include <bus.h>

#ifdef __cpluspluss
extern "C" {
#endif

#define PLC_MAX_CLOCK       40000000
#define plc_device_max_num  4

#define PLC_LINE_CPHA      (1 << 0)
#define PLC_LINE_CPOL      (1 << 1)

#define PLC_LSB            (0 << 2)
#define PLC_MSB            (1 << 2)

#define PLC_MASTER         (0 << 3)
#define DEV_PLC_SLAVE      (1 << 3)

#define PLC_MODE_0         (0 | 0)
#define PLC_MODE_1         (0 | PLC_LINE_CPHA)
#define PLC_MODE_2         (PLC_LINE_CPOL | 0)
#define PLC_MODE_3         (PLC_LINE_CPOL | PLC_LINE_CPHA)
#define PLC_MODE_MASK      (PLC_LINE_CPHA | PLC_LINE_CPOL | PLC_MSB)

#define PLC_CS_HIGH        (1 << 4)
#define PLC_NO_CS          (1 << 5)
#define PLC_3WIRE          (1 << 6)
#define PLC_READY          (1 << 7)

struct PlcDataStandard
{
    uint8 plc_chip_select;
    uint8 plc_cs_release;

    const uint8 *tx_buff;
    uint32 tx_len;

    uint8 *rx_buff;
    uint32 rx_len;

    uint32 length;
    struct PlcDataStandard *next;
};

struct PlcMasterParam
{
    uint8 plc_work_mode;//CPOL CPHA
    uint8 plc_frame_format;//frame format
    uint8 plc_data_bit_width;//bit width
    uint8 plc_data_endian;//little endian: big endian
    uint32 plc_maxfrequency;//work frequency
};

struct PlcDmaParam
{
    uint8 plc_master_id;
    uint8 plc_dmac_txchannel;
    uint8 plc_dmac_rxchannel;
};

struct PlcSlaveParam
{
    uint8 plc_slave_id;
    uint8 plc_cs_gpio_pin;
    uint8 plc_cs_select_id;
};

typedef struct
{
    struct PlcDmaParam *plc_dma_param;

    struct PlcSlaveParam *plc_slave_param;

    struct PlcMasterParam *plc_master_param;

}PlcDeviceParam;

struct PlcDevice;

struct PlcDevDone
{
    uint32 (*dev_open) (struct PlcDevice *dev);
    uint32 (*dev_close) (struct PlcDevice *dev);
    uint32 (*dev_write) (struct PlcDevice *dev, struct PlcDataStandard *msg);
    uint32 (*dev_read) (struct PlcDevice *dev, struct PlcDataStandard *msg);
};

struct PlcHardwareDevice
{
    struct HardwareDev haldev;
    PlcDeviceParam plc_param;

    x_bool plc_dev_flag;

    const struct PlcDevDone *plc_dev_done;

    void *private_data;
};

/*Register the plc device*/
int PlcDeviceRegister(struct PlcDevice *plc_device, void *plc_param, const char *device_name);

/*Register the plc device to the plc bus*/
int PlcDeviceAttachToBus(const char *dev_name, const char *bus_name);

/*Find the register plc device*/
struct PlcDevice *PlcDeviceFind(const char *dev_name, enum PlcCtlType dev_type);

/*Configure the cs pin of plc dev*/
int PlcDevConfigureCs(struct PlcDevice *dev, uint8 plc_chip_select, uint8 plc_cs_release);


#ifdef __cplusplus
}
#endif

#endif
