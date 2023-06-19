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
* @file:    aliyun_mqtt.c
* @brief:   connect aliyun mqtt
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2023/6/14
*
*/

#include <string.h>
#include <stdint.h>
#include <adapter.h>
#include "shell.h"
#include "xsconfig.h"
#include <adapter.h>
#include "aliyun_mqtt.h"

MQTT_TCB Aliyun_mqtt;  //创建一个用于连接阿里云mqtt的结构体
static struct Adapter *adapter;
static const uint8_t parket_connetAck[] = {0x20,0x02,0x00,0x00};   //连接成功服务器回应报文
static const uint8_t parket_disconnet[] = {0xe0,0x00};             //客户端主动断开连接发送报文
static const uint8_t parket_heart[] = {0xc0,0x00};                 //客户端发送保活心跳包
static const uint8_t parket_subAck[] = {0x90,0x03,0x00,0x0A,0x01}; //订阅成功服务器回应报文
static const uint8_t parket_unsubAck[] = {0xB0,0x02,0x00,0x0A};    //取消订阅成功服务器回应报文
static uint8_t mqtt_rxbuf[16];


/*******************************************************************************
* 函 数 名: AdapterNetActive
* 功能描述: 使能设备的网络模块连接,连接TCP服务器并进入透传模式，当前使用4G方式
* 形    参: 无
* 返 回 值: 0表示成功,其他值表示失败
*******************************************************************************/
int AdapterNetActive(void)
{
    int ret = 0;
    uint32_t baud_rate = BAUD_RATE_115200;
    adapter =  AdapterDeviceFindByName(ADAPTER_4G_NAME);
    adapter->socket.socket_id = 0;
    
    ret = AdapterDeviceOpen(adapter);
    if (ret < 0) 
    {
        goto out;   
    }
       
    ret = AdapterDeviceControl(adapter, OPE_INT, &baud_rate);
    if (ret < 0)
    {
        goto out;
    }

    ret = AdapterDeviceConnect(adapter, CLIENT, SERVERIP, SERVERPORT, IPV4);
    if (ret < 0) 
    {
        goto out;
    }

out:
    if (ret < 0) 
    {
        AdapterDeviceClose(adapter);
    }

    return ret;
}



/*******************************************************************************
* 函 数 名: MQTT_Send
* 功能描述: MQTT client数据发送函数
* 形    参: buf:要发送的数据,buflen:要发送的数据长度
* 返 回 值: 发送成功为0,发送失败为-1
*******************************************************************************/
int MQTT_Send(const uint8_t* buf, int buflen)
{
    return AdapterDeviceSend(adapter, buf, buflen) ;
}


/*******************************************************************************
* 函 数 名: MQTT_Recv
* 功能描述: MQTT client数据接收函数
* 形    参: buf:数据缓冲区,buflen:期望接收的数据长度
* 返 回 值: 实际接收到的数据长度,接收失败为-1
*******************************************************************************/
int MQTT_Recv(uint8_t* buf, int buflen)
{
    return AdapterDeviceRecv(adapter, buf, buflen) ;
}


