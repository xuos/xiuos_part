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
 * @file adapter_nbiot.c
 * @brief Implement the connection nbiot adapter function
 * @version 1.1
 * @author AIIT XUOS Lab
 * @date 2021.06.25
 */
#include <adapter.h>


#ifdef ADAPTER_BC28
extern AdapterProductInfoType BC28Attach(struct Adapter *adapter);
#endif

#define ADAPTER_NBIOT_NAME "nbiot"

static int AdapterNbiotRegister(struct Adapter *adapter)
{
    int ret = 0;

    strncpy(adapter->name, ADAPTER_NBIOT_NAME, NAME_NUM_MAX); 
 
    adapter->net_protocol = IP_PROTOCOL;
    adapter->net_role = CLIENT;

    adapter->adapter_status = UNREGISTERED;

    ret = AdapterDeviceRegister(adapter);
    if (ret < 0) {
        printf("AdapterNbiot register error\n");
        return -1;
    }

    return ret;
}

int AdapterNbiotInit(void)
{
    int ret = 0;

    struct Adapter *adapter = malloc(sizeof(struct Adapter));
    if (!adapter) {
        printf("malloc adapter failed.\n");
        return -1;
    }
    memset(adapter, 0, sizeof(struct Adapter));
    ret = AdapterNbiotRegister(adapter);
    if (ret < 0) {
        printf("register nbiot adapter error\n");
        free(adapter);
        return -1;
    }
#ifdef ADAPTER_BC28
    AdapterProductInfoType product_info = BC28Attach(adapter);
    if (!product_info) {
        printf("bc28 attach error\n");
        free(adapter);
        return -1;
    }

    adapter->product_info_flag = 1;
    adapter->info = product_info;
    adapter->done = product_info->model_done;
#endif

    return ret;
}

/******************TEST*********************/
// int openzigbee(void)
// {
//     int ret = 0;

//     struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_ZIGBEE_NAME);

// #ifdef ADAPTER_E18
//     ret = AdapterDeviceOpen(adapter);
//     if(ret < 0){
//         printf("open adapter failed\n");
//         return -1;
//     }

//     adapter->info->work_mode = 1;
//     ret = AdapterDeviceControl(adapter, CONFIG_ZIGBEE_NET_MODE,NULL);
//     if(ret < 0){
//         printf("control adapter failed\n");
//         return -1;
//     }
//     ret = AdapterDeviceJoin(adapter, NULL);
//     if(ret < 0){
//         printf("join adapter failed\n");
//         return -1;
//     }
// #endif

//     return 0;    
// }
// SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0)|SHELL_CMD_DISABLE_RETURN, openzigbee, openzigbee, show adapter zigbee information);

// int sendzigbee(int argc, char *argv[])
// {
//     const char *send_msg = argv[1];
//     int ret = 0;

//     struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_ZIGBEE_NAME);

//     printf("send argv1 %s\n",argv[1]);
//     ret = AdapterDeviceSend(adapter, send_msg, strlen(send_msg));
//     if(ret < 0){
//         printf(" adapter send failed\n");
//         return -1;
//     }
//     printf("zigbee send msg %s\n", send_msg);
    

//     return 0;    
// }
// SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN)|SHELL_CMD_PARAM_NUM(2)|SHELL_CMD_DISABLE_RETURN, sendzigbee, sendzigbee, show adapter zigbee information);

// int recvzigbee(void)
// {
//     char recv_msg[128];
//     struct Adapter* adapter =  AdapterDeviceFindByName(ADAPTER_ZIGBEE_NAME);
//     memset(recv_msg,0,128);
//     AdapterDeviceRecv(adapter, recv_msg, 128);
//     PrivTaskDelay(2000);
//     printf("zigbee recv msg %s\n", recv_msg);
    
//     return 0;    
// }
// SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0)|SHELL_CMD_TYPE(SHELL_TYPE_CMD_FUNC)|SHELL_CMD_PARAM_NUM(0)|SHELL_CMD_DISABLE_RETURN, recvzigbee, recvzigbee, show adapter zigbee information);

