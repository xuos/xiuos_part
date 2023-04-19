
/*
* Copyright (c) 2020 AIIT XUOS Lab
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
* @file:    ymodem.c
* @brief:   file ymodem.c
* @version: 1.0
* @author:  AIIT XUOS Lab
* @date:    2023/3/24
*/

#include "ymodem.h"
#include "string.h"
#include "flash.h"

uint8_t tab_1024[1024] ={0};
uint8_t FileName[FILE_NAME_LENGTH];


/**
  * @brief  Receive byte from sender
  * @param  c: Character
  * @param  timeout: Timeout
  * @retval 0: Byte received
  *         -1: Timeout
  */
static  int32_t Receive_Byte (uint8_t *c, uint32_t timeout)
{
  while (timeout-- > 0)
  {
    if (SerialKeyPressed(c) == 1)
    {
      return 0;
    }
  }
  return -1;
}

/**
  * @brief  Send a byte
  * @param  c: Character
  * @retval 0: Byte sent
  */
static uint32_t Send_Byte (uint8_t c)
{
  SerialPutChar(c);
  return 0;
}

/**
  * @brief  Update CRC16 for input byte
  * @param  CRC input value 
  * @param  input byte
  * @retval Updated CRC value
  */
uint16_t UpdateCRC16(uint16_t crcIn, uint8_t byte)
{
  uint32_t crc = crcIn;
  uint32_t in = byte|0x100;

  do
  {
    crc <<= 1;
    in <<= 1;

    if(in&0x100)
    {
      ++crc;
    }
    
    if(crc&0x10000)
    {
      crc ^= 0x1021;
    }
 } while(!(in&0x10000));

 return (crc&0xffffu);
}

/**
  * @brief  Cal CRC16 for YModem Packet
  * @param  data
  * @param  length
  * @retval CRC value
  */
uint16_t Cal_CRC16(const uint8_t* data, uint32_t size)
{
  uint32_t crc = 0;
  const uint8_t* dataEnd = data+size;
  
  while(data<dataEnd)
  {
    crc = UpdateCRC16(crc,*data++);
  }
  crc = UpdateCRC16(crc,0);
  crc = UpdateCRC16(crc,0);

  return (crc&0xffffu);
}

/**
  * @brief  Cal Check sum for YModem Packet
  * @param  data
  * @param  length
  * @retval None
  */
uint8_t CalChecksum(const uint8_t* data, uint32_t size)
{
  uint32_t sum = 0;
  const uint8_t* dataEnd = data+size;
 
  while(data < dataEnd)
  {
    sum += *data++;
  }

 return (sum&0xffu);
}

/**
  * @brief  Receive a packet from sender
  * @param  data
  * @param  length
  * @param  timeout
  *          0: end of transmission
  *          -1: abort by sender
  *          >0: packet length
  * @retval 0: normally return
  *         -1: timeout or packet error
  *         1: abort by user
  */
static int32_t Receive_Packet (uint8_t *data, int32_t *length, uint32_t timeout)
{
  uint16_t i, packet_size, computedcrc;
  uint8_t c;
  *length = 0;
  if (Receive_Byte(&c, timeout) != 0)
  {
    return -1;
  }
  switch (c)
  {
    case SOH:
      packet_size = PACKET_SIZE;
      break;
    case STX:
      packet_size = PACKET_1K_SIZE;
      break;
    case EOT:
      return 0;
    case CA:
      if ((Receive_Byte(&c, timeout) == 0) && (c == CA))
      {
        *length = -1;
        return 0;
      }
      else
      {
        return -1;
      }
    case ABORT1:
    case ABORT2:
      return 1;
    default:
      return -1;
  }
  *data = c;
  for (i = 1; i < (packet_size + PACKET_OVERHEAD); i ++)
  {
    if (Receive_Byte(data + i, timeout) != 0)
    {
      return -1;
    }
  }
  if (data[PACKET_SEQNO_INDEX] != ((data[PACKET_SEQNO_COMP_INDEX] ^ 0xff) & 0xff))
  {
    return -1;
  }

  /* Compute the CRC */
  computedcrc = Cal_CRC16(&data[PACKET_HEADER], (uint32_t)packet_size);
  /* Check that received CRC match the already computed CRC value
     data[packet_size+3]<<8) | data[packet_size+4] contains the received CRC 
     computedcrc contains the computed CRC value */
  if (computedcrc != (uint16_t)((data[packet_size+3]<<8) | data[packet_size+4]))
  {
    /* CRC error */
    return -1;
  }

  *length = packet_size;
  return 0;
}

/**
  * @brief  Receive a file using the ymodem protocol
  * @param  buf: Address of the first byte,addr:download flash start address
  * @retval The size of the file
  */
