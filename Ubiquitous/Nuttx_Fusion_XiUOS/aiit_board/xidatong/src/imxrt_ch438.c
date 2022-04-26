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
#include <syslog.h>

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


static pthread_t thr_438;
struct sched_param param;
pthread_attr_t attr = PTHREAD_ATTR_INITIALIZER;


static char		thr_438_stack[1024];


static sem_t sem_438;     /* 用于接收的信号量 */
/* ch438中断回调函数 */
static int Ch438Irq(int irq, FAR void *context, FAR void *arg)
{
	sem_post(&sem_438);
	up_mdelay(500);
	return OK;
}

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


static	uint8_t	RevLen ,buff[8][128],buff_ptr[8];
static	uint8_t	Interruptnum[8] = {0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,};	/* SSR寄存器中断号对应值 */
static 	uint8_t	offsetadd[] = {0x00,0x10,0x20,0x30,0x08,0x18,0x28,0x38,};		/* 串口号的偏移地址 */

void* ImxrtCh438ReadData(void *parameter)
{
    int result, i;
	uint8_t gInterruptStatus;
	uint8_t InterruptStatus;
	uint8_t ext_uart_no;
	static uint8_t dat;
	uint8_t	REG_LCR_ADDR;
	uint8_t	REG_DLL_ADDR;
	uint8_t	REG_DLM_ADDR;
	uint8_t	REG_IER_ADDR;
	uint8_t	REG_MCR_ADDR;
	uint8_t	REG_FCR_ADDR;
	uint8_t	REG_RBR_ADDR;
	uint8_t	REG_THR_ADDR;
	uint8_t	REG_IIR_ADDR;
	uint8_t	REG_LSR_ADDR;
	uint8_t	REG_MSR_ADDR;
	// struct timespec abstime;
	// abstime.tv_sec = 2;
    // while (1)
    // {
		syslog(LOG_INFO, "sem_438 is %d\n",sem_438.semcount);
        result = sem_wait(&sem_438);
        if (result == OK)
        {
			gInterruptStatus = ReadCH438Data( REG_SSR_ADDR );
			syslog(LOG_INFO,"gInterruptStatus is %d\n", gInterruptStatus);
			if(!gInterruptStatus)
			{ 
				 
			}			
			else
			{
				// for(ext_uart_no=0; ext_uart_no<8; ext_uart_no++)
				// {
					ext_uart_no = 2;
					if( gInterruptStatus & Interruptnum[ext_uart_no] )    /* 检测哪个串口发生中断 */
					{
							
						REG_LCR_ADDR = offsetadd[ext_uart_no] | REG_LCR0_ADDR;
						REG_DLL_ADDR = offsetadd[ext_uart_no] | REG_DLL0_ADDR;
						REG_DLM_ADDR = offsetadd[ext_uart_no] | REG_DLM0_ADDR;
						REG_IER_ADDR = offsetadd[ext_uart_no] | REG_IER0_ADDR;
						REG_MCR_ADDR = offsetadd[ext_uart_no] | REG_MCR0_ADDR;
						REG_FCR_ADDR = offsetadd[ext_uart_no] | REG_FCR0_ADDR;
						REG_RBR_ADDR = offsetadd[ext_uart_no] | REG_RBR0_ADDR;
						REG_THR_ADDR = offsetadd[ext_uart_no] | REG_THR0_ADDR;
						REG_IIR_ADDR = offsetadd[ext_uart_no] | REG_IIR0_ADDR;
						REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
						REG_MSR_ADDR = offsetadd[ext_uart_no] | REG_MSR0_ADDR;
								
						InterruptStatus = ReadCH438Data( REG_IIR_ADDR ) & 0x0f;    /* 读串口的中断状态 */	
						syslog(LOG_INFO,"InterruptStatus is %d\n", InterruptStatus);
						
						switch( InterruptStatus )
						{
							case INT_NOINT:			/* 没有中断 */					
								break;
							case INT_THR_EMPTY:		/* THR空中断 */		
//								ReadCH438Data( REG_IIR_ADDR );							
								break;
							case INT_RCV_OVERTIME:	/* 接收超时中断，收到数据后一般是触发这个 。在收到一帧数据后4个数据时间没有后续的数据时触发*/
							case INT_RCV_SUCCESS:	/* 接收数据可用中断。这是一个数据帧超过缓存了才发生，否则一般是前面的超时中断。处理过程同上面的超时中断 */
								RevLen = CH438UARTRcv(ext_uart_no, buff[ext_uart_no]);
								for(i=0;i<RevLen;++i)
								{
									syslog(LOG_INFO,"%c(0x%x) ", buff[ext_uart_no][i], buff[ext_uart_no][i]);
								}

								for(i=0;i<128;i++)
									buff[ext_uart_no][i] = 0;
								buff_ptr[ext_uart_no] = 0;

								break;

							case INT_RCV_LINES:		/* 接收线路状态中断 */
								ReadCH438Data( REG_LSR_ADDR );
								break;
							case INT_MODEM_CHANGE:	/* MODEM输入变化中断 */
								ReadCH438Data( REG_MSR_ADDR );
								break;
							default:
//								ReadCH438Data( REG_IIR_ADDR );
								break;

						}
					}
				// }
				
			}
		}
		
    // }
}
	
