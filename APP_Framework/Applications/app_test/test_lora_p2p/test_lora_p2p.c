#include "test_lora_p2p.h"

/**************************PublicOperations*********************************/
static const uint8_t table_crc_hi[] = {
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1,0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1,0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40,
    0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1,0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40,
    0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40, 0x00, 0xC1, 0x81, 0x40,
    0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0, 0x80, 0x41, 0x00, 0xC1,0x81, 0x40, 0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41,
    0x00, 0xC1, 0x81, 0x40, 0x01, 0xC0, 0x80, 0x41, 0x01, 0xC0,0x80, 0x41, 0x00, 0xC1, 0x81, 0x40
};

static const uint8_t table_crc_lo[] = {
    0x00, 0xC0, 0xC1, 0x01, 0xC3, 0x03, 0x02, 0xC2, 0xC6, 0x06,0x07, 0xC7, 0x05, 0xC5, 0xC4, 0x04, 0xCC, 0x0C, 0x0D, 0xCD,
    0x0F, 0xCF, 0xCE, 0x0E, 0x0A, 0xCA, 0xCB, 0x0B, 0xC9, 0x09,0x08, 0xC8, 0xD8, 0x18, 0x19, 0xD9, 0x1B, 0xDB, 0xDA, 0x1A,
    0x1E,0xDE, 0xDF, 0x1F,0xDD,0x1D,0x1C,0xDC, 0x14, 0xD4,0xD5, 0x15, 0xD7, 0x17, 0x16, 0xD6, 0xD2, 0x12, 0x13, 0xD3,
    0x11, 0xD1, 0xD0, 0x10, 0xF0, 0x30, 0x31, 0xF1, 0x33, 0xF3,0xF2, 0x32, 0x36, 0xF6, 0xF7, 0x37, 0xF5, 0x35, 0x34, 0xF4,
    0x3C, 0xFC, 0xFD, 0x3D, 0xFF, 0x3F, 0x3E, 0xFE, 0xFA, 0x3A,0x3B, 0xFB, 0x39, 0xF9, 0xF8, 0x38, 0x28, 0xE8, 0xE9, 0x29,
    0xEB, 0x2B, 0x2A, 0xEA, 0xEE, 0x2E, 0x2F, 0xEF, 0x2D, 0xED,0xEC, 0x2C, 0xE4, 0x24, 0x25, 0xE5, 0x27, 0xE7, 0xE6, 0x26,
    0x22, 0xE2, 0xE3, 0x23, 0xE1, 0x21, 0x20, 0xE0, 0xA0, 0x60,0x61, 0xA1, 0x63, 0xA3, 0xA2, 0x62, 0x66, 0xA6, 0xA7, 0x67,
    0xA5, 0x65, 0x64, 0xA4, 0x6C, 0xAC, 0xAD, 0x6D, 0xAF, 0x6F,0x6E, 0xAE, 0xAA, 0x6A, 0x6B, 0xAB, 0x69, 0xA9, 0xA8, 0x68,
    0x78, 0xB8, 0xB9, 0x79, 0xBB, 0x7B, 0x7A, 0xBA, 0xBE, 0x7E,0x7F, 0xBF, 0x7D, 0xBD, 0xBC, 0x7C, 0xB4, 0x74, 0x75, 0xB5,
    0x77, 0xB7, 0xB6, 0x76, 0x72, 0xB2, 0xB3, 0x73, 0xB1, 0x71,0x70, 0xB0, 0x50, 0x90, 0x91, 0x51, 0x93, 0x53, 0x52, 0x92,
    0x96, 0x56, 0x57, 0x97, 0x55, 0x95, 0x94, 0x54, 0x9C, 0x5C,0x5D, 0x9D, 0x5F, 0x9F, 0x9E, 0x5E, 0x5A, 0x9A, 0x9B, 0x5B,
    0x99, 0x59, 0x58, 0x98, 0x88, 0x48, 0x49, 0x89, 0x4B, 0x8B,0x8A, 0x4A, 0x4E, 0x8E, 0x8F, 0x4F, 0x8D, 0x4D, 0x4C, 0x8C,
    0x44, 0x84, 0x85, 0x45, 0x87, 0x47, 0x46, 0x86, 0x82, 0x42,0x43, 0x83, 0x41, 0x81, 0x80, 0x40
};

