#include "test_lora_p2p.h"

/******************************public_operate*********************************/
static const uint8_t table_crc_hi[] =
    {
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
        0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
        0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40};

static const uint8_t table_crc_lo[] =
    {
        0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06, 0x07, 0xC7, 0x05, 0xC5, 0xC4, 0x04, 0xCC, 0x0C, 0x0D, 0xCD, 0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09, 0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A,
        0x1E, 0xDE, 0xDF, 0x1F, 0xDD, 0x1D, 0x1C, 0xDC, 0x14, 0xD4, 0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3, 0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3, 0xF2, 0x32, 0x36, 0xF6, 0xF7, 0x37, 0xF5, 0x35, 0x34, 0xF4,
        0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A, 0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29, 0xEB, 0x2B, 0x2A, 0xEA, 0xEE, 0x2E, 0x2F, 0xEF, 0x2D, 0xED, 0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,
        0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60, 0x61, 0xA1, 0x63, 0xA3, 0xA2, 0x62, 0x66, 0xA6, 0xA7, 0x67, 0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F, 0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68,
        0x78, 0xB8, 0xB9, 0x79, 0xBB, 0x7B, 0x7A, 0xBA, 0xBE, 0x7E, 0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5, 0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71, 0x70, 0xB0, 0x50, 0x90, 0x91, 0x51, 0x93, 0x53, 0x52, 0x92,
        0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C, 0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B, 0x99, 0x59, 0x58, 0x98, 0x88, 0x48, 0x49, 0x89, 0x4B, 0x8B, 0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,
        0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42, 0x43, 0x83, 0x41, 0x81, 0x80, 0x40};

struct DataFrameFormat frame_send_buffer;        // 消息发送缓冲区
struct DataFrameFormat frame_recv_buffer;        // 消息接收缓冲区
uint8_t data_buffer[LORA_FRAME_USER_MAX_LENGTH]; // 数据发送/接收缓冲区

// 按照要求计算出数据帧的校验值
static uint8_t CalCrcDataFrameFormat(struct DataFrameFormat *frame)
{
    uint8_t crc_hi = 0xFF;
    uint8_t crc_lo = 0xFF;
    unsigned int temp;
    uint8_t *bit_arr = (uint8_t *)frame; // 转化为字节的方式进行数据访问

    uint8_t *temp_begin = bit_arr + 2; // 指向第二个数据段
    for (int i = 0; i < 5; i++)        // 计算第二个字段到第六个字段，计算完毕该指针失效
    {
        temp = crc_hi ^ *temp_begin++;
        crc_hi = crc_lo ^ table_crc_hi[temp];
        crc_lo = table_crc_lo[temp];
    }

    if (CG_DATA_SEND == frame->frame_type) // 是否携带了上传数据
    {
        if (NULL == frame->user_data)
        {
            printf("CalCrcDataFrameFormat: User data is null\n");
            return -1;
        }
        uint8_t data_length = frame->attach_data;
        temp_begin = frame->user_data;
        for (int i = 0; i < data_length; i++) // 计算上传数据的校验值
        {
            temp = crc_hi ^ *temp_begin++;
            crc_hi = crc_lo ^ table_crc_hi[temp];
            crc_lo = table_crc_lo[temp];
        }
    }

    frame->crc_lo = crc_lo;
    frame->crc_hi = crc_hi;

    return 0;
}

// 按照要求计算出数据帧的校验值
static uint8_t CheckCrcDataFrameFormat(struct DataFrameFormat *frame)
{
    uint8_t crc_hi = 0xFF;
    uint8_t crc_lo = 0xFF;
    unsigned int temp;
    uint8_t *bit_arr = (uint8_t *)frame; // 转化为字节的方式进行数据访问

    uint8_t *temp_begin = bit_arr + 2; // 指向第二个数据段
    for (int i = 0; i < 5; i++)        // 计算第二个字段到第六个字段，计算完毕该指针失效
    {
        temp = crc_hi ^ *temp_begin++;
        crc_hi = crc_lo ^ table_crc_hi[temp];
        crc_lo = table_crc_lo[temp];
    }

    if (CG_DATA_SEND == frame->frame_type) // 是否携带了上传数据
    {
        if (NULL == frame->user_data)
        {
            printf("CheckCrcDataFrameFormat: User data is null\n");
            return -1;
        }
        uint8_t data_length = frame->attach_data;
        temp_begin = frame->user_data;
        for (int i = 0; i < data_length; i++) // 计算上传数据的校验值
        {
            temp = crc_hi ^ *temp_begin++;
            crc_hi = crc_lo ^ table_crc_hi[temp];
            crc_lo = table_crc_lo[temp];
        }
    }

    frame->crc_lo = crc_lo;
    frame->crc_hi = crc_hi;

    return (frame->crc_hi == crc_hi && frame->crc_lo == crc_lo) ? 0 : -1;
}

