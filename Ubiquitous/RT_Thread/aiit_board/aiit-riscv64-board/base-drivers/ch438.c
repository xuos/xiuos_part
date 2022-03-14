#include <rtthread.h>
#include <rtdevice.h>
#include <drv_io_config.h>
#include <gpiohs.h>
#include "board.h"
#include "ch438.h"
#include "sleep.h"

static rt_sem_t ch438_sem;

static rt_uint8_t	offsetadd[] = {0x00,0x10,0x20,0x30,0x08,0x18,0x28,0x38,};		/* Offset address of serial port number */
rt_uint8_t	RevLen ,Ch438Buff[8][BUFFSIZE],Ch438BuffPtr[8];

void CH438_INIT(void)
{	
	CH438_set_output();
 	gpiohs_set_drive_mode(FPIOA_CH438_NWR, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_NRD, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_ALE, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_INT, GPIO_DM_INPUT_PULL_UP);
	gpiohs_set_drive_mode(FPIOA_485_DIR, GPIO_DM_OUTPUT);
	
	gpiohs_set_pin(FPIOA_CH438_NWR, GPIO_PV_HIGH);
	gpiohs_set_pin(FPIOA_CH438_NRD, GPIO_PV_HIGH);
	gpiohs_set_pin(FPIOA_CH438_ALE, GPIO_PV_HIGH);
}	

void CH438_PORT_INIT( rt_uint8_t ext_uart_no,rt_uint32_t	BaudRate )
{
	rt_uint32_t	div;
	rt_uint8_t	DLL,DLM,dlab;
	rt_uint8_t	REG_LCR_ADDR;
	rt_uint8_t	REG_DLL_ADDR;
	rt_uint8_t	REG_DLM_ADDR;
	rt_uint8_t	REG_IER_ADDR;
	rt_uint8_t	REG_MCR_ADDR;
	rt_uint8_t	REG_FCR_ADDR;
	rt_uint8_t	REG_RBR_ADDR;
	rt_uint8_t	REG_THR_ADDR;
	rt_uint8_t	REG_IIR_ADDR;
	
	REG_LCR_ADDR = offsetadd[ext_uart_no] | REG_LCR0_ADDR;
	REG_DLL_ADDR = offsetadd[ext_uart_no] | REG_DLL0_ADDR;
	REG_DLM_ADDR = offsetadd[ext_uart_no] | REG_DLM0_ADDR;
	REG_IER_ADDR = offsetadd[ext_uart_no] | REG_IER0_ADDR;
	REG_MCR_ADDR = offsetadd[ext_uart_no] | REG_MCR0_ADDR;
	REG_FCR_ADDR = offsetadd[ext_uart_no] | REG_FCR0_ADDR;
	REG_RBR_ADDR = offsetadd[ext_uart_no] | REG_RBR0_ADDR;
	REG_THR_ADDR = offsetadd[ext_uart_no] | REG_THR0_ADDR;
	REG_IIR_ADDR = offsetadd[ext_uart_no] | REG_IIR0_ADDR;
			
    WriteCH438Data( REG_IER_ADDR, BIT_IER_RESET );             /* Reset the serial port */
	rt_thread_delay(50);
	
	dlab = ReadCH438Data(REG_IER_ADDR);
	dlab &= 0xDF;
	WriteCH438Data(REG_IER_ADDR, dlab);
	
	dlab = ReadCH438Data(REG_LCR_ADDR);
	dlab |= 0x80;
	WriteCH438Data(REG_LCR_ADDR, dlab);

    div = ( Fpclk >> 4 ) / BaudRate;
    DLM = div >> 8;
    DLL = div & 0xff;
	WriteCH438Data( REG_DLL_ADDR, DLL );             /* Set baud rate */
    WriteCH438Data( REG_DLM_ADDR, DLM );
	WriteCH438Data( REG_FCR_ADDR, BIT_FCR_RECVTG1 | BIT_FCR_RECVTG0 | BIT_FCR_FIFOEN );    /* Set FIFO mode */

    WriteCH438Data( REG_LCR_ADDR, BIT_LCR_WORDSZ1 | BIT_LCR_WORDSZ0 );

    WriteCH438Data( REG_IER_ADDR, /*BIT_IER_IEMODEM | BIT_IER_IETHRE |  BIT_IER_IELINES | */BIT_IER_IERECV );

    WriteCH438Data( REG_MCR_ADDR, BIT_MCR_OUT2  );

	WriteCH438Data(REG_FCR_ADDR,ReadCH438Data(REG_FCR_ADDR)| BIT_FCR_RFIFORST | BIT_FCR_TFIFORST);

}