void CalCrc(uint8_t const *data_src, uint16_t raw_data_len, uint8_t* crc_lo_dst, uint8_t* crc_hi_dst)
{
    uint8_t crc_hi = 0xFF; 
    uint8_t crc_lo = 0xFF; 
    unsigned int i; 

    while (raw_data_len--) {
        i = crc_hi ^ *data_src++; 
        crc_hi = crc_lo ^ table_crc_hi[i];
        crc_lo = table_crc_lo[i];
    }
    *crc_lo_dst = crc_lo;
    *crc_hi_dst = crc_hi;
}

int CheckCrc(uint8_t const *data_src, uint16_t raw_data_len, uint8_t crc_lo_dst, uint8_t crc_hi_dst)
{
    uint8_t crc_hi = 0xFF; 
    uint8_t crc_lo = 0xFF; 
    unsigned int i; 

    while (raw_data_len--) {
        i = crc_hi ^ *data_src++; 
        crc_hi = crc_lo ^ table_crc_hi[i];
        crc_lo = table_crc_lo[i];
    }

    if (crc_lo == crc_lo_dst && crc_hi == crc_hi_dst)
    {
        return 0;
    }
    return -1;
}

uint8_t crc_data_buffer[LORA_DATA_MAX_LENGTH];
uint8_t crc_header_buffer[LORA_HEADER_RAW_LENGTH];

void ShowHeader(struct LoraHeaderFormat* header)
{
    printf("Header(client_id: %X panid: %X gateway_id: %X data_type: %d data: %d crc_lo: %X crc_hi: %X)\n",header->client_id,header->panid,header->gateway_id,header->lora_data_type,header->data,header->crc_lo,header->crc_hi);
}

void CalHeaderCrc(struct LoraHeaderFormat* header)
{
    memcpy(crc_header_buffer,header,LORA_HEADER_RAW_LENGTH);
    CalCrc(crc_header_buffer,LORA_HEADER_RAW_LENGTH,&header->crc_lo,&header->crc_hi);
    ShowHeader(header);
}

uint16_t CheckHeaderCrc(struct LoraHeaderFormat* header)
{
    printf("Start the datagram integrity check:  ");
    ShowHeader(header);

    memcpy(crc_header_buffer,header,LORA_HEADER_RAW_LENGTH);
    if (0 == CheckCrc(crc_header_buffer,LORA_HEADER_RAW_LENGTH,header->crc_lo,header->crc_hi))
    {
        printf("The datagram integrity check passes\n");
        return 0;
    }
    printf("Datagram integrity check failed\n");
    return -1;
}

struct LoraHeaderFormat header_send_buffer;
struct LoraHeaderFormat header_recv_buffer;

static int LoraRecvHeader(struct Adapter* adapter, struct LoraHeaderFormat* header)
{
    UserTaskDelay(1000);

    if (LORA_HEADER_LENGTH == AdapterDeviceRecv(adapter,header,LORA_HEADER_LENGTH ))
    {
        if (0 == CheckHeaderCrc(header))
        {
            UserTaskDelay(500);
            return LORA_HEADER_LENGTH;
        }
    }

    return -1;
}

static int LoraSendHeader(struct Adapter* adapter, struct LoraHeaderFormat* header)
{
    UserTaskDelay(500);

    CalHeaderCrc(header);

    if (LORA_HEADER_LENGTH == AdapterDeviceSend(adapter,header,LORA_HEADER_LENGTH ))
    {
        UserTaskDelay(1000);
        return LORA_HEADER_LENGTH;
    }

    return -1;
}