/*******************************************************************************
* 函 数 名: MQTT_Connect
* 功能描述: 登录MQTT服务器
* 形    参: 无
* 返 回 值: 0表示成功,1表示失败
*******************************************************************************/
int MQTT_Connect(void)
{
    uint8_t TryConnect_time = 10;  //尝试登录次数

    Aliyun_mqtt.MessageID = 0;      //报文标识符清零,CONNECT报文虽然不需要添加报文标识符,但是CONNECT报文是第一个发送的报文,在此清零报文标识符为后续报文做准备
    Aliyun_mqtt.Fixed_len = 1;      //CONNECT报文固定报头长度暂定为1
    Aliyun_mqtt.Variable_len = 10;  //CONNECT报文可变报头长度为10
    Aliyun_mqtt.Payload_len = (2+strlen(CLIENTID)) + (2+strlen(USERNAME)) + (2+strlen(PASSWORD)); //CONNECT报文中负载长度
    Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len; //剩余长度=可变报头长度+负载长度
    memset(Aliyun_mqtt.Pack_buff,0,sizeof(Aliyun_mqtt.Pack_buff));

    Aliyun_mqtt.Pack_buff[0] = 0x10;        //CONNECT报文 固定报头第1个字节0x10	
    do{
        if((Aliyun_mqtt.Remaining_len/128) == 0)
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = Aliyun_mqtt.Remaining_len;
        }
        else
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = (Aliyun_mqtt.Remaining_len%128)|0x80;
        }
        Aliyun_mqtt.Fixed_len++;
        Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Remaining_len/128;
    }while(Aliyun_mqtt.Remaining_len);

    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+0] = 0x00;  //CONNECT报文,可变报头第1个字节:固定0x00
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+1] = 0x04;  //CONNECT报文,可变报头第2个字节:固定0x04
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+2] = 0x4D;  //CONNECT报文,可变报头第3个字节:固定0x4D,大写字母M
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+3] = 0x51;  //CONNECT报文,可变报头第4个字节:固定0x51,大写字母Q
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+4] = 0x54;  //CONNECT报文,可变报头第5个字节:固定0x54,大写字母T
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+5] = 0x54;  //CONNECT报文,可变报头第6个字节:固定0x54,大写字母T
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+6] = 0x04;  //CONNECT报文,可变报头第7个字节:固定0x04
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+7] = 0xC2;  //CONNECT报文,可变报头第8个字节:使能用户名和密码校验,不使用遗嘱功能,不保留会话功能
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+8] = 0x00;  //CONNECT报文,可变报头第9个字节:保活时间高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+9] = 0x64;  //CONNECT报文,可变报头第10个字节:保活时间高字节
                                                   
    /* CLIENT_ID */
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+10] = strlen(CLIENTID)/256;             //客户端ID长度高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+11] = strlen(CLIENTID)%256;             //客户端ID长度低字节
    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+12],CLIENTID,strlen(CLIENTID)); //复制过来客户端ID字串
    /* USER_NAME */
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+12+strlen(CLIENTID)] = strlen(USERNAME)/256;             //用户名长度高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+13+strlen(CLIENTID)] = strlen(USERNAME)%256;             //用户名长度低字节
    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+14+strlen(CLIENTID)],USERNAME,strlen(USERNAME)); //复制过来用户名字串
    /* PASSWARD */
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+14+strlen(CLIENTID)+strlen(USERNAME)] = strlen(PASSWORD)/256;             //密码长度高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+15+strlen(CLIENTID)+strlen(USERNAME)] = strlen(PASSWORD)%256;             //密码长度低字节
    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+16+strlen(CLIENTID)+strlen(USERNAME)],PASSWORD,strlen(PASSWORD)); //复制过来密码字串
    
    while(TryConnect_time > 0)
    {
        memset(mqtt_rxbuf,0,sizeof(mqtt_rxbuf));
        MQTT_Send(Aliyun_mqtt.Pack_buff,Aliyun_mqtt.Fixed_len + Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len);
        MdelayKTask(50);
        MQTT_Recv(mqtt_rxbuf, 4);
        if(mqtt_rxbuf[0] == parket_connetAck[0] && mqtt_rxbuf[1] == parket_connetAck[1]) //连接成功
        {
            return 0;
        }
        TryConnect_time--;
    }
    return 1;
}


/*******************************************************************************
* 函 数 名: MQTT_Disconnect
* 功能描述: 断开与MQTT服务器的连接
* 形    参: 无
* 返 回 值: 无
*******************************************************************************/
void MQTT_Disconnect(void)
{
    while(MQTT_Send(parket_disconnet,sizeof(parket_disconnet)) < 0);
}


/*******************************************************************************
* 函 数 名: MQTT_SubscribeTopic
* 功能描述: MQTT订阅单个主题
* 形    参: topic_name:要订阅的主题
* 返 回 值: 0表示订阅成功,1表示订阅失败
*******************************************************************************/
int MQTT_SubscribeTopic(uint8_t *topic_name)
{
    uint8_t TrySub_time = 10; //尝试订阅次数

    Aliyun_mqtt.Fixed_len = 1;   //SUBSCRIBE报文,固定报头长度暂定为1
    Aliyun_mqtt.Variable_len = 2;//SUBSCRIBE报文,可变报头长度=2,2为字节报文标识符
    Aliyun_mqtt.Payload_len = 0; //SUBSCRIBE报文,负载数据长度暂定为0

    Aliyun_mqtt.Payload_len = strlen(topic_name) + 2 + 1; //每个需要订阅的topic除了本身的字符串长度,还包含表示topic字符串长度的2字节,以及订阅等级1字节
    Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len; //计算剩余长度=可变报头长度+负载长度
    memset(Aliyun_mqtt.Pack_buff,0,sizeof(Aliyun_mqtt.Pack_buff));

    Aliyun_mqtt.Pack_buff[0]=0x82;  //SUBSCRIBE报文,固定报头第1个字节0x82
    do{
        if((Aliyun_mqtt.Remaining_len/128) == 0)
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = Aliyun_mqtt.Remaining_len;
        }
        else
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = (Aliyun_mqtt.Remaining_len%128)|0x80;
        }
        Aliyun_mqtt.Fixed_len++;
        Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Remaining_len/128;
    }while(Aliyun_mqtt.Remaining_len);

    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+0] = Aliyun_mqtt.MessageID/256; //报文标识符高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+1] = Aliyun_mqtt.MessageID%256; //报文标识符低字节
    Aliyun_mqtt.MessageID++;                                                    //每用一次MessageID加1

    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+2] = strlen(topic_name)/256;               //主题长度高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+3] = strlen(topic_name)%256;               //主题长度低字节
    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+4],topic_name,strlen(topic_name)); //复制主题字串
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+4+strlen(topic_name)] = 0;                 //QOS等级设置为0
    
    while(TrySub_time > 0)
    {
        memset(mqtt_rxbuf,0,sizeof(mqtt_rxbuf));
        MQTT_Send(Aliyun_mqtt.Pack_buff,Aliyun_mqtt.Fixed_len + Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len);
        MdelayKTask(50);
        MQTT_Recv(mqtt_rxbuf, 5);
        if(mqtt_rxbuf[0] == parket_subAck[0] && mqtt_rxbuf[1] == parket_subAck[1]) //订阅成功
        {
            return 0;
        }
        TrySub_time--;
    }
    return 1;
}