static void CH438_set_output(void)
{
 	gpiohs_set_drive_mode(FPIOA_CH438_D0, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_D1, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_D2, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_D3, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_D4, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_D5, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_D6, GPIO_DM_OUTPUT);
	gpiohs_set_drive_mode(FPIOA_CH438_D7, GPIO_DM_OUTPUT);
	
}
static void CH438_set_input(void)
{
	gpiohs_set_drive_mode(FPIOA_CH438_D0, GPIO_DM_INPUT_PULL_UP);
	gpiohs_set_drive_mode(FPIOA_CH438_D1, GPIO_DM_INPUT_PULL_UP);
	gpiohs_set_drive_mode(FPIOA_CH438_D2, GPIO_DM_INPUT_PULL_UP);
	gpiohs_set_drive_mode(FPIOA_CH438_D3, GPIO_DM_INPUT_PULL_UP);
	gpiohs_set_drive_mode(FPIOA_CH438_D4, GPIO_DM_INPUT_PULL_UP);
	gpiohs_set_drive_mode(FPIOA_CH438_D5, GPIO_DM_INPUT_PULL_UP);
	gpiohs_set_drive_mode(FPIOA_CH438_D6, GPIO_DM_INPUT_PULL_UP);
	gpiohs_set_drive_mode(FPIOA_CH438_D7, GPIO_DM_INPUT_PULL_UP);
	
}


void set_485_input(rt_uint8_t	ch_no)
{
	if(ch_no == 1)
		gpiohs_set_pin(FPIOA_485_DIR, GPIO_PV_LOW);
}

void set_485_output(rt_uint8_t	ch_no)
{
	if(ch_no == 1)
		gpiohs_set_pin(FPIOA_485_DIR, GPIO_PV_HIGH);
}

rt_uint8_t ReadCH438Data( rt_uint8_t addr )
{
	rt_uint8_t dat;

	gpiohs_set_pin(FPIOA_CH438_NWR,GPIO_PV_HIGH);	
	gpiohs_set_pin(FPIOA_CH438_NRD,GPIO_PV_HIGH);	
	gpiohs_set_pin(FPIOA_CH438_ALE,GPIO_PV_HIGH);	

	CH438_set_output();
	usleep(1);
	
	if(addr &0x80)	gpiohs_set_pin(FPIOA_CH438_D7,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D7,GPIO_PV_LOW);	
	if(addr &0x40)	gpiohs_set_pin(FPIOA_CH438_D6,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D6,GPIO_PV_LOW);	
	if(addr &0x20)	gpiohs_set_pin(FPIOA_CH438_D5,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D5,GPIO_PV_LOW);	
	if(addr &0x10)	gpiohs_set_pin(FPIOA_CH438_D4,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D4,GPIO_PV_LOW);	
	if(addr &0x08)	gpiohs_set_pin(FPIOA_CH438_D3,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D3,GPIO_PV_LOW);	
	if(addr &0x04)	gpiohs_set_pin(FPIOA_CH438_D2,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D2,GPIO_PV_LOW);	
	if(addr &0x02)	gpiohs_set_pin(FPIOA_CH438_D1,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D1,GPIO_PV_LOW);	
	if(addr &0x01)	gpiohs_set_pin(FPIOA_CH438_D0,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D0,GPIO_PV_LOW);	
		
	usleep(1);

	gpiohs_set_pin(FPIOA_CH438_ALE,GPIO_PV_LOW);	

	usleep(1);		

	CH438_set_input();
	usleep(1);
	
	gpiohs_set_pin(FPIOA_CH438_NRD,GPIO_PV_LOW);	
	
	usleep(1);	
	
	dat = 0;
	if (gpiohs_get_pin(FPIOA_CH438_D7))	dat |= 0x80;
	if (gpiohs_get_pin(FPIOA_CH438_D6))	dat |= 0x40;
	if (gpiohs_get_pin(FPIOA_CH438_D5))	dat |= 0x20;
	if (gpiohs_get_pin(FPIOA_CH438_D4))	dat |= 0x10;
	if (gpiohs_get_pin(FPIOA_CH438_D3))	dat |= 0x08;
	if (gpiohs_get_pin(FPIOA_CH438_D2))	dat |= 0x04;
	if (gpiohs_get_pin(FPIOA_CH438_D1))	dat |= 0x02;
	if (gpiohs_get_pin(FPIOA_CH438_D0))	dat |= 0x01;
	
	gpiohs_set_pin(FPIOA_CH438_NRD,GPIO_PV_HIGH);	
	gpiohs_set_pin(FPIOA_CH438_ALE,GPIO_PV_HIGH);	

	usleep(1);

	return dat;

}
	

