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
* @date:    2023/8/22
*/

#include<adapter.h>
#include<transform.h>

#define LORA_DATA_MAX_LENGTH 128

#define LORA_HEADER_LENGTH 7
#define LORA_HEADER_RAW_LENGTH 5
#define LORA_USER_DATA_MAX_LENGTH LORA_DATA_MAX_LENGTH - LORA_HEADER_LENGTH

#define GATEWAY_MAX_CLIENT_NUM 20

#define DEAFULT_PANID 0XA
#define DEAFULT_CLIENT_ID 0XB
#define DEAFULT_GATEWAY_ID 0XC

extern AdapterProductInfoType E220Attach(struct Adapter *adapter);

enum ClientState
{
    CLIENT_DISCONNECT = 0,
    CLIENT_CONNECT,
};

struct LoraClientParam 
{
    uint8_t client_id;
    uint8_t panid;
    uint8_t gateway_id;
    enum ClientState client_state;
    int client_mtx;
};

struct LoraGatewayParam 
{
    uint8_t gateway_id;
    uint8_t panid;
    uint8_t client_id[GATEWAY_MAX_CLIENT_NUM];
    int client_num;
    int gateway_mtx;
};

enum LoraDataType
{
    /*****C --->  G*/
    CLIENT_JOIN_NET_REQUEST = 0,
    CLIENT_QUIT_NET_REQUEST,
    CLIENT_SEND_TEST_DATA_TO_GATEWAY_REQUEST,
    /*****G --->  C*/
    GATEWAY_REPLY_CLIENT_RESULT_EXPECTED,
    GATEWAY_REPLY_CLIENT_RESULT_UN_EXPECTED,
};

struct LoraHeaderFormat
{
    uint8_t client_id; //1
    uint8_t panid;//1
    uint8_t gateway_id; //1
    uint8_t lora_data_type; //1
    uint8_t data; //1
    uint8_t crc_lo;
    uint8_t crc_hi; //2
};

/**************************gateway_handlers*********************************/
static int ClientJoinNetHandler(struct Adapter* adapter,struct LoraHeaderFormat* header);
static int ClientQuitNetHandler(struct Adapter* adapter,struct LoraHeaderFormat* header);
static int ClientSendTestDataHandler(struct Adapter* adapter,struct LoraHeaderFormat* header);

static int (*gateway_handlers[])(struct Adapter*,struct LoraHeaderFormat*) = 
{
    [CLIENT_JOIN_NET_REQUEST] = ClientJoinNetHandler,
    [CLIENT_QUIT_NET_REQUEST] = ClientQuitNetHandler,
    [CLIENT_SEND_TEST_DATA_TO_GATEWAY_REQUEST] = ClientSendTestDataHandler,
};