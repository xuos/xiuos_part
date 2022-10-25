/*
* Copyright (c) 2022 AIIT XUOS Lab
* XiUOS is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*        http://license.coscl.org.cn/MulanPSL2
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
* See the Mulan PSL v2 for more details.
*/

/**
 * @file k210_touch.c
 * @brief gt911 touch driver
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022.10.25
 */


/****************************************************************************
 * Included Files
 ****************************************************************************/
#include "k210_touch.h"

/****************************************************************************
 * Name: IIC_Init
 * Description: i2c pin mode configure
 * input: None
 * output: None
 * return:none
 ****************************************************************************/
void IIC_Init(void)
{
    /* config simluate IIC bus */
    k210_fpioa_config(BSP_IIC_SDA, GT911_FUNC_GPIO(FPIOA_IIC_SDA));
    k210_fpioa_config(BSP_IIC_SCL, GT911_FUNC_GPIO(FPIOA_IIC_SCL));

    k210_gpiohs_set_direction(FPIOA_IIC_SDA, GPIO_DM_OUTPUT);
	k210_gpiohs_set_direction(FPIOA_IIC_SCL, GPIO_DM_OUTPUT);
}

/****************************************************************************
 * Name: SDA_IN
 * Description: set sda input mode
 * input: None
 * output: None
 * return:none
 ****************************************************************************/
void SDA_IN(void)
{
    k210_gpiohs_set_direction(FPIOA_IIC_SDA, GPIO_DM_INPUT_PULL_UP);
}

/****************************************************************************
 * Name: SDA_OUT
 * Description: set sda output mode
 * input: None
 * output: None
 * return:none
 ****************************************************************************/
void SDA_OUT(void)
{	
    k210_gpiohs_set_direction(FPIOA_IIC_SDA, GPIO_DM_OUTPUT);
}

/****************************************************************************
 * Name: READ_SDA
 * Description: read sda value
 * input: None
 * output: None
 * return: sda pin value
 ****************************************************************************/
uint8_t READ_SDA(void)
{
	return k210_gpiohs_get_value(FPIOA_IIC_SDA);
}   

/****************************************************************************
 * Name: IIC_SCL
 * Description: set the value of scl
 * input: val:the value to be set
 * output: None
 * return: None
 ****************************************************************************/
void IIC_SCL(uint8_t val)
{
	if (val)
		k210_gpiohs_set_value(FPIOA_IIC_SCL,GPIO_PV_HIGH); 
	else
	{
		k210_gpiohs_set_value(FPIOA_IIC_SCL,GPIO_PV_LOW);
	}
}

/****************************************************************************
 * Name: IIC_SDA
 * Description: set the value of sda
 * input: val:the value to be set
 * output: None
 * return: None
 ****************************************************************************/
void IIC_SDA(uint8_t val)
{
	if (val)
		k210_gpiohs_set_value(FPIOA_IIC_SDA,GPIO_PV_HIGH);
	else
	{
		k210_gpiohs_set_value(FPIOA_IIC_SDA,GPIO_PV_LOW);
	}
}

/****************************************************************************
 * Name: IIC_Start
 * Description: Generate i2c start signal
 * input: None
 * output: None
 * return: None
 ****************************************************************************/
void IIC_Start(void)
{
	SDA_OUT(); 
	IIC_SDA(1);	  	  
	IIC_SCL(1);
	up_mdelay(30);
 	IIC_SDA(0);
	up_mdelay(2);
	IIC_SCL(0);
}	  

/****************************************************************************
 * Name: IIC_Start
 * Description: Generate i2c stop signal
 * input: None
 * output: None
 * return: None
 ****************************************************************************/
void IIC_Stop(void)
{
	SDA_OUT();
	IIC_SCL(1);
	up_mdelay(30);
	IIC_SDA(0);
	up_mdelay(2);
	IIC_SDA(1);							   	
}