// 初始化数据帧的头部标识和尾部标识
static void InitFrame(struct DataFrameFormat *frame)
{
    memset(frame, 0, sizeof(struct DataFrameFormat));
    frame->begin_mark_1 = LORA_FRAME_BEGIN_MARK_1;
    frame->begin_mark_2 = LORA_FRAME_BEGIN_MARK_2;
    frame->end_mark_1 = LORA_FRAME_END_MARK_1;
    frame->end_mark_2 = LORA_FRAME_END_MARK_2;
}

// 空中信号探测器，用于简易的信道碰撞检测，当一个周期未能收到数据时判定为信道空闲
static uint8_t SignalDetector(struct Adapter *adapter)
{
    uint8_t temp_dst;
    while (1 == AdapterDeviceRecv(adapter, &temp_dst, 1)) // 当读取数据超时时假定为信道空闲
    {
        printf("SignalDetector: Channel Occupied\n");
    }
    printf("SignalDetector: Channel Idle\n");
    return 0;
}

// 打印消息头数据
static void PrintFrame(struct DataFrameFormat *frame, char *prefix)
{
    printf("%s: ", prefix);
    printf("client: %X, pan: %X, gateway: %X, frame_type: ", frame->client_id, frame->panid, frame->gateway_id);
    switch (frame->frame_type)
    {
    case CG_NET_JOIN:
        printf(" - CG_NET_JOIN- ");
        break;
    case CG_NET_QUIT:
        printf(" - CG_NET_QUIT- ");
        break;
    case CG_DATA_SEND:
        printf(" - CG_DATA_SEND- ");
        break;
    case GC_REPLY_EXPECTED:
        printf(" - GC_REPLY_EXPECTED- ");
        break;
    case GC_REPLY_UNEXPECTED:
        printf(" - GC_REPLY_UNEXPECTED- ");
        break;
    default:
        break;
    }
    printf("attach_data: %X, crc: %X %X ", frame->attach_data, frame->crc_hi, frame->crc_lo);
    if (frame->frame_type == CG_DATA_SEND)
    {
        frame->user_data[frame->attach_data] = '\0';
        printf("user_data: %s \n", frame->user_data);
    }
    else
    {
        printf("\n");
    }
}