/*******************************************************************************
* 函 数 名: MQTT_UnSubscribeTopic
* 功能描述: MQTT取消订阅单个主题
* 形    参: topic_name:要取消订阅的主题
* 返 回 值: 0表示订阅成功,1表示订阅失败
*******************************************************************************/
int MQTT_UnSubscribeTopic(uint8_t *topic_name)
{
    uint8_t TryUnSub_time = 10; //尝试取消订阅次数

    Aliyun_mqtt.Fixed_len = 1;                        //UNSUBSCRIBE报文,固定报头长度暂定为1
    Aliyun_mqtt.Variable_len = 2;                     //UNSUBSCRIBE报文,可变报头长度=2,2为字节报文标识符
    Aliyun_mqtt.Payload_len = strlen(topic_name) + 2; //每个需要取消的订阅topic除了本身的字符串长度,还包含表示topic字符串长度的2字节
    Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len; //计算剩余长度=可变报头长度+负载长度
    memset(Aliyun_mqtt.Pack_buff,0,sizeof(Aliyun_mqtt.Pack_buff));

    Aliyun_mqtt.Pack_buff[0]=0xA0; //UNSUBSCRIBE报文,固定报头第1个字节0xA0
    do{
        if((Aliyun_mqtt.Remaining_len/128) == 0)
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = Aliyun_mqtt.Remaining_len;
        }
        else
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = (Aliyun_mqtt.Remaining_len%128)|0x80;
        }
        Aliyun_mqtt.Fixed_len++;
        Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Remaining_len/128;
    }while(Aliyun_mqtt.Remaining_len);

    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+0] = Aliyun_mqtt.MessageID/256; //报文标识符高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+1] = Aliyun_mqtt.MessageID%256; //报文标识符低字节
    Aliyun_mqtt.MessageID++;                                                    //每用一次MessageID加1

    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+2] = strlen(topic_name)/256;               //主题长度高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+3] = strlen(topic_name)%256;               //主题长度低字节
    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+4],topic_name,strlen(topic_name)); //复制主题字串
    
    while(TryUnSub_time > 0)
    {
        memset(mqtt_rxbuf,0,sizeof(mqtt_rxbuf));
        MQTT_Send(Aliyun_mqtt.Pack_buff,Aliyun_mqtt.Fixed_len + Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len);
        MdelayKTask(50);
        MQTT_Recv(mqtt_rxbuf, 4);
        if(mqtt_rxbuf[0] == parket_unsubAck[0] && mqtt_rxbuf[1] == parket_unsubAck[1]) //取消订阅成功
        {
            return 0;
        }
        TryUnSub_time--;
    }
    return 1;
}


/*******************************************************************************
* 函 数 名: MQTT_PublishDataQs0
* 功能描述: 向服务器发送等级0的Publish报文
* 形    参: topic_name:主题名称
            data:数据缓存
            data_len:数据长度
* 返 回 值: 发布Qs=0的消息服务器不返回确认消息
*******************************************************************************/
void MQTT_PublishDataQs0(uint8_t *topic_name,uint8_t *data, uint16_t data_len)
{   
    Aliyun_mqtt.Fixed_len = 1;                            //PUBLISH等级0报文固定报头长度暂定为1
    Aliyun_mqtt.Variable_len = 2 + strlen(topic_name);    //PUBLISH等级0报文,可变报头长度=2字节topic长度标识字节+topic字符串的长度
    Aliyun_mqtt.Payload_len = data_len;                   //PUBLISH等级0报文,负载数据长度=data_len
    Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len; //计算剩余长度=可变报头长度+负载长度
    memset(Aliyun_mqtt.Pack_buff,0,sizeof(Aliyun_mqtt.Pack_buff));
            
    Aliyun_mqtt.Pack_buff[0]=0x30; //PUBLISH等级0报文固定报头第1个字节0x30
    do{
        if((Aliyun_mqtt.Remaining_len/128) == 0)
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = Aliyun_mqtt.Remaining_len;
        }
        else
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = (Aliyun_mqtt.Remaining_len%128)|0x80;
        }
        Aliyun_mqtt.Fixed_len++;
        Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Remaining_len/128;
    }while(Aliyun_mqtt.Remaining_len);

    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+0]=strlen(topic_name)/256;                    //主题长度高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+1]=strlen(topic_name)%256;                    //主题长度低字节
    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+2],topic_name,strlen(topic_name));    //复制主题字串
    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+2+strlen(topic_name)],data,data_len); //复制data数据

    MQTT_Send(Aliyun_mqtt.Pack_buff, Aliyun_mqtt.Fixed_len + Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len);
}


