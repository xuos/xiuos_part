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
 * @file ec200t.c
 * @brief Implement the connection 4G adapter function, using EC200T device
 * @version 1.1
 * @author AIIT XUOS Lab
 * @date 2021.07.08
 */

#include <adapter.h>
#include <at_agent.h>

static void Ec200tPowerSet(void)
{
    int pin_fd;
    pin_fd = PrivOpen(ADAPTER_EC200T_PIN_DRIVER, O_RDWR);

    struct PinParam pin_param;
    pin_param.cmd = GPIO_CONFIG_MODE;
    pin_param.mode = GPIO_CFG_OUTPUT;
    pin_param.pin = ADAPTER_EC200T_PWRKEY;

    struct PrivIoctlCfg ioctl_cfg;
    ioctl_cfg.ioctl_driver_type = PIN_TYPE;
    ioctl_cfg.args = &pin_param;
    PrivIoctl(pin_fd, OPE_CFG, &ioctl_cfg);

    struct PinStat pin_stat;
    pin_stat.pin = ADAPTER_EC200T_PWRKEY;
    pin_stat.val = GPIO_HIGH;
    PrivWrite(pin_fd, &pin_stat, 1);

    PrivTaskDelay(600);//at least 500ms

    pin_stat.val = GPIO_LOW;
    PrivWrite(pin_fd, &pin_stat, 1);

    PrivClose(pin_fd);
}

static int Ec200tOpen(struct Adapter *adapter)
{
    /*step1: open ec200t serial port*/
    adapter->fd = PrivOpen(ADAPTER_EC200T_DRIVER, O_RDWR);
    if (adapter->fd < 0) {
        printf("Ec200tOpen get serial %s fd error\n", ADAPTER_EC200T_DRIVER);
        return -1;
    }

    /*step2: init AT agent*/
    if (!adapter->agent) {
        char *agent_name = "4G_uart_client";
        if (EOK != InitATAgent(agent_name, adapter->fd, 512)) {
            printf("at agent init failed !\n");
            return -1;
        }
        ATAgentType at_agent = GetATAgent(agent_name);

        adapter->agent = at_agent;
    }

    /*step3: serial write "+++", quit transparent mode*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "+++");

    /*step4: serial write "AT+CCID", get SIM ID*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+CCID\r\n");

    PrivTaskDelay(2500);

    /*step5: serial write "AT+CPIN?", check SIM status*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+CPIN?\r\n");

    PrivTaskDelay(2500);

    /*step6: serial write "AT+CREG?", check whether registered to GSM net*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+CREG?\r\n");

    PrivTaskDelay(2500);

    /*step7: serial write "AT+QICLOSE", close socket connect before open socket*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+QICLOSE=0\r\n");

    PrivTaskDelay(2500);

    /*step8: serial write "AT+QIDEACT", close TCP net before open socket*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+QIDEACT=1\r\n");

    PrivTaskDelay(2500);
    
    ADAPTER_DEBUG("Ec200t open done\n");

    return 0;
}

static int Ec200tClose(struct Adapter *adapter)
{
    if (!adapter->agent) {
        printf("Ec200tClose AT agent NULL\n");
        return -1;
    }

    /*step1: serial write "+++", quit transparent mode*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "+++");

    /*step2: serial write "AT+QICLOSE", close socket connect before open socket*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+QICLOSE=0\r\n");

    PrivTaskDelay(2500);

    /*step3: serial write "AT+QIDEACT", close TCP net before open socket*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+QIDEACT=1\r\n");

    PrivTaskDelay(2500);

    /*step4: close ec200t serial port*/
    PrivClose(adapter->fd);

    /*step5: power down ec200t*/
    Ec200tPowerSet();
    
    return 0;
}