static int LoraSendData(struct Adapter* adapter,uint8_t* src_data, uint16_t raw_data_length)
{
    if (raw_data_length > LORA_DATA_MAX_LENGTH - 2)
    {
        printf("The amount of data exceeds the limit\n");
        return -1;
    }

    UserTaskDelay(500);
    
    CalCrc(src_data,raw_data_length,src_data + raw_data_length, src_data + raw_data_length + 1);

    if (raw_data_length + 2 == AdapterDeviceSend(adapter,src_data,raw_data_length + 2 ))
    {
        uint8_t crc_lo = src_data[raw_data_length];
        uint8_t crc_hi = src_data[raw_data_length + 1];
        src_data[raw_data_length] = '\0';

        printf("Send data : %s crc_lo: %X crc_hi: %X \n",src_data,crc_lo,crc_hi);

        UserTaskDelay(1000);
        return raw_data_length + 2;
    }
    
    return -1;
}

static int LoraRecvData(struct Adapter* adapter, uint8_t* dest_data, uint16_t data_length)
{

    if (data_length > LORA_DATA_MAX_LENGTH)
    {
        printf("The amount of data exceeds the limit\n");
        return -1;
    }

    UserTaskDelay(1000);

    if (data_length == AdapterDeviceRecv(adapter,dest_data,data_length))
    {
        UserTaskDelay(500);
        if (0 == CheckCrc(dest_data,data_length -2,dest_data[data_length-2],dest_data[data_length-1]))
        {
            return data_length;
        }
    }
    return -1;
}