int32_t Ymodem_Receive (uint8_t *buf, const uint32_t addr)
{
  uint8_t packet_data[PACKET_1K_SIZE + PACKET_OVERHEAD], file_size[FILE_SIZE_LENGTH], *file_ptr, *buf_ptr;
  int32_t i, packet_length, session_done, file_done, packets_received, errors, session_begin, size = 0;
  uint32_t flashdestination;

  /* Initialize flashdestination variable */
  flashdestination = addr;
  
  for (session_done = 0, errors = 0, session_begin = 0; ;)
  {
    for (packets_received = 0, file_done = 0, buf_ptr = buf; ;)
    {
      switch (Receive_Packet(packet_data, &packet_length, NAK_TIMEOUT))
      {
        case 0:
          errors = 0;
          switch (packet_length)
          {
            /* Abort by sender */
            case - 1:
              Send_Byte(ACK);
              return 0;
            /* End of transmission */
            case 0:
              Send_Byte(ACK);
              file_done = 1;
              break;
            /* Normal packet */
            default:
              if ((packet_data[PACKET_SEQNO_INDEX] & 0xff) != (packets_received & 0xff))
              {
                Send_Byte(NAK);
              }
              else
              {
                if (packets_received == 0)
                {
                  /* Filename packet */
                  if (packet_data[PACKET_HEADER] != 0)
                  {
                    /* Filename packet has valid data */
                    for (i = 0, file_ptr = packet_data + PACKET_HEADER; (*file_ptr != 0) && (i < FILE_NAME_LENGTH);)
                    {
                      FileName[i++] = *file_ptr++;
                    }
                    FileName[i++] = '\0';
                    for (i = 0, file_ptr ++; (*file_ptr != ' ') && (i < (FILE_SIZE_LENGTH - 1));)
                    {
                      file_size[i++] = *file_ptr++;
                    }
                    file_size[i++] = '\0';
                    Str2Int(file_size, &size);

                    /* Test the size of the image to be sent */
                    /* Image size is greater than Flash size */
                    if (size > (USER_FLASH_SIZE + 1))
                    {
                      /* End session */
                      Send_Byte(CA);
                      Send_Byte(CA);
                      return -1;
                    }
                    /* erase user application area */

                    NOR_FLASH_Erase(addr,size);
                    Send_Byte(ACK);
                    Send_Byte(CRC16);
                  }
                  /* Filename packet is empty, end session */
                  else
                  {
                    Send_Byte(ACK);
                    file_done = 1;
                    session_done = 1;
                    break;
                  }
                }
                /* Data packet */
                else
                {
                  memcpy(buf_ptr, packet_data + PACKET_HEADER, packet_length);

                  /* Write received data in Flash */
#ifndef  USE_HIGHT_SPEED_TRANS
                 if (NOR_FLASH_Write(&flashdestination, buf, (uint16_t) packet_length)  == 0)
#else
                  if (NOR_FLASH_Write(&flashdestination, buf, (uint16_t) packet_length,0)  == 0)
#endif
                  {
                    Send_Byte(ACK);
                  }
                  else /* An error occurred while writing to Flash memory */
                  {
                    /* End session */
                    Send_Byte(CA);
                    Send_Byte(CA);
                    return -2;
                  }
                }
                packets_received ++;
                session_begin = 1;
              }
          }
          break;
        case 1:
          Send_Byte(CA);
          Send_Byte(CA);
          return -3;
        default:
          if (session_begin > 0)
          {
            errors ++;
          }
          if (errors > MAX_ERRORS)
          {
            Send_Byte(CA);
            Send_Byte(CA);
            return 0;
          }
          Send_Byte(CRC16);
          break;
      }
      if (file_done != 0)
      {
        break;
      }
    }
    if (session_done != 0)
    {
      break;
    }
  }
#ifdef  USE_HIGHT_SPEED_TRANS
    NOR_FLASH_Write(&flashdestination, buf, (uint16_t) packet_length,1);
#endif
  return (int32_t)size;
}

/**
  * @brief  Download a file via serial port
  * @param  flash start addr
  * @retval None
  */
int32_t SerialDownload(const uint32_t addr)
{
  uint8_t Number[10] = {0};
  int32_t Size = 0;

  Serial_PutString("Waiting for the file to be sent ... (press 'a' to abort)\n\r");
  Size = Ymodem_Receive(&tab_1024[0], addr);
  if (Size > 0)
  {		
    Serial_PutString("\n\n\r Programming Completed Successfully!\n\r--------------------------------\r\n Name: ");
    Serial_PutString(FileName);
    Int2Str(Number, Size);
    Serial_PutString("\n\r Size: ");
    Serial_PutString(Number);
    Serial_PutString(" Bytes\r\n");
    Serial_PutString("-------------------\n");
  }
  else if (Size == -1)
  {
    Serial_PutString("\n\n\rThe image size is higher than the allowed space memory!\n\r");
  }
  else if (Size == -2)
  {
    Serial_PutString("\n\n\rVerification failed!\n\r");
  }
  else if (Size == -3)
  {
    Serial_PutString("\r\n\nAborted by user.\n\r");
  }
  else
  {
    Serial_PutString("\n\rFailed to receive the file!\n\r");
  }

  return Size;
}
