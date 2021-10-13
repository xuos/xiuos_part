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
 * @file bc28.c
 * @brief Implement the connection nbiot adapter function, using BC28 device
 * @version 1.1
 * @author AIIT XUOS Lab
 * @date 2021.09.15
 */

#include <adapter.h>
#include <at_agent.h>
#include "../adapter_nbiot.h"

#define SOCKET_PROTOCOL_TCP  (6)
#define SOCKET_PROTOCOL_UDP  (17)

#define NET_TYPE_AF_INET   (0)
#define NET_TYPE_AF_INET6  (1)

#define SOCKET_INVALID_ID  (-1)

static int BC28UartOpen(struct Adapter *adapter)
{
    if (NULL == adapter) {
        return -1;
    }

    /* Open device in read-write mode */
    adapter->fd = PrivOpen(ADAPTER_BC28_DRIVER,O_RDWR);
    if (adapter->fd < 0) {
        printf("BC28UartOpen get serial %s fd error\n", ADAPTER_BC28_DRIVER);
        return -1;
    }
    /* set serial config, serial_baud_rate = 9600 */

    struct SerialDataCfg cfg;
    memset(&cfg, 0 ,sizeof(struct SerialDataCfg));

    cfg.serial_baud_rate = BAUD_RATE_9600;
    cfg.serial_data_bits = DATA_BITS_8;
    cfg.serial_stop_bits = STOP_BITS_1;
    cfg.serial_parity_mode = PARITY_NONE;
    cfg.serial_bit_order = BIT_ORDER_LSB;
    cfg.serial_invert_mode = NRZ_NORMAL;
    cfg.serial_buffer_size = SERIAL_RB_BUFSZ;

    /*aiit board use ch438, so it needs more serial configuration*/
#ifdef ADAPTER_BC28_DRIVER_EXTUART
    cfg.ext_uart_no         = ADAPTER_BC28_DRIVER_EXT_PORT;
    cfg.port_configure      = PORT_CFG_INIT;
#endif

    struct PrivIoctlCfg ioctl_cfg;
    ioctl_cfg.ioctl_driver_type = SERIAL_TYPE;
    ioctl_cfg.args = &cfg;

    PrivIoctl(adapter->fd, OPE_INT, &ioctl_cfg);
    PrivTaskDelay(1000);

    printf("NBIot uart config ready\n");
    return 0;
}

static void BC28PowerSet(void)
{
    int pin_fd;
    pin_fd = PrivOpen(ADAPTER_BC28_PIN_DRIVER, O_RDWR);

    struct PinParam pin_param;
    pin_param.cmd = GPIO_CONFIG_MODE;
    pin_param.mode = GPIO_CFG_OUTPUT; 
    pin_param.pin = ADAPTER_BC28_PWRKEY;

    struct PrivIoctlCfg ioctl_cfg;
    ioctl_cfg.ioctl_driver_type = PIN_TYPE;
    ioctl_cfg.args = &pin_param;
    PrivIoctl(pin_fd, OPE_CFG, &ioctl_cfg);

    struct PinStat pin_stat;
    pin_stat.pin = ADAPTER_BC28_PWRKEY;
    pin_stat.val = GPIO_HIGH;
    PrivWrite(pin_fd, &pin_stat, 1);

    PrivTaskDelay(200);//at least 200ms

    pin_stat.val = GPIO_LOW;
    PrivWrite(pin_fd, &pin_stat, 1);

    PrivClose(pin_fd);
}
/**
 * @description: NBIoT device create a socket connection
 * @param adapter - NBIoT adapter AT
 * @param socket_fd - socket file description
 * @param type - socket type
 * @param af_type - IPv4 or IPv6
 * @return success: EOK, failure: -ERROR
 */
int NBIoTSocketCreate(struct Adapter *adapter, struct Socket *socket )
{
    int32 result = 0;

    if (!adapter || !socket){
        return -1;
    }

    ATReplyType reply = CreateATReply(64);
    if (NULL == reply) {
        printf("at create failed ! \n");
        result = -1;
        goto __exit;
    }

    if ( socket->af_type == NET_TYPE_AF_INET6 ) {
        printf("IPv6 not surport !\n");
        result = -1;
        goto __exit;
    }

    char *str_af_type = "AF_INET";
    char *str_type;
    char str_fd[3] = {0};
    char *str_protocol ;
    char at_cmd[64] = {0};
    char listen_port[] = {0};

    if (socket->socket_id >= 0 && socket->socket_id < 7) {
        itoa(socket->socket_id, str_fd, 10);
        adapter->socket.socket_id = socket->socket_id;
    } else {
        printf("surport max 0-6, socket_id = [%d] is error!\n",socket->socket_id);
        result = -1;
        goto __exit;
    }

    if( socket->listen_port >= 0 && socket->listen_port <= 65535){
        itoa(socket->listen_port, listen_port, 10);
    } 
    
    adapter->socket.af_type = NET_TYPE_AF_INET;

    if (socket->type == SOCKET_TYPE_STREAM) {   //tcp = AT+NSOCR=STREAM,6,0,1,AF_INET
        adapter->socket.protocal = SOCKET_PROTOCOL_TCP;
        adapter->socket.type = SOCKET_TYPE_STREAM;
        str_type = "STREAM";
        char *str_protocol = "6";

    } else if ( socket->type == SOCKET_TYPE_DGRAM ){  //udp
        adapter->socket.type = SOCKET_TYPE_DGRAM;
        adapter->socket.protocal = SOCKET_PROTOCOL_UDP;
        str_type = "DGRAM";
        char *str_protocol = "17";

    } else {
        printf("error socket type \n");
        result = -1;
        goto __exit;
    }

    memcpy(at_cmd, "AT+NSOCR=", 9);
    strcat(at_cmd, str_type);
    strcat(at_cmd, ",");
    strcat(at_cmd, str_protocol);
    strcat(at_cmd, ",");
    strcat(at_cmd, listen_port);
    strcat(at_cmd, ",");
    strcat(at_cmd, str_fd);
    strcat(at_cmd, ",");
    strcat(at_cmd, str_af_type);
    strcat(at_cmd, "\n");

    printf("cmd : %s\n", at_cmd);
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, reply, at_cmd);
    PrivTaskDelay(3000);
    printf("bak : ");
    for(int i = 0; i < strlen(reply->reply_buffer); i++)
        printf(" 0x%02x", reply->reply_buffer[i]);
    printf("\n");

