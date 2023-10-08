#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#include <errno.h>

#define THREAD_NUM 10
static int isBinary = 0; // transmit binary data
static int port = 9992; // service port
static int dataPort = 9993; // the port for file download
static char order[4]; // receive order
static char param[20]; // receive order param
static char *respMessage; // respose message
static int serverFd;  // the server fd for deal with order requests
static int dataServerFd; // the server fd for file download
struct Data{
    sem_t isReady;
    sem_t isDone;
    char fileName[20];
};

void RecvData(int clientFd,char param[20]){
    recv(clientFd,param,20,0);
    for(int i = 0;i < 20;++i){
        if(param[i] == '\r'){
            param[i] = '\0';
            return;
        }
    }
    return;
}

void SendMessage(int clientFd, char * respMessage){
    int len = 0;
    while(respMessage[len] != '\n'){
        len++;
    }
    send(clientFd,respMessage,len+1,0);
}

int CreateServer(int port) {
    int serverFd = 0;
	struct sockaddr_in serverAddr = {0};
	socklen_t socklen = 0;
	serverFd = socket(AF_INET, SOCK_STREAM, 0);
	if(0 > serverFd)
	{
		printf("创建socket失败\n");
		return 0;
	}	
	printf("in server:serverFd=%d\n",serverFd);
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = htons(port);
	serverAddr.sin_addr.s_addr=htonl(INADDR_ANY);
	if(0 > bind(serverFd, (void *)&serverAddr, sizeof(serverAddr)))
	{
		printf("绑定失败！\n");
		return 0;
	}
	if(0 > listen(serverFd, 1024))
	{
		printf("监听失败！\n");
		return 0;
	}
    return serverFd;
}

// accept a client and receive file's data
void* UpLoadServer(void * args){ 
    struct Data* pData = (struct Data *) args;
    struct sockaddr_in clientAdrr = {0};
    int socketLen = sizeof(clientAdrr);
    int clientFd = accept(dataServerFd,(struct sockaddr *)&clientAdrr,&socketLen);
    printf("accept a client for file upload: clientFd=%d,tid=%ld\n",clientFd,pthread_self());
    char data[4096];
    int ret = recv(clientFd,data,4096,0);
    printf("ret=%d,errno=%d\n",ret,errno);
    FILE * file = fopen(pData->fileName,"wb");  // fileName需要线程间通信
    fwrite(data,4096,1,file);
    fclose(file);
    printf("upload complete for client: clientFd=%d,tid=%ld\n",clientFd,pthread_self());
    sem_post(&pData->isDone);
    close(clientFd);
}

// accept a client and send file's data
void* DownLoadServer(void * args){ 
    struct Data* pData = (struct Data *) args;
    struct sockaddr_in clientAdrr = {0};
    int socketLen = sizeof(clientAdrr);
    int clientFd = accept(dataServerFd,(struct sockaddr *)&clientAdrr,&socketLen);
    printf("accept a client for file download: clientFd=%d,tid=%ld\n",clientFd,pthread_self());

    // wait for fileName ready
    printf("wait for fileName ready,tid=%ld\n",pthread_self());
    sem_wait(&pData->isReady);
    char data[4096];
    FILE * file = fopen(pData->fileName,"rb");  // fileName需要线程间通信
    fread(data,4096,1,file);
    send(clientFd,data,sizeof(data),0);
    fclose(file);
    printf("download complete for client: clientFd=%d,tid=%ld\n",clientFd,pthread_self());
    sem_post(&pData->isDone);
    close(clientFd);
}