// 接收直到一个完整的数据帧并校验其完整性，不完整的数据会被丢弃
static uint8_t RecvFrame(struct Adapter *adapter, struct DataFrameFormat *frame)
{
    memset(frame, 0, sizeof(struct DataFrameFormat)); // 缓冲区数据初始化
    uint8_t header_temp[2] = {0, 0};                  // 头部数据查找缓冲区，一个用于接收数据，一个用于存储上一次接收到的数据

    while (1 == AdapterDeviceRecv(adapter, &header_temp[1], 1)) // 查找开始标志
    {
        if (LORA_FRAME_BEGIN_MARK_2 == header_temp[1]) // 查找到了第二个标志
        {
            if (LORA_FRAME_BEGIN_MARK_1 == header_temp[0]) // 查看上一次的数据是不是第一个标识
            {
                frame->begin_mark_1 = header_temp[0];
                frame->begin_mark_2 = header_temp[1];
                // 开始按照结构读取数据
                if (LORA_FRAME_NECK_LENGTH == AdapterDeviceRecv(adapter, &frame->client_id, LORA_FRAME_NECK_LENGTH)) // 接收除可能的用户数据以外的数据
                {
                    // 判断是否有用户数据
                    if (CG_DATA_SEND == frame->frame_type) // 存在用户数据
                    {
                        frame->user_data = data_buffer;                                                        // 关联数据缓冲区用于接收数据
                        if (frame->attach_data != AdapterDeviceRecv(adapter, data_buffer, frame->attach_data)) // 接收数据
                        {
                            printf("RecvFrame: Timeout or Failed 5\n");
                            break; // 接收用户数据失败或者超时
                        }
                    }
                    // 继续接收接下来的数据
                    if (LORA_FRAME_CRC_LENGTH + LORA_FRAME_MARK_LENGTH == AdapterDeviceRecv(adapter, &frame->crc_hi, LORA_FRAME_CRC_LENGTH + LORA_FRAME_MARK_LENGTH))
                    {
                        // 判断数据帧的完善性，看是否有尾巴
                        if (LORA_FRAME_END_MARK_1 == frame->end_mark_1 && LORA_FRAME_END_MARK_2 == frame->end_mark_2)
                        {
                            // 进行数据完整性校验
                            if (0 == CheckCrcDataFrameFormat(frame))
                            {
                                return 0; // 成功接收了一帧数据
                            }
                            printf("RecvFrame: CRC ERROR!\n");
                            break;
                        }
                        printf("RecvFrame: End ERROR!\n");
                        break;
                    }
                    printf("RecvFrame: Timeout or Failed 4\n");
                    break;
                }
                printf("RecvFrame: Timeout or Failed 3\n");
                break; // 找到了头数据，却没能收到完整数据的全部失败
            }
            else
            {
                header_temp[0] = header_temp[1]; // 记录这一次的数据
            }
        }
        else
        {
            header_temp[0] = header_temp[1]; // 记录这一次的数据
        }
    }

    return -1;
}

// 计算消息头校验并发送出去
static uint8_t SendFrame(struct Adapter *adapter, struct DataFrameFormat *frame)
{
    // 校验数据
    if (0 == CalCrcDataFrameFormat(frame))
    {
        // 发送公共信息
        if (LORA_FRAME_MARK_LENGTH + LORA_FRAME_NECK_LENGTH == AdapterDeviceSend(adapter, frame, LORA_FRAME_MARK_LENGTH + LORA_FRAME_NECK_LENGTH))
        {
            // 判断是否有需要发送的用户数据
            if (CG_DATA_SEND == frame->frame_type)
            {
                if (frame->attach_data != AdapterDeviceSend(adapter, frame->user_data, frame->attach_data))
                {
                    return -1;
                }
            }
            // 发送剩下的数据
            if (LORA_FRAME_MARK_LENGTH + LORA_FRAME_CRC_LENGTH == AdapterDeviceSend(adapter, &frame->crc_hi, LORA_FRAME_MARK_LENGTH + LORA_FRAME_CRC_LENGTH))
            {
                return 0;
            }
        }
    }
    return -1;
}

// 切换Lora的工作模式
static void LoraModeConfig(struct Adapter *adapter, enum LoraMode mode)
{
    if (adapter->net_protocol == PRIVATE_PROTOCOL)
    {
        struct PrivProtocolDone *done = (struct PrivProtocolDone *)adapter->done;
        done->ioctl(adapter, mode, NULL);

        printf("LoraModeConfig: Config Lora %s\n", mode == LORA_WORK ? "Working" : "Sleeping");
    }
    else
    {
        printf("LoraModeConfig: Config Lora Fail\n");
    }
}

// 客户端数据帧过滤器
static uint8_t LoraClientFrameFilter(struct ClientParam *client_param, struct DataFrameFormat *frame)
{
    if (client_param->panid != frame->panid) // 是否是同一个网络
    {
        printf("LoraFrameFilter: Different Networks\n");
        return -1;
    }

    if (client_param->gateway_id != 0 && client_param->gateway_id != frame->gateway_id) // 不是该客户端所连接的网关
    {
        printf("LoraFrameFilter: Different Gateway\n");
        return -1;
    }

    if (client_param->client_id != frame->client_id) // 不是该客户端所连接的网关
    {
        printf("LoraFrameFilter: Not For This Client\n");
        return -1;
    }

    return 0;
}