void Ch438InitDefault(void)
{
	int ret = 0;

	sem_init(&sem_438, 0, 0);
	syslog(LOG_INFO,"sem_438 init is %d\n",sem_438.semcount);
	// attr.priority = 120;
    // attr.stacksize = 8192;
	// ret = pthread_create(&thr_438, &attr, &ImxrtCh438ReadData, NULL);

	if (ret != 0){
      syslog(LOG_INFO,"ImxrtCh438ReadData: task create failed, status=%d\n", ret);
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

	up_mdelay(10);
	
    imxrt_config_gpio(CH438_INT_PIN);
	irq_attach(IMXRT_IRQ_GPIO3_3, Ch438Irq, NULL);
	
}

void ch438_irq_enable(void)
{
	//重新对每个串口初始化
	CH438PortInit(0,115200);
	CH438PortInit(1,115200);
	CH438PortInit(2,9600);
	CH438PortInit(3,9600);
	CH438PortInit(4,115200);
	CH438PortInit(5,115200);
	CH438PortInit(6,115200);
	CH438PortInit(7,115200);
	
    /* 使能中断 */
    up_enable_irq(IMXRT_IRQ_GPIO3_3);
	
	
	//以下代码测试用。用于enable时向所有串口发一串数据
	up_mdelay(20);
	CH438UARTSend(0,"#1234ABCD!",10);
	CH438UARTSend(1,"#1234ABCD!",10);
	CH438UARTSend(2,"#1234ABCD!",10);
	CH438UARTSend(3,"#1234ABCD!",10);
	CH438UARTSend(4,"#1234ABCD!",10);
	CH438UARTSend(5,"#1234ABCD!",10);
	CH438UARTSend(6,"#1234ABCD!",10);
	CH438UARTSend(7,"#1234ABCD!",10);
	up_mdelay(20);
}

static void ImxrtCH438Init(void)
{
	uint8_t	dat;
	
	CH438SetOutput();
	imxrt_config_gpio(CH438_NWR_PIN);
	imxrt_config_gpio(CH438_NRD_PIN);
	imxrt_config_gpio(CH438_ALE_PIN);
	
	imxrt_gpio_write(CH438_NWR_PIN,true);
	imxrt_gpio_write(CH438_NRD_PIN,true);
	imxrt_gpio_write(CH438_ALE_PIN,true);
}	
	
static void CH438PortInit( uint8_t ext_uart_no,uint32_t	baud_rate )
{
	uint32_t div;
	uint8_t	DLL,DLM,dlab;
	uint8_t	REG_LCR_ADDR;
	uint8_t	REG_DLL_ADDR;
	uint8_t	REG_DLM_ADDR;
	uint8_t	REG_IER_ADDR;
	uint8_t	REG_MCR_ADDR;
	uint8_t	REG_FCR_ADDR;
	uint8_t	REG_RBR_ADDR;
	uint8_t	REG_THR_ADDR;
	uint8_t	REG_IIR_ADDR;
	uint8_t	dat;
	
	REG_LCR_ADDR = offsetadd[ext_uart_no] | REG_LCR0_ADDR;
	REG_DLL_ADDR = offsetadd[ext_uart_no] | REG_DLL0_ADDR;
	REG_DLM_ADDR = offsetadd[ext_uart_no] | REG_DLM0_ADDR;
	REG_IER_ADDR = offsetadd[ext_uart_no] | REG_IER0_ADDR;
	REG_MCR_ADDR = offsetadd[ext_uart_no] | REG_MCR0_ADDR;
	REG_FCR_ADDR = offsetadd[ext_uart_no] | REG_FCR0_ADDR;
	REG_RBR_ADDR = offsetadd[ext_uart_no] | REG_RBR0_ADDR;
	REG_THR_ADDR = offsetadd[ext_uart_no] | REG_THR0_ADDR;
	REG_IIR_ADDR = offsetadd[ext_uart_no] | REG_IIR0_ADDR;
			

	
    WriteCH438Data( REG_IER_ADDR, BIT_IER_RESET );             /* 复位该串口 */
	up_mdelay(50);
	
	
//	dat = ReadCH438Data(REG_FCR_ADDR);
//	dat = ReadCH438Data(REG_LCR_ADDR);
	
	dlab = ReadCH438Data(REG_IER_ADDR);
	dlab &= 0xDF;
	WriteCH438Data(REG_IER_ADDR, dlab);
	
//    WriteCH438Data( REG_LCR_ADDR, BIT_LCR_DLAB );    /* 设置DLAB为1 */
	dlab = ReadCH438Data(REG_LCR_ADDR);
	dlab |= 0x80;		//置LCR寄存器DLAB位为1
	WriteCH438Data(REG_LCR_ADDR, dlab);

    div = ( Fpclk >> 4 ) / baud_rate;
    DLM = div >> 8;
    DLL = div & 0xff;
	WriteCH438Data( REG_DLL_ADDR, DLL );             /* 设置波特率 */
    WriteCH438Data( REG_DLM_ADDR, DLM );
	WriteCH438Data( REG_FCR_ADDR, BIT_FCR_RECVTG1 | BIT_FCR_RECVTG0 | BIT_FCR_FIFOEN );    /* 设置FIFO模式，触发点为112字节 */

    WriteCH438Data( REG_LCR_ADDR, BIT_LCR_WORDSZ1 | BIT_LCR_WORDSZ0 );                     /* 字长8位，1位停止位、无校验 */

	// if(ext_uart_no==1)
    // 	WriteCH438Data( REG_IER_ADDR, 0x00 );    /* 使能中断 */
	// else
		WriteCH438Data( REG_IER_ADDR, /*BIT_IER_IEMODEM | BIT_IER_IETHRE |  BIT_IER_IELINES | */BIT_IER_IERECV );    /* 使能中断 */

    WriteCH438Data( REG_MCR_ADDR, BIT_MCR_OUT2  );// | BIT_MCR_RTS     | BIT_MCR_DTR 	);              /* 允许中断输出,DTR,RTS为1 */

	WriteCH438Data(REG_FCR_ADDR,ReadCH438Data(REG_FCR_ADDR)| BIT_FCR_TFIFORST);  /* 清空FIFO中的数据 */

}



/*********************************************************************************************************
** 函数名称: ReadCH438Data
** 功能描述: 接口函数，从CH438地址读取数据
** 输　入: 地址
**
** 输　出: 数据
**         
** 日　期: 2011年8月26日
**-------------------------------------------------------------------------------------------------------
** 修改人:
** 日　期:
**-------------------------------------------------------------------------------------------------------
********************************************************************************************************/
static uint8_t ReadCH438Data( uint8_t addr )
{
//读函数  

//ALE WR RD线空闲都为高电平，读取数据时候先将地址放在并口，然后拉低ALE锁存地址，延时保持

//切换引脚输入，拉低RD读信号线，延时等待，读取并口上数据

//撤销RD，撤销ALE
	uint8_t dat;

//	imxrt_gpio_write(CH438_NCS_PIN,true);	
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
	
	dat = 0;
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
	
static void WriteCH438Data( uint8_t addr, uint8_t dat)
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



/*********************************************************************************************************
** 函数名称: WriteCH438Block
** 功能描述: 接口函数，从CH438地址写入数据块
** 输　入: CH438寄存器地址,数据块长度,数据缓冲区地址
**
** 输　出: 无
**         
** 日　期: 2011年8月26日
**-------------------------------------------------------------------------------------------------------
** 修改人:
** 日　期:
**-------------------------------------------------------------------------------------------------------
********************************************************************************************************/
static void WriteCH438Block( uint8_t mAddr, uint8_t mLen, uint8_t *mBuf )   
{

    while ( mLen -- ) 	
	  WriteCH438Data( mAddr, *mBuf++ );

}


///*********************************************************************************************************
//** 函数名称: CH438UARTSend
//** 功能描述: 功能函数，启用FIFO模式, 用于CH438串口0 发送多字节数据 单次最多发送128字节数据
//** 输　入: 发送数据缓冲区地址, 发送数据块长度
//**
//** 输　出: 无
//**
//** 日　期: 2011年8月26日
//**-------------------------------------------------------------------------------------------------------
//** 修改人:
//** 日　期:
//**-------------------------------------------------------------------------------------------------------
//********************************************************************************************************/
void  CH438UARTSend( uint8_t	ext_uart_no, uint8_t *Data, uint8_t Num )
{
	uint8_t	REG_LSR_ADDR,REG_THR_ADDR;
	
			REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
			REG_THR_ADDR = offsetadd[ext_uart_no] | REG_THR0_ADDR;
			
   while( 1 )
   {

       while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_TEMT ) == 0 );    /* 等待数据发送完毕，THR,TSR全空 */

       if( Num <= 128 )
       {

           WriteCH438Block( REG_THR_ADDR, Num, Data );

           break;

       }

       else
       {

           WriteCH438Block( REG_THR_ADDR, 128, Data );

           Num -= 128;

           Data += 128;

       }

   }
}



