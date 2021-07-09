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
 * @file adapter.h
 * @brief Structure and function declarations of the connection adapter framework
 * @version 1.1
 * @author AIIT XUOS Lab
 * @date 2021.05.10
 */

#ifndef ADAPTER_H
#define ADAPTER_H

#include <list.h>
#include <transform.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <sys/types.h>

#ifdef __cplusplus
extern "C" {
#endif

#define ADAPTER_BUFFSIZE 64

#define ADAPTER_AT_OPERATION    1
#define ADAPTER_LWIP_OPERATION    2
#define ADAPTER_RAWIP_OPERATION    3

#define ADAPTER_LORA_FUNC       ((uint32_t)(1 << ATAPTER_LORA))
#define ADAPTER_4G_FUNC         ((uint32_t)(1 << ADAPTER_4G))
#define ADAPTER_NBIOT_FUNC      ((uint32_t)(1 << ADAPTER_NBIOT))
#define ADAPTER_WIFI_FUNC       ((uint32_t)(1 << ADAPTER_WIFI))
#define ADAPTER_ETHERNET_FUNC   ((uint32_t)(1 << ADAPTER_ETHERNET))
#define ADAPTER_BLUETOOTH_FUNC  ((uint32_t)(1 << ADAPTER_BLUETOOTH))
#define ADAPTER_ZIGBEE_FUNC     ((uint32_t)(1 << ADAPTER_ZIGBEE))
#define ADAPTER_5G_FUNC         ((uint32_t)(1 << ADAPTER_5G))

#ifdef CONNECTION_FRAMEWORK_DEBUG
#define ADAPTER_DEBUG printf
#else
#define ADAPTER_DEBUF
#endif

struct Adapter;
struct AdapterProductInfo;
typedef struct Adapter *AdapterType;
typedef struct AdapterProductInfo *AdapterProductInfoType;

struct Socket
{
    int id;
    struct Adapter *adapter;
};

enum AdapterType
{
    ADAPTER_TYPE_LORA = 0,
    ADAPTER_TYPE_4G ,
    ADAPTER_TYPE_NBIOT ,
    ADAPTER_TYPE_WIFI ,
    ADAPTER_TYPE_ETHERNET ,
    ADAPTER_TYPE_BLUETOOTH ,
    ADAPTER_TYPE_ZIGBEE ,
    ADAPTER_TYPE_5G ,
};

enum NetProtocolType
{
    PRIVATE_PROTOCOL = 1,
    IP_PROTOCOL,
    PROTOCOL_NONE,
};

enum NetRoleType
{
    CLIENT = 1, 
    SERVER,
    ROLE_NONE,
};

enum AdapterStatus
{
    REGISTERED = 1,
    UNREGISTERED,
    INSTALL,
    UNINSTALL,
};

enum IpType
{
    IPV4 = 1,
    IPV6,
};

struct AdapterProductInfo
{
    uint32_t functions;
    const char *vendor_name;
    const char *model_name;

    void *model_done;
};

struct IpProtocolDone
{
    int (*open)(struct Adapter *adapter);
    int (*close)(struct Adapter *adapter);
    int (*ioctl)(struct Adapter *adapter, int cmd, void *args);
    int (*connect)(struct Adapter *adapter, const char *ip, const char *port, enum IpType ip_type);
    int (*send)(struct Adapter *adapter, const void *buf, size_t len);
    int (*recv)(struct Adapter *adapter, void *buf, size_t len);
    int (*disconnect)(struct Adapter *adapter);
};

struct PrivProtocolDone
{
    int (*open)(struct Adapter *adapter);
    int (*close)(struct Adapter *adapter);
    int (*ioctl)(struct Adapter *adapter, int cmd, void *args);
    int (*join)(struct Adapter *adapter, const char *priv_net_group);
    int (*send)(struct Adapter *adapter, const void *buf, size_t len);
    int (*recv)(struct Adapter *adapter, void *buf, size_t len);
    int (*quit)(struct Adapter *adapter);
};

struct Adapter
{
    char *name;
    int fd;

    int product_info_flag;
    struct AdapterProductInfo *info;

    //struct Socket *socket;

    enum NetProtocolType net_protocol;
    enum NetRoleType net_role;
    enum AdapterStatus adapter_status;

    char buffer[ADAPTER_BUFFSIZE];
    
    void *done;

    struct DoublelistNode link;
};

/*Init adapter framework*/
int AdapterFrameworkInit(void);

/*Find adapter device by name*/
AdapterType AdapterDeviceFindByName(const char *name);

/*Register the adapter to the linked list*/
int AdapterDeviceRegister(struct Adapter *adapter);

/*Unregister the adapter from the linked list*/
int AdapterDeviceUnregister(struct Adapter *adapter);

/*Open adapter device*/
int AdapterDeviceOpen(const char *name);

/*Close adapter device*/
int AdapterDeviceClose(struct Adapter *adapter);

/*Receice data from adapter*/
ssize_t AdapterDeviceRecv(struct Adapter *adapter, void *dst, size_t len);

/*Send data to adapter*/
ssize_t AdapterDeviceSend(struct Adapter *adapter, const void *src, size_t len);

/*Configure adapter device*/
int AdapterDeviceControl(struct Adapter *adapter, int cmd, void *args);

/*Connect to a certain ip net, only support IP_PROTOCOL*/
int AdapterDeviceConnect(struct Adapter *adapter, const char *ip, const char *port, enum IpType ip_type);

/*Join to a certain private net, only support PRIVATE_PROTOCOL*/
int AdapterDeviceJoin(struct Adapter *adapter, const char *priv_net_group);

/*Adapter disconnect from ip net or private net group*/
int AdapterDeviceDisconnect(struct Adapter *adapter);

#ifdef __cplusplus
}
#endif

#endif