// 网关数据帧过滤器
static uint8_t LoraGatewayFrameFilter(struct GatewayParam *gateway_param, struct DataFrameFormat *frame)
{
    if (gateway_param->panid != frame->panid) // 是否是同一个网络
    {
        printf("LoraFrameFilter: Different Networks\n");
        return -1;
    }

    if (frame->gateway_id == 0 && frame->frame_type == CG_NET_JOIN) // 入网请求
    {
        return 0;
    }

    if (frame->gateway_id != gateway_param->gateway_id) // 不是该网关所连接的客户端
    {
        printf("LoraFrameFilter: Different Gateway\n");
        return -1;
    }

    return 0;
}

/******************************client_operate*********************************/
static uint8_t LoraClientConnectState(struct Adapter *adapter, enum ClientState aim_state)
{
    if (aim_state == CLIENT_CONNECT || aim_state == CLIENT_DISCONNECT) // 只支持联网和退网
    {
        struct ClientParam *client_param = (struct ClientParam *)adapter->adapter_param;

        if (client_param->client_state == aim_state) // 已经处于目标状态
        {
            printf("LoraClientConnectState: Client %s Before\n", aim_state == CLIENT_CONNECT ? "Connect" : "Disconnect");
            return 0;
        }

        PrivMutexObtain(&client_param->client_mutex); // 获取lora的使用权
        LoraModeConfig(adapter, LORA_WORK);           // 切换Lora到普通接收模式

        InitFrame(&frame_send_buffer); // 准备数据帧
        frame_send_buffer.client_id = client_param->client_id;
        frame_send_buffer.panid = client_param->panid;
        frame_send_buffer.gateway_id = client_param->gateway_id;
        frame_send_buffer.frame_type = aim_state == CLIENT_CONNECT ? CG_NET_JOIN : CG_NET_QUIT;

        while (1) // 不停的发送信息直到收到正确的响应
        {
            SignalDetector(adapter); // 监听信道直到信道空闲

            if (0 == SendFrame(adapter, &frame_send_buffer))
            {
                printf("LoraClientConnectState: Send Frame Success\n");
                PrintFrame(&frame_send_buffer, "LoraClientConnectState Send");
                if (0 == RecvFrame(adapter, &frame_recv_buffer)) // 成功接收到了一个数据帧
                {
                    printf("LoraClientConnectState: Recv Frame Success\n");
                    PrintFrame(&frame_recv_buffer, "LoraClientConnectState Recv");
                    if (0 == LoraClientFrameFilter(client_param, &frame_recv_buffer)) // 判断这个数据帧是不是自己
                    {
                        if (frame_recv_buffer.frame_type == GC_REPLY_EXPECTED) // 请求成功
                        {
                            client_param->gateway_id = aim_state == CLIENT_CONNECT ? frame_recv_buffer.gateway_id : 0;
                            client_param->client_state = aim_state;

                            printf("LoraClientConnectState: Success - > Client(%X) Gateway(%X) %s\n", client_param->client_id, client_param->gateway_id, aim_state == CLIENT_CONNECT ? "Connect" : "Disconnect");
                            break;
                        }
                        else
                        {
                            printf("LoraClientConnectState: Fail And Try Again\n");
                        }
                    }
                }
                else
                {
                    printf("LoraClientConnectState: Recv Frame Failed\n");
                }
            }
            else
            {
                printf("LoraClientConnectState: Send Frame Failed\n");
            }
        }

        LoraModeConfig(adapter, LORA_SLEEP);           // 切换Lora到休眠状态
        PrivMutexAbandon(&client_param->client_mutex); // 释放Lora

        return 0;
    }
    else
    {
        printf("LoraClientConnectState: Not Supported!\n");
        return -1;
    }
}

