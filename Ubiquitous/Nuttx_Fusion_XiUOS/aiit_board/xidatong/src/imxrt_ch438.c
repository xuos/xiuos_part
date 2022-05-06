/*
* Copyright (c) 2020 AIIT XUOS Lab
* XiOS is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*        http://license.coscl.org.cn/MulanPSL2
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
* See the Mulan PSL v2 for more details.
*/

/**
 * @file imxrt_ch438.c
 * @brief imxrt board sd card automount
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022.04.26
 */

#include "imxrt_ch438.h"

#define CH438PORTNUM 8
#define BUFFERSIZE   128

/****************************************************************************
 * Private Function Prototypes
 ****************************************************************************/
static void ImxrtCH438Init(void);
static void CH438PortInit(uint8_t ext_uart_no, uint32_t baud_rate);
static void CH438SetOutput(void);
static void CH438SetInput(void);
static uint8_t ReadCH438Data(uint8_t addr);
static void WriteCH438Data(uint8_t addr, uint8_t dat);
static void WriteCH438Block(uint8_t mAddr, uint8_t mLen, char *mBuf);
static uint8_t CH438UARTRcv(uint8_t ext_uart_no, char *buf);
static size_t ImxrtCh438ReadData(uint8_t ext_uart_no);
static void CH438UARTSend(uint8_t ext_uart_no, char *Data, uint8_t Num);


static int ch438_open(FAR struct file *filep);
static int ch438_close(FAR struct file *filep);
static ssize_t ch438_read(FAR struct file *filep, FAR char *buffer, size_t buflen);
static ssize_t ch438_write(FAR struct file *filep, FAR const char *buffer, size_t buflen);

/****************************************************************************
 * Private type
 ****************************************************************************/
struct ch438_dev_s
{
  uint8_t port;    /* ch438 port number*/
};

/****************************************************************************
 * Private Data
 ****************************************************************************/

static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t  cond = PTHREAD_COND_INITIALIZER;
volatile int done[CH438PORTNUM] = {0};

static	char buff[CH438PORTNUM][BUFFERSIZE];
static	uint8_t buff_ptr[CH438PORTNUM];
static	uint8_t	Interruptnum[CH438PORTNUM] = {0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,};	/* SSR寄存器中断号对应值 */
static 	uint8_t	offsetadd[CH438PORTNUM] = {0x00,0x10,0x20,0x30,0x08,0x18,0x28,0x38,};		/* 串口号的偏移地址 */

static uint8_t gInterruptStatus;

static bool g_ch438open[CH438PORTNUM];
static const struct file_operations g_ch438fops =
{
  ch438_open,
  ch438_close,
  ch438_read,
  ch438_write,
  NULL,
  NULL,
  NULL
};

/****************************************************************************
 * Name: getInterruptStatus
 *
 * Description:
 *   thread task getInterruptStatus
 *
 ****************************************************************************/
int getInterruptStatus(int argc, char **argv)
{
	uint8_t ext_uart_no = 0;
	while(1)
	{
		pthread_mutex_lock(&mutex);
		gInterruptStatus = ReadCH438Data(REG_SSR_ADDR);
		if(!gInterruptStatus)
		{
			pthread_mutex_unlock(&mutex);
			continue;
		}

		for(ext_uart_no = 0; ext_uart_no < CH438PORTNUM; ext_uart_no++)
		{
			if(gInterruptStatus & Interruptnum[ext_uart_no])
			{
				done[ext_uart_no] = 1;
				pthread_cond_signal(&cond);
				pthread_mutex_unlock(&mutex);
			}
		}
	}
}

/****************************************************************************
 * Name: CH438SetOutput
 *
 * Description:
 *   Configure pin mode to output
 *
 ****************************************************************************/
static void CH438SetOutput(void)
{
	imxrt_config_gpio(CH438_D0_PIN_OUT);
	imxrt_config_gpio(CH438_D1_PIN_OUT);
	imxrt_config_gpio(CH438_D2_PIN_OUT);
	imxrt_config_gpio(CH438_D3_PIN_OUT);
	imxrt_config_gpio(CH438_D4_PIN_OUT);
	imxrt_config_gpio(CH438_D5_PIN_OUT);
	imxrt_config_gpio(CH438_D6_PIN_OUT);
	imxrt_config_gpio(CH438_D7_PIN_OUT);
	
}