static void WriteCH438Data( rt_uint8_t addr, rt_uint8_t dat)
{
	gpiohs_set_pin(FPIOA_CH438_ALE,GPIO_PV_HIGH);	
	gpiohs_set_pin(FPIOA_CH438_NRD,GPIO_PV_HIGH);	
	gpiohs_set_pin(FPIOA_CH438_NWR,GPIO_PV_HIGH);	

	CH438_set_output();
	usleep(1);	
	
	if(addr &0x80)	gpiohs_set_pin(FPIOA_CH438_D7,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D7,GPIO_PV_LOW);	
	if(addr &0x40)	gpiohs_set_pin(FPIOA_CH438_D6,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D6,GPIO_PV_LOW);	
	if(addr &0x20)	gpiohs_set_pin(FPIOA_CH438_D5,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D5,GPIO_PV_LOW);	
	if(addr &0x10)	gpiohs_set_pin(FPIOA_CH438_D4,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D4,GPIO_PV_LOW);	
	if(addr &0x08)	gpiohs_set_pin(FPIOA_CH438_D3,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D3,GPIO_PV_LOW);	
	if(addr &0x04)	gpiohs_set_pin(FPIOA_CH438_D2,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D2,GPIO_PV_LOW);	
	if(addr &0x02)	gpiohs_set_pin(FPIOA_CH438_D1,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D1,GPIO_PV_LOW);	
	if(addr &0x01)	gpiohs_set_pin(FPIOA_CH438_D0,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D0,GPIO_PV_LOW);	
	
	usleep(1);	
	
	gpiohs_set_pin(FPIOA_CH438_ALE,GPIO_PV_LOW);	
	usleep(1);
	
	if(dat &0x80)	gpiohs_set_pin(FPIOA_CH438_D7,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D7,GPIO_PV_LOW);	
	if(dat &0x40)	gpiohs_set_pin(FPIOA_CH438_D6,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D6,GPIO_PV_LOW);	
	if(dat &0x20)	gpiohs_set_pin(FPIOA_CH438_D5,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D5,GPIO_PV_LOW);	
	if(dat &0x10)	gpiohs_set_pin(FPIOA_CH438_D4,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D4,GPIO_PV_LOW);	
	if(dat &0x08)	gpiohs_set_pin(FPIOA_CH438_D3,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D3,GPIO_PV_LOW);	
	if(dat &0x04)	gpiohs_set_pin(FPIOA_CH438_D2,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D2,GPIO_PV_LOW);	
	if(dat &0x02)	gpiohs_set_pin(FPIOA_CH438_D1,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D1,GPIO_PV_LOW);	
	if(dat &0x01)	gpiohs_set_pin(FPIOA_CH438_D0,GPIO_PV_HIGH);	else	gpiohs_set_pin(FPIOA_CH438_D0,GPIO_PV_LOW);	
	
	usleep(1);	

	gpiohs_set_pin(FPIOA_CH438_NWR,GPIO_PV_LOW);	

	usleep(1);	
	
	gpiohs_set_pin(FPIOA_CH438_NWR,GPIO_PV_HIGH);	
	gpiohs_set_pin(FPIOA_CH438_ALE,GPIO_PV_HIGH);	
	
	usleep(1);	

	CH438_set_input();

	return;
}