__exit:
    if (reply) {
        DeleteATReply(reply);
    }

    return result;
}

/**
 * @description: NBIoT device close a socket connection
 * @param adapter - NBIoT adapter AT
 * @param socket_fd - socket file description
 * @return success: EOK, failure: -ERROR
 */
int NBIoTSocketDelete(struct Adapter *adapter )
{
    int result = 0;

    if (!adapter){
        return -1;
    }

    ATReplyType reply = CreateATReply(64);
    if (NULL == reply) {
        printf("at create failed ! \n");
        result = -1;
        goto __exit;
    }

    if (adapter->socket.socket_id >= 7) {
        printf("socket fd error \n");
        result = -1;
        goto __exit;
    }

    char str_fd[2] = {0};
    char at_cmd[16] = {0};
    itoa(adapter->socket.socket_id, str_fd, 10);

    memcpy(at_cmd, "AT+NSOCL=", 9);
    strcat(at_cmd, str_fd);
    strcat(at_cmd, "\n");

    printf("cmd : %s\n", at_cmd);
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, reply, at_cmd);
    PrivTaskDelay(300);

    adapter->socket.socket_id = SOCKET_INVALID_ID;

__exit:
    if (reply) {
        DeleteATReply(reply);
    }

    return result;
}

static int BC28Open(struct Adapter *adapter)
{
    int ret = 0;
    struct Socket create_socket;

    if (NULL == adapter) {
        return -1;
    }
    /*step1: open BC8 serial port*/
    ret = BC28UartOpen(adapter);
    if (ret < 0) {
        printf("bc18 setup failed.\n");
        return -1;
    }
     /*step2: init AT agent*/
    if (!adapter->agent) {
        char *agent_name = "niot_device";
        if (EOK != InitATAgent(agent_name, adapter->fd, 512)) {
            printf("at agent init failed !\n");
            return -1;
        }
        ATAgentType at_agent = GetATAgent(agent_name);
        adapter->agent = at_agent;
    }
    create_socket.type = SOCKET_TYPE_STREAM;
    create_socket.listen_port = 0;
    create_socket.socket_id = 0;
    create_socket.af_type = NET_TYPE_AF_INET;

    /*step3: create a tcp socket default */
    ret = NBIoTSocketCreate(adapter, &create_socket);
    if(ret < 0){
        printf("NBIot create tcp socket failed.\n");
        return -1;
    }

    printf("NBiot BC28 open successful\n");
    return 0;
}

static int BC28Close(struct Adapter *adapter)
{
    NBIoTSocketDelete(adapter);
    PrivClose(adapter->fd);
    return 0;
}

static int BC28Ioctl(struct Adapter *adapter, int cmd, void *args)
{
    int ret = 0;
    switch (cmd)
    {
        case CONFIG_NBIOT_RESET: /* reset nbiot */
            BC28PowerSet();
            break;
        case CONFIG_NBIOT_CREATE_SOCKET: /* create tcp/UDP socket */
            if(!args){
                return -1;
            }
            struct Socket *create_socket = ( struct Socket *) args;
            ret = NBIoTSocketCreate(adapter, create_socket);
            break;
        case CONFIG_NBIOT_DELETE_SOCKET: /* close socket */
            ret = NBIoTSocketDelete(adapter);
            break;
        default:
            ret = -1;
            break;
    }

    return ret;
}