/*******************************************************************************************
 * Name: IIC_Wait_Ack
 * Description: Wait for the reply signal to arrive
 * input: None
 * output: None
 * return: Return value: 1:failed to receive response,0:the received response is successful.
********************************************************************************************/
uint8_t IIC_Wait_Ack(void)
{
	uint16_t ucErrTime=0;
	SDA_IN();
	IIC_SDA(1);	   
	IIC_SCL(1);
	up_mdelay(2); 
	while(READ_SDA())
	{
		ucErrTime++;
		if(ucErrTime>2500)
		{
			IIC_Stop();
			return 1;
		}
        up_mdelay(2);
	}
	IIC_SCL(0);  
	return 0;  
} 

/****************************************************************************
 * Name: IIC_Ack
 * Description: generate ack response
 * input: None
 * output: None
 * return: None
 ****************************************************************************/
void IIC_Ack(void)
{
	IIC_SCL(0);
	SDA_OUT();
	up_mdelay(2);
	IIC_SDA(0);
	up_mdelay(2);
	IIC_SCL(1);
	up_mdelay(2);
	IIC_SCL(0);
}

/****************************************************************************
 * Name: IIC_NAck
 * Description: No ACK response is generated
 * input: None
 * output: None
 * return: None
 ****************************************************************************/
void IIC_NAck(void)
{
	IIC_SCL(0);
	SDA_OUT();
	up_mdelay(2);
	IIC_SDA(1);
	up_mdelay(2);
	IIC_SCL(1);
	up_mdelay(2);
	IIC_SCL(0);
}					 				     

/****************************************************************************
 * Name: IIC_Send_Byte
 * Description: IIC sends a byte,Return whether the slave has a response
 * input: None
 * output: None
 * return: 1:there is a response,0:no response
 ****************************************************************************/	  
void IIC_Send_Byte(uint8_t txd)
{                        
    uint8_t t;   
	SDA_OUT(); 	    
    IIC_SCL(0);
	up_mdelay(2);
    for(t=0;t<8;t++)
    {              
		IIC_SDA((txd&0x80)>>7);
        txd<<=1; 	  
		IIC_SCL(1);
	    up_mdelay(2);
		IIC_SCL(0);	
	    up_mdelay(2);
    }	 
} 	    

/****************************************************************************
 * Name: IIC_Read_Byte
 * Description: Read 1 byte, when ack=1, send ACK, when ack=0, send nACK
 * input: None
 * output: None
 * return: Returns one byte of data read
 ****************************************************************************/	
uint8_t IIC_Read_Byte(uint8_t ack)
{
	uint8_t i,receive=0;
	SDA_IN();
	up_mdelay(30);
    for(i=0;i<8;i++ )
	{
        IIC_SCL(0); 
        up_mdelay(2);
		IIC_SCL(1);
        up_udelay(1);
        receive<<=1;
        if(READ_SDA())receive++;   
		up_udelay(1); 
    }					 
    if (!ack)
        IIC_NAck();
    else
        IIC_Ack(); 
    return receive;
}

/***********************************************************************************
 * Name: GT911_WR_Reg
 * Description: Write data to GT911 once
 * input: reg: start register address,buf: data cache area,len: write data length
 * output: None
 * return: Return value: 0, success; 1, failure.
 ***********************************************************************************/	
static uint8_t GT911_WR_Reg(uint16_t reg,uint8_t *buf,uint8_t len)
{
	uint8_t i;
	uint8_t ret=0;
	IIC_Start();
 	IIC_Send_Byte(CT_CMD_WR);
	IIC_Wait_Ack();
	IIC_Send_Byte(reg>>8);
	IIC_Wait_Ack();
	IIC_Send_Byte(reg&0XFF);
	IIC_Wait_Ack();
	for(i=0;i<len;i++)
	{
        IIC_Send_Byte(buf[i]);
		ret=IIC_Wait_Ack();
		if(ret)break;
	}
    IIC_Stop();
	return ret;
}

/***********************************************************************************
 * Name: GT911_RD_Reg
 * Description: Read data from GT911 once
 * input: reg: start register address,buf: data cache area,len: read data length
 * output: None
 * return: None
 ***********************************************************************************/	