static void WriteCH438Block( rt_uint8_t mAddr, rt_uint8_t mLen, rt_uint8_t *mBuf )   
{

    while ( mLen -- ) 	
	  WriteCH438Data( mAddr, *mBuf++ );

}


// void  CH438UARTSend( rt_uint8_t	ext_uart_no,rt_uint8_t *Data, rt_uint8_t Num )
// {
// 	rt_uint8_t	REG_LSR_ADDR,REG_THR_ADDR;
	
// 			REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
// 			REG_THR_ADDR = offsetadd[ext_uart_no] | REG_THR0_ADDR;
			
//    while( 1 )
//    {

//        while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_TEMT ) == 0 );

//        if( Num <= 128 )
//        {

//            WriteCH438Block( REG_THR_ADDR, Num, Data );

//            break;

//        }

//        else
//        {

//            WriteCH438Block( REG_THR_ADDR, 128, Data );

//            Num -= 128;

//            Data += 128;

//        }

//    }
// }



// rt_uint8_t  CH438UARTRcv( rt_uint8_t ext_uart_no, rt_uint8_t* buf )
// {
//     rt_uint8_t RcvNum = 0;
// 	rt_uint8_t	dat = 0;
// 	rt_uint8_t	REG_LSR_ADDR,REG_RBR_ADDR;
// 	rt_uint8_t	*p_rev;
	
// 	p_rev = buf;
	
// 	REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
// 	REG_RBR_ADDR = offsetadd[ext_uart_no] | REG_RBR0_ADDR;
			
//     {

// 		while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_DATARDY ) == 0 );

//         while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_DATARDY ) == 0x01 )
//         {
// 			dat =  ReadCH438Data( REG_RBR_ADDR );
			
// 			Ch438Buff[ext_uart_no][Ch438BuffPtr[ext_uart_no]] = dat;
			
// 			Ch438BuffPtr[ext_uart_no] = Ch438BuffPtr[ext_uart_no] + 1;
// 			if (Ch438BuffPtr[ext_uart_no] == BUFFSIZE)
// 				Ch438BuffPtr[ext_uart_no] = 0;
			
//             RcvNum = RcvNum + 1;

//         }
//     }
//     return( RcvNum );
// }

static rt_err_t rt_extuart_configure(struct rt_serial_device *serial, struct serial_configure *cfg)
{

	rt_uint32_t  baud_rate = cfg->baud_rate;
	uint16_t port = cfg->reserved;
	CH438_PORT_INIT(port, baud_rate);

}

static rt_err_t extuart_control(struct rt_serial_device *serial, int cmd, void *arg)
{
    switch (cmd)
    {
    case RT_DEVICE_CTRL_CLR_INT:
        break;

    case RT_DEVICE_CTRL_SET_INT:
        break;
    }

    return (RT_EOK);
}

static int drv_extuart_putc(struct rt_serial_device *serial, char c)
{
	uint16_t ext_uart_no = serial->config.reserved;

	rt_uint8_t	REG_LSR_ADDR,REG_THR_ADDR;
	
	REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
	REG_THR_ADDR = offsetadd[ext_uart_no] | REG_THR0_ADDR;

	while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_TEMT ) == 0 );

	WriteCH438Block( REG_THR_ADDR, 1, &c );
}

