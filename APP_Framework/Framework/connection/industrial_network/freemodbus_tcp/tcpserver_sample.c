/*
 * FreeModbus Libary: Win32 Demo Application
 * Copyright (C) 2006 Christian Walter <wolti@sil.at>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * File: $Id$
 */

 /**********************************************************
 *	Linux TCP support.
 *	Based on Walter's project. 
 *	Modified by Steven Guo <gotop167@163.com>
 ***********************************************************/

/* ----------------------- Standard C Libs includes --------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <pthread.h>
#include <signal.h>
#include <transform.h>
#include "lwip/sys.h"
#include "lwip/sockets.h"

/* ----------------------- Modbus includes ----------------------------------*/
#include "mb.h"
#include "mbport.h"

/* ----------------------- Defines ------------------------------------------*/
#define PROG            "freemodbus"

#define REG_INPUT_START 1000
#define REG_INPUT_NREGS 4
#define REG_HOLDING_START 2000
#define REG_HOLDING_NREGS 10

/* ----------------------- Static variables ---------------------------------*/
static USHORT   usRegInputStart = REG_INPUT_START;
static USHORT   usRegInputBuf[REG_INPUT_NREGS];
static USHORT   usRegHoldingStart = REG_HOLDING_START;
static USHORT   usRegHoldingBuf[REG_HOLDING_NREGS];
static pthread_mutex_t xLock;
static enum ThreadState
{
    STOPPED,
    RUNNING,
    SHUTDOWN
} ePollThreadState;

/* ----------------------- Static functions ---------------------------------*/
static BOOL     bCreatePollingThread( void );
static enum ThreadState eGetPollingThreadState( void );
static void     eSetPollingThreadState( enum ThreadState eNewState );
static void* pvPollingThread( void *pvParameter );
int LWIPConnectSocket(uint16_t port);

/* ----------------------- Start implementation -----------------------------*/
int MBServer()
{
    int             iExitCode;
    CHAR            cCh;
    BOOL            bDoExit;
    usRegHoldingBuf[5] = 123;
    usRegHoldingBuf[7] = 234;

    printf("%s ip %d.%d.%d.%d mask %d.%d.%d.%d gw %d.%d.%d.%d\n", __func__, 
    192, 168, 250, 233,
    255, 255, 255, 255,
    192, 168, 250, 1);
    uint8_t local_ip[4] = {192,168,250,233};
    uint8_t gateway[4] = {192,168,250,1};
    uint8_t netmask[4] = {255,255,255,0};
    lwip_config_tcp(0, local_ip, netmask, gateway);
    printf("%s LWIPInit done\n", __func__);

    if( eMBTCPInit( MB_TCP_PORT_USE_DEFAULT ) != MB_ENOERR )
    {
        fprintf( stderr, "%s: can't initialize modbus stack!\r\n", PROG );
        iExitCode = EXIT_FAILURE;
    }
    else
    {
        eSetPollingThreadState( STOPPED );
        /* CLI interface. */
        if( bCreatePollingThread(  ) != TRUE )
        {
            printf(  "Can't start protocol stack! Already running?\r\n"  );
        }
    }
    printf("%d %d %s\n",sizeof(usRegHoldingBuf),__LINE__,__func__);
    
    while(1)
    {
        for(int i =0; i<sizeof(usRegHoldingBuf)/2;i++)
        {
            printf("poll recv is %3d\n", usRegHoldingBuf[i]);
            MdelayKTask(100);
        }
    }
    return iExitCode;
}

PRIV_SHELL_CMD_FUNCTION(MBServer, a Mtcp server Demo, PRIV_SHELL_CMD_MAIN_ATTR);  


BOOL bCreatePollingThread( void )
{
    BOOL            bResult;
	pthread_t       xThread;
    if( eGetPollingThreadState(  ) == STOPPED )
    {
        if( pthread_create( &xThread, NULL, pvPollingThread, NULL ) != 0 )
        {
            /* Can't create the polling thread. */
            bResult = FALSE;
        }
        else
        {
            bResult = TRUE;
        }
    }
    else
    {
        bResult = FALSE;
    }
    return bResult;
}


