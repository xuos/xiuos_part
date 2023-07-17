#include "transport.h"
#include "lwip/opt.h"
#include "lwip/arch.h"
#include "lwip/api.h"
#include "lwip/inet.h"
#include "lwip/sockets.h"
#include "string.h"

static int mysock;

/************************************************************************
** ��������: transport_sendPacketBuffer									
** ��������: ��TCP��ʽ��������
** ��ڲ���: unsigned char* buf�����ݻ�����
**           int buflen�����ݳ���
** ���ڲ���: <0��������ʧ��							
************************************************************************/
int32_t transport_sendPacketBuffer( uint8_t* buf, int32_t buflen)
{
	int32_t rc;
	rc = write(mysock, buf, buflen);
	return rc;
}

/************************************************************************
** ��������: transport_getdata									
** ��������: �������ķ�ʽ����TCP����
** ��ڲ���: unsigned char* buf�����ݻ�����
**           int count�����ݳ���
** ���ڲ���: <=0��������ʧ��									
************************************************************************/
int transport_getdata(unsigned char* buf, int count)
{
	int32_t rc;
	
  rc = recv(mysock, buf, count, 0);
  lw_print("get data : %lx\n",rc);
	return rc;
}



/************************************************************************
** ��������: transport_open									
** ��������: ��һ���ӿڣ����Һͷ����� ��������
** ��ڲ���: char* servip:����������
**           int   port:�˿ں�
** ���ڲ���: <0������ʧ��										
************************************************************************/
// int32_t transport_open(int8_t* servip, int32_t port)
// {
// 	int32_t *sock = &mysock;
// 	int32_t ret;
// //	int32_t opt;
// 	struct sockaddr_in addr;
	
// 	//��ʼ����������Ϣ
// 	memset(&addr,0,sizeof(addr));
// 	addr.sin_len = sizeof(addr);
// 	addr.sin_family = AF_INET;
// 	//��д�������˿ں�
// 	addr.sin_port = PP_HTONS(port);
// 	//��д������IP��ַ
// 	addr.sin_addr.s_addr = inet_addr((const char*)servip);
	
// 	//����SOCK
// 	*sock = socket(AF_INET,SOCK_STREAM,0);
// 	//���ӷ����� 
// 	ret = connect(*sock,(struct sockaddr*)&addr,sizeof(addr));
// 	if(ret != 0)
// 	{
// 		 //�ر�����
// 		 close(*sock);
// 		 //����ʧ��
// 		 return -1;
// 	}
// 	//���ӳɹ�,���ó�ʱʱ��1000ms
// //	opt = 1000;
// //	setsockopt(*sock,SOL_SOCKET,SO_RCVTIMEO,&opt,sizeof(int));
	
// 	//�����׽���
// 	return *sock;
// }


/************************************************************************
** ��������: transport_close									
** ��������: �ر��׽���
** ��ڲ���: unsigned char* buf�����ݻ�����
**           int buflen�����ݳ���
** ���ڲ���: <0��������ʧ��							
************************************************************************/
int32_t transport_close(void)
{
  
	int rc;
//	rc = close(mysock);
  rc = shutdown(mysock, SHUT_WR);
	rc = recv(mysock, NULL, (size_t)0, 0);
	rc = close(mysock);
	return rc;
}
