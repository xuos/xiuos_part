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

#include <nuttx/config.h>

#include <sys/types.h>
#include <errno.h>

#include <nuttx/arch.h>
#include <nuttx/irq.h>
#include <arch/board/board.h>

#include "arm_arch.h"

#include "imxrt_config.h"
#include "imxrt_irq.h"
#include "imxrt_gpio.h"

#include "imxrt_ch438.h"
#include "xidatong.h"
#include <nuttx/pthread.h>
#include <nuttx/semaphore.h>
#include <nuttx/time.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <sched.h>
#include <debug.h>

/****************************************************************************
 * Private Data
 ****************************************************************************/

/* Semaphore for receiving data */

static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;;
static pthread_cond_t  cond = PTHREAD_COND_INITIALIZER;
volatile int done = 0;

static	uint8_t	RevLen;
static	uint8_t	buff[8][128];
static	uint8_t buff_ptr[8];
static	uint8_t	Interruptnum[8] = {0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,};	/* SSR寄存器中断号对应值 */
static 	uint8_t	offsetadd[] = {0x00,0x10,0x20,0x30,0x08,0x18,0x28,0x38,};		/* 串口号的偏移地址 */

static uint8_t gInterruptStatus;


/****************************************************************************
 * Private Function Prototypes
 ****************************************************************************/
static void ImxrtCH438Init(void);
static void CH438PortInit(uint8_t ext_uart_no,uint32_t	baud_rate);
static void CH438SetOutput(void);
static void CH438SetInput(void);
static uint8_t ReadCH438Data(uint8_t addr);
static void WriteCH438Data(uint8_t addr, uint8_t dat);
static void WriteCH438Block(uint8_t mAddr, uint8_t mLen, uint8_t *mBuf);
static uint8_t CH438UARTRcv(uint8_t ext_uart_no, uint8_t* buf);


/****************************************************************************
 * Public and Private Functions
 ****************************************************************************/

/****************************************************************************
 * Name: getInterruptStatus
 *
 * Description:
 *   thread task getInterruptStatus
 *
 ****************************************************************************/
int getInterruptStatus(int argc, char **argv)
{
	int ext_uart_no = 2;
	while(1)
	{
		pthread_mutex_lock(&mutex);
		gInterruptStatus = ReadCH438Data(REG_SSR_ADDR);
		if(!gInterruptStatus)
		{
			pthread_mutex_unlock(&mutex);
			continue;
		}
		if(gInterruptStatus & Interruptnum[ext_uart_no])
		{
			done = 1;
			pthread_cond_signal(&cond);
			pthread_mutex_unlock(&mutex);
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
void CH438SetOutput(void)
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
void CH438SetInput(void)
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
 * Name: ImxrtCh438ReadData
 *
 * Description:
 *   Read data from ch438 port
 *
 ****************************************************************************/
void ImxrtCh438ReadData(void *parameter)
{
    int result, i;
	uint8_t InterruptStatus;
	uint8_t ext_uart_no;
	uint8_t	REG_IIR_ADDR;
	uint8_t	REG_LSR_ADDR;
	uint8_t	REG_MSR_ADDR;

	pthread_mutex_lock(&mutex);
	while(done == 0)
		pthread_cond_wait(&cond, &mutex);
	if (done == 1)
	{
		ext_uart_no = 2;		
		REG_IIR_ADDR = offsetadd[ext_uart_no] | REG_IIR0_ADDR;
		REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
		REG_MSR_ADDR = offsetadd[ext_uart_no] | REG_MSR0_ADDR;
		InterruptStatus = ReadCH438Data(REG_IIR_ADDR) & 0x0f;    /* 读串口的中断状态 */	
		_info("InterruptStatus is %d\n", InterruptStatus);
		
		switch( InterruptStatus )
		{
			case INT_NOINT:			/* 没有中断 */					
				break;
			case INT_THR_EMPTY:		/* THR空中断 */									
				break;
			case INT_RCV_OVERTIME:	/* 接收超时中断，收到数据后一般是触发这个 。在收到一帧数据后4个数据时间没有后续的数据时触发*/
			case INT_RCV_SUCCESS:	/* 接收数据可用中断。这是一个数据帧超过缓存了才发生，否则一般是前面的超时中断。处理过程同上面的超时中断 */
				RevLen = CH438UARTRcv(ext_uart_no, buff[ext_uart_no]);
				for(i=0;i<RevLen;++i)
				{
					_info("%c(0x%x)\n", buff[ext_uart_no][i], buff[ext_uart_no][i]);
				}

				for(i=0;i<128;i++)
					buff[ext_uart_no][i] = 0;
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
		_info("pthread_mutex_init failed, status=%d\n", ret);
	}

	/* Initialize the condition variable */

	ret = pthread_cond_init(&cond, NULL);
	if (ret != 0)
	{
		_info("pthread_cond_init failed, status=%d\n", ret);
	}

	ret = task_create("ch438_task", 60, 8192, getInterruptStatus, NULL);
    if (ret < 0)
    {
        _info("task create failed, status=%d\n", ret);
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
static void CH438PortInit(uint8_t ext_uart_no,uint32_t	baud_rate)
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
static void WriteCH438Block(uint8_t mAddr, uint8_t mLen, uint8_t *mBuf)   
{
    while (mLen--) 	
	  WriteCH438Data(mAddr, *mBuf++);
}

/****************************************************************************
 * Name: CH438UARTSend
 *
 * Description:
 *   Enable FIFO mode, which is used for ch438 serial port to send multi byte data, 
 *   with a maximum of 128 bytes of data sent at a time
 *
 ****************************************************************************/	
void CH438UARTSend(uint8_t ext_uart_no, uint8_t *Data, uint8_t Num)
{
	uint8_t	REG_LSR_ADDR,REG_THR_ADDR;
	REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
	REG_THR_ADDR = offsetadd[ext_uart_no] | REG_THR0_ADDR;
	
   while(1)
   {
       while((ReadCH438Data(REG_LSR_ADDR) & BIT_LSR_TEMT ) == 0);    /* 等待数据发送完毕，THR,TSR全空 */
       if(Num <= 128)
       {
           WriteCH438Block(REG_THR_ADDR, Num, Data);
           break;
       }
       else
       {
           WriteCH438Block(REG_THR_ADDR, 128, Data);
           Num -= 128;
           Data += 128;
       }
   }
}

/****************************************************************************
 * Name: CH438UARTRcv
 *
 * Description:
 *   Disable FIFO mode for ch438 serial port to receive multi byte data
 *
 ****************************************************************************/	
uint8_t CH438UARTRcv(uint8_t ext_uart_no, uint8_t* buf)
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
		if (buff_ptr[ext_uart_no] == 128)
			buff_ptr[ext_uart_no] = 0;
		RcvNum = RcvNum + 1;
	}
    return RcvNum;
}