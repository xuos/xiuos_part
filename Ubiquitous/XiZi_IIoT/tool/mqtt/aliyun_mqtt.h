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
* @file:    aliyun_mqtt.h
* @brief:   connect aliyun mqtt
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2023/6/14
*
*/

#ifndef _ALIYUN_MQTT_H_
#define	_ALIYUN_MQTT_H_

#include <stdint.h>

#define CLIENTID   "iv74JbFgzhv.D001|securemode=2,signmethod=hmacsha256,timestamp=1686617772433|"
#define USERNAME   "D001&iv74JbFgzhv"
#define PASSWORD    "2e5e585ec5fc8665dd8bc1a17444fc8ffcb07ed515b220785883d478e49666e5"
#define SERVERIP   "101.133.196.127"
#define SERVERPORT "1883"

#define  PACK_SIZE 512  //存放报文数据缓冲区大小
#define  CMD_SIZE  512  //保存推送的PUBLISH报文中的数据缓冲区大小

typedef struct{ 
    uint8_t  Pack_buff[PACK_SIZE]; //存放发送报文数据缓冲区
    uint16_t MessageID;            //记录报文标识符
    uint16_t Fixed_len;            //固定报头长度
    uint16_t Variable_len;         //可变报头长度
    uint16_t Payload_len;          //有效负荷长度
    uint16_t Remaining_len;        //保存报文剩余长度字节
    uint8_t  cmdbuff[CMD_SIZE];    //保存推送的PUBLISH报文中的数据缓冲区
}MQTT_TCB;

extern MQTT_TCB Aliyun_mqtt; //外部变量声明
 
int AdapterNetActive(void);
int MQTT_Send(const uint8_t* buf, int buflen);
int MQTT_Recv(uint8_t* buf, int buflen);
int MQTT_Connect(void);
void MQTT_Disconnect(void);
int MQTT_SubscribeTopic(uint8_t *topic_name);
int MQTT_UnSubscribeTopic(uint8_t *topic_name);
void MQTT_PublishDataQs0(uint8_t *topic_name,uint8_t *data, uint16_t data_len);
void MQTT_PublishDataQs1(uint8_t *topic_name,uint8_t *data, uint16_t data_len);
int MQTT_SendHeart(void);
void MQTT_DealPublishData(uint8_t *data, uint16_t data_len);
#endif