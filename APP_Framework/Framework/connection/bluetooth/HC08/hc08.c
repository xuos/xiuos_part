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
 * @file hc08.c
 * @brief Implement the connection Bluetooth adapter function, using HC08 device
 * @version 1.1
 * @author AIIT XUOS Lab
 * @date 2021.07.12
 */

#include <adapter.h>
#include <at_agent.h>

static int rx_sem;
static sem_t *hc08_sem;
static pthread_t hc08_recv_thread;

void Hc08RecvThreadEntry(void *parameter)
{

    while (1)
    {
        PrivRead(adapter->fd, buf, len);

        UserSemaphoreAbandon(rx_sem);
        
    }
}

static int Hc08Open(struct Adapter *adapter)
{   
    if (INSTALL == adapter->adapter_status) {
        printf("Hc08 has already been open\n");
        return 0;
    }
    
    /*step1: open hc08 serial port*/
    adapter->fd = PrivOpen(ADAPTER_HC08_DRIVER, O_RDWR);
    if (adapter->fd < 0) {
        printf("Hc08Open get serial %s fd error\n", ADAPTER_HC08_DRIVER);
        return -1;
    }

    /*step2: init AT agent*/
    if (!adapter->agent) {
        char *agent_name = "bluetooth_uart_client";
        if (EOK != InitATAgent(agent_name, adapter->fd, 512)) {
            printf("at agent init failed !\n");
            return -1;
        }
        ATAgentType at_agent = GetATAgent(agent_name);

        adapter->agent = at_agent;
    }

    /*step3: create bluetooth receive task*/
    PrivSemaphoreCreate(hc08_sem, 0, rx_sem);

    PrivTaskCreate(&hc08_recv_thread, NULL, Hc08RecvThreadEntry, NULL);

    ADAPTER_DEBUG("Hc08 open done\n");
}

static int Hc08Close(struct Adapter *adapter)
{
    return 0;
}

static int Hc08Ioctl(struct Adapter *adapter, int cmd, void *args)
{
    if (OPE_INT != cmd) {
        printf("Hc08Ioctl only support OPE_INT, do not support %d\n", cmd);
        return -1;
    }

    uint32_t baud_rate = *((uint32_t *)args);

    struct SerialDataCfg serial_cfg;
    memset(&serial_cfg, 0 ,sizeof(struct SerialDataCfg));
    serial_cfg.serial_baud_rate = baud_rate;
    serial_cfg.serial_data_bits = DATA_BITS_8;
    serial_cfg.serial_stop_bits = STOP_BITS_1;
    serial_cfg.serial_buffer_size = SERIAL_RB_BUFSZ;
    serial_cfg.serial_parity_mode = PARITY_NONE;
    serial_cfg.serial_bit_order = STOP_BITS_1;
    serial_cfg.serial_invert_mode = NRZ_NORMAL;
#ifdef ADAPTER_HC08_DRIVER_EXT_PORT
    serial_cfg.ext_uart_no = ADAPTER_HC08_DRIVER_EXT_PORT;
    serial_cfg.port_configure = PORT_CFG_INIT;
#endif

    struct PrivIoctlCfg ioctl_cfg;
    ioctl_cfg.ioctl_driver_type = SERIAL_TYPE;
    ioctl_cfg.args = &serial_cfg;
    PrivIoctl(adapter->fd, OPE_INT, &ioctl_cfg);

    ADAPTER_DEBUG("Hc08 ioctl done\n");
    
    return 0;
}

static int Hc08SetAddr(struct Adapter *adapter, const char *ip, const char *gateway, const char *netmask)
{

}

static int Hc08Connect(struct Adapter *adapter, enum NetRoleType net_role, const char *ip, const char *port, enum IpType ip_type)
{

}

static int Hc08Send(struct Adapter *adapter, const void *buf, size_t len)
{
    PrivWrite(adapter->fd, buf, len);
    return 0;
}

static int Hc08Recv(struct Adapter *adapter, void *buf, size_t len)
{
    return 0;
}

static int Hc08Disconnect(struct Adapter *adapter)
{

}

static const struct IpProtocolDone hc08_done = 
{
    .open = Hc08Open,
    .close = Hc08Close,
    .ioctl = Hc08Ioctl,
    .setup = NULL,
    .setdown = NULL,
    .setaddr = Hc08SetAddr,
    .setdns = NULL,
    .setdhcp = NULL,
    .ping = NULL,
    .netstat = NULL,
    .connect = Hc08Connect,
    .send = Hc08Send,
    .recv = Hc08Recv,
    .disconnect = Hc08Disconnect,
};

AdapterProductInfoType Hc08Attach(struct Adapter *adapter)
{
    struct AdapterProductInfo *product_info = malloc(sizeof(struct AdapterProductInfo));
    if (!product_info) {
        printf("Hc08Attach malloc product_info error\n");
        free(product_info);
        return NULL;
    }

    product_info->model_name = ADAPTER_BLUETOOTH_HC08;

    product_info->model_done = (void *)&hc08_done;

    return product_info;
}