/****************************************************************************
 * Name: CH438SetInput
 *
 * Description:
 *   Configure pin mode to input
 *
 ****************************************************************************/
static void CH438SetInput(void)
{
	imxrt_config_gpio(CH438_D0_PIN_INPUT);
	imxrt_config_gpio(CH438_D1_PIN_INPUT);
	imxrt_config_gpio(CH438_D2_PIN_INPUT);
	imxrt_config_gpio(CH438_D3_PIN_INPUT);
	imxrt_config_gpio(CH438_D4_PIN_INPUT);
	imxrt_config_gpio(CH438_D5_PIN_INPUT);
	imxrt_config_gpio(CH438_D6_PIN_INPUT);
	imxrt_config_gpio(CH438_D7_PIN_INPUT);	
}

/****************************************************************************
 * Name: ImxrtCH438Init
 *
 * Description:
 *   ch438 initialization
 *
 ****************************************************************************/
static void ImxrtCH438Init(void)
{
	CH438SetOutput();
	imxrt_config_gpio(CH438_NWR_PIN);
	imxrt_config_gpio(CH438_NRD_PIN);
	imxrt_config_gpio(CH438_ALE_PIN);
	
	imxrt_gpio_write(CH438_NWR_PIN,true);
	imxrt_gpio_write(CH438_NRD_PIN,true);
	imxrt_gpio_write(CH438_ALE_PIN,true);
}	

/****************************************************************************
 * Name: CH438PortInit
 *
 * Description:
 *   ch438 port initialization
 *
 ****************************************************************************/
static void CH438PortInit(uint8_t ext_uart_no, uint32_t	baud_rate)
{
	uint32_t div;
	uint8_t	DLL,DLM,dlab;
	uint8_t	REG_LCR_ADDR;
	uint8_t	REG_DLL_ADDR;
	uint8_t	REG_DLM_ADDR;
	uint8_t	REG_IER_ADDR;
	uint8_t	REG_MCR_ADDR;
	uint8_t	REG_FCR_ADDR;
	
	REG_LCR_ADDR = offsetadd[ext_uart_no] | REG_LCR0_ADDR;
	REG_DLL_ADDR = offsetadd[ext_uart_no] | REG_DLL0_ADDR;
	REG_DLM_ADDR = offsetadd[ext_uart_no] | REG_DLM0_ADDR;
	REG_IER_ADDR = offsetadd[ext_uart_no] | REG_IER0_ADDR;
	REG_MCR_ADDR = offsetadd[ext_uart_no] | REG_MCR0_ADDR;
	REG_FCR_ADDR = offsetadd[ext_uart_no] | REG_FCR0_ADDR;
	
    WriteCH438Data(REG_IER_ADDR, BIT_IER_RESET);             /* 复位该串口 */
	up_mdelay(50);
	
	dlab = ReadCH438Data(REG_IER_ADDR);
	dlab &= 0xDF;
	WriteCH438Data(REG_IER_ADDR, dlab);
	
	dlab = ReadCH438Data(REG_LCR_ADDR);
	dlab |= 0x80;		//置LCR寄存器DLAB位为1
	WriteCH438Data(REG_LCR_ADDR, dlab);

    div = ( Fpclk >> 4 ) / baud_rate;
    DLM = div >> 8;
    DLL = div & 0xff;
	WriteCH438Data(REG_DLL_ADDR, DLL);             /* 设置波特率 */
    WriteCH438Data(REG_DLM_ADDR, DLM);
	WriteCH438Data(REG_FCR_ADDR, BIT_FCR_RECVTG1 | BIT_FCR_RECVTG0 | BIT_FCR_FIFOEN);    /* 设置FIFO模式，触发点为112字节 */
    WriteCH438Data(REG_LCR_ADDR, BIT_LCR_WORDSZ1 | BIT_LCR_WORDSZ0 );                     /* 字长8位，1位停止位、无校验 */
	WriteCH438Data(REG_IER_ADDR, BIT_IER_IERECV);    /* 使能中断 */
    WriteCH438Data(REG_MCR_ADDR, BIT_MCR_OUT2);// | BIT_MCR_RTS     | BIT_MCR_DTR 	);              /* 允许中断输出,DTR,RTS为1 */
	WriteCH438Data(REG_FCR_ADDR, ReadCH438Data(REG_FCR_ADDR)| BIT_FCR_TFIFORST);  /* 清空FIFO中的数据 */
}