/*********************************************************************************************************
** 函数名称: CH438UARTRcv
** 功能描述: 功能函数，禁用FIFO模式, 用于CH438串口0 接收多字节数据
** 输　入: 接收数据缓冲区地址
**
** 输　出: 接收数据长度
**
** 日　期: 2011年8月26日
**-------------------------------------------------------------------------------------------------------
** 修改人:
** 日　期:
**-------------------------------------------------------------------------------------------------------
********************************************************************************************************/

uint8_t  CH438UARTRcv( uint8_t	ext_uart_no, uint8_t* buf )
{
    uint8_t RcvNum = 0;
	uint8_t	dat = 0;
	uint8_t	REG_LSR_ADDR,REG_RBR_ADDR;
	uint8_t	*p_rev;
	
	p_rev = buf;
	
			REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
			REG_RBR_ADDR = offsetadd[ext_uart_no] | REG_RBR0_ADDR;
			
	
//	if( !( ReadCH438Data( REG_LSR_ADDR ) & ( BIT_LSR_BREAKINT | BIT_LSR_FRAMEERR | BIT_LSR_PARERR | BIT_LSR_OVERR ) ) )    /* b1-b4无错误 */
	//	if( !( dat & ( BIT_LSR_BREAKINT | BIT_LSR_FRAMEERR | BIT_LSR_PARERR | BIT_LSR_OVERR ) ) )    /* b1-b4无错误 */	不用管这有没有错误，只管 DATAREADY
    {

		while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_DATARDY ) == 0 );    /* 等待数据准备好 */

        while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_DATARDY ) == 0x01 )
        {

//            *buf++ = ReadCH438Data( REG_RBR_ADDR );                           /* 从接收缓冲寄存器读出数据 */
			dat =  ReadCH438Data( REG_RBR_ADDR );
			
			buff[ext_uart_no][buff_ptr[ext_uart_no]] = dat;
			
			buff_ptr[ext_uart_no] = buff_ptr[ext_uart_no] + 1;
			if (buff_ptr[ext_uart_no] == 128)
				buff_ptr[ext_uart_no] = 0;
			
            RcvNum = RcvNum + 1;

        }

        

    }

//    else ReadCH438Data( REG_RBR_ADDR );

    return( RcvNum );
}