static uint8_t LoraClientSendData(struct Adapter *adapter, uint8_t *data_buffer, uint8_t data_length)
{
    struct ClientParam *client_param = (struct ClientParam *)adapter->adapter_param;

    if (client_param->client_state == CLIENT_CONNECT) // 只有处于联网状态的客户端才可以进行数据传输任务
    {
        PrivMutexObtain(&client_param->client_mutex); // 拿到控制权
        LoraModeConfig(adapter, LORA_WORK);           // 切换Lora为工作模式

        InitFrame(&frame_send_buffer); // 准备消息头
        frame_send_buffer.client_id = client_param->client_id;
        frame_send_buffer.panid = client_param->panid;
        frame_send_buffer.gateway_id = client_param->gateway_id;
        frame_send_buffer.frame_type = CG_DATA_SEND;
        frame_send_buffer.user_data = data_buffer;   // 关联数据缓冲区
        frame_send_buffer.attach_data = data_length; // 数据长度

        while (1) // 不停的发送信息直到收到正确的响应
        {
            SignalDetector(adapter); // 监听信道直到信道空闲

            if (0 == SendFrame(adapter, &frame_send_buffer))
            {
                printf("LoraClientSendData: Send Frame Success\n");
                PrintFrame(&frame_send_buffer, "LoraClientSendData Send");
                if (0 == RecvFrame(adapter, &frame_recv_buffer)) // 成功接收到了一个数据帧
                {
                    printf("LoraClientSendData: Recv Frame Success\n");
                    PrintFrame(&frame_recv_buffer, "LoraClientSendData Recv");
                    if (0 == LoraClientFrameFilter(client_param, &frame_recv_buffer)) // 判断这个数据帧是不是自己
                    {
                        if (frame_recv_buffer.frame_type == GC_REPLY_EXPECTED) // 发送成功
                        {
                            printf("LoraClientSendData: Send Data Success\n");
                            break;
                        }
                        else
                        {
                            printf("LoraClientSendData: Fail And Try Again\n");
                        }
                    }
                }
                else
                {
                    printf("LoraClientSendData: Recv Frame Failed\n");
                }
            }
            else
            {
                printf("LoraClientSendData: Send Frame Failed\n");
            }
        }

        LoraModeConfig(adapter, LORA_SLEEP);           // 切换Lora到睡眠模式
        PrivMutexAbandon(&client_param->client_mutex); // 释放Lora

        return 0;
    }
    else
    {
        printf("LoraClientSendData: Client Is Disconnect\n");
        return -1;
    }
}

/**************************gateway_handlers*********************************/

// 网关处理客户端入网请求
static uint8_t GatewayJoinNetHandler(struct Adapter *adapter, struct DataFrameFormat *frame)
{
    PrintFrame(frame, "GatewayJoinNetHandler Recv");

    struct GatewayParam *gateway_param = (struct GatewayParam *)adapter->adapter_param;

    frame->gateway_id = gateway_param->gateway_id; // 确保网关设备参数正确传递

    if (gateway_param->client_num == GATEWAY_MAX_CLIENT_NUM) // 判断网关连接的客户端是否达到上限
    {
        printf("GatewayJoinNetHandler: Too much client\n");
        frame->frame_type = GC_REPLY_UNEXPECTED;
        if (0 != SendFrame(adapter, frame))
        {
            printf("GatewayJoinNetHandler: Client(%X) Join Gateway(%X) Failed 1 !\n", frame->client_id, gateway_param->gateway_id);
            return -1;
        }
        PrintFrame(frame, "GatewayJoinNetHandler Send");
        printf("GatewayJoinNetHandler: Client(%X) Join Gateway(%X) Failed (MAX)!\n", frame->client_id, gateway_param->gateway_id);
        return -1;
    }

    for (int i = 0; i < gateway_param->client_num; i++) // 判断该客户端是否已经连接过了
    {
        if (gateway_param->client_infos[i] == frame->client_id)
        {
            printf("GatewayJoinNetHandler: Joined before\n");
            frame->frame_type = GC_REPLY_EXPECTED;
            if (0 != SendFrame(adapter, frame))
            {
                printf("GatewayJoinNetHandler: Client(%X) Join Gateway(%X) Failed 2 !\n", frame->client_id, gateway_param->gateway_id);
                return -1;
            }
            PrintFrame(frame, "GatewayJoinNetHandler Send");
            printf("GatewayJoinNetHandler: Client(%X) Join Gateway(%X) Success!\n", frame->client_id, gateway_param->gateway_id);
            return 0;
        }
    }

    gateway_param->client_infos[gateway_param->client_num] = frame->client_id;
    gateway_param->client_num++;
    frame->frame_type = GC_REPLY_EXPECTED; // 成功连接到网关
    frame->gateway_id = gateway_param->gateway_id;
    if (0 != SendFrame(adapter, frame))
    {
        printf("GatewayJoinNetHandler: Client(%X) Join Gateway(%X) Failed 3 !\n", frame->client_id, gateway_param->gateway_id);
        return -1;
    }
    PrintFrame(frame, "GatewayJoinNetHandler Send");
    printf("GatewayJoinNetHandler: Client(%X) Join Gateway(%X) Success!\n", frame->client_id, gateway_param->gateway_id);
    return 0;
}