// deal with order requests
void* OrderServer(void * args){
    int clientFd = *(int *)args;
    struct Data data;
    printf("in OrderServer thread: tid=%ld\n",pthread_self());
    // order format: USER anonymous\r\n
    // response code format: 213 4096\r\n
    while(1){
        recv(clientFd,order,4,0);
        printf("order=%s,tid=%ld\n",order,pthread_self());
        if(strcmp(order,"USER") == 0){
            RecvData(clientFd,param);
            if(strcmp(param," anonymous") == 0){
                respMessage = "331 Please specify the password.\r\n";
                SendMessage(clientFd,respMessage);
            }
        }else if(strcmp(order,"PASS") == 0){
            RecvData(clientFd,param);
            if(strcmp(param," anonymous") == 0){
                respMessage = "230 Login successful.\r\n";
                SendMessage(clientFd,respMessage);
                printf("login successful in clientFd %d,tid=%ld\n",clientFd,pthread_self());
            }
        }else if(strcmp(order,"TYPE") == 0){
            RecvData(clientFd,param);
            if(strcmp(param," I") == 0){
                isBinary = 1;
                respMessage = "200 Switching to Binary mode.\r\n";
                SendMessage(clientFd,respMessage);
            }
        }else if(strcmp(order,"SIZE") == 0){
            RecvData(clientFd,param);
            respMessage = "213 4096\r\n";
            SendMessage(clientFd,respMessage);
        }else if(strcmp(order,"PASV") == 0){
            sem_init(&data.isReady,0,0);
            sem_init(&data.isDone,0,0);
            RecvData(clientFd,param);
            char buf[50];
            sprintf(buf,"227 Entering passive mode (8,140,53,225,%d,%d).\r\n",dataPort/256,dataPort%256);
            respMessage = buf;
            SendMessage(clientFd,respMessage);
        }else if(strcmp(order,"RETR") == 0){
            RecvData(clientFd,param);
            sprintf(data.fileName,"./data/%s",param+2);
            pthread_t thread;
            pthread_create(&thread,NULL,&DownLoadServer,&data);
            // notify the thread of waiting fileName
            sem_post(&data.isReady);
            char buf[70];
            sprintf(buf,"150 Opening Binary mode data connection for %s (4096 bytes).\r\n",param+1);
            respMessage = buf;
            SendMessage(clientFd,respMessage);
            // wait for download complete
            printf("wait for download complete,tid=%ld\n",pthread_self());
            sem_wait(&data.isDone);
            respMessage = "226 Transfer complete.\r\n";
            SendMessage(clientFd,respMessage);
        }else if(strcmp(order,"STOR") == 0){
            RecvData(clientFd,param);
            sprintf(data.fileName,"./out/%s",param+1);
            pthread_t thread;
            pthread_create(&thread,NULL,&UpLoadServer,&data);
            char buf[70];
            sprintf(buf,"150 Opening Binary mode data connection for %s (4096 bytes).\r\n",param+1);
            respMessage = buf;
            SendMessage(clientFd,respMessage);
            // wait for upload complete
            printf("wait for upload complete,tid=%ld\n",pthread_self());
            sem_wait(&data.isDone);
            respMessage = "226 Transfer complete.\r\n";
            SendMessage(clientFd,respMessage);
        }
        else if(strcmp(order,"QUIT") == 0){
            printf("close clientFd=%d,tid=%ld\n",clientFd,pthread_self());
            close(clientFd);
            break;
        }
    }
    return NULL;
}

int main(){
    serverFd = CreateServer(port);
    dataServerFd = CreateServer(dataPort);
    int clientFds[THREAD_NUM];
    int i = 0;
    while(1){
        struct sockaddr_in clientAdrr = {0}; 
        int socketLen = sizeof(clientAdrr);
        clientFds[i] = accept(serverFd,(struct sockaddr *)&clientAdrr,&socketLen);
        printf("accept a client:fd=%d\n",clientFds[i]);
        respMessage = "220 (myFtpServer 1.0)\r\n";
        SendMessage(clientFds[i],respMessage);
        printf("send successful.\n");
        pthread_t thread;
        pthread_create(&thread,NULL,&OrderServer,&clientFds[i]);
        i++;
    }
    return 0;
}
