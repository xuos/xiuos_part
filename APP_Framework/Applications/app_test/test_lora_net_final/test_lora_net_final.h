#include <transform.h>
#include <adapter.h>

// #define AS_LORA_GATEWAY

/**
 * @brief: 节点测试函数
 * 1. 打开Lora硬件设施.
 * 2. 连接到网关.
*/
void TestNodeUp(void);

/**
 * @brief: 发送数据
*/
void TestNodeSend(void);

/**
 * @brief: 循环发送数据
*/
void TestNodeSendCycle(void);

/**
 * @brief: 网关测试函数
 * 1. 打开Lora硬件设施.
 * 2. 接入网络.
*/
void TestGateway(void);