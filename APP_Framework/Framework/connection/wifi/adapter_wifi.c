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
 * @file adapter_wifiiiii.c
 * @brief Implement the connection wifi adapter function
 * @version 1.1
 * @author AIIT XUOS Lab
 * @date 2021.07.25
 */

#include <adapter.h>
#include <bus_pin.h>

#ifdef ADAPTER_HFA21
extern AdapterProductInfoType Hfa21Attach(struct Adapter *adapter);
#endif

#define ADAPTER_WIFI_NAME "wifi"

static int AdapterWifiRegister(struct Adapter *adapter)
{
    int ret = 0;

    strncpy(adapter->name, ADAPTER_WIFI_NAME, NAME_NUM_MAX);

    adapter->net_protocol = IP_PROTOCOL;
    adapter->adapter_status = UNREGISTERED;

    ret = AdapterDeviceRegister(adapter);
    if (ret < 0) {
        printf("AdapterWifi register error\n");
        return -1;
    }

    return ret;
}

int AdapterWifiInit(void)
{
    int ret = 0;

    struct Adapter *adapter = malloc(sizeof(struct Adapter));
    if (!adapter) {
        printf("AdapterWifiInit malloc error\n");
        free(adapter);
        return -1;
    }

    ret = AdapterWifiRegister(adapter);
    if (ret < 0) {
        printf("AdapterWifiInit register wifi adapter error\n");
        free(adapter);
        return -1;
    }

#ifdef ADAPTER_HFA21
    AdapterProductInfoType product_info = Hfa21Attach(adapter);
    if (!product_info) {
        printf("AdapterWifiInit hfa21 attach error\n");
        free(adapter);
        return -1;
    }

    adapter->product_info_flag = 1;
    adapter->info = product_info;
    adapter->done = product_info->model_done;

#endif

    return ret;
}

/******************wifi TEST*********************/
int AdapterWifiTest(void)
{
    char cmd[64];
    int baud_rate = BAUD_RATE_57600;

    struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_WIFI_NAME);


#ifdef ADAPTER_HFA21_DRIVER_EXT_PORT
    // static BusType ch438_pin;
    // ch438_pin = PinBusInitGet();
	// struct PinParam pin_cfg;	
	// int ret = 0;

	// struct BusConfigureInfo configure_info;
	// configure_info.configure_cmd = OPE_CFG;
	// configure_info.private_data = (void *)&pin_cfg;

    // pin_cfg.cmd = GPIO_CONFIG_MODE;
    // pin_cfg.pin = 22;
    // pin_cfg.mode = GPIO_CFG_OUTPUT;

	// ret = BusDrvConfigure(ch438_pin->owner_driver, &configure_info);

    // struct PinStat pin_stat;
	// struct BusBlockWriteParam write_param;
	// struct BusBlockReadParam read_param;
	// write_param.buffer = (void *)&pin_stat;
	
	// pin_stat.val = GPIO_HIGH;

    // pin_stat.pin = 22;
    // BusDevWriteData(ch438_pin->owner_haldev, &write_param);

    int pin_fd;
    pin_fd = PrivOpen("/dev/pin_dev", O_RDWR);

    struct PinParam pin_param;
    pin_param.cmd = GPIO_CONFIG_MODE;
    pin_param.mode = GPIO_CFG_OUTPUT;
    pin_param.pin = 22;

    struct PrivIoctlCfg ioctl_cfg;
    ioctl_cfg.ioctl_driver_type = PIN_TYPE;
    ioctl_cfg.args = &pin_param;
    PrivIoctl(pin_fd, OPE_CFG, &ioctl_cfg);

    struct PinStat pin_stat;
    pin_stat.pin = 52;
    pin_stat.val = GPIO_HIGH;
    PrivWrite(pin_fd, &pin_stat, 1);

    PrivClose(pin_fd);
#endif


    AdapterDeviceOpen(adapter);
    AdapterDeviceControl(adapter, OPE_INT, &baud_rate);

    AdapterDeviceSetUp(adapter);
    AdapterDeviceSetAddr(adapter, "192.168.66.253", "255.255.255.0", "192.168.66.1");
    AdapterDevicePing(adapter, "36.152.44.95");
    AdapterDeviceNetstat(adapter);

    const char *ip = "192.168.66.211";
    const char *port = "12345";
    enum NetRoleType net_role = CLIENT;
    enum IpType ip_type = IPV4;
    AdapterDeviceConnect(adapter, net_role, ip, port, ip_type);

    const char *wifi_msg = "LiuKai Test";
    int len = strlen(wifi_msg);
    for(int i = 0;i < 10; ++i) {
        AdapterDeviceSend(adapter, wifi_msg, len);
        PrivTaskDelay(4000);
    }

    char wifi_recv_msg[128];
    while (1) {
        AdapterDeviceRecv(adapter, wifi_recv_msg, 128);
    }
    
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0)|SHELL_CMD_DISABLE_RETURN, AdapterWifiTest, AdapterWifiTest, show adapter wifi information);