/****************************************************************************
 * Name: ReadCH438Data
 *
 * Description:
 *   Read data from ch438 address
 *
 ****************************************************************************/
static uint8_t ReadCH438Data(uint8_t addr)
{
	uint8_t dat = 0;
	imxrt_gpio_write(CH438_NWR_PIN, true);	
	imxrt_gpio_write(CH438_NRD_PIN, true);	
	imxrt_gpio_write(CH438_ALE_PIN, true);	

	CH438SetOutput();
	up_udelay(1);
	
	if(addr &0x80)	imxrt_gpio_write(CH438_D7_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D7_PIN_OUT, false);	
	if(addr &0x40)	imxrt_gpio_write(CH438_D6_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D6_PIN_OUT, false);	
	if(addr &0x20)	imxrt_gpio_write(CH438_D5_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D5_PIN_OUT, false);	
	if(addr &0x10)	imxrt_gpio_write(CH438_D4_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D4_PIN_OUT, false);	
	if(addr &0x08)	imxrt_gpio_write(CH438_D3_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D3_PIN_OUT, false);	
	if(addr &0x04)	imxrt_gpio_write(CH438_D2_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D2_PIN_OUT, false);	
	if(addr &0x02)	imxrt_gpio_write(CH438_D1_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D1_PIN_OUT, false);	
	if(addr &0x01)	imxrt_gpio_write(CH438_D0_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D0_PIN_OUT, false);	
		
	up_udelay(1);

	imxrt_gpio_write(CH438_ALE_PIN, false);	
	up_udelay(1);		

	CH438SetInput();
	up_udelay(1);
	
	imxrt_gpio_write(CH438_NRD_PIN, false);	
	up_udelay(1);	
	
	if (imxrt_gpio_read(CH438_D7_PIN_INPUT))	dat |= 0x80;
	if (imxrt_gpio_read(CH438_D6_PIN_INPUT))	dat |= 0x40;
	if (imxrt_gpio_read(CH438_D5_PIN_INPUT))	dat |= 0x20;
	if (imxrt_gpio_read(CH438_D4_PIN_INPUT))	dat |= 0x10;
	if (imxrt_gpio_read(CH438_D3_PIN_INPUT))	dat |= 0x08;
	if (imxrt_gpio_read(CH438_D2_PIN_INPUT))	dat |= 0x04;
	if (imxrt_gpio_read(CH438_D1_PIN_INPUT))	dat |= 0x02;
	if (imxrt_gpio_read(CH438_D0_PIN_INPUT))	dat |= 0x01;
	
	imxrt_gpio_write(CH438_NRD_PIN, true);	
	imxrt_gpio_write(CH438_ALE_PIN, true);	
	up_udelay(1);

	return dat;

}

/****************************************************************************
 * Name: WriteCH438Data
 *
 * Description:
 *   write data to ch438 address
 *
 ****************************************************************************/	
