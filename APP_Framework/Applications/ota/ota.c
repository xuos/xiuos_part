
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
* @file:    ota.c
* @brief:   a application ota task of system
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2021/11/3
*
*/
#include <transform.h>
#include <adapter.h>

extern int main(void);

struct ota_header_t
{
    int16 frame_flag;          ///< frame start flag 2 Bytes
    uint8 dev_type;            ///< device type
    uint8 burn_mode;           ///< data burn way
    unsigned long total_len;   ///< send data total length caculated from each frame_len 
    unsigned long dev_hid;     ///< device hardware version
    unsigned long dev_sid;     ///< device software version
    char resv[32];             ///< reserve
};

struct ota_frame_t
{
    uint32 frame_id;           ///< Current frame id
    uint32 frame_len;          ///< Current frame data length
    char   frame_data[224];    ///< Current frame data,max length 224
    uint32 crc;                ///< Current frame data crc
};

struct ota_data
{
    struct ota_header_t header;
    struct ota_frame_t frame;
};

pthread_t ota_task;
pthread_t restart_main;

/**
 * @description: CRC16 check
 * @param data data buffer
 * @param length data length
 * @return check code
 */
uint32_t OtaCrc16(uint8_t * data, uint8_t length)
{
    int j;
    unsigned int reg_crc=0xFFFF;
    
    while (length--) {
        reg_crc ^= *data++;
        for (j=0;j<8;j++) {
            if(reg_crc & 0x01)
                reg_crc=reg_crc >>1 ^ 0xA001;
            else
                reg_crc=reg_crc >>1;
        }
    }
    
    return reg_crc;
}

static int SaveAppBin(int fd, char* buf, int len)
{
    // int fd = 0;
    // fd = open( BOARD_APP_NAME, O_RDWR | O_CREAT );
    write(fd, buf, len);
    lseek(fd, len, SEEK_CUR);
    
    // close(fd);
}

static int CrcFileCheck(uint32 crc_check, unsigned long total_len)
{
    int ret = 0;
    int fd = 0;
    int len = 0;
    char *buf = NULL;
    
    fd = open( BOARD_APP_NAME, O_RDONLY );
    if(fd < 0){
        printf("open %s bin failed.\n",BOARD_APP_NAME);
        return -1;
    }

    buf = PrivMalloc(total_len);
    if(NULL == buf)
    {
        printf("malloc failed.\n");
        close(fd);
        return -1;
    }

    len = read(fd, buf, total_len);

    if (crc_check != OtaCrc16(buf, len))
    {
       ret =-1;
    }

    PrivFree(buf);
    close(fd);

    return ret;
}

static void RestartApplication(void)
{
    pthread_attr_t attr;
    attr.schedparam.sched_priority = 10;
    attr.stacksize = 2048;

    while(1) 
    {
        unsigned long pid = PrivUserTaskSearch();
        if (pid > 0) 
        {
            PrivTaskDelete(pid, 0);
        } 
        else 
        {
            break;
        }
    }
    PrivTaskCreate(&restart_main, &attr, (void *)main, NULL);
}
static int OtaDataRecv(struct Adapter* adapter)
{
    struct ota_data recv_msg;
    char reply[16] = {0};
    int ret = 0;
    int try_times = 5;
    int fd = 0;

    fd = open( BOARD_APP_NAME, O_RDWR | O_CREAT | O_TRUNC);

    while(1) {
        memset(&recv_msg, 0, sizeof(struct ota_data));
        ret = AdapterDeviceRecv(adapter, &recv_msg, 256);
        if(ret > 0 && recv_msg.header.frame_flag == 0x5A5A) 
        {
            if(0 == strncmp("aiit_ota_end",recv_msg.frame.frame_data, strlen("aiit_ota_end"))) 
            {
                printf("total [%d]frames [%d]Bytes,receive successful,\n",recv_msg.frame.frame_id,recv_msg.header.total_len);
                if(0 != CrcFileCheck(recv_msg.frame.crc, recv_msg.header.total_len))
                {
                    printf("crc check %s bin failed.please try again.\n", BOARD_APP_NAME);
                    ret = -1;
                }
                break;
            }

            if (recv_msg.frame.crc == OtaCrc16(recv_msg.frame.frame_data,recv_msg.frame.frame_len))
            {
                SaveAppBin(fd, recv_msg.frame.frame_data, recv_msg.frame.frame_len);
            }  
            else 
            {
                printf("current [%d] frame crc check failed,try again\n",recv_msg.frame.frame_id);
                goto try_again;
            }
            memset(reply, 0, 16);
            memcpy(reply, "ok", strlen("ok"));
        } 
        else 
        {
try_again:
            if(try_times == 0)
            {
                printf("oops!!! current [%d] frame try 5 times failed,break out\n",recv_msg.frame.frame_id);
                ret = -1;
                break;
            }
            memset(reply, 0, 16);
            memcpy(reply, "try_again", strlen("try_again"));
            AdapterDeviceSend(adapter, reply, strlen(reply));
            try_times--;
            continue;
        }
    }
    close(fd);
    RestartApplication();
    return ret;
}

static void *OtaKTaskEntry(void *parameter)
{
    struct ota_data recv_msg;
    char reply[4] = {0};
    int baud_rate = BAUD_RATE_115200;
    int len = 0;
    int ret = 0;

    struct Adapter* adapter =  AdapterDeviceFindByName("4G");
    uint8 server_addr[64] = "101.68.82.219";
    uint8 server_port[64] = "9898";

    adapter->socket.socket_id = 0;

    AdapterDeviceOpen(adapter);
    AdapterDeviceControl(adapter, OPE_INT, &baud_rate);
    AdapterDeviceConnect(adapter, CLIENT, server_addr, server_port, IPV4);

    while(1)
    {
        memset(&recv_msg, 0, sizeof(struct ota_data));
        /* step1: Confirm the start signal of transmission*/
        ret = AdapterDeviceRecv(adapter, &recv_msg, 256);
        if(ret > 0 && recv_msg.header.frame_flag == 0x5A5A) 
        {
            if (0 == strncmp("aiit_ota_start",recv_msg.frame.frame_data, strlen("aiit_ota_start"))) 
            {
                memset(reply, 0, 4);
                memcpy(reply, "ok", strlen("ok"));
                AdapterDeviceSend(adapter, reply, strlen(reply));

                /* step2: start receive source bin file of application*/
                ret = OtaDataRecv(adapter);
                if (0 != ret)
                {
                    memset(reply, 0, 4);
                    memcpy(reply, "send_restart", strlen("send_restart"));
                    AdapterDeviceSend(adapter, reply, strlen(reply));
                    continue;
                } 
                else
                {
                    break;
                }
            }
        }
        PrivTaskDelay(3000); /* check ota signal every 3s */
    }
    AdapterDeviceClose(adapter);
    
}

void ApplicationOtaTaskInit(void)
{   
    pthread_attr_t attr;
    attr.schedparam.sched_priority = 10;
    attr.stacksize = 2048;

    PrivTaskCreate(&ota_task, &attr, OtaKTaskEntry, NULL);

}