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
    int16_t frame_flag;          ///< frame start flag 2 Bytes
    uint8_t dev_type;            ///< device type
    uint8_t burn_mode;           ///< data burn way
    uint32_t total_len;          ///< send data total length caculated from each frame_len 
    uint32_t dev_hid;            ///< device hardware version
    uint32_t dev_sid;            ///< device software version
    char resv[8];               ///< reserve
};

struct ota_frame_t
{
    uint32_t frame_id;           ///< Current frame id
    uint32_t frame_len;          ///< Current frame data length
    char     frame_data[64];       ///< Current frame data,max length 224
    uint32_t crc;                ///< Current frame data crc
};

struct ota_data
{
    struct ota_header_t header;
    struct ota_frame_t frame;
    char end[2];
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

    file_fd = fopen("/home/aep04/wwg/XiUOS_aiit-arm32-board_app.bin", "r");
    if (NULL == file_fd){
        printf("open file failed.\n");
        return -1;
    }
    fseek(file_fd, 0, SEEK_SET);
    printf("start send file.\n");
    // while((ch = fgetc(file_fd)) != EOF)
    while(!feof(file_fd))
    {
        memset(&data, 0, sizeof(data));

        data.header.frame_flag = 0x5A5A;
        len = fread( data.frame.frame_data, 1, 64, file_fd );
        if(len > 0) 
        {
            data.frame.frame_id = frame_cnt;
            data.frame.frame_len = len;
            data.frame.crc = OtaCrc16(data.frame.frame_data, len);
            file_length += len;
        }
        memcpy(data.end,"!@",2);
        fseek(file_fd, len, SEEK_CUR);

try_again:
        send(fd, &data, sizeof(data), MSG_NOSIGNAL);
        len = recv(fd, buf, sizeof(buf), 0);
        if(0 == strncmp(buf, "ok", len))
        {
            try_times = 5;
            printf("ota send current[%d] frame.\n",frame_cnt);
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

        len = fread(file_buf, file_length,1,file_fd);
        if(len > 0) {
            data.header.total_len = file_length;
            data.frame.frame_len = strlen("aiit_ota_end");;
            data.frame.crc = OtaCrc16(file_buf, len);
            memcpy(data.frame.frame_data,"aiit_ota_end",strlen("aiit_ota_end"));
            memcpy(data.end,"!@",2);
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
    int ret = 0;

    printf("pthread = %d\n",fd);
    sleep(10);
    while(1)
    {
        memset(&data, 0 , sizeof(struct ota_data));
        data.header.frame_flag = 0x5A5A;
        memcpy(data.frame.frame_data,"aiit_ota_start",strlen("aiit_ota_start"));
        data.frame.frame_len = strlen("aiit_ota_start");
        memcpy(data.end,"!@",2);
        ret = send(fd, &data, sizeof(data), MSG_NOSIGNAL);
        if (ret > 0){
            printf("send %s[%d] Bytes\n",data.frame.frame_data,ret);
        }
        // sleep(1);
        len = recv(fd, buf, sizeof(buf), 0);
        if (len <= 0)
        {
            continue;
        }
        else 
        {
            printf("recv buf %s\n",buf);
            if(0 == strncmp(buf, "ready", len))
            {
                ret = OtaFileSend(fd);
                if (ret == 0) {
                    printf("ota file send successful.\n");
                    break;
                } else { /* ota failed then restart the ota process */
                    continue;
                }
            }
        }
    }
    printf("exit fd = %d\n",fd);
    close(fd);
    pthread_exit(0);
}

void server(void)
{
    printf("ota Server startup\n");
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