static void WriteCH438Data(uint8_t addr, uint8_t dat)
{
	imxrt_gpio_write(CH438_ALE_PIN, true);	
	imxrt_gpio_write(CH438_NRD_PIN, true);	
	imxrt_gpio_write(CH438_NWR_PIN, true);	

	CH438SetOutput();
	up_udelay(1);	
	
	if(addr &0x80)	imxrt_gpio_write(CH438_D7_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D7_PIN_OUT, false);	
	if(addr &0x40)	imxrt_gpio_write(CH438_D6_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D6_PIN_OUT, false);	
	if(addr &0x20)	imxrt_gpio_write(CH438_D5_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D5_PIN_OUT, false);	
	if(addr &0x10)	imxrt_gpio_write(CH438_D4_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D4_PIN_OUT, false);	
	if(addr &0x08)	imxrt_gpio_write(CH438_D3_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D3_PIN_OUT, false);	
	if(addr &0x04)	imxrt_gpio_write(CH438_D2_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D2_PIN_OUT, false);	
	if(addr &0x02)	imxrt_gpio_write(CH438_D1_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D1_PIN_OUT, false);	
	if(addr &0x01)	imxrt_gpio_write(CH438_D0_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D0_PIN_OUT, false);	
	
	up_udelay(1);	
	
	imxrt_gpio_write(CH438_ALE_PIN, false);	
	up_udelay(1);
	
	if(dat &0x80)	imxrt_gpio_write(CH438_D7_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D7_PIN_OUT, false);	
	if(dat &0x40)	imxrt_gpio_write(CH438_D6_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D6_PIN_OUT, false);	
	if(dat &0x20)	imxrt_gpio_write(CH438_D5_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D5_PIN_OUT, false);	
	if(dat &0x10)	imxrt_gpio_write(CH438_D4_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D4_PIN_OUT, false);	
	if(dat &0x08)	imxrt_gpio_write(CH438_D3_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D3_PIN_OUT, false);	
	if(dat &0x04)	imxrt_gpio_write(CH438_D2_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D2_PIN_OUT, false);	
	if(dat &0x02)	imxrt_gpio_write(CH438_D1_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D1_PIN_OUT, false);	
	if(dat &0x01)	imxrt_gpio_write(CH438_D0_PIN_OUT, true);	else	imxrt_gpio_write(CH438_D0_PIN_OUT, false);	
	
	up_udelay(1);	

	imxrt_gpio_write(CH438_NWR_PIN, false);	
	up_udelay(1);	
	
	imxrt_gpio_write(CH438_NWR_PIN, true);	
	imxrt_gpio_write(CH438_ALE_PIN, true);	
	up_udelay(1);	

	CH438SetInput();

	return;
}

/****************************************************************************
 * Name: WriteCH438Block
 *
 * Description:
 *   Write data block from ch438 address
 *
 ****************************************************************************/	
static void WriteCH438Block(uint8_t mAddr, uint8_t mLen, char *mBuf)   
{
    while (mLen--) 	
	  WriteCH438Data(mAddr, *mBuf++);
}

/****************************************************************************
 * Name: CH438UARTRcv
 *
 * Description:
 *   Disable FIFO mode for ch438 serial port to receive multi byte data
 *
 ****************************************************************************/	
uint8_t CH438UARTRcv(uint8_t ext_uart_no, char* buf)
{
    uint8_t RcvNum = 0;
	uint8_t	dat = 0;
	uint8_t	REG_LSR_ADDR,REG_RBR_ADDR;
	
	REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
	REG_RBR_ADDR = offsetadd[ext_uart_no] | REG_RBR0_ADDR;

	while((ReadCH438Data(REG_LSR_ADDR) & BIT_LSR_DATARDY) == 0 );    /* 等待数据准备好 */
	while((ReadCH438Data(REG_LSR_ADDR) & BIT_LSR_DATARDY) == 0x01 )
	{
		dat =  ReadCH438Data(REG_RBR_ADDR);
		buff[ext_uart_no][buff_ptr[ext_uart_no]] = dat;
		
		buff_ptr[ext_uart_no] = buff_ptr[ext_uart_no] + 1;
		if (buff_ptr[ext_uart_no] == BUFFERSIZE)
			buff_ptr[ext_uart_no] = 0;
		RcvNum = RcvNum + 1;
	}
    return RcvNum;
}

/****************************************************************************
 * Name: CH438UARTSend
 *
 * Description:
 *   Enable FIFO mode, which is used for ch438 serial port to send multi byte data, 
 *   with a maximum of 128 bytes of data sent at a time
 *
 ****************************************************************************/	
static void CH438UARTSend(uint8_t ext_uart_no, char *Data, uint8_t Num)
{
	uint8_t	REG_LSR_ADDR,REG_THR_ADDR;
	REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
	REG_THR_ADDR = offsetadd[ext_uart_no] | REG_THR0_ADDR;
	
   while(1)
   {
       while((ReadCH438Data(REG_LSR_ADDR) & BIT_LSR_TEMT ) == 0);    /* 等待数据发送完毕，THR,TSR全空 */
       if(Num <= BUFFERSIZE)
       {
           WriteCH438Block(REG_THR_ADDR, Num, Data);
           break;
       }
       else
       {
           WriteCH438Block(REG_THR_ADDR, BUFFERSIZE, Data);
           Num -= BUFFERSIZE;
           Data += BUFFERSIZE;
       }
   }
}

/****************************************************************************
 * Name: ImxrtCh438ReadData
 *
 * Description:
 *   Read data from ch438 port
 *
 ****************************************************************************/