// 网关处理客户端退网请求
static uint8_t GatewayQuitNetHandler(struct Adapter *adapter, struct DataFrameFormat *frame)
{
    PrintFrame(frame, "GatewayQuitNetHandler Recv");

    struct GatewayParam *gateway_param = (struct GatewayParam *)adapter->adapter_param;

    for (int i = 0; i < gateway_param->client_num; i++)
    {
        // 移除这个客户端的信息
        if (gateway_param->client_infos[i] == frame->client_id)
        {
            for (int j = i; j < gateway_param->client_num - 1; j++)
            {
                gateway_param->client_infos[j] = gateway_param->client_infos[j + 1];
            }
            gateway_param->client_num--;
            break;
        }
    }

    frame->frame_type = GC_REPLY_EXPECTED;
    if (0 != SendFrame(adapter, frame))
    {
        printf("GatewayQuitNetHandler: Client(%X) Quit Gateway(%X) Failed!\n", frame->client_id, gateway_param->gateway_id);
        return -1;
    }
    PrintFrame(frame, "GatewayQuitNetHandler Send");
    printf("GatewayQuitNetHandler: Client(%X) Quit Gateway(%X) Success!\n", frame->client_id, gateway_param->gateway_id);
    return 0;
}

// 网关处理客户端的数据传输请求
static uint8_t GatewayDataSendHandler(struct Adapter *adapter, struct DataFrameFormat *frame)
{
    PrintFrame(frame, "GatewayDataSendHandler Recv");

    frame->frame_type = GC_REPLY_EXPECTED;

    if (0 != SendFrame(adapter, frame))
    {
        printf("GatewayDataSendHandler: Client(%X) Send Data To Gateway(%X) Failed!\n", frame->client_id, frame->gateway_id);
        return -1;
    }
    PrintFrame(frame, "GatewayDataSendHandler Send");
    printf("GatewayDataSendHandler: Client(%X) Send Data To Gateway(%X) Success!\n", frame->client_id, frame->gateway_id);
    return 0;
}

// 网关自动程序
static void *GatewayDaemonTask(void *param)
{
    struct Adapter *gateway_adapter = (struct Adapter *)param;
    if (gateway_adapter == NULL) // 判断参数合法性
    {
        return NULL;
    }

    struct GatewayParam *gateway_param = (struct GatewayParam *)gateway_adapter->adapter_param;
    if (gateway_param->gateway_state != GATEWAY_WORKING)
    {
        if (0 != AdapterDeviceOpen(gateway_adapter)) // 开启Lora模块以接收消息
        {
            return NULL;
        }
        gateway_param->gateway_state = GATEWAY_WORKING;
    }

    PrivMutexObtain(&gateway_param->gateway_mutex); // 获取Lora控制权

    while (1) // 内部业务大循环
    {
        if (0 == RecvFrame(gateway_adapter, &frame_recv_buffer) && 0 == LoraGatewayFrameFilter(gateway_param, &frame_recv_buffer)) // 是否接收成功且是发给自己的
        {
            gateway_handlers[frame_recv_buffer.frame_type](gateway_adapter, &frame_recv_buffer); // 根据消息类型，调用指定处理函数
        }
        else
        {
            printf("GatewayDaemonTask: Recv No Frame\n");
        }
    }

    PrivMutexAbandon(&gateway_param->gateway_mutex); // 释放Lora

    printf("GatewayDaemonTask: Exit!\n");
    return NULL;
}