static int Ec200tIoctl(struct Adapter *adapter, int cmd, void *args)
{
    if (OPE_INT != cmd) {
        printf("Ec200tIoctl only support OPE_INT, do not support %d\n", cmd);
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
#ifdef ADAPTER_EC200T_DRIVER_EXT_PORT
    serial_cfg.ext_uart_no = ADAPTER_EC200T_DRIVER_EXT_PORT;
    serial_cfg.port_configure = PORT_CFG_INIT;
#endif

    struct PrivIoctlCfg ioctl_cfg;
    ioctl_cfg.ioctl_driver_type = SERIAL_TYPE;
    ioctl_cfg.args = &serial_cfg;
    PrivIoctl(adapter->fd, OPE_INT, &ioctl_cfg);
    
    return 0;
}

static int Ec200tConnect(struct Adapter *adapter, enum NetRoleType net_role, const char *ip, const char *port, enum IpType ip_type)
{
    uint8_t ec200t_cmd[64];

    /*step1: serial write "AT+QICSGP", connect to China Mobile using ipv4 or ipv6*/
    memset(ec200t_cmd, 0, sizeof(ec200t_cmd));

    if (IPV4 == ip_type) {
        strcpy(ec200t_cmd, "AT+QICSGP=1,1,\"CMNET\",\"\",\"\",1\r\n");
    } else if (IPV6 == ip_type) {
        strcpy(ec200t_cmd, "AT+QICSGP=1,2,\"CMNET\",\"\",\"\",1\r\n");
    }
    
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, ec200t_cmd);

    PrivTaskDelay(2500);

    /*step2: serial write "AT+QIACT", open TCP net*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+QIACT=1\r\n");

    PrivTaskDelay(2500);

    /*step3: serial write "AT+QIOPEN", connect socket using TCP*/
    memset(ec200t_cmd, 0, sizeof(ec200t_cmd));
    strcpy(ec200t_cmd, "AT+QIOPEN=1,0,\"TCP\",\"");
    strcat(ec200t_cmd, ip);
    strcat(ec200t_cmd, "\",");
    strcat(ec200t_cmd, port);
    strcat(ec200t_cmd, ",0,2\r\n");

    ADAPTER_DEBUG("Ec200t connect AT CMD :%s\n", ec200t_cmd);
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, ec200t_cmd);

    ADAPTER_DEBUG("Ec200t connect TCP done\n");

    return 0;
}

static int Ec200tSend(struct Adapter *adapter, const void *buf, size_t len)
{
    PrivWrite(adapter->fd, buf, len);
    return 0;
}

static int Ec200tRecv(struct Adapter *adapter, void *buf, size_t len)
{
    PrivRead(adapter->fd, buf, len);
    return 0;
}

static int Ec200tDisconnect(struct Adapter *adapter)
{
    uint8_t ec200t_cmd[64];
    
    /*step1: serial write "+++", quit transparent mode*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "+++");

    /*step2: serial write "AT+QICLOSE", close socket connect before open socket*/
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, NULL, "AT+QICLOSE=0\r\n");

    PrivTaskDelay(2500);

    ADAPTER_DEBUG("Ec200t disconnect TCP done\n");

    return 0;
}

static const struct IpProtocolDone ec200t_done = 
{
    .open = Ec200tOpen,
    .close = Ec200tClose,
    .ioctl = Ec200tIoctl,
    .setup = NULL,
    .setdown = NULL,
    .setaddr = NULL,
    .setdns = NULL,
    .setdhcp = NULL,
    .ping = NULL,
    .netstat = NULL,
    .connect = Ec200tConnect,
    .send = Ec200tSend,
    .recv = Ec200tRecv,
    .disconnect = Ec200tDisconnect,
};

AdapterProductInfoType Ec200tAttach(struct Adapter *adapter)
{
    struct AdapterProductInfo *product_info = PrivMalloc(sizeof(struct AdapterProductInfo));
    if (!product_info) {
        printf("Ec200tAttach malloc product_info error\n");
        PrivFree(product_info);
        return NULL;
    }

    strcpy(product_info->model_name, ADAPTER_4G_EC200T);

    product_info->model_done = (void *)&ec200t_done;

    Ec200tPowerSet();

    return product_info;
}