void* pvPollingThread( void *pvParameter )
{
    eSetPollingThreadState( RUNNING );

    if( eMBEnable(  ) == MB_ENOERR )
    {
        do
        {
            if( eMBPoll(  ) != MB_ENOERR )
                break;
        }
        while( eGetPollingThreadState(  ) != SHUTDOWN );
    }

    ( void )eMBDisable(  );

    eSetPollingThreadState( STOPPED );

    return 0;
}

enum ThreadState eGetPollingThreadState(  )
{
    enum ThreadState eCurState;

    ( void )pthread_mutex_lock( &xLock );
    eCurState = ePollThreadState;
    ( void )pthread_mutex_unlock( &xLock );

    return eCurState;
}

void eSetPollingThreadState( enum ThreadState eNewState )
{
    ( void )pthread_mutex_lock( &xLock );
    ePollThreadState = eNewState;
    ( void )pthread_mutex_unlock( &xLock );
}

eMBErrorCode eMBRegInputCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNRegs )
{
    eMBErrorCode    eStatus = MB_ENOERR;
    int             iRegIndex;

    if( ( usAddress >= REG_INPUT_START )
        && ( usAddress + usNRegs <= REG_INPUT_START + REG_INPUT_NREGS ) )
    {
        iRegIndex = ( int )( usAddress - usRegInputStart );
        while( usNRegs > 0 )
        {
            *pucRegBuffer++ = ( unsigned char )( usRegInputBuf[iRegIndex] >> 8 );
            *pucRegBuffer++ = ( unsigned char )( usRegInputBuf[iRegIndex] & 0xFF );
            iRegIndex++;
            usNRegs--;
        }
    }
    else
    {
        eStatus = MB_ENOREG;
    }

    return eStatus;
}

eMBErrorCode eMBRegHoldingCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNRegs, eMBRegisterMode eMode )
{
    eMBErrorCode    eStatus = MB_ENOERR;
    int             iRegIndex;

    if( ( usAddress >= REG_HOLDING_START ) &&
        ( usAddress + usNRegs <= REG_HOLDING_START + REG_HOLDING_NREGS ) )
    {
        iRegIndex = ( int )( usAddress - usRegHoldingStart );
        switch ( eMode )
        {
            /* Pass current register values to the protocol stack. */
        case MB_REG_READ:
            while( usNRegs > 0 )
            {
                *pucRegBuffer++ = ( UCHAR ) ( usRegHoldingBuf[iRegIndex] >> 8 );
                *pucRegBuffer++ = ( UCHAR ) ( usRegHoldingBuf[iRegIndex] & 0xFF );
                iRegIndex++;
                usNRegs--;
            }
            break;

            /* Update current register values with new values from the
             * protocol stack. */
        case MB_REG_WRITE:
            while( usNRegs > 0 )
            {
                usRegHoldingBuf[iRegIndex] = *pucRegBuffer++ << 8;
                usRegHoldingBuf[iRegIndex] |= *pucRegBuffer++;
                iRegIndex++;
                usNRegs--;
            }
        }
    }
    else
    {
        eStatus = MB_ENOREG;
    }
    return eStatus;
}


eMBErrorCode eMBRegCoilsCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNCoils, eMBRegisterMode eMode )
{
    return MB_ENOREG;
}

eMBErrorCode eMBRegDiscreteCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNDiscrete )
{
    return MB_ENOREG;
}




/**
 * @description: Modbus Tcp Server Open
 * @param control_protocol - control protocol pointer
 * @return success : 0 error
 */
// int FreeModbusTcpOpen(struct ControlProtocol *control_protocol)
// {
//     ControlProtocolOpenDef(control_protocol);
//     return 0;
// }

// static struct ControlDone FreeModbusTcp_protocol_done = 
// {
//     ._open = FreeModbusTcpOpen,
//     ._close = NULL,
//     ._read = NULL,
//     ._write = NULL,
//     ._ioctl = NULL,
// };

// void *ReceivePlcDataTask(void *parameter)
// {
//     MBServer();
// }

/**
 * @description: Modbus Tcp Server Init
 * @param p_recipe - recipe pointer
 * @return success : 0 error : -1
 */
// int FreeModbusTcpServerInit(struct ControlRecipe *p_recipe)
// {   
//     p_recipe->done = &FreeModbusTcp_protocol_done;
//     return 0;
// }