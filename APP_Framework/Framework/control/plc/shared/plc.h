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
 * @file plc.h
 * @brief plc relative definition and structure
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.12.15
 */

#include "xs_klist.h"

#define IP_ADDR_SIZE 32
#define PLC_NAME_SIZE 32

// PLC device information
struct PlcInfo {
    uint32_t ability;      // PLC ability
    uint32_t id;           // PLC Device ID
    uint32_t soft_version; // software version
    uint32_t hard_version; // hardware version
    uint32_t date;         // manufact date
    const char *vendor;    // vendor
    const char *model;     // product model
};

enum PlcSerialType {
    PLC_SERIAL_232,
    PLC_SERIAL_485,
    PLC_SERIAL_CAN
};

union PlcCfg {
    struct {
        char ip_addr[IP_ADDR_SIZE];
        uint32_t ip_port;
    } PlcIpCfg;
    struct {
        enum PlcSerialType serial_type;
        char station_id;
        char serial_port;
    } PlcSerialCfg;
};

struct PlcDevice;

// operation API
struct PlcOps {
   int (*open)(struct PlcDevice *pdev); // open and connect PLC device
   void (*close)(struct PlcDevice*pdev); // close and disconnect PLC device
   int (*read)(struct PlcDevice* pdev, void *buf, size_t len); // read data from PLC
   int (*write)(struct PlcDevice* pdev, const void *buf, size_t len); // write data from PLC
   int (*ioctl)(struct PlcDevice* pdev, int cmd, void *arg); // send control command to PLC
};

enum PlcCtlType {
    PLC_CTRL_TYPE_HSC,
    PLC_CTRL_TYPE_PID,
    PLC_CTRL_TYPE_PHASING
};


#define PLC_ABILITY_HSC     ((uint32_t)(1 << PLC_CTRL_TYPE_HSC))
#define PLC_ABILITY_PID     ((uint32_t)(1 << PLC_CTRL_TYPE_PID))
#define PLC_ABILITY_PHASING ((uint32_t)(1 << PLC_CTRL_TYPE_PHASING))


enum PlcIndHybridNet
{
    //PLC Field Bus
    PLC_IND_FIELD_MODBUS_485,
    PLC_IND_FIELD_PROFIBUS,
    PLC_IND_FIELD_CANOPEN,
    PLC_IND_FIELD_DEVICENET,
    PLC_IND_FIELD_CONTROLNET,

    // PLC ETHERNET
    PLC_IND_ENET_ETHERNET_IP,
    PLC_IND_ENET_PROFINET,
    PLC_IND_ENET_ETHERCAT,
    PLC_IND_ENET_SERCOS,
    PLC_IND_ENET_OPCUA,

    //PLC wireless net
    PLC_IND_WIRELESS
};

enum PlcTransType
{
    PLC_TRANS_TCP,
    PLC_TRANS_UDP,
    PLC_TRANS_SERIAL
};

//communication interface
struct PlcInterface
{
    enum PlcIndHybridNet net;
    enum PlcTransType trans;
    char ip_addr[IP_ADDR_SIZE];
    char attrib;
};

// identify PLC device
struct PlcDevice {
    const char name[PLC_NAME_SIZE]; /* name of the  device */
    enum PlcCtlType type; /* PLC Control Type */
    struct PlcInfo info;/* Plc info, such as vendor name and model name */
    union PlcCfg cfg;
    struct PlcOps ops; /* filesystem-like APIs for data transferring */
    struct PlcInterface interface; /* protocols used for transferring data from program to plc */
    DoubleLinklistType link;/* link list node */
};