/**************************ClientOperations*********************************/
uint8_t client_data_send_buffer[LORA_DATA_MAX_LENGTH];
static int LoraClientJoinNet()
{
    struct Adapter* adapter = AdapterDeviceFindByName(ADAPTER_LORA_NAME);
    if (adapter == NULL)
    {
        printf("Connection framework fundamental error\n");
        return -1;
    }
    
    struct LoraClientParam* client_param =(struct LoraClientParam*) adapter->adapter_param;

    if (INSTALL != adapter->adapter_status || 0 != AdapterDeviceOpen(adapter))
    {
        printf("The Lora device failed to open\n");
        return -1;
    }
    UserMutexObtain(client_param->client_mtx, -1);

    memset(&header_send_buffer,0,LORA_HEADER_LENGTH);

    header_send_buffer.client_id=client_param->client_id;
    header_send_buffer.panid = client_param->panid;
    header_send_buffer.lora_data_type = CLIENT_JOIN_NET_REQUEST;
    
    if (LORA_HEADER_LENGTH != LoraSendHeader(adapter,&header_send_buffer))
    {
        printf("The header of the incoming request failed to be sent\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }
    
    memset(&header_recv_buffer,0,LORA_HEADER_LENGTH);

    if (LORA_HEADER_LENGTH != LoraRecvHeader(adapter,&header_recv_buffer))
    {
        printf("Failed to receive the gateway inbound response data\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }

    if (header_recv_buffer.lora_data_type == GATEWAY_REPLY_CLIENT_RESULT_UN_EXPECTED)
    {
        printf("The gateway cannot accept the client from the network\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }
    
    client_param->client_state = CLIENT_CONNECT;
    client_param->gateway_id = header_recv_buffer.gateway_id;

    printf("The client successfully joins the network through the gateway\n");
    UserMutexAbandon(client_param->client_mtx);

    return 0;
}

static int LoraClientSendData(void* data, uint16_t raw_data_length)
{
    if (raw_data_length > LORA_DATA_MAX_LENGTH - 2)
    {
        printf("The data load exceeds the limit\n");
        return -1;
    }
    
    struct Adapter* adapter = AdapterDeviceFindByName(ADAPTER_LORA_NAME);
    if (adapter == NULL)
    {
        printf("Connection framework fundamental error\n");
        return -1;
    }
    
    struct LoraClientParam* client_param =(struct LoraClientParam*) adapter->adapter_param;

    if (INSTALL != adapter->adapter_status || 0 != AdapterDeviceOpen(adapter))
    {
        printf("The Lora device failed to open\n");
        return -1;
    }

    if (client_param->client_state != CLIENT_CONNECT)
    {
        printf("This client has not connected to gateway\n");
        return -1;
    }

    UserMutexObtain(client_param->client_mtx, -1);
    
    memset(&header_send_buffer,0,LORA_HEADER_LENGTH);

    header_send_buffer.client_id=client_param->client_id;
    header_send_buffer.panid = client_param->panid;
    header_send_buffer.gateway_id = client_param->gateway_id;
    header_send_buffer.data = raw_data_length + 2;
    header_send_buffer.lora_data_type = CLIENT_SEND_TEST_DATA_TO_GATEWAY_REQUEST;
    
    if (LORA_HEADER_LENGTH != LoraSendHeader(adapter,&header_send_buffer))
    {
        printf("The header of the incoming request failed to be sent\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }
    
    memset(&header_recv_buffer,0,LORA_HEADER_LENGTH);

    if (LORA_HEADER_LENGTH != LoraRecvHeader(adapter,&header_recv_buffer))
    {
        printf("Failed to receive the gateway inbound response data\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }

    if (header_recv_buffer.lora_data_type == GATEWAY_REPLY_CLIENT_RESULT_UN_EXPECTED)
    {
        printf("The gateway cannot accept client data\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }

    if ((raw_data_length + 2)!= LoraSendData(adapter,data,raw_data_length))
    {
        printf("The client gets permission to upload the data, but the send fails\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }
    
    UserMutexAbandon(client_param->client_mtx);
    printf("The client successfully sends the data\n");

    return 0;
}

static int LoraClientQuitNet()
{
    struct Adapter* adapter = AdapterDeviceFindByName(ADAPTER_LORA_NAME);
    if (adapter == NULL)
    {
        printf("Connection framework fundamental error\n");
        return -1;
    }
    
    struct LoraClientParam* client_param =(struct LoraClientParam*) adapter->adapter_param;

    if (INSTALL != adapter->adapter_status || 0 != AdapterDeviceOpen(adapter))
    {
        printf("The Lora device failed to open\n");
        return -1;
    }

    UserMutexObtain(client_param->client_mtx, -1);
    memset(&header_send_buffer,0,LORA_HEADER_LENGTH);

    header_send_buffer.client_id=client_param->client_id;
    header_send_buffer.panid = client_param->panid;
    header_send_buffer.gateway_id = client_param->gateway_id;
    header_send_buffer.lora_data_type = CLIENT_QUIT_NET_REQUEST;
    
    if (LORA_HEADER_LENGTH != LoraSendHeader(adapter,&header_send_buffer))
    {
        printf("The header of the incoming request failed to be sent\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }
    
    memset(&header_recv_buffer,0,LORA_HEADER_LENGTH);

    if (LORA_HEADER_LENGTH != LoraRecvHeader(adapter,&header_recv_buffer))
    {
        printf("Failed to receive the gateway inbound response data\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }

    if (header_recv_buffer.lora_data_type == GATEWAY_REPLY_CLIENT_RESULT_UN_EXPECTED)
    {
        printf("Client exit from the network failed\n");
        UserMutexAbandon(client_param->client_mtx);
        return -1;
    }
    
    client_param->client_state = CLIENT_DISCONNECT;
    client_param->gateway_id = 0;

    printf("The client successfully quit the network through the gateway\n");
    UserMutexAbandon(client_param->client_mtx);

    return 0;
}

/**************************GatewayOperations*********************************/
uint8_t gateway_recv_buffer[LORA_DATA_MAX_LENGTH];

static int ClientJoinNetHandler(struct Adapter* adapter,struct LoraHeaderFormat* header)
{
    struct LoraGatewayParam* gateway_param = (struct LoraGatewayParam*)adapter->adapter_param;

    header->gateway_id = gateway_param->gateway_id;

    if (gateway_param->client_num == GATEWAY_MAX_CLIENT_NUM)
    {
        header->lora_data_type = GATEWAY_REPLY_CLIENT_RESULT_UN_EXPECTED;
        printf("%X : Clients connected to the gateway have reached the upper limit\n",header->client_id);

        LoraSendHeader(adapter,header);
        
        return -1;
    }

    for (int i = 0; i < gateway_param->client_num; i++)
    {
         if (gateway_param->client_id[i] == header->client_id)
         {
            header->lora_data_type = GATEWAY_REPLY_CLIENT_RESULT_EXPECTED;
            printf("%X : The client has already connected to this gateway before\n",header->client_id);
            
            if (LORA_HEADER_LENGTH != LoraSendHeader(adapter,header))
            {
                printf("The gateway failed to respond to the client's network connection request\n");
                return -1;
            }
             return 0;
        }
    }

    gateway_param->client_id[gateway_param->client_num] = header->client_id;
    gateway_param->client_num ++;
    header->lora_data_type = GATEWAY_REPLY_CLIENT_RESULT_EXPECTED;

    if (LORA_HEADER_LENGTH != LoraSendHeader(adapter,header))
    {
        printf("The gateway failed to respond to the client's network connection request\n");
        return -1;
    }

    printf("%X - %X : The client joins the gateway network successfully\n",header->client_id,gateway_param->gateway_id);

    return 0;
}

static int ClientQuitNetHandler(struct Adapter* adapter,struct LoraHeaderFormat* header)
{
    struct LoraGatewayParam* gateway_param = (struct LoraGatewayParam*)adapter->adapter_param;

    header->gateway_id = gateway_param->gateway_id;

    for (int i = 0; i < gateway_param->client_num; i++)
    {
         if (gateway_param->client_id[i] == header->client_id)
         {
             for (int j = i; j < gateway_param->client_num - 1; j++)
             {
                gateway_param->client_id[j] = gateway_param->client_id[j+1];
             }
             gateway_param->client_num --;

             break;
        }
    }

    header->lora_data_type = GATEWAY_REPLY_CLIENT_RESULT_EXPECTED;

    if (LORA_HEADER_LENGTH != LoraSendHeader(adapter,header))
    {
        printf("The gateway failed to respond to the client's decommissioning request\n");
        return -1;
    }

    printf("%X - %X : The client quit the gateway network successfully\n",header->client_id,gateway_param->gateway_id);
    return 0;
}

static int ClientSendTestDataHandler(struct Adapter* adapter,struct LoraHeaderFormat* header)
{
    struct LoraGatewayParam* gateway_param = (struct LoraGatewayParam*)adapter->adapter_param;

    int data_length = header->data;

    if (data_length > LORA_DATA_MAX_LENGTH)
    {
        header->lora_data_type = GATEWAY_REPLY_CLIENT_RESULT_UN_EXPECTED;
        LoraSendHeader(adapter,header);
        
        return -1;
    }
    
    header->lora_data_type = GATEWAY_REPLY_CLIENT_RESULT_EXPECTED;

    if (LORA_HEADER_LENGTH != LoraSendHeader(adapter,header))
    {
        printf("The gateway failed to respond to a client data transfer request\n");
        return -1;
    }

    memset(gateway_recv_buffer,0,data_length);

    if (data_length != LoraRecvData(adapter,gateway_recv_buffer,data_length))
    {
        printf("The gateway failed to receive client data\n");
        return -1;
    }

    uint8_t crc_lo = gateway_recv_buffer[data_length - 2];
    uint8_t crc_hi = gateway_recv_buffer[data_length - 1];

    gateway_recv_buffer[data_length - 2] = '\0';
    gateway_recv_buffer[data_length - 1] = '\0';

    printf("Receive data: %s crc_lo: %X crc_hi: %X\n",gateway_recv_buffer,crc_lo,crc_hi);
    
    //todo
    return 0;
}

/*****************************GatewayAutoTask********************************************/
static void * LoraGatewayAutoTask(void * parameter)
{
    printf("Starting the gateway service...\n");
    struct Adapter* gateway_adapter = (struct Adapter*) parameter;
    struct LoraGatewayParam* gateway_param = (struct LoraGatewayParam*)gateway_adapter->adapter_param;

    if (gateway_adapter == NULL || gateway_param == NULL)
    {
        printf("Connection framework foundation error, task exit!\n");
        goto END;
    }

    if (INSTALL != gateway_adapter->adapter_status)
    {
        if (0 != AdapterDeviceOpen(gateway_adapter))
        {
            printf("Open lora device fail, task exit!\n");
            goto END;
        }
    }

    while (1)
    {
        UserMutexObtain(gateway_param->gateway_mtx,-1);
        memset(&header_recv_buffer, 0, LORA_HEADER_LENGTH);

        if (LORA_HEADER_LENGTH == LoraRecvHeader(gateway_adapter,&header_recv_buffer))
        {
            if (header_recv_buffer.panid == gateway_param->panid)
            {
                if (header_recv_buffer.gateway_id == gateway_param->gateway_id || header_recv_buffer.lora_data_type == CLIENT_JOIN_NET_REQUEST)
                {
                    printf("This header is for the gateway, start processing the data header\n");
                    gateway_handlers[header_recv_buffer.lora_data_type](gateway_adapter,&header_recv_buffer);
                }
            }
        }
        
        UserMutexAbandon(gateway_param->gateway_mtx);
    }

END:
    printf("Gateway task end\n");
}

/*******************LORA ADAPTER FUNCTION********************/
static int UsrAdapterLoraRegister(struct Adapter *adapter)
{
    int ret = 0;
    struct LoraGatewayParam *lora_gateway;
    struct LoraClientParam *lora_client;

    strncpy(adapter->name, ADAPTER_LORA_NAME, NAME_NUM_MAX);
    adapter->net_protocol = PRIVATE_PROTOCOL;

#ifdef AS_LORA_GATEWAY_ROLE
    lora_gateway = PrivMalloc(sizeof(struct LoraGatewayParam));
    if (!lora_gateway) {
        PrivFree(lora_gateway);
        return -1;
    }

    memset(lora_gateway, 0, sizeof(struct LoraGatewayParam));

    lora_gateway->gateway_id = DEAFULT_GATEWAY_ID;
    lora_gateway->panid = DEAFULT_PANID;
    lora_gateway->gateway_mtx = UserMutexCreate();
    if (lora_gateway->gateway_mtx < 0)
    {
        printf("create lora gateway mutex fail\n");
        return -1;
    }
    
    adapter->net_role = GATEWAY;
    adapter->net_role_id = DEAFULT_GATEWAY_ID;
    adapter->adapter_param = (void *)lora_gateway;
#else //AS_LORA_CLIENT_ROLE
    lora_client = PrivMalloc(sizeof(struct LoraClientParam));
    if (!lora_client) {
        PrivFree(lora_client);
        return -1;
    }

    memset(lora_client, 0, sizeof(struct LoraClientParam));

    lora_client->client_id = DEAFULT_CLIENT_ID;
    lora_client->client_state = CLIENT_DISCONNECT;
    lora_client->panid = DEAFULT_PANID;
    lora_client->client_mtx = UserMutexCreate();
    if (lora_client->client_mtx < 0)
    {
        printf("create lora client mutex fail\n");
        return -1;
    }

    adapter->net_role = CLIENT;
    adapter->net_role_id = DEAFULT_CLIENT_ID;
    adapter->adapter_param = (void *)lora_client;
#endif
    adapter->adapter_status = UNREGISTERED;
    ret = AdapterDeviceRegister(adapter);
    if (ret < 0) {
        printf("Adapter4G register error\n");
        if (lora_gateway)
            PrivFree(lora_gateway);
        if (lora_client)
            PrivFree(lora_client);

        return -1;
    }
    return ret;
}

int UsrAdapterLoraInit(void)
{
    int ret = 0;
    struct Adapter *adapter = PrivMalloc(sizeof(struct Adapter));
    if (!adapter) {
        PrivFree(adapter);
        return -1;
    }

    memset(adapter, 0, sizeof(struct Adapter));

    ret = UsrAdapterLoraRegister(adapter);
    if (ret < 0) {
        printf("AdapterLoraInit register lora adapter error\n");
        PrivFree(adapter);
        return -1;
    }
    
    AdapterProductInfoType product_info = E220Attach(adapter);
    if (!product_info) {
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

/**********************************TestFunction***************************/

#ifdef AS_LORA_GATEWAY_ROLE
struct Adapter* gateway_adapter = NULL; 
UtaskType gateway_task;
int gateway_task_id = -1;

int StartGatewayTask(void)
{
    gateway_adapter = AdapterDeviceFindByName(ADAPTER_LORA_NAME);
    printf("gateway_priv: %d\n", gateway_adapter->net_protocol);

    if (gateway_adapter != NULL)
    {
        gateway_task.prio = 25;
        gateway_task.stack_size = 4096;
        gateway_task.func_entry = LoraGatewayAutoTask;
        gateway_task.func_param = gateway_adapter;
        strncpy(gateway_task.name,"lora_gateway_task",strlen("lora_gateway_task"));
        gateway_task_id = UserTaskCreate(gateway_task);
        if (gateway_task_id >= 0)
        {
            if (0 == UserTaskStartup(gateway_task_id))
            {
                printf("start gateway task success!\n");
            }
        }
    }
}
PRIV_SHELL_CMD_FUNCTION(StartGatewayTask, start the lora gateway task, PRIV_SHELL_CMD_MAIN_ATTR);

int StopLoraGateway(void)
{
   if (gateway_task_id < 0)
   {
    printf("gateway task not exist!\n");
   }
   else
   {
    UserTaskDelete(gateway_task_id);
    gateway_task_id = -1;
    printf("delete gateway task success!\n");
   }
}
PRIV_SHELL_CMD_FUNCTION(StopLoraGateway, stop the lora gateway task, PRIV_SHELL_CMD_MAIN_ATTR);

int ShowGateway(void)
{
    if (gateway_adapter != NULL)
    {
        struct LoraGatewayParam* gateway_param = (struct LoraGatewayParam*) gateway_adapter->adapter_param;
        printf("ROLE:  Gateway\n");
        printf("panid: %X, gateway_id:%X, client_num: %X \n", gateway_param->panid, gateway_param->gateway_id,gateway_param->client_num);
        printf("clients: \n");
        for (int i = 0; i < gateway_param->client_num; i++)
        {
            printf("client %d  - >  %X\t",i,gateway_param->client_id[i]);
        }
    }
}
PRIV_SHELL_CMD_FUNCTION(ShowGateway, display some info about the gateway after the task started, PRIV_SHELL_CMD_MAIN_ATTR);
#else //AS_LORA_CLIENT_ROLE

struct Adapter* client_adapter = NULL;
struct LoraClientParam * client_param = NULL;
int client_is_init = -1;

uint8_t client_input_data_buffer[100];

void ClientInit(void)
{
    if (0 != client_is_init)
    {
        client_adapter = AdapterDeviceFindByName(ADAPTER_LORA_NAME);
        client_param =(struct LoraClientParam *) client_adapter->adapter_param;
        
        if (0 == AdapterDeviceOpen(client_adapter))
        {
            client_is_init = 0;
            printf("client init success: client_id: %X, panid: %X, gateway_id: %X, client_state: %d \n",client_param->client_id,client_param->panid,client_param->gateway_id,client_param->client_state);
            return;
        }
    }
    printf("client init success before: client_id: %X, panid: %X, gateway_id: %X, client_state: %d \n",client_param->client_id,client_param->panid,client_param->gateway_id,client_param->client_state);
}
PRIV_SHELL_CMD_FUNCTION(ClientInit, init the lora client such as open the lora model etc, PRIV_SHELL_CMD_MAIN_ATTR);

void ShowClient(void)
{
    printf("ROLE: client  client_id: %X, panid: %X, gateway_id: %X, client_state: %d \n",client_param->client_id,client_param->panid,client_param->gateway_id,client_param->client_state);
}
PRIV_SHELL_CMD_FUNCTION(ShowClient, show some info about the lora client, PRIV_SHELL_CMD_FUNC_ATTR);

void ClientConnect()
{
    LoraClientJoinNet();
}
PRIV_SHELL_CMD_FUNCTION(ClientConnect, connect to the certen vlan, PRIV_SHELL_CMD_FUNC_ATTR);

void ClientDisConnect()
{
    LoraClientQuitNet();
}
PRIV_SHELL_CMD_FUNCTION(ClientDisConnect, disconnect to the certen vlan, PRIV_SHELL_CMD_FUNC_ATTR);

void ClientSend(char *data)
{
    memcpy(client_input_data_buffer,data,strlen(data));
    LoraClientSendData(client_input_data_buffer,strlen(data));
}
PRIV_SHELL_CMD_FUNCTION(ClientSend, send data to gateway after connected, PRIV_SHELL_CMD_FUNC_ATTR);
#endif