static void GT911_RD_Reg(uint16_t reg,uint8_t *buf,uint8_t len)
{
	uint8_t i;
 	IIC_Start();
 	IIC_Send_Byte(CT_CMD_WR);
	IIC_Wait_Ack();
 	IIC_Send_Byte(reg>>8);
	IIC_Wait_Ack();
 	IIC_Send_Byte(reg&0XFF);
	IIC_Wait_Ack();
 	IIC_Stop();

 	IIC_Start();
	IIC_Send_Byte(CT_CMD_RD);
	IIC_Wait_Ack();
	for(i=0;i<len;i++)
	{
		buf[i]=IIC_Read_Byte(i==(len-1)?0:1);
	}
    IIC_Stop();
}

/***********************************************************************************
 * Name: GT911_ReadFirmwareVersion
 * Description: Get firmware version number
 * input: None
 * output: None
 * return: version number
 ***********************************************************************************/	
static uint16_t GT911_ReadFirmwareVersion(void)
{
	uint8_t buf[2];
	GT911_RD_Reg(GT911_FIRMWARE_VERSION_REG, buf, 2);
	return ((uint16_t)buf[1] << 8) + buf[0];
}

/***********************************************************************************
 * Name: GT911_Scan
 * Description: point:structure to store coordinates
 * input: None
 * output: None
 * return: Returns true for touch, false for no touch
 ***********************************************************************************/
bool GT911_Scan(POINT* point)
{
    GT911_Dev Dev_Now;
    uint8_t Clearbuf = 0;
    uint8_t buf[41];

    GT911_RD_Reg(GT911_READ_XY_REG, buf, 1);	
    if ((buf[0]&0x80) == 0x00)
    {
        GT911_WR_Reg(GT911_READ_XY_REG, (uint8_t *)&Clearbuf, 1);
        return false;
    }
    else
    {
        Dev_Now.TouchCount = buf[0] & 0x0f;
        if((Dev_Now.TouchCount > 5) || (Dev_Now.TouchCount == 0) )
        {
            GT911_WR_Reg(GT911_READ_XY_REG, (uint8_t *)&Clearbuf, 1);
            return false;
        }		
        GT911_RD_Reg(GT911_READ_XY_REG + 1, &buf[1], Dev_Now.TouchCount*8);
        GT911_WR_Reg(GT911_READ_XY_REG, (uint8_t *)&Clearbuf, 1);

        for (uint8_t i = 0;i < Dev_Now.TouchCount; i++)
        {
            Dev_Now.Touchkeytrackid[i] = buf[1+(8*i)];
            Dev_Now.X[i] = ((uint16_t)buf[3+(8*i)] << 8) + buf[2+(8*i)];  
            Dev_Now.Y[i] = ((uint16_t)buf[5+(8*i)] << 8) + buf[4+(8*i)];
            Dev_Now.S[i] = ((uint16_t)buf[7+(8*i)] << 8) + buf[6+(8*i)];  
        
        
            if(Dev_Now.Y[i] < 20) Dev_Now.Y[i] = 20;
            if(Dev_Now.Y[i] > GT911_MAX_HEIGHT -20) Dev_Now.Y[i]=GT911_MAX_HEIGHT - 20;
            if(Dev_Now.X[i] < 20) Dev_Now.X[i] = 20;
            if(Dev_Now.X[i] > GT911_MAX_WIDTH-20) Dev_Now.X[i] = GT911_MAX_WIDTH - 20;
            point->X = Dev_Now.X[i];
            point->Y = Dev_Now.Y[i];	
        }
    }
    return true;			
}

/***********************************************************************************
 * Name: GT911_test
 * Description: gt911 test code
 * input: None
 * output: None
 * return: Returns true for touch, false for no touch
 ***********************************************************************************/
void GT911_test(void)
{
    uint16_t res;
    POINT point = {0, 0};
    IIC_Init();
    res = GT911_ReadFirmwareVersion();
    printf("FirmwareVersion:%2x\n",res);
    while(1)
    {
        if(GT911_Scan(&point))
        {
            printf("Now touch point:(%d,%d)\n",point.X,point.Y);
        }
    }
}