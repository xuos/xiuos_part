#include <string.h>
#include <board.h>
#include "plc_socket.h"

#define xs_kprintf KPrintf
#define xs_device_t uint32_t


static unsigned char data_head = 0x5A;
static char device_s14[] = "S14";
static char device_s15[] = "S15";
static char device_s16[] = "S16";
static char device_s17[] = "S17";
static char device_s18[] = "S18";
static char data_end[] = "#";
unsigned char redis_data[1024];

// 创建一个信号量，用于接收消息的同步
static sem_t Ch_Sem = NULL;
static sem_t Rx_Sem = NULL;

extern xs_device_t ec200t;

//for SIEMENS TCP read data cmd
const unsigned char handshake_first[] =
{
    0x3, 0x00, 0x00, 0x16, 0x11, 0xe0, 0x00, 0x00, 0x02,
        0xc8,0x00,0xc1,0x02,0x02,0x01,0xc2,0x02,0x02,0x01,0xc0,0x01,0x0a
};

const unsigned char handshake_second[] =
{
    0x3,0x00,0x00,0x19,0x02,0xf0,0x80,0x32,0x01,0x00,0x00,0x00,0x0d,0x00,0x08,0x00,0x00,0xf0,0x00,0x00,0x01,0x00,0x01,0x00,0xf0
};

const unsigned char siemens_read_data[] =
{
    0x3,0x00,0x00, 0x1f,0x02,0xf0,0x80,0x32,0x01,0x00,0x00,0x33,0x01,0x00,0x0e,0x00,0x00,0x04,0x01,0x12,0x0a,0x10,0x02,0x00,0xD2,0x00,0x34,0x84,0x00,0x00,0x00
};

//for OML UDP read data cmd
const unsigned char UDP_read_data[] =
{
    0x80,0x00,0x02,0x00,0x03,0x00,0x00,0x7E,0x00,0x00,0x01,0x01,0x82,0x0F,0xA0,0x00,0x00,0x20
};

//for SIEMENS 1200 read data cmd
const unsigned char handshake_1200_first[] =
{
    0x03, 0x00, 0x00, 0x16, 0x11, 0xE0, 0x00, 0x00, 0x02, 0xC8, 0x00, 0xC1, 0x02, 0x02, 0x01, 0xC2, 0x02, 0x02, 0x01, 0xC0, 0x01, 0x0A
};

const unsigned char handshake_1200_second[] =
{
    0x03, 0x00, 0x00, 0x19, 0x02, 0xF0, 0x80, 0x32, 0x01, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x08, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0xF0
};

const unsigned char siemens_1200_read_data[] =
{
    0x03, 0x00, 0x00, 0x1F, 0x02, 0xF0, 0x80, 0x32, 0x01, 0x00, 0x00, 0x33, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x04, 0x01, 0x12, 0x0A, 0x10, 0x02, 0x00, 0xD2, 0x00, 0x34, 0x84, 0x00, 0x00, 0x00
};

#define PUT_ULONG_BE(n,b,i)                             \
{                                                       \
    (b)[(i)    ] = (uint8_t) ( (n) >> 24 );       \
    (b)[(i) + 1] = (uint8_t) ( (n) >> 16 );       \
    (b)[(i) + 2] = (uint8_t) ( (n) >>  8 );       \
    (b)[(i) + 3] = (uint8_t) ( (n)       );       \
}

#define GET_ULONG_BE(n,b,i)                             \
{                                                       \
    (n) = ( (uint32_t) (b)[(i)    ] << 24 )        \
        | ( (uint32_t) (b)[(i) + 1] << 16 )        \
        | ( (uint32_t) (b)[(i) + 2] <<  8 )        \
        | ( (uint32_t) (b)[(i) + 3]       );       \
}

#define XS_SERIAL_RB_BUFSZ 128

char rx_buffer_cmp[256 + 1];
char msg_pool[256];
char rx_buffer[XS_SERIAL_RB_BUFSZ + 1] = {0};
#define WIFI_RESET 73

#define LEN_PARA_BUF 128
uint8_t server_addr_wifi[LEN_PARA_BUF] = "192.168.23.181"; //???????
uint8_t server_port_wifi[LEN_PARA_BUF] = "9999"; //??????

uint8_t WIFI_ssid[LEN_PARA_BUF] = "xiaoshanos";  //WIFI?
uint8_t WIFI_pwd[LEN_PARA_BUF] = "12345678";  //WIFI????

#if 0
/* ?????? */
xs_device_t hfa21;
/* ??????? */
struct xs_MessageQueue* rx3_mq;
/* ???????? */

void hfa21_sta_config(void)
{
    xs_kprintf("hfa21_sta_config start\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd, "AT+FCLR\r\n");

    //send
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(30000); //AT+FLCR ??????,???????
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 5;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 5;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+E\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 6);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 6;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+WSSSID=");
    strcat(cmd,WIFI_ssid);
    strcat(cmd,"\r\n");

    //??????????
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    //send
    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 7;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+WSKEY=WPAPSK,AES,");
    strcat(cmd,WIFI_pwd);
    strcat(cmd,"\r\n");

    //??????????
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    //send
    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 8;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+WMODE=sta\r\n");

    //send
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 9;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(500);
    strcpy(cmd,"AT+LANN=10.10.99.254,255.255.255.0\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 36);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 10;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcat(cmd,"AT+Z\r\n");

    //send
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_sta_config, asd);


void hfa21_eth_on(void)
{
    xs_kprintf("hfa21_eth_on start\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+E\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 5);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+FEPHY=on\r");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 12);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 5;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcat(cmd,"AT+Z\r\n");
    xs_DeviceWrite(hfa21, 0, cmd, 6);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_eth_on, hahah asd);


void hfa21_sta_connect(void)
{
    xs_kprintf("hfa21_wifi_connecting start\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+E\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 6);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+NETP=TCP,CLIENT,");
    strcat(cmd,server_port_wifi);
    strcat(cmd,",");
    strcat(cmd,server_addr_wifi);
    strcat(cmd,"\r\n");

    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    //send
    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 5;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcat(cmd,"AT+Z\r\n");

    //send
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_sta_connect, asd);