static int drv_extuart_getc(struct rt_serial_device *serial)
{
	rt_uint8_t	dat = 0;
	rt_uint8_t	REG_LSR_ADDR,REG_RBR_ADDR;
	
	uint16_t ext_uart_no = serial->config.reserved;///< get extern uart port
	
	REG_LSR_ADDR = offsetadd[ext_uart_no] | REG_LSR0_ADDR;
	REG_RBR_ADDR = offsetadd[ext_uart_no] | REG_RBR0_ADDR;
			
	while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_DATARDY ) == 0 );

	// while( ( ReadCH438Data( REG_LSR_ADDR ) & BIT_LSR_DATARDY ) == 0x01 )
	// {
	dat =  ReadCH438Data( REG_RBR_ADDR );
	// }
    
    return( dat );
}

const struct rt_uart_ops extuart_ops =
{
    rt_extuart_configure,
    extuart_control,
    drv_extuart_putc,
    drv_extuart_getc,
    RT_NULL
};

static plic_irq_callback_t Ch438Irq(void *parameter)
{
	rt_sem_release(&ch438_sem);
}

void Ch438InitDefault(void)
{
	xs_uint8	i, dat;
	xs_err_t flag;

	flag = rt_sem_init(&ch438_sem, "sem_438",0,RT_IPC_FLAG_FIFO);
	if (flag != RT_EOK)
	{
		rt_kprintf("ch438.drv create sem failed .\n");
		return ;
	}		
	
    gpiohs_set_drive_mode(FPIOA_CH438_INT, GPIO_DM_INPUT_PULL_UP);
    gpiohs_set_pin_edge(FPIOA_CH438_INT,GPIO_PE_FALLING);
    gpiohs_irq_register(FPIOA_CH438_INT,1,Ch438Irq,0);

	CH438_INIT();
}

int rt_hw_ch438_init(void)
{
    struct rt_serial_device *extserial;
    struct device_uart      *extuart;
    struct serial_configure config = RT_SERIAL_CONFIG_DEFAULT;


// #ifdef BSP_USING_UART1
    {
        static struct rt_serial_device  extserial0;
        static struct device_uart       extuart0;

        extserial  = &extserial0;
        extuart    = &extuart0;

        extserial->ops              = &extuart_ops;
        extserial->config           = config;
        extserial->config.baud_rate = UART_DEFAULT_BAUDRATE;
		extserial->config.reserved = 0; ///< extern uart port

        // extuart->hw_base   = UART1_BASE_ADDR;
        // extuart->irqno     = IRQN_UART1_INTERRUPT;

        // _uart_init(UART_DEVICE_1);

        rt_hw_serial_register(extserial,
                              "extuart_dev0",
                              RT_DEVICE_FLAG_RDWR | RT_DEVICE_FLAG_INT_RX,
                              extuart);
    }
// #endif

// #ifdef BSP_USING_UART2
    // {
    //     static struct rt_serial_device  serial2;
    //     static struct device_uart       uart2;

    //     serial  = &serial2;
    //     uart    = &uart2;

    //     serial->ops              = &_uart_ops;
    //     serial->config           = config;
    //     serial->config.baud_rate = UART_DEFAULT_BAUDRATE;

    //     uart->hw_base   = UART2_BASE_ADDR;
    //     uart->irqno     = IRQN_UART2_INTERRUPT;

    //     _uart_init(UART_DEVICE_2);

    //     rt_hw_serial_register(serial,
    //                           "uart2",
    //                           RT_DEVICE_FLAG_RDWR | RT_DEVICE_FLAG_INT_RX,
    //                           uart);
    // }
// #endif

// #ifdef BSP_USING_UART3
    // {
    //     static struct rt_serial_device  serial3;
    //     static struct device_uart       uart3;

    //     serial  = &serial3;
    //     uart    = &uart3;

    //     serial->ops              = &_uart_ops;
    //     serial->config           = config;
    //     serial->config.baud_rate = UART_DEFAULT_BAUDRATE;

    //     uart->hw_base   = UART3_BASE_ADDR;
    //     uart->irqno     = IRQN_UART3_INTERRUPT;

    //     _uart_init(UART_DEVICE_3);

    //     rt_hw_serial_register(serial,
    //                           "uart3",
    //                           RT_DEVICE_FLAG_RDWR | RT_DEVICE_FLAG_INT_RX,
    //                           uart);
    // }
// #endif
	Ch438InitDefault();
    return 0;
}