static size_t ImxrtCh438ReadData(uint8_t ext_uart_no)
{
	size_t RevLen = 0;
	uint8_t InterruptStatus;
	uint8_t	REG_IIR_ADDR;
	uint8_t	REG_LSR_ADDR;
	uint8_t	REG_MSR_ADDR;

	pthread_mutex_lock(&mutex);
	while(done[ext_uart_no] == 0)
		pthread_cond_wait(&cond, &mutex);
	if (done[ext_uart_no] == 1)
	{
		REG_IIR_ADDR = offsetadd[ext_uart_no] | REG_IIR0_ADDR;
		REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
		REG_MSR_ADDR = offsetadd[ext_uart_no] | REG_MSR0_ADDR;
		InterruptStatus = ReadCH438Data(REG_IIR_ADDR) & 0x0f;    /* 读串口的中断状态 */	
		ch438info("InterruptStatus is %d\n", InterruptStatus);
		
		switch(InterruptStatus)
		{
			case INT_NOINT:			/* 没有中断 */					
				break;
			case INT_THR_EMPTY:		/* THR空中断 */									
				break;
			case INT_RCV_OVERTIME:	/* 接收超时中断，收到数据后一般是触发这个 。在收到一帧数据后4个数据时间没有后续的数据时触发*/
			case INT_RCV_SUCCESS:	/* 接收数据可用中断。这是一个数据帧超过缓存了才发生，否则一般是前面的超时中断。处理过程同上面的超时中断 */
				RevLen = CH438UARTRcv(ext_uart_no, buff[ext_uart_no]);
				buff_ptr[ext_uart_no] = 0;
				break;

			case INT_RCV_LINES:		/* 接收线路状态中断 */
				ReadCH438Data(REG_LSR_ADDR);
				break;
			case INT_MODEM_CHANGE:	/* MODEM输入变化中断 */
				ReadCH438Data(REG_MSR_ADDR);
				break;
			default:
				break;
		}
	}
	pthread_mutex_unlock(&mutex);

	return RevLen;
}

/****************************************************************************
 * Name: Ch438InitDefault
 *
 * Description:
 *   Ch438 default initialization function
 *
 ****************************************************************************/
void Ch438InitDefault(void)
{
	
	int ret;

	/* Initialize the mutex */

	ret = pthread_mutex_init(&mutex, NULL);
	if (ret != 0)
	{
		ch438err("pthread_mutex_init failed, status=%d\n", ret);
	}

	/* Initialize the condition variable */

	ret = pthread_cond_init(&cond, NULL);
	if (ret != 0)
	{
		ch438err("pthread_cond_init failed, status=%d\n", ret);
	}

	ret = task_create("ch438_task", 60, 8192, getInterruptStatus, NULL);
    if (ret < 0)
    {
        ch438err("task create failed, status=%d\n", ret);
    }

	ImxrtCH438Init();
	CH438PortInit(0,115200);
	CH438PortInit(1,115200);
	CH438PortInit(2,9600);
	CH438PortInit(3,9600);
	CH438PortInit(4,115200);
	CH438PortInit(5,115200);
	CH438PortInit(6,115200);
	CH438PortInit(7,115200);
}

/****************************************************************************
 * Name: ch438_open
 ****************************************************************************/
static int ch438_open(FAR struct file *filep)
{
	FAR struct inode *inode = filep->f_inode;
	FAR struct ch438_dev_s *priv = inode->i_private;
	uint8_t port = priv->port;
	DEBUGASSERT(port >= 0 && port < CH438PORTNUM);

	if (g_ch438open[port])
	{
		return -EBUSY;
	}
	g_ch438open[port] = true;

	return OK;
}

/****************************************************************************
 * Name: ch438_close
 ****************************************************************************/
static int ch438_close(FAR struct file *filep)
{
	FAR struct inode *inode = filep->f_inode;
	FAR struct ch438_dev_s *priv = inode->i_private;
	uint8_t port = priv->port;
	DEBUGASSERT(port >= 0 && port < CH438PORTNUM);

	g_ch438open[port] = false;
	return OK;
}

/****************************************************************************
 * Name: ch438_read
 ****************************************************************************/