void hfa21_ap_config(void)
{
    xs_kprintf("hfa21_ap_config start\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd, "AT+FCLR\r\n");

    //send
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(30000); //AT+FLCR ??????,???????
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 5;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 6;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+E\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 6);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 7; //config ap
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+WMODE=AP\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 13);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 8;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+WAKEY=WPAPSK,AES,123456789\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 31);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 9;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+WAP=11BGN,ap_test,AUTO\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 27);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 10;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+DHCPDEN\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 12);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 11;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+LANN\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 13;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcat(cmd,"AT+Z\r\n");

    //send
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_ap_config, asd);

void hfa21_restart(void)
{
    xs_kprintf("hfa21_restart \r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(500);
    strcpy(cmd, "AT+Z\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 6);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_restart, asd);


void hfa21_wan_status(void)
{
    xs_kprintf("hfa21_wan_status\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+WANN\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+ENTM\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_wan_status, asd);


void hfa21_uart3_config(void)
{
    xs_kprintf("hfa21_uart3_config\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+UART=460800,8,1,NONE\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 25);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+Z\r\n");

    //send
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    uart3_reconfig();
    xs_MdelayKTask(2500);
}
MSH_CMD_EXPORT(hfa21_uart3_config, asd);

void hfa21_uart3_setdefault(void)
{
    xs_kprintf("hfa21_uart3_config\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+UART=57600,8,1,NONE\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 24);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+Z\r\n");

    //send
    for(i=0; i<LEN_PARA_BUF; i++)
    {
        if(cmd[i] == 0)
        {
            break;
        }
    }

    xs_DeviceWrite(hfa21, 0, cmd, i);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    uart3_setdefault();
    xs_MdelayKTask(2500);
}
MSH_CMD_EXPORT(hfa21_uart3_setdefault, asd);

void hfa21_tcp_status(void)
{
    xs_kprintf("hfa21_tcp_status\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+TCPDIS\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 11);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+ENTM\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_tcp_status, asd);

void hfa21_sta_status(void)
{
    xs_kprintf("hfa21_sta_status\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+WSLK\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+ENTM\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_sta_status, asd);

void hfa21_ping(void)
{
    xs_kprintf("hfa21_sta_status\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(500);
    strcpy(cmd,"AT+PING=192.168.23.1\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 23);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(500);
    strcpy(cmd,"AT+PING=192.168.23.188\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 23);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 5;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+ENTM\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_ping, asd);

void printtest(void)
{
    int i;

    for(i=0; rx_buffer_cmp[i]!='\0'; i++)
    {
        xs_kprintf("%c",rx_buffer_cmp[i]);
    }
}
MSH_CMD_EXPORT(printtest, ec200t link tongxinmao);




//set default
void hfa21_eth_def(void)
{
    xs_kprintf("hfa21_eth_def start\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 3;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+E\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 5);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcpy(cmd,"AT+FCLR\r");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 8);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    xs_MdelayKTask(20000);
    step = 5;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(2500);
    strcat(cmd,"AT+Z\r\n");
    xs_DeviceWrite(hfa21, 0, cmd, 6);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_eth_def, hahah asd);


void hfa21_uartf_set_enable(void)
{
    xs_kprintf("hfa21_uartf_set_enable start\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");                                                       //打开命令模式
    //send
    xs_DeviceWrite(hfa21,0, cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21,0, cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+UARTF=enable\r\n");
    //send
    xs_DeviceWrite(hfa21, 0,  cmd, 17);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 6;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+ENTM\r\n");
    //send
    xs_DeviceWrite(hfa21,0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_uartf_set_enable, asd);

void hfa21_uartf_set_len(void)
{
    xs_kprintf("hfa21_uartf_set_len start\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21,0,   cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21,0,  cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+UARTFL=1024\r\n");
    //send
    xs_DeviceWrite(hfa21, 0,  cmd, 16);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 6;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+ENTM\r\n");
    //send
    xs_DeviceWrite(hfa21,0,  cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_uartf_set_len, asd);


void hfa21_uartf_set_time(void)
{
    xs_kprintf("hfa21_uartf_set_time start\r\n");
    uint8_t i,step;
    uint8_t cmd[LEN_PARA_BUF];
    step = 1;
    strcpy(cmd, "+++");
    //send
    xs_DeviceWrite(hfa21, 0,  cmd, 3);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 2;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"a");
    //send
    xs_DeviceWrite(hfa21,0,  cmd, 1);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 4;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+UARTFT=600\r\n");
    //send
    xs_DeviceWrite(hfa21, 0,  cmd, 15);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
    step = 6;
    memset(cmd,0,sizeof(cmd));
    xs_MdelayKTask(100);
    strcpy(cmd,"AT+ENTM\r\n");
    //send
    xs_DeviceWrite(hfa21, 0, cmd, 9);
    xs_kprintf("cmd.%d=%s\r\n",step,cmd);
}
MSH_CMD_EXPORT(hfa21_uartf_set_time, asd);


void uart3_reconfig(void)
{
    struct SerialConfigure config3 = XS_SERIAL_CONFIG_DEFAULT;
    //config3.BaudRate = BAUD_RATE_230400;
    config3.BaudRate = 460800;
    //config3.BaudRate = 57600;
    config3.DataBits = DATA_BITS_8;
    config3.StopBits = STOP_BITS_1;
    config3.bufsz     = XS_SERIAL_RB_BUFSZ;
    config3.parity    = PARITY_NONE;
    xs_DeviceControl(hfa21, XS_DEVICE_CTRL_CONFIG, &config3);
}
MSH_CMD_EXPORT(uart3_reconfig, asd);

void uart3_setdefault(void)
{
    struct SerialConfigure config3 = XS_SERIAL_CONFIG_DEFAULT;
    config3.BaudRate = BAUD_RATE_57600;
    config3.DataBits = DATA_BITS_8;
    config3.StopBits = STOP_BITS_1;
    config3.bufsz     = XS_SERIAL_RB_BUFSZ;
    config3.parity    = PARITY_NONE;
    xs_DeviceControl(hfa21, XS_DEVICE_CTRL_CONFIG, &config3);
}
MSH_CMD_EXPORT(uart3_setdefault, asd);

void msg_send(void)
{
    uint8_t msg[1024] = { 0};
    uint32_t i = 0;
    xs_kprintf("ap test, send msg to server : ");
    memset(msg,0x37,1024);
    xs_memcpy(msg,"arm:dev7,data:",14);
    msg[1023] = '\n';

    for(;;)
    {
        xs_DeviceWrite(hfa21,0, msg, 1024);
        // xs_MdelayKTask(1000);
    }

    return ;
}
MSH_CMD_EXPORT(msg_send, asd);

void msg_send_data(uint8_t* buf, uint32_t len)
{
    if(len > 1000)
    {
        xs_kprintf("data length too long\n ");
        return;
    }

    xs_DeviceWrite(hfa21, 0, buf, len);
    return ;
}

void msg_send_once(void)
{
    uint8_t msg[1024] = { 0};
    uint32_t i = 0;
    xs_kprintf("ap test, send msg to server : ");
    memset(msg,0x37,1024);
    xs_memcpy(msg,"arm:dev7,data:",14);
    msg[1023] = '\n';
    xs_DeviceWrite(hfa21,0, msg, 1024);
    // xs_MdelayKTask(1000);
    return ;
}
MSH_CMD_EXPORT(msg_send_once, asd);

void msg_send_nointerval(void)
{
    uint8_t msg[1024] = { 0};
    uint32_t i = 1;
    uint32_t index = 0;
    uint8_t seq[10] = { 0};
    uint8_t* prefix = "{board:stm32f407-st-discovery,arch:arm,device:7,seq:";
    xs_kprintf("ap test, send msg to server : ");

    for(;;)
    {
        index = 0;
        memset(msg,0x37,1024);
        memset(seq,0,10);
        msg[1021] = '}';
        msg[1022] = '\n';
        msg[1023] = 0;
        xs_memcpy(msg,prefix,strlen(prefix));
        index = index + strlen(prefix);
        PUT_ULONG_BE(i, msg, index)
        index = index + 4;
        xs_memcpy(msg+index,",data:",6);
        xs_DeviceWrite(hfa21,0, msg, 1024);
        ++ i;
    }

    return ;
}
MSH_CMD_EXPORT(msg_send_nointerval, asd);

void msg_send_interval(void)
{
    uint8_t msg[1024] = { 0};
    uint32_t i = 1;
    uint32_t index = 0;
    uint8_t seq[4] = { 0};
    uint8_t* prefix = "{board:stm32f407-st-discovery,arch:arm,device:7,seq:";
    xs_kprintf("ap test, send msg to server : ");

    for(;;)
    {
        index = 0;
        memset(msg,0x37,1024);
        memset(seq,0,10);
        msg[1021] = '}';
        msg[1022] = '\n';
        msg[1023] = 0;
        xs_memcpy(msg,prefix,strlen(prefix));
        index = index + strlen(prefix);
        PUT_ULONG_BE(i, msg, index)
        index = index + 4;
        xs_memcpy(msg+index,",data:",6);
        xs_DeviceWrite(hfa21,0, msg, 1024);
        xs_MdelayKTask(1000);
        ++ i;
    }

    return ;
}
MSH_CMD_EXPORT(msg_send_interval, asd);

struct xs_Ringbuffer* ringbuffer;

uint8_t stack[256] = {0};
xs_uint16 data_index = 0 ;
uint8_t  start = 0xaa;
uint8_t  end = 0xbb;

uint8_t lora_buffer[8][256] = {0};

static void read_ringbuffer_thread_entry(void* parameter)
{
    uint8_t  ch = 0;
    xs_uint16 index = 0 ;
    uint8_t devicenumber;

    while(1)
    {
        if(1 ==  xs_GetRingBufferchar(ringbuffer,&ch))
        {
            if(data_index < 256)
            {
                stack[data_index++] = ch;

                if(data_index > 2)
                {
                    if(stack[data_index-1] == start && stack[data_index-2] == start)
                    {
                        data_index = 0;
                        stack[data_index++] == start;
                        stack[data_index++] == start;
                    }
                    else if(stack[data_index-1] == end && stack[data_index-2] == end)
                    {
                        //end
                        devicenumber = stack[3] - 0x30;

                        if(devicenumber > 0 && devicenumber < 8)
                        {
                            memset(lora_buffer[devicenumber-1],0,256);
                            memcpy(lora_buffer[devicenumber-1], &stack[2],data_index - 4);
                            // xs_kprintf("lora data: %s\n",lora_buffer[devicenumber-1]);
                        }

                        data_index = 0;
                    }
                }
            }
            else
            {
                data_index = 0;
            }
        }
        else
        {
            xs_MdelayKTask(20);
        }
    }
}
#endif

#if 0
/***********************************************************************/
//欧姆龙PLC      IP 192.168.250.3   port  9600

static xs_err_t oml_uart_input(xs_device_t dev, xs_size_t size)
{
    xs_KSemaphoreAbandon(Ch_Sem);
    return XS_EOK;
}

static void oml_plc_thread(void* parameter)
{
    xs_err_t ret;
    uint32_t rx_length, total_rx_length = 0;
    uint8_t i;
    unsigned int length = 0;

    while(1)
    {
        ret = xs_KSemaphoreObtain(Ch_Sem, XS_WAITING_FOREVER);

        if(XS_EOK == ret)
        {
            rx_length = xs_DeviceRead(hfa21, 0, redis_data + 1 + sizeof(device_s14) + total_rx_length, 78);
            xs_kprintf("dst data length %d total length %d\n", rx_length, total_rx_length);

            for(i = 0; i < rx_length; ++i)
            {
                xs_kprintf("0x%x ", redis_data[i + 1 + sizeof(device_s14) + total_rx_length]);
            }

            xs_kprintf("\n");
            total_rx_length += rx_length;

            if((78 == total_rx_length) && (0xC0 == redis_data[1 + sizeof(device_s14)])
                    && (0x00 == redis_data[1 + sizeof(device_s14) + 1])
                    && (0x02 == redis_data[1 + sizeof(device_s14) + 2])
                    && (0x00 == redis_data[1 + sizeof(device_s14) + 3]))
            {
                /******format redis data******/
                memcpy(redis_data, &data_head, 1);
                memcpy(redis_data + 1, device_s14, sizeof(device_s14));
                memcpy(redis_data + 1 + sizeof(device_s14) + total_rx_length, data_end, sizeof(data_end));
                length = 1 + sizeof(device_s14) + total_rx_length + sizeof(data_end);
                /******end******/
                xs_DeviceWrite(ec200t, 0, redis_data, length);
                total_rx_length = 0;
                memset(redis_data, 0, sizeof(redis_data));
                xs_KSemaphoreAbandon(Rx_Sem);
            }
        }
    }
}

int OML_UDP(void)
{
    struct SerialConfigure config3 = XS_SERIAL_CONFIG_DEFAULT;
    hfa21 = xs_DeviceFind("uart3");

    if(!hfa21)
    {
        xs_kprintf("find dev.hfa21 failed!\r\n");
        return XS_ERROR;
    }

    Ch_Sem = xs_KCreateSemaphore("Ch_Sem",0,XS_LINKLIST_FLAG_FIFO);

    if(Ch_Sem == NULL)
    {
        xs_kprintf("create Ch_sem failed .\n");
        return XS_ERROR;
    }

    Rx_Sem = xs_KCreateSemaphore("Rx_Sem",0,XS_LINKLIST_FLAG_FIFO);

    if(Rx_Sem == NULL)
    {
        xs_kprintf("create Rx_sem failed .\n");
        return XS_ERROR;
    }

    //hfa21
    config3.BaudRate = BAUD_RATE_460800;
    config3.DataBits = DATA_BITS_8;
    config3.StopBits = STOP_BITS_1;
    config3.bufsz     = XS_SERIAL_RB_BUFSZ;
    config3.parity    = PARITY_NONE;
    xs_DeviceControl(hfa21, XS_DEVICE_CTRL_CONFIG, &config3);
    xs_DeviceOpen(hfa21,XS_DEVICE_FLAG_DMA_RX);
    xs_DeviceSetRxIndicate(hfa21, oml_uart_input);
    xs_kprintf("hfa21 init success!\r\n");
    TaskDescriptorPointer thread_oml_plc = xs_KTaskCreate("oml_hfa21", oml_plc_thread, NULL, 1024, 25);

    if(thread_oml_plc != NULL)
    {
        xs_StartupKTask(thread_oml_plc);
    }
    else
    {
        return XS_ERROR;
    }

    xs_MdelayKTask(10000);
    xs_kprintf("The UDP send_receive function is running......\n");

    while(1)
    {
//      CH438UARTSend(6, UDP_read_data, sizeof(UDP_read_data));                                                   //UDP_read_data
        xs_DeviceWrite(hfa21, 0, UDP_read_data, sizeof(UDP_read_data));
        xs_kprintf("hfa21 write cmd\n");
        xs_KSemaphoreObtain(Rx_Sem, XS_WAITING_FOREVER);
        xs_MdelayKTask(1000);
    }

    return XS_EOK;
}
MSH_CMD_EXPORT(OML_UDP, oml);

/*********************************************************************************************/
// IP 192.168.250.50  port  102  tcp

//工控机的测试代码，数据帧头FF，帧尾FE，数据帧长度不固�?static struct xs_MessageQueue *ipc_mq;
xs_device_t ipc_hfa21;

static xs_err_t ipc_uart_input(xs_device_t dev, xs_size_t size)
{
    struct rx_msg msg;
    xs_err_t result;
    msg.dev = dev;
    msg.size = size;
    result = xs_KMsgQueueSend(ipc_mq, &msg, sizeof(msg));

    if(result == -XS_EFULL)
    {
        xs_kprintf("ipc_mq message queue full!\r\n");
    }

    xs_KSemaphoreAbandon(Ch_Sem);
    return result;
}

static void ipc_plc_thread(void* parameter)
{
    struct rx_msg msg;
    xs_err_t ret;
    uint32_t rx_length, total_rx_length = 0;
    uint8_t i;
    unsigned int length = 0;

    while(1)
    {
        ret = xs_KSemaphoreObtain(Ch_Sem, XS_WAITING_FOREVER);

        if(XS_EOK == ret)
        {
            xs_memset(&msg, 0, sizeof(msg));
            ret = xs_KMsgQueueRecv(ipc_mq, &msg, sizeof(msg), XS_WAITING_FOREVER);

            if(XS_EOK == ret)
            {
                rx_length = xs_DeviceRead(ipc_hfa21, 0, redis_data + 2 + sizeof(device_s15) + total_rx_length, msg.size);
                xs_kprintf("dst data length %d total length %d\n", rx_length, total_rx_length);

                for(i = 0; i < rx_length; ++i)
                {
                    xs_kprintf("0x%x ", redis_data[i + 2 + sizeof(device_s15) + total_rx_length]);
                }

                xs_kprintf("\n");
                total_rx_length += rx_length;

                if((0x46 == redis_data[2 + sizeof(device_s15)]) && (0x46 == redis_data[2 + sizeof(device_s15) + 1]) &&
                        (0x45 == redis_data[2 + sizeof(device_s15) + total_rx_length - 1]) && (0x46 == redis_data[2 + sizeof(device_s15) + total_rx_length - 2]))
                {
                    /******format redis data******/
                    redis_data[0] = data_head;
                    redis_data[1] = PLC_IPC_FLAG;
                    memcpy(redis_data + 2, device_s15, sizeof(device_s15));
                    length = 2 + sizeof(device_s15) + total_rx_length;
                    /******end******/
                    // xs_kprintf("redis data : \n");
                    // for(i = 0; i < length; ++i)
                    //  xs_kprintf("0x%x ", redis_data[i]);
                    // xs_kprintf("\n");
                    xs_DeviceWrite(ec200t, 0, redis_data, length);
                    total_rx_length = 0;
                    memset(redis_data, 0, sizeof(redis_data));
                    xs_KSemaphoreAbandon(Rx_Sem);
                }
            }
        }
    }
}

int BRL_IPC(void)
{
    struct SerialConfigure config3 = XS_SERIAL_CONFIG_DEFAULT;
    ipc_hfa21 = xs_DeviceFind("uart3");

    if(!ipc_hfa21)
    {
        xs_kprintf("find ipc_hfa21 failed!\r\n");
        return XS_ERROR;
    }

    Ch_Sem = xs_KCreateSemaphore("Ch_Sem",0,XS_LINKLIST_FLAG_FIFO);

    if(Ch_Sem == NULL)
    {
        xs_kprintf("BRL_IPC create sem failed .\n");
        return XS_ERROR;
    }

    Rx_Sem = xs_KCreateSemaphore("Rx_Sem",0,XS_LINKLIST_FLAG_FIFO);

    if(Rx_Sem == NULL)
    {
        xs_kprintf("BRL_IPC create Rx_sem failed .\n");
        return XS_ERROR;
    }

    ipc_mq = xs_KCreateMsgQueue("ipc_mq",
                                sizeof(struct rx_msg),
                                sizeof(msg_pool),
                                XS_LINKLIST_FLAG_FIFO);

    if(ipc_mq == NULL)
    {
        xs_kprintf("create ipc_mq mutex failed.\n");
        return -1;
    }

    //ipc_hfa21
    config3.BaudRate = BAUD_RATE_460800;
    config3.DataBits = DATA_BITS_8;
    config3.StopBits = STOP_BITS_1;
    config3.bufsz     = XS_SERIAL_RB_BUFSZ;
    config3.parity    = PARITY_NONE;
    xs_DeviceControl(ipc_hfa21, XS_DEVICE_CTRL_CONFIG, &config3);
    xs_DeviceOpen(ipc_hfa21,XS_DEVICE_FLAG_DMA_RX);
    xs_DeviceSetRxIndicate(ipc_hfa21, ipc_uart_input);
    xs_kprintf("ipc_hfa21 init success!\r\n");
    TaskDescriptorPointer thread_ipc_plc = xs_KTaskCreate("ipc_hfa21", ipc_plc_thread, NULL, 1024, 25);

    if(thread_ipc_plc != NULL)
    {
        xs_StartupKTask(thread_ipc_plc);
    }
    else
    {
        return XS_ERROR;
    }

    xs_kprintf("start to receive data...\n");

    while(1)
    {
        xs_MdelayKTask(100);
        xs_KSemaphoreObtain(Rx_Sem, XS_WAITING_FOREVER);
        xs_kprintf("\n");
    }

    return XS_EOK;
}
MSH_CMD_EXPORT(BRL_IPC, IPC server);

/*********************************************************************************************/
// IP 192.168.250.150  port  9898  tcp

//金凤工控机的测试代码，数据帧头FF，帧尾EF
xs_device_t jf_ipc_hfa21;
static sem_t jf_input_sem = NULL;
static sem_t jf_ec200t_sem = NULL;

static xs_err_t jf_ipc_uart_input(xs_device_t dev, xs_size_t size)
{
    xs_KSemaphoreAbandon(jf_input_sem);
    return XS_EOK;
}

static void jf_ipc_plc_thread(void* parameter)
{
    xs_err_t ret;
    uint32_t rx_length, total_rx_length = 0;
    uint8_t i;
    unsigned int length = 0;

    while(1)
    {
        ret = xs_KSemaphoreObtain(jf_input_sem, XS_WAITING_FOREVER);

        if(XS_EOK == ret)
        {
            rx_length = xs_DeviceRead(jf_ipc_hfa21, 0, redis_data + 2 + sizeof(device_s16) + total_rx_length, 512);
            xs_kprintf("dst data length %d total length %d\n", rx_length, total_rx_length);

            for(i = 0; i < rx_length; ++i)
            {
                xs_kprintf("0x%x ", redis_data[i + 2 + sizeof(device_s16) + total_rx_length]);
            }

            xs_kprintf("\n");
            total_rx_length += rx_length;

            if(((((unsigned int)redis_data[2 + sizeof(device_s16) + 2] & 0x000000FF) << 8) | ((unsigned int)redis_data[2 + sizeof(device_s16) + 3] & 0x000000FF) == total_rx_length) &&
                    (0xFF == redis_data[2 + sizeof(device_s16)]) && (0x20 == redis_data[2 + sizeof(device_s16) + 1]))
            {
                /******format redis data******/
                redis_data[0] = data_head;
                redis_data[1] = PLC_JF_IPC_FLAG;
                memcpy(redis_data + 2, device_s16, sizeof(device_s16));
                length = 2 + sizeof(device_s16) + total_rx_length;
                /******end******/
                xs_DeviceWrite(ec200t, 0, redis_data, length);
                total_rx_length = 0;
                memset(redis_data, 0, sizeof(redis_data));
                xs_KSemaphoreAbandon(jf_ec200t_sem);
            }
        }
    }
}

int JF_IPC(void)
{
    struct SerialConfigure config3 = XS_SERIAL_CONFIG_DEFAULT;
    jf_ipc_hfa21 = xs_DeviceFind("uart3");

    if(!jf_ipc_hfa21)
    {
        xs_kprintf("find jf_ipc_hfa21 failed!\r\n");
        return XS_ERROR;
    }

    jf_ec200t_sem = xs_KCreateSemaphore("jf_ec200t_sem",0,XS_LINKLIST_FLAG_FIFO);

    if(jf_ec200t_sem == NULL)
    {
        xs_kprintf("JF_IPC create jf_ec200t_sem failed .\n");
        return XS_ERROR;
    }

    jf_input_sem = xs_KCreateSemaphore("jf_input_sem",0,XS_LINKLIST_FLAG_FIFO);

    if(jf_input_sem == NULL)
    {
        xs_kprintf("JF_IPC create jf_input_sem failed .\n");
        return XS_ERROR;
    }

    //jf_ipc_hfa21
    config3.BaudRate = BAUD_RATE_460800;
    config3.DataBits = DATA_BITS_8;
    config3.StopBits = STOP_BITS_1;
    config3.bufsz     = XS_SERIAL_RB_BUFSZ;
    config3.parity    = PARITY_NONE;
    xs_DeviceControl(jf_ipc_hfa21, XS_DEVICE_CTRL_CONFIG, &config3);
    xs_DeviceOpen(jf_ipc_hfa21,XS_DEVICE_FLAG_DMA_RX);
    xs_DeviceSetRxIndicate(jf_ipc_hfa21, jf_ipc_uart_input);
    xs_kprintf("jf_ipc_hfa21 init success!\r\n");
    TaskDescriptorPointer thread_jf_ipc_plc = xs_KTaskCreate("jf_ipc_hfa21", jf_ipc_plc_thread, NULL, 1024, 25);

    if(thread_jf_ipc_plc != NULL)
    {
        xs_StartupKTask(thread_jf_ipc_plc);
    }
    else
    {
        return XS_ERROR;
    }

    xs_kprintf("start to receive data...\n");

    while(1)
    {
        xs_MdelayKTask(100);
        xs_KSemaphoreObtain(jf_ec200t_sem, XS_WAITING_FOREVER);
        xs_kprintf("JF send data to server done\n");
    }

    return XS_EOK;
}
MSH_CMD_EXPORT(JF_IPC, JF IPC client);

/*********************************************************************************************/
//西门子PLC      IP 192.168.250.9   port  102

static xs_device_t siemens_hfa21;
static sem_t siemens_input_sem = NULL;
static sem_t siemens_ec200t_sem = NULL;

static xs_err_t siemens_uart_input(xs_device_t dev, xs_size_t size)
{
    xs_KSemaphoreAbandon(siemens_input_sem);
    return XS_EOK;
}

static void siemens_plc_thread(void* parameter)
{
    xs_err_t ret;
    uint32_t rx_length, total_rx_length = 0;
    uint8_t i;
    static char shakehand_cnt = 0;
    unsigned int length = 0;

    while(1)
    {
        ret = xs_KSemaphoreObtain(siemens_input_sem, XS_WAITING_FOREVER);

        if(XS_EOK == ret)
        {
            //rx_length = xs_DeviceRead(siemens_hfa21, 0, redis_data, 234);
            // xs_kprintf("siemens dst data length %d\n", rx_length);
            // for(i = 0; i < rx_length; ++i)
            //  xs_kprintf("0x%x ", redis_data[i]);
            // xs_kprintf("\n");
            if(shakehand_cnt < 2)
            {
                //ignore first two siemens input sem
                xs_DeviceRead(siemens_hfa21, 0, redis_data + 2 + sizeof(device_s17), 87);
                shakehand_cnt++;
                continue;
            }

            rx_length = xs_DeviceRead(siemens_hfa21, 0, redis_data + 2 + sizeof(device_s17) + total_rx_length, 87);
            xs_kprintf("siemens dst data length %d total length %d\n", rx_length, total_rx_length);

            for(i = 0; i < rx_length; ++i)
            {
                xs_kprintf("0x%x ", redis_data[i + 2 + sizeof(device_s17) + total_rx_length]);
            }

            xs_kprintf("\n");
            total_rx_length += rx_length;

            if((87 == total_rx_length) && (0x03 == redis_data[2 + sizeof(device_s17)])
                    && (0x00 == redis_data[2 + sizeof(device_s17) + 1])
                    && (0x00 == redis_data[2 + sizeof(device_s17) + 2])
                    && (0x57 == redis_data[2 + sizeof(device_s17) + 3]))
            {
                /******format redis data******/
                redis_data[0] = data_head;
                redis_data[1] = PLC_SIEMENS_FLAG;
                memcpy(redis_data + 2, device_s17, sizeof(device_s17));
                length = 2 + sizeof(device_s17) + total_rx_length;
                /******end******/
                xs_DeviceWrite(ec200t, 0, redis_data, length);
                total_rx_length = 0;
                memset(redis_data, 0, sizeof(redis_data));
                xs_KSemaphoreAbandon(siemens_ec200t_sem);
            }
        }
    }
}

int SIEMENS_TCP(void)
{
    xs_err_t result;
    struct SerialConfigure config3 = XS_SERIAL_CONFIG_DEFAULT;
    siemens_hfa21 = xs_DeviceFind("uart3");

    if(!siemens_hfa21)
    {
        xs_kprintf("find siemens_hfa21 failed!\r\n");
        return XS_ERROR;
    }

    siemens_input_sem = xs_KCreateSemaphore("siemens_input_sem", 0, XS_LINKLIST_FLAG_FIFO);

    if(siemens_input_sem == NULL)
    {
        xs_kprintf("siemens_hfa21 create siemens_input_sem failed.\n");
        return XS_ERROR;
    }

    siemens_ec200t_sem = xs_KCreateSemaphore("siemens_ec200t_sem", 0, XS_LINKLIST_FLAG_FIFO);

    if(siemens_ec200t_sem == NULL)
    {
        xs_kprintf("siemens_hfa21 create siemens_ec200t_sem failed.\n");
        return XS_ERROR;
    }

    //siemens_hfa21
    config3.BaudRate = BAUD_RATE_460800;
    config3.DataBits = DATA_BITS_8;
    config3.StopBits = STOP_BITS_1;
    config3.bufsz     = XS_SERIAL_RB_BUFSZ;
    config3.parity    = PARITY_NONE;
    xs_DeviceControl(siemens_hfa21, XS_DEVICE_CTRL_CONFIG, &config3);
    xs_DeviceOpen(siemens_hfa21, XS_DEVICE_FLAG_DMA_RX);
    xs_DeviceSetRxIndicate(siemens_hfa21, siemens_uart_input);
    TaskDescriptorPointer thread_siemens_plc = xs_KTaskCreate("siemens_hfa21", siemens_plc_thread, NULL, 1024, 25);

    if(thread_siemens_plc != NULL)
    {
        xs_StartupKTask(thread_siemens_plc);
    }
    else
    {
        return XS_ERROR;
    }

    //step1 : send handshake_first cmd, waiting for response sem
    xs_kprintf("siemens_hfa21 start send handshake_first!\r\n");
    //CH438UARTSend(6, handshake_first, sizeof(handshake_first));
    xs_DeviceWrite(siemens_hfa21, 0, handshake_first, sizeof(handshake_first));
    xs_MdelayKTask(3000);
    xs_DeviceWrite(siemens_hfa21, 0, handshake_first, sizeof(handshake_first));
    xs_MdelayKTask(500);
    //step2 : send handshake_second cmd, waiting for response sem
    xs_kprintf("siemens_hfa21 start send handshake_second!\r\n");
    //CH438UARTSend(6, handshake_second, sizeof(handshake_second));
    xs_DeviceWrite(siemens_hfa21, 0, handshake_second, sizeof(handshake_second));
    xs_kprintf("siemens_hfa21 init success!\r\n");
    xs_MdelayKTask(500);

    while(1)
    {
        //CH438UARTSend(6, siemens_read_data, sizeof(siemens_read_data));                                                   //read_data
        xs_DeviceWrite(siemens_hfa21, 0, siemens_read_data, sizeof(siemens_read_data));
        xs_kprintf("siemens hfa21 write cmd\n");
        xs_KSemaphoreObtain(siemens_ec200t_sem, XS_WAITING_FOREVER);
        xs_MdelayKTask(1000);
    }

    return XS_EOK;
}
MSH_CMD_EXPORT(SIEMENS_TCP, Siemens TCP PLC);

/*********************************************************************************************/
//西门�?1200 PLC      IP 192.168.250.107   port  102

static xs_device_t siemens_1200_hfa21;
static sem_t siemens_1200_input_sem = NULL;
static sem_t siemens_1200_ec200t_sem = NULL;

static xs_err_t siemens_1200_uart_input(xs_device_t dev, xs_size_t size)
{
    xs_KSemaphoreAbandon(siemens_1200_input_sem);
    return XS_EOK;
}

static void siemens_1200_plc_thread(void* parameter)
{
    xs_err_t ret;
    uint32_t rx_length, total_rx_length = 0;
    uint8_t i;
    static char shakehand_cnt = 0;
    unsigned int length = 0;

    while(1)
    {
        ret = xs_KSemaphoreObtain(siemens_1200_input_sem, XS_WAITING_FOREVER);

        if(XS_EOK == ret)
        {
            if(shakehand_cnt < 2)
            {
                //ignore first two siemens input sem
                xs_DeviceRead(siemens_1200_hfa21, 0, redis_data + 2 + sizeof(device_s18), 235);
                shakehand_cnt++;
                continue;
            }

            rx_length = xs_DeviceRead(siemens_1200_hfa21, 0, redis_data + 2 + sizeof(device_s18) + total_rx_length, 235);
            xs_kprintf("siemens 1200 dst data length %d total length %d\n", rx_length, total_rx_length);

            for(i = 0; i < rx_length; ++i)
            {
                xs_kprintf("0x%x ", redis_data[i + 2 + sizeof(device_s18) + total_rx_length]);
            }

            xs_kprintf("\n");
            total_rx_length += rx_length;

            if((235 == total_rx_length) && (0x03 == redis_data[2 + sizeof(device_s18)])
                    && (0x00 == redis_data[2 + sizeof(device_s18) + 1])
                    && (0x00 == redis_data[2 + sizeof(device_s18) + 2])
                    && (0xEB == redis_data[2 + sizeof(device_s18) + 3]))
            {
                /******format redis data******/
                redis_data[0] = data_head;
                redis_data[1] = PLC_SIEMENS_1200_FLAG;
                memcpy(redis_data + 2, device_s18, sizeof(device_s18));
                length = 2 + sizeof(device_s18) + total_rx_length;
                /******end******/
                xs_DeviceWrite(ec200t, 0, redis_data, length);
                total_rx_length = 0;
                memset(redis_data, 0, sizeof(redis_data));
                xs_KSemaphoreAbandon(siemens_1200_ec200t_sem);
            }
        }
    }
}

int SIEMENS_1200(void)
{
    xs_err_t result;
    struct SerialConfigure config3 = XS_SERIAL_CONFIG_DEFAULT;
    siemens_1200_hfa21 = xs_DeviceFind("uart3");

    if(!siemens_1200_hfa21)
    {
        xs_kprintf("find siemens_1200_hfa21 failed!\r\n");
        return XS_ERROR;
    }

    siemens_1200_input_sem = xs_KCreateSemaphore("siemens_1200_input_sem", 0, XS_LINKLIST_FLAG_FIFO);

    if(siemens_1200_input_sem == NULL)
    {
        xs_kprintf("siemens_1200_hfa21 create siemens_1200_input_sem failed.\n");
        return XS_ERROR;
    }

    siemens_1200_ec200t_sem = xs_KCreateSemaphore("siemens_1200_ec200t_sem", 0, XS_LINKLIST_FLAG_FIFO);

    if(siemens_1200_ec200t_sem == NULL)
    {
        xs_kprintf("siemens_1200_hfa21 create siemens_1200_ec200t_sem failed.\n");
        return XS_ERROR;
    }

    //siemens_hfa21
    config3.BaudRate = BAUD_RATE_460800;
    config3.DataBits = DATA_BITS_8;
    config3.StopBits = STOP_BITS_1;
    config3.bufsz     = XS_SERIAL_RB_BUFSZ;
    config3.parity    = PARITY_NONE;
    xs_DeviceControl(siemens_1200_hfa21, XS_DEVICE_CTRL_CONFIG, &config3);
    xs_DeviceOpen(siemens_1200_hfa21, XS_DEVICE_FLAG_DMA_RX);
    xs_DeviceSetRxIndicate(siemens_1200_hfa21, siemens_1200_uart_input);
    TaskDescriptorPointer thread_siemens_1200_plc = xs_KTaskCreate("siemens_1200_hfa21", siemens_1200_plc_thread, NULL, 1024, 25);

    if(thread_siemens_1200_plc != NULL)
    {
        xs_StartupKTask(thread_siemens_1200_plc);
    }
    else
    {
        return XS_ERROR;
    }

    //step1 : send handshake_1200_first cmd, waiting for response sem
    xs_kprintf("siemens_1200_hfa21 start send handshake_1200_first!\r\n");
    //CH438UARTSend(6, handshake_1200_first, sizeof(handshake_1200_first));
    xs_DeviceWrite(siemens_1200_hfa21, 0, handshake_1200_first, sizeof(handshake_1200_first));
    xs_MdelayKTask(3000);
    xs_DeviceWrite(siemens_1200_hfa21, 0, handshake_1200_first, sizeof(handshake_1200_first));
    xs_MdelayKTask(500);
    //step2 : send handshake_1200_second cmd, waiting for response sem
    xs_kprintf("siemens_1200_hfa21 start send handshake_1200_second!\r\n");
    //CH438UARTSend(6, handshake_1200_second, sizeof(handshake_1200_second));
    xs_DeviceWrite(siemens_1200_hfa21, 0, handshake_1200_second, sizeof(handshake_1200_second));
    xs_kprintf("siemens_1200_hfa21 init success!\r\n");
    xs_MdelayKTask(500);

    while(1)
    {
        //CH438UARTSend(6, siemens_1200_read_data, sizeof(siemens_1200_read_data));                                                   //read_data
        xs_DeviceWrite(siemens_1200_hfa21, 0, siemens_1200_read_data, sizeof(siemens_1200_read_data));
        xs_kprintf("siemens 1200 hfa21 write cmd\n");
        xs_KSemaphoreObtain(siemens_1200_ec200t_sem, XS_WAITING_FOREVER);
        xs_MdelayKTask(1000);
    }

    return XS_EOK;
}
MSH_CMD_EXPORT(SIEMENS_1200, Siemens 1200 PLC);
#endif

/*********************************************************************************************/
//贝加莱PLC      IP 192.168.250.4   port  12000
static unsigned char brl_redis_data[2048];
static xs_device_t brl_plc_hfa21;
static sem_t brl_plc_input_sem = NULL;
static sem_t brl_plc_ec200t_sem = NULL;

static xs_err_t brl_plc_uart_input(xs_device_t dev, xs_size_t size)
{
    xs_KSemaphoreAbandon(brl_plc_input_sem);
    return XS_EOK;
}

static void brl_plc_thread(void* parameter)
{
    xs_err_t ret;
    uint32_t rx_length, total_rx_length = 0;
    uint8_t i;
    unsigned int length = 0;

    while(1)
    {
        ret = xs_KSemaphoreObtain(brl_plc_input_sem, XS_WAITING_FOREVER);

        if(XS_EOK == ret)
        {
            xs_kprintf("before total %d\n", total_rx_length);
            rx_length = xs_DeviceRead(brl_plc_hfa21, 0, brl_redis_data + 2 + total_rx_length, 1640);
            xs_kprintf("brl dst data length %d total length %d\n", rx_length, total_rx_length);

            for(i = 0; i < rx_length / 10; i ++)
            {
                xs_kprintf("0x%x ", brl_redis_data[i + 2 + total_rx_length]);
            }

            xs_kprintf("\n");
            total_rx_length += rx_length;

            if(total_rx_length > 1640)
            {
                xs_kprintf("ERROR : rx_buffer is full total_rx_length %d\n", total_rx_length);
                total_rx_length = 0;
                memset(brl_redis_data, 0, sizeof(brl_redis_data));
                xs_KSemaphoreAbandon(brl_plc_ec200t_sem);
                continue;
            }

            if((1640 == total_rx_length) && (0x53 == brl_redis_data[2]))
            {
                /******format redis data******/
                brl_redis_data[0] = data_head;
                brl_redis_data[1] = PLC_BRL_FLAG;
                length = 2 + total_rx_length;

                /******end******/
                for(i = 0; i < 10; i ++)
                {
                    xs_kprintf("0x%x ", brl_redis_data[i + 1478]);
                }

                xs_kprintf("\n");
                xs_DeviceWrite(ec200t, 0, brl_redis_data, length);
                total_rx_length = 0;
                memset(brl_redis_data, 0, sizeof(brl_redis_data));
                xs_KSemaphoreAbandon(brl_plc_ec200t_sem);
            }
        }
    }
}

int BRL_PLC(void)
{
    xs_err_t result;
    const unsigned char brl_reply_data[] = {0x1, 0x1, 0x1};
    struct SerialConfigure config3 = XS_SERIAL_CONFIG_DEFAULT;
    brl_plc_hfa21 = xs_DeviceFind("uart3");

    if(!brl_plc_hfa21)
    {
        xs_kprintf("find brl_plc_hfa21 failed!\r\n");
        return XS_ERROR;
    }

    brl_plc_input_sem = xs_KCreateSemaphore("brl_plc_input_sem", 0, XS_LINKLIST_FLAG_FIFO);

    if(brl_plc_input_sem == NULL)
    {
        xs_kprintf("brl_plc_hfa21 create brl_plc_input_sem failed.\n");
        return XS_ERROR;
    }

    brl_plc_ec200t_sem = xs_KCreateSemaphore("brl_plc_ec200t_sem", 0, XS_LINKLIST_FLAG_FIFO);

    if(brl_plc_ec200t_sem == NULL)
    {
        xs_kprintf("brl_plc_hfa21 create brl_plc_ec200t_sem failed.\n");
        return XS_ERROR;
    }

    //brl_hfa21
    config3.BaudRate = BAUD_RATE_460800;
    config3.DataBits = DATA_BITS_8;
    config3.StopBits = STOP_BITS_1;
    config3.bufsz     = 2048;
    config3.parity    = PARITY_NONE;
    xs_DeviceControl(brl_plc_hfa21, XS_DEVICE_CTRL_CONFIG, &config3);
    xs_DeviceOpen(brl_plc_hfa21, XS_DEVICE_FLAG_DMA_RX);
    xs_DeviceSetRxIndicate(brl_plc_hfa21, brl_plc_uart_input);
    TaskDescriptorPointer thread_brl_plc = xs_KTaskCreate("brl_plc_hfa21", brl_plc_thread, NULL, 1024, 25);

    if(thread_brl_plc != NULL)
    {
        xs_StartupKTask(thread_brl_plc);
    }
    else
    {
        return XS_ERROR;
    }

    xs_kprintf("brl_plc_hfa21 init success!\r\n");
    xs_MdelayKTask(500);

    while(1)
    {
        //CH438UARTSend(6, brl_reply_data, sizeof(brl_reply_data));
        xs_kprintf("brl_plc hfa21 write cmd\n");                                                //read_data
        xs_DeviceWrite(brl_plc_hfa21, 0, brl_reply_data, sizeof(brl_reply_data));
        xs_KSemaphoreObtain(brl_plc_ec200t_sem, XS_WAITING_FOREVER);
    }

    return XS_EOK;
}

MSH_CMD_EXPORT(BRL_PLC, Brl PLC);

