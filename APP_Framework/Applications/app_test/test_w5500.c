#include <stdio.h>
#include <string.h>
#include <transform.h>

#include <socket.h>

#define BUFF_SIZE 128
#define RECV_SIZE 16
#define TCP_PORT  12345

const static uint32_t sn = 0;
const static uint32_t socket_tcp = 0;

static int32_t wiz_server_op(uint8_t sn, uint8_t *buf, uint32_t buf_size,
                      uint16_t port, enum TCP_OPTION opt) {
  int32_t ret = 0;
  uint16_t size = 0, sentsize = 0;
  switch (getSn_SR(sn)) {
    case SOCK_ESTABLISHED:
      if (getSn_IR(sn) & Sn_IR_CON) {
        printf("%d:Connected\r\n", sn);
        setSn_IR(sn, Sn_IR_CON);
      }
      if (opt == SEND_DATA) {
        uint32_t sent_size = 0;
        memset(buf,0,buf_size);
        strcpy(buf,"The message has been recved");
        ret = wiz_sock_send(socket_tcp, buf, buf_size);
        if (ret < 0) {
          wiz_sock_close(socket_tcp);
          return ret;
        }
      } else if (opt == RECV_DATA) {
        uint32_t size = 0;
        if ((size = getSn_RX_RSR(sn)) > 0) {
          if (size > buf_size) size = buf_size;
          memset(buf,0,buf_size);
          ret = wiz_sock_recv(sn, buf, size);
          printf("Recv message: %s\n",buf);
          return ret;
        }
      }
      break;
    case SOCK_CLOSE_WAIT:
      printf("%d:CloseWait\r\n", sn);
      if ((ret = wiz_sock_disconnect(sn)) != SOCK_OK) return ret;
      printf("%d:Closed\r\n", sn);
      break;
    case SOCK_INIT:
      printf("%d:Listen, port [%d]\r\n", sn, port);
      if ((ret = wiz_sock_listen(sn)) != SOCK_OK) return ret;
      break;
    case SOCK_CLOSED:
      printf("%d:LBTStart\r\n", sn);
      if ((ret = wiz_socket(sn, Sn_MR_TCP, port, 0x00)) != sn) return ret;
      printf("%d:Opened\r\n", sn);
      break;
    default:
      break;
  }
  return 0;
}

void TestSocketInW5500(int argc, char *argv[])
{
    x_err_t ret;
    uint8_t buf[BUFF_SIZE] = {0};

    while (1) {
        ret = wiz_server_op(0, buf, BUFF_SIZE, TCP_PORT, RECV_DATA);
        if (ret > 0) {
        wiz_server_op(0, buf, BUFF_SIZE, TCP_PORT, SEND_DATA);
        };
    }

    return ;
    
}


PRIV_SHELL_CMD_FUNCTION(TestSocketInW5500, a w5500 test sample, PRIV_SHELL_CMD_MAIN_ATTR);