/*******************************************************************************
* 函 数 名: MQTT_PublishDataQs1
* 功能描述: 向服务器发送等级1的Publish报文
* 形    参: topic_name:主题名称
            data:数据缓存
            data_len:数据长度
* 返 回 值: 无
*******************************************************************************/
void MQTT_PublishDataQs1(uint8_t *topic_name,uint8_t *data, uint16_t data_len)
{
    Aliyun_mqtt.Fixed_len = 1;                             //PUBLISH等级1报文固定报头长度暂定为1
    Aliyun_mqtt.Variable_len = 2 + 2 + strlen(topic_name); //PUBLISH等级1报文,可变报头长度=2字节消息标识符+2字节topic长度标识字节+topic字符串的长度
    Aliyun_mqtt.Payload_len = data_len;                    //PUBLISH等级1报文,负载数据长度=data_len
    Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len; //计算剩余长度=可变报头长度+负载长度

    Aliyun_mqtt.Pack_buff[0] = 0x32; //等级1的Publish报文固定报头第1个字节，0x32
    do{
        if(Aliyun_mqtt.Remaining_len/128 == 0)
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = Aliyun_mqtt.Remaining_len;
        }
        else
        {
            Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len] = (Aliyun_mqtt.Remaining_len%128)|0x80;
        }
        Aliyun_mqtt.Fixed_len++;
        Aliyun_mqtt.Remaining_len = Aliyun_mqtt.Remaining_len/128;
    }while(Aliyun_mqtt.Remaining_len);

    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+0] = strlen(topic_name)/256;               //主题长度高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+1] = strlen(topic_name)%256;               //主题长度低字节
    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+2],topic_name,strlen(topic_name)); //复制主题字串
 
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+2+strlen(topic_name)] = Aliyun_mqtt.MessageID/256; //报文标识符高字节
    Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+3+strlen(topic_name)] = Aliyun_mqtt.MessageID%256; //报文标识符低字节
    Aliyun_mqtt.MessageID++;                                                                       //每用一次MessageID加1

    memcpy(&Aliyun_mqtt.Pack_buff[Aliyun_mqtt.Fixed_len+4+strlen(topic_name)],data,strlen(data));  //复制data数据

    MQTT_Send(Aliyun_mqtt.Pack_buff,Aliyun_mqtt.Fixed_len + Aliyun_mqtt.Variable_len + Aliyun_mqtt.Payload_len);
}


/*******************************************************************************
* 函 数 名: MQTT_SendHeart
* 功能描述: 发送心跳保活包
* 形    参: 无
* 返 回 值: 0表示发送成功,其他值表示发送失败
*******************************************************************************/
int MQTT_SendHeart(void)
{
    uint8_t TrySentHeart_time = 10; //尝试发送心跳保活次数
    while(TrySentHeart_time > 0)
    {
        memset(mqtt_rxbuf,0,sizeof(mqtt_rxbuf));
        MQTT_Send(parket_heart,sizeof(parket_heart));
        MdelayKTask(50);
        MQTT_Recv(mqtt_rxbuf, 2);
        if(mqtt_rxbuf[0] == 0xD0 && mqtt_rxbuf[1] == 0x00)
        {
            return 0;
        }
        TrySentHeart_time--;
    }
    return 1;
}


/*******************************************************************************
* 函 数 名: MQTT_DealPublishData
* 功能描述: 处理服务器发来的等级0的推送数据,附带topic信息
* 形    参: redata:接收的数据,data_len:要处理的数据长度
* 返 回 值: 无
*******************************************************************************/
void MQTT_DealPublishData(uint8_t *data, uint16_t data_len)
{
    uint8_t i;
    uint16_t cmdpos,cmdlen;

    for(i = 1;i < 5;i++)
    {
        if((data[i] & 0x80) == 0)
            break;
    }

    cmdpos = 1+i+2;
    cmdlen = data_len-(1+i+2);

    if(data_len <= CMD_SIZE)
    {
        memset(Aliyun_mqtt.cmdbuff, 0, CMD_SIZE);
        memcpy(Aliyun_mqtt.cmdbuff, &data[cmdpos], cmdlen);
    }
}
