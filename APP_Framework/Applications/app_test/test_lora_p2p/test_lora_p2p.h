/*
* Copyright (c) 2023 AIIT XUOS Lab
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
* @file:    test_lora_p2p.h
* @brief:   a head file of lora structure
* @version: 1.0
* @author:  Chu yunfei
* @date:    2023/8/30
*/

#include<adapter.h>
#include<transform.h>

#define LORA_FRAME_MAX_LENGTH 128
#define LORA_FRAME_USER_MAX_LENGTH LORA_FRAME_MAX_LENGTH - 11
#define LORA_FRAME_BEGIN_MARK_1 0XFF
#define LORA_FRAME_BEGIN_MARK_2 0XAA
#define LORA_FRAME_END_MARK_1 0XFF
#define LORA_FRAME_END_MARK_2 0X00
#define LORA_FRAME_MARK_LENGTH 2
#define LORA_FRAME_NECK_LENGTH 5
#define LORA_FRAME_CRC_LENGTH 2
#define LORA_FRAME_SEND_INTERVAL 500

#define GATEWAY_MAX_CLIENT_NUM 20

#define DEFAULT_ID_MAX 125
#define DEFAULT_ID_MIN 1
#define DEAFULT_PANID 0XA
#define DEAFULT_CLIENT_ID 0XB
#define DEAFULT_GATEWAY_ID 0XC

extern AdapterProductInfoType E220Attach(struct Adapter *adapter);

// Lora工作模式枚举
enum LoraMode
{
    LORA_SLEEP = 0, // 切换至休眠模式
    LORA_WORK = 1 // 切换至工作模式
};

// 客户端状态
enum ClientState
{
    CLIENT_DISCONNECT = 0, // 开启但断网
    CLIENT_CONNECT, // 开启且联网
    CLIENT_BROKEN, // 硬件损坏
    CLIENT_CLOSED // 硬件关闭
};

// 客户端参数
struct ClientParam 
{
    uint8_t client_id;
    uint8_t panid;
    uint8_t gateway_id;
    enum ClientState client_state;
    pthread_mutex_t client_mutex; // 互斥量
};

// 网关状态
enum GatewayState
{
    GATEWAY_ORIGINAL= 0, // 关闭且未开始工作
    GATEWAY_WORKING, // 开启且已经开始工作
    GATEWAY_BROKEN // 模块损坏
};

// 网关参数
struct GatewayParam 
{
    uint8_t gateway_id;
    uint8_t panid;
    uint8_t client_infos[GATEWAY_MAX_CLIENT_NUM];
    uint8_t client_num;
    enum GatewayState gateway_state;
    pthread_mutex_t gateway_mutex; // 互斥量
};

// 消息类型
enum FrameType
{
    /*C --->  G*/
    CG_NET_JOIN = 0, // 入网请求
    CG_NET_QUIT, // 退网请求
    CG_DATA_SEND, // 数据传输请求
    /*G --->  C*/
    GC_REPLY_EXPECTED, // 上行请求执行成功
    GC_REPLY_UNEXPECTED, // 上行请求执行失败
};
// 消息数据帧格式
struct DataFrameFormat
{
    uint8_t begin_mark_1; // 0XFF
    uint8_t begin_mark_2; // 0XAA
    uint8_t client_id;  // 0 - 127
    uint8_t panid;  // 0 - 127
    uint8_t gateway_id;   // 0 - 127
    uint8_t frame_type;   // 0 - 127
    uint8_t attach_data;   // 0 - 127
    uint8_t* user_data;  // 在有数据携带时才会发送该指针所指缓冲区数据
    uint8_t crc_hi;   // 这个字节没有0XFF
    uint8_t crc_lo; // 这个字节会出现 0XFF，但是他的下一个字节不可能是00，必然是0XFF
    uint8_t end_mark_1; // 0XFF
    uint8_t end_mark_2; // 0X00
};
/******************************client_operate*********************************/
/**
 * @description: 将客户端网络状态切换为联网状态或者离线状态
 * @param adapter - 需要是一个已经打开的设备
 * @param aim_state - 需要转换的状态： CLIENT_CONNECT OR CLIENT_DISCONNECT
 * @return success: 0, failure: -1
 */
static uint8_t LoraClientConnectState(struct Adapter *adapter, enum ClientState aim_state);

/**
 * @description: 在联网状态下向网关发送数据
 * @param adapter - 需要是一个已经打开的设备
 * @param data_buffer - 数据缓冲区地址
 * @param data_length - 数据长度
 * @return success: 0, failure: -1
 */
static uint8_t LoraClientSendData(struct Adapter *adapter, uint8_t *data_buffer, uint8_t data_length);

/*****************************gateway_handlers*********************************/
// 网关处理客户端入网请求
static uint8_t GatewayJoinNetHandler(struct Adapter* adapter,struct DataFrameFormat* frame);
// 网关处理客户端退网请求
static uint8_t GatewayQuitNetHandler(struct Adapter* adapter,struct DataFrameFormat* frame);
// 网关处理客户端的数据传输请求
static uint8_t GatewayDataSendHandler(struct Adapter* adapter,struct DataFrameFormat* frame);
// 网关自动化处理程序任务，需要启动
static void *GatewayDaemonTask(void *param);

// 网关处理程序与消息类型的对照表
static uint8_t (*gateway_handlers[])(struct Adapter*,struct DataFrameFormat*) = 
{
    [CG_NET_JOIN] = GatewayJoinNetHandler,
    [CG_NET_QUIT] = GatewayQuitNetHandler,
    [CG_DATA_SEND] = GatewayDataSendHandler
};

/************************lora adapter function*********************************/
// 自定义注册函数
static int UserAdapterLoraRegister(struct Adapter *adapter);
// 自定义初始化函数
int UserAdapterLoraInit(void);