/**************************test_funcations*********************************/
#ifdef AS_LORA_GATEWAY_ROLE

void TestLoraGateway(void)
{
    struct Adapter *gateway_adapter = (struct Adapter *)AdapterDeviceFindByName(ADAPTER_LORA_NAME);

    UtaskType gateway_task;
    gateway_task.prio = 24;
    gateway_task.stack_size = 2048;
    gateway_task.func_param = gateway_adapter;
    gateway_task.func_entry = GatewayDaemonTask;
    strncpy(gateway_task.name, "lora_gateway_task", strlen("lora_gateway_task"));

    int32_t gateway_task_id = UserTaskCreate(gateway_task);

    if (gateway_task_id > 0)
    {
        printf("TestLoraGateway: Create Gateway Task Success\n");
        if (0 == UserTaskStartup(gateway_task_id))
        {
            printf("TestLoraGateway: Start Gateway Task Success\n");
        }
        else
        {
            printf("TestLoraGateway: Start Gateway Task Failed\n");
        }
    }
    else
    {
        printf("TestLoraGateway: Create Gateway Task Failed\n");
    }
}
PRIV_SHELL_CMD_FUNCTION(TestLoraGateway, TestLoraGateway No Param, PRIV_SHELL_CMD_MAIN_ATTR);

#else
void TestLoraConnectState(int user_state)
{
    enum ClientState state;
    if (user_state == 0)
    {
        state = CLIENT_DISCONNECT;
        printf("TestLoraConnectState: Config Lora Disconnect\n");
    }
    else if (user_state == 1)
    {
        state = CLIENT_CONNECT;
        printf("TestLoraConnectState: Config Lora Connect\n");
    }
    else
    {
        printf("TestLoraConnectState: Not Suport 0-CLIENT_DISCONNECT 1-CLIENT_CONNECT\n");
    }
    
    struct Adapter *client_adapter = (struct Adapter *)AdapterDeviceFindByName(ADAPTER_LORA_NAME);
    if (0 == AdapterDeviceOpen(client_adapter))
    {
        if (0 == LoraClientConnectState(client_adapter, state))
        {
            printf("TestLoraConnectState: Config Lora Connect State Success\n");
        }
        else
        {
            printf("TestLoraConnectState: Config Lora Connect State Failed\n");
        }
    }
    else
    {
        printf("TestLoraConnectState:  Lora Open Failed\n");
    }
}
PRIV_SHELL_CMD_FUNCTION(TestLoraConnectState, Only Suport 0-CLIENT_DISCONNECT 1-CLIENT_CONNECT, PRIV_SHELL_CMD_FUNC_ATTR);

void TestLoraSendData(char* data)
{
    struct Adapter *client_adapter = (struct Adapter *)AdapterDeviceFindByName(ADAPTER_LORA_NAME);
    if (0 == AdapterDeviceOpen(client_adapter))
    {
        if (0 == LoraClientSendData(client_adapter, data,strlen(data)))
        {
            printf("TestLoraSendData: Send Data Success\n");
        }
        else
        {
            printf("TestLoraSendData: Send Data Failed\n");
        }
    }
    else
    {
        printf("TestLoraSendData:  Lora Open Failed\n");
    }
}
PRIV_SHELL_CMD_FUNCTION(TestLoraSendData, char* data param, PRIV_SHELL_CMD_FUNC_ATTR);

