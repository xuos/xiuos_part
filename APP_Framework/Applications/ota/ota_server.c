#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <pthread.h>
#include <time.h>

#include <sys/types.h>
#include <errno.h>
#include <sys/time.h>
#include <assert.h>
#include <netdb.h>

#include <sys/stat.h>
#include <fcntl.h>

/*******************************mail*****************************/

#define MAX_BUFF_SIZE   (2048)
#define IP_ADDR         ("smtp.163.com")
#define IP_ADDR_PORT    (25)
#define USERNAME        ("18535861947@163.com")
#define TO_ADDRESS      ("522736215@qq.com")
#define ACCESS_PORT     ("有链接已接入服务器端口")
#define USING_DEVICE_AUTH            1


#define BUFLEN 1024
#define LISTNUM 20
#define IP_ADDRESS "0.0.0.0"

/*宏定义*/
#define SID_MAX_LENGHT 16
#define NAME_MAX_LENGHT 16
#define MAJOR_MAX_LENGHT 64
#define CMD_MAX_LENGHT  1024
#define REDIS_SERVER_IP "127.0.0.1"
#define REDIS_SERVER_PORT 6379

typedef int BOOL;
#define true 1
#define false 0

int serverfd;//服务器socket
int clientfd[100000];//客户端的socketfd,100个元素，clientfd[0]~clientfd[99]
int size = 99999;//用来控制进入聊天室的人数为50以内
int PORT = 9898;//端口号
typedef struct sockaddr meng;
socklen_t len;

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

pthread_t ota_ktask;

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

void init(void)
{
    serverfd = socket(PF_INET,SOCK_STREAM,0);

    if (serverfd == -1)
    {
        perror("创建socket失败");
        exit(-1);
    }

//为套接字设置ip协议 设置端口号  并自动获取本机ip转化为网络ip

    struct sockaddr_in addr;//存储套接字的信息
    addr.sin_family = AF_INET;//地址族
    addr.sin_port = htons(PORT);//设置server端端口号，你可以随便设置,当sin_port = 0时，系统随机选择一个未被使用的端口号
    addr.sin_addr.s_addr = htons(INADDR_ANY);//当sin_addr = INADDR_ANY时，表示从本机的任一网卡接收数据

//绑定套接字
    int on = 1;
    if(setsockopt(serverfd, SOL_SOCKET, SO_REUSEADDR, &on, sizeof(int)) < 0)
    {
        perror("端口设置失败");
        exit(-1);
    }

    if (bind(serverfd,(meng*)&addr,sizeof(addr)) == -1)
    {
       perror("绑定失败");
       exit(-1);
    }

    if (listen(serverfd,100) == -1)
    {//监听最大连接数
        perror("设置监听失败");
        exit(-1);
    }
}
int OtaFileSend(int fd)
{
    unsigned char buf[32] = { 0 };
    struct ota_data data;
    FILE *file_fd;
    char ch;
    int len = 0;
    int try_times = 5;
    int ret = 0;
    int  frame_cnt = 0;
    int file_length = 0;
    char * file_buf = NULL;

    file_fd = fopen("/tmp/xiuos_app.bin", "r");

    while((ch = fgetc(file_fd)) != EOF)
    {
        memset(&data, 0, sizeof(data));

        data.header.frame_flag = 0x5A5A;
        len = read(file_fd, data.frame.frame_data, 200 );
        if(len > 0) {
            data.frame.frame_id = frame_cnt;
            data.frame.frame_len = len;
            data.frame.crc = OtaCrc16(data.frame.frame_data, len);
            file_length += len;
        }
        lseek(file_fd, len, SEEK_CUR);

try_again:
        send(fd, &data, sizeof(data), MSG_NOSIGNAL);
        len = recv(fd, buf, sizeof(buf), 0);
        if(0 == strncmp(buf, "ok", len))
        {
            frame_cnt++;
            continue;
        } 
        else
        {
            if(try_times > 0)
            {
                try_times--;
                goto try_again;
            } 
            else
            {
                printf("send frame[%d] 5 times failed.\n",frame_cnt);
                ret = -1;
                break;
            }
        }
    }

    if (ret == 0)
    {
        file_buf = malloc(file_length);
        memset(file_buf, 0, file_length);
        memset(&data, 0, sizeof(data));

        data.header.frame_flag = 0x5A5A;

        len = read(file_fd, file_buf, file_length);
        if(len > 0) {
            data.frame.frame_len = strlen("aiit_ota_end!@");;
            data.frame.crc = OtaCrc16(file_buf, len);
            memcpy(data.frame.frame_data,"aiit_ota_end!@",strlen("aiit_ota_end!@"));
        }
        send(fd, &data, sizeof(data), MSG_NOSIGNAL);
        free(file_buf);
    }

    fclose(file_fd);
    return ret;
}

void* server_thread(void* p)
{
    int fd = *(int*)p;
    unsigned char buf[32] = { 0 };
    struct ota_data data;

    printf("pthread = %d\n",fd);

    while(1)
    {
        memset(&data, 0 , sizeof(struct ota_data));
        data.header.frame_flag = 0x5A5A;
        memcpy(data.frame.frame_data,"aiit_ota_start!@",strlen("aiit_ota_start!@"));
        data.frame.frame_len = strlen("aiit_ota_start!@");

        send(fd, &data, sizeof(data), MSG_NOSIGNAL);

        len = recv(fd, buf, sizeof(buf),0);
        if (len <= 0)
        {
            continue;
        }
        else 
        {
            if(0 == strncmp(buf, "ok", len))
            {
                OtaFileSend(fd);
            }
        }
    }
}

void server(void)
{
    printf("Server startup\n");
    while(1)
    {
        struct sockaddr_in fromaddr;
        socklen_t len = sizeof(fromaddr);
        int fd = accept(serverfd,(meng*)&fromaddr,&len);

//调用accept进入堵塞状态，等待客户端的连接

        if (fd == -1)
        {
            printf("The client connection is wrong...\n");
            continue;
        }

        int i = 0;
        for (i = 0;i < size;i++)
        {
            if (clientfd[i] == 0)
            {
                //记录客户端的socket
                clientfd[i] = fd;

                //有客户端连接之后，启动线程给此客户服务
                pthread_t tid;
                pthread_create(&tid,0,server_thread,&fd);
                break;
            }

            if (size == i)
            {
                //发送给客户端说聊天室满了
                char* str = "Devices full";
                printf("%s", str);
                send(fd,str,strlen(str),0);
                close(fd);
            }
        }
    }
}

int main(void)
{
    init();
    server();
}