static ssize_t ch438_read(FAR struct file *filep, FAR char *buffer, size_t buflen)
{
	size_t length = 0;
	FAR struct inode *inode = filep->f_inode;
	FAR struct ch438_dev_s *priv = inode->i_private;
	uint8_t port = priv->port;
	DEBUGASSERT(port >= 0 && port < CH438PORTNUM);

	length = ImxrtCh438ReadData(port);
    memcpy(buffer, buff[port], buflen);

	if (length > buflen)
	{
		length = buflen;
	}

	return length;
}

/****************************************************************************
 * Name: ch438_write
 ****************************************************************************/
static ssize_t ch438_write(FAR struct file *filep, FAR const char *buffer, size_t buflen)
{
	FAR struct inode *inode = filep->f_inode;
	FAR struct ch438_dev_s *priv = inode->i_private;
	uint8_t port = priv->port;
	DEBUGASSERT(port >= 0 && port < CH438PORTNUM);

	CH438UARTSend(port, buffer, buflen);
	
	return buflen;
}


/****************************************************************************
 * Name: ch438_register
 *
 * Description:
 *   Register /dev/ext_uartN
 *
 ****************************************************************************/
int ch438_register(FAR const char *devpath, uint8_t port)
{
	FAR struct ch438_dev_s *priv;
	int ret = 0;

	/* port number check */
	DEBUGASSERT(port >= 0 && port < CH438PORTNUM);

	priv = (FAR struct ch438_dev_s *)kmm_malloc(sizeof(struct ch438_dev_s));
	if (priv == NULL)
	{
		ch438err("ERROR: Failed to allocate instance\n");
		return -ENOMEM;
	}

	priv->port = port;

	/* Register the character driver */
	ret = register_driver(devpath, &g_ch438fops, 0666, priv);
	if (ret < 0)
	{
		ch438err("ERROR: Failed to register driver: %d\n", ret);
		kmm_free(priv);
	}
	
	return ret;
}

/****************************************************************************
 * Name: board_ch438_initialize
 *
 * Description:
 *   ch438 initialize
 *
 ****************************************************************************/
int board_ch438_initialize(void)
{
	int ret = 0;

	Ch438InitDefault();

#ifdef CONFIG_CH438_EXTUART0
	ret = ch438_register("/dev/extuart_dev0", 0);
	if (ret < 0)
	{
		ch438err("Failed to register /dev/extuart_dev0: %d\n", ret);
		goto __exit;
	}
#endif

#ifdef CONFIG_CH438_EXTUART1
	ret = ch438_register("/dev/extuart_dev1", 1);
	if (ret < 0)
	{
		ch438err("Failed to register /dev/extuart_dev1: %d\n", ret);
		goto __exit;
	}
#endif

#ifdef CONFIG_CH438_EXTUART2
	ret = ch438_register("/dev/extuart_dev2", 2);
	if (ret < 0)
	{
		ch438err("Failed to register /dev/extuart_dev2: %d\n", ret);
		goto __exit;
	}
#endif

#ifdef CONFIG_CH438_EXTUART3
	ret = ch438_register("/dev/extuart_dev3", 3);
	if (ret < 0)
	{
		ch438err("Failed to register /dev/extuart_dev3: %d\n", ret);
		goto __exit;
	}
#endif

#ifdef CONFIG_CH438_EXTUART4
	ret = ch438_register("/dev/extuart_dev4", 4);
	if (ret < 0)
	{
		ch438err("Failed to register /dev/extuart_dev4: %d\n", ret);
		goto __exit;
	}
#endif

#ifdef CONFIG_CH438_EXTUART5
	ret = ch438_register("/dev/extuart_dev5", 5);
	if (ret < 0)
	{
		ch438err("Failed to register /dev/extuart_dev5: %d\n", ret);
		goto __exit;
	}
#endif

#ifdef CONFIG_CH438_EXTUART6
	ret = ch438_register("/dev/extuart_dev6", 6);
	if (ret < 0)
	{
		ch438err("Failed to register /dev/extuart_dev6: %d\n", ret);
		goto __exit;
	}
#endif

#ifdef CONFIG_CH438_EXTUART7
	ret = ch438_register("/dev/extuart_dev7", 7);
	if (ret < 0)
	{
		ch438err("Failed to register /dev/extuart_dev7: %d\n", ret);
		goto __exit;
	}
#endif

__exit:
    return ret;
}