void TestLoraClient(void)
{
    struct Adapter *client_adapter = (struct Adapter *)AdapterDeviceFindByName(ADAPTER_LORA_NAME);
    if (0 == AdapterDeviceOpen(client_adapter))
    {
        printf("TestLoraClient: Open Lora Success!\n");
        if (0 == LoraClientConnectState(client_adapter, CLIENT_CONNECT))
        {
            printf("TestLoraClient: Client Join Net Success!\n");
            if (0 == LoraClientSendData(client_adapter, "Hello,Gateway!", strlen("Hello,Gateway!")))
            {
                printf("TestLoraClient: Client Send Data Success!\n");
                if (0 == LoraClientConnectState(client_adapter, CLIENT_DISCONNECT))
                {
                    printf("TestLoraClient: Client Quit Net Success!\n");
                    if (0 == LoraClientConnectState(client_adapter, CLIENT_CONNECT))
                    {
                        printf("TestLoraClient: Client Join Net Success!\n");
                    }
                    else
                    {
                        printf("TestLoraClient: Client Join Net Failed!\n");
                    }
                }
                else
                {
                    printf("TestLoraClient: Client Quit Net Failed!\n");
                }
            }
            else
            {
                printf("TestLoraClient: Client Send Data Fail!\n");
            }
        }
        else
        {
            printf("TestLoraClient: Client Join Net Fail!\n");
        }
    }
    else
    {
        printf("TestLoraClient: Open Lora Failed!\n");
    }
}
PRIV_SHELL_CMD_FUNCTION(TestLoraClient, TestLoraClient No Param, PRIV_SHELL_CMD_MAIN_ATTR);

#endif
/*******************LORA ADAPTER FUNCTION********************/
static int UsrAdapterLoraRegister(struct Adapter *adapter)
{
    int ret = 0;
    struct GatewayParam *gateway_param;
    struct ClientParam *client_param;
    strncpy(adapter->name, ADAPTER_LORA_NAME, NAME_NUM_MAX);
    adapter->net_protocol = PRIVATE_PROTOCOL;
#ifdef AS_LORA_GATEWAY_ROLE
    gateway_param = PrivMalloc(sizeof(struct GatewayParam));
    if (!gateway_param)
    {
        PrivFree(gateway_param);
        return -1;
    }
    memset(gateway_param, 0, sizeof(struct GatewayParam));
    gateway_param->gateway_id = DEAFULT_GATEWAY_ID;
    gateway_param->panid = DEAFULT_PANID;
    gateway_param->gateway_state = GATEWAY_ORIGINAL;
    PrivMutexCreate(&gateway_param->gateway_mutex, 0);
    adapter->net_role = GATEWAY;
    adapter->net_role_id = DEAFULT_GATEWAY_ID;
    adapter->adapter_param = (void *)gateway_param;
#else // AS_LORA_CLIENT_ROLE
    client_param = PrivMalloc(sizeof(struct ClientParam));
    if (!client_param)
    {
        PrivFree(client_param);
        return -1;
    }
    memset(client_param, 0, sizeof(struct ClientParam));
    client_param->client_id = DEAFULT_CLIENT_ID;
    client_param->panid = DEAFULT_PANID;
    client_param->gateway_id = 0;
    client_param->client_state = CLIENT_DISCONNECT;
    PrivMutexCreate(&client_param->client_mutex, 0);
    adapter->net_role = CLIENT;
    adapter->net_role_id = DEAFULT_CLIENT_ID;
    adapter->adapter_param = (void *)client_param;
#endif
    adapter->adapter_status = UNREGISTERED;
    ret = AdapterDeviceRegister(adapter);
    if (ret < 0)
    {
        printf("Adapter lora register error\n");
        if (gateway_param)
            PrivFree(gateway_param);
        if (client_param)
            PrivFree(client_param);
        return -1;
    }
    return ret;
}

int UsrAdapterLoraInit(void)
{
    int ret = 0;
    struct Adapter *adapter = PrivMalloc(sizeof(struct Adapter));
    if (!adapter)
    {
        PrivFree(adapter);
        return -1;
    }
    memset(adapter, 0, sizeof(struct Adapter));
    ret = UsrAdapterLoraRegister(adapter);
    if (ret < 0)
    {
        printf("AdapterLoraInit register lora adapter error\n");
        PrivFree(adapter);
        return -1;
    }
    AdapterProductInfoType product_info = E220Attach(adapter);
    if (!product_info)
    {
        printf("AdapterLoraInit e220 attach error\n");
        PrivFree(adapter);
        return -1;
    }
    adapter->product_info_flag = 1;
    adapter->info = product_info;
    adapter->done = product_info->model_done;
    PrivSemaphoreCreate(&adapter->sem, 0, 0);
    PrivMutexCreate(&adapter->lock, 0);
    return ret;
}
