
#include "shell.h"
#include "ch32v30x.h"
#include "ch32v30x_usart.h"
#include "connect_uart.h"

// UART5发送数据
static void UART5_SendData(uint8_t data)
{
    // 等待发送缓冲区为空
    while (USART_GetFlagStatus(UART5, USART_FLAG_TXE) == RESET)
    {
    }

    // 发送数据
    USART_SendData(UART5, data);
}

// UART5接收数据
static uint8_t UART5_ReceiveData(void)
{
    // 等待接收缓冲区非空
    while (USART_GetFlagStatus(UART5, USART_FLAG_RXNE) == RESET)
    {
    }

    // 读取接收数据
    return USART_ReceiveData(UART5);
}

static void UART5_SendString(const char *buffer)
{
    size_t len = strlen(buffer);
    for (size_t i = 0; i < len; i++)
    {
        if (buffer[i] != '\r' || buffer[i] != '\n')
        {
            UART5_SendData(buffer[i]);
        }
    }
}

static void UART5_ReceiveString(char *buffer, size_t bufferSize)
{
    size_t i = 0;

    while (i < bufferSize - 1)
    {
        char receivedChar = UART5_ReceiveData();

        if (receivedChar == '\n')
        {
            // 收到回车或换行符，表示字符串接收完毕
            break;
        }

        buffer[i] = receivedChar;
        i++;
    }

    buffer[i] = '\0'; // 在字符串末尾添加空字符，表示字符串结束

    while (USART_GetFlagStatus(UART5, USART_FLAG_RXNE) != RESET)
    {
        char dummy = USART_ReceiveData(UART5);
        (void)dummy; // 避免编译器警告
    }
}

int test_rs485(int argc, char *argv[])
{
    KPrintf("485 Test\r\n");
    char receiveBuffer[100];
    char *sendString = " hello aiit 485\r\n";
    int n = 10;
    UART5_SendString(sendString);
    while (n--)
    {
        // 接收字符串
        UART5_ReceiveString(receiveBuffer, sizeof(receiveBuffer));
        KPrintf("%s\r\n", receiveBuffer);
        if (receiveBuffer[0] == 0xfd)
        {
            UART5_SendString(sendString);
        }
        else
        {
            USART_ClearFlag(UART5, USART_FLAG_TC);
            UART5_SendString(receiveBuffer);
        }
    }

    return 0;
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN),
                 test_rs485, test_rs485, test rs485);