static int BC28Connect(struct Adapter *adapter, enum NetRoleType net_role, const char *ip, const char *port, enum IpType ip_type)
{
    int result = 0;

    ATReplyType reply = CreateATReply(64);
    if (NULL == reply) {
        printf("at create failed ! \n");
        result = -1;
        goto __exit;
    }

    if (adapter->socket.socket_id > 6) {
        printf("socket fd error \n");
        result = -1;
        goto __exit;
    }

    if ( ip_type != SOCKET_TYPE_STREAM) {
        printf("socket type error \n");
    }

    char at_cmd[64] = {0};
    char str_fd[2] = {0};

    itoa(adapter->socket.socket_id, str_fd, 10);

    memcpy(at_cmd, "AT+NSOCO=", 9);
    strcat(at_cmd, str_fd);
    strcat(at_cmd, ",");
    strcat(at_cmd, ip);
    strcat(at_cmd, ",");
    strcat(at_cmd, port);
    strcat(at_cmd, "\n");

    printf("cmd : %s\n", at_cmd);
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, reply, at_cmd);
    PrivTaskDelay(300);

__exit:
    if (reply) {
        DeleteATReply(reply);
    }

    return result;
}

static int BC28Send(struct Adapter *adapter, const void *buf, size_t len)
{
    uint32_t result = 0;

    ATReplyType reply = CreateATReply(64);
    if (NULL == reply) {
        printf("at create failed ! \n");
        result = -ERROR;
        goto __exit;
    }

    if (adapter->socket.type == SOCKET_TYPE_STREAM ) {
        
        char at_cmd[64] = {0};
        char str_fd[2] = {0};
        char size[2] = {0};

        itoa(adapter->socket.socket_id, str_fd, 10);
        size[0] = len + '0';

        memcpy(at_cmd, "AT+NSOSD=", 9);
        strcat(at_cmd, str_fd);
        strcat(at_cmd, ",");
        strcat(at_cmd, size);
        strcat(at_cmd, ",");
        strcat(at_cmd, buf);
        strcat(at_cmd, "\n");

        printf("cmd : %s\n", at_cmd);
        ATOrderSend(adapter->agent, REPLY_TIME_OUT, reply, at_cmd);
        PrivTaskDelay(300);

    } else if(adapter->socket.type == SOCKET_TYPE_DGRAM ) {
        char at_cmd[64] = {0};
        char str_fd[2] = {0};
        char listen_port[] = {0};

        itoa(adapter->socket.socket_id, str_fd, 10);

        itoa(adapter->socket.listen_port, listen_port, 10);

        memcpy(at_cmd, "AT+NSOST=", 9);
        strcat(at_cmd, str_fd);
        strcat(at_cmd, ",");
        strcat(at_cmd, adapter->socket.dst_ip_addr);
        strcat(at_cmd, ",");
        strcat(at_cmd, listen_port);
        strcat(at_cmd, ",");
        strcat(at_cmd, buf);
        strcat(at_cmd, "\n");

        printf("cmd : %s\n", at_cmd);
        ATOrderSend(adapter->agent, REPLY_TIME_OUT, reply, at_cmd);
        PrivTaskDelay(300);
    }

__exit:
    if (reply) {
        DeleteATReply(reply);
    }

    return result;
}

static int BC28Recv(struct Adapter *adapter, void *buf, size_t len)
{
    char at_cmd[64] = {0};
    char str_fd[2] = {0};
    char size[2] = {0};

    ATReplyType reply = CreateATReply(64);
    if (NULL == reply) {
        printf("at create failed ! \n");
        return -1;
    }
    
    itoa(adapter->socket.socket_id, str_fd, 10);
    size[0] = len + '0';

    memcpy(at_cmd, "AT+NSORF=", 9);
    strcat(at_cmd, str_fd);
    strcat(at_cmd, ",");
    strcat(at_cmd, size);
    strcat(at_cmd, "\n");

    printf("cmd : %s\n", at_cmd);
    ATOrderSend(adapter->agent, REPLY_TIME_OUT, reply, at_cmd);
    PrivTaskDelay(300);

    buf = GetReplyText(reply);
    if (!buf) {
        printf("%s %n get reply failed.\n",__func__,__LINE__);
    }

    if (reply) {
        DeleteATReply(reply);
    }

    return 0;
}

static int BC28Disconnect(struct Adapter *adapter)
{
    if (!adapter) {
        return -1;
    }

    return NBIoTSocketDelete(adapter);
}

static const struct IpProtocolDone BC28_done = 
{
    .open = BC28Open,
    .close = BC28Close,
    .ioctl = BC28Ioctl,
    .setup = NULL,
    .setdown = NULL,
    .setaddr = NULL,
    .setdns = NULL,
    .setdhcp = NULL,
    .ping = NULL,
    .netstat = NULL,
    .connect = BC28Connect,
    .send = BC28Send,
    .recv = BC28Recv,
    .disconnect = BC28Disconnect,
};

AdapterProductInfoType BC28Attach(struct Adapter *adapter)
{
    struct AdapterProductInfo *product_info = malloc(sizeof(struct AdapterProductInfo));
    if (!product_info) {
        printf("BC28Attach malloc product_info error\n");
        return NULL;
    }
    memset(product_info, 0, sizeof(struct AdapterProductInfo));

    strncpy(product_info->model_name, ADAPTER_NBIOT_BC28,sizeof(product_info->model_name));
    product_info->model_done = (void *)&BC28_done;

    BC28PowerSet();
    return product_info;
}



