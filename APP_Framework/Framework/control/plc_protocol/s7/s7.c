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
 * @file s7.c
 * @brief plc protocol s7 
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023-4-14
 */

#include <s7.h>

sem_t union_plc_data_updata_sem;
pthread_mutex_t union_plc_data_read_mutex;
static BasicSocketPlc plc_socket = {0};
void KPrintf(const char *fmt, ...);
#define BASIC_PLC_PRINTF KPrintf

/**
 * @description: Printf Hex Number List 
 * @param name - number list name 
 * @param number_list - number list pointer
 * @param length - numner list length
 * @return
 */
void PrintHexNumberList(char name[4], uint8_t* number_list, uint16_t length)
{
    BASIC_PLC_PRINTF("\n******************%4s****************\n", name);
    for (int32_t i = 0;i < length;i++) {
        BASIC_PLC_PRINTF("%03x ", number_list[i]);
    }
    BASIC_PLC_PRINTF("\n**************************************\n");
}

/**
 * @description: S7 Receive Plc Data Task
 * @param parameter - parameter pointer
 * @return
 */
void *ReceivePlcDataTask(void *parameter)
{
    printf("%s %d\n", __func__, __LINE__);
    ReadPlcDataByRecipe(control_protocol->recipe);
}

/**
 * @description: S7 Protocol Open
 * @param control_protocol - control protocol pointer
 * @return success : 0 error
 */
int S7Open(struct ControlProtocol *control_protocol)
{
    ControlProtocolOpenDef(control_protocol);
    return 0;
}

/**
 * @description: S7 Protocol Close
 * @param control_protocol - control protocol pointer
 * @return success : 0 error
 */
int S7Close(struct ControlProtocol *control_protocol)
{
#ifdef CONTROL_USING_SOCKET
    ControlDisconnectSocket(&plc_socket);
#endif
    
    ControlProtocolCloseDef();

    return 0;
}

/**
 * @description: S7 Protocol Read Data
 * @param control_protocol - control protocol pointer
 * @param buf - read data buffer pointer
 * @param len - read data length
 * @return success : data length error : 0
 */
int S7Read(struct ControlProtocol *control_protocol, void *buf, size_t len)
{
    struct CircularAreaApp *circular_area = (struct CircularAreaApp *)control_protocol->args;
    return CircularAreaAppRead(circular_area, buf, len);
}

static struct ControlDone s7_protocol_done = 
{
    ._open = S7Open,
    ._close = S7Close,
    ._read = S7Read,
    ._write = NULL,
    ._ioctl = NULL,
};

/**
 * @description: S7 Protocol Value Type
 * @param uniform_value_type -  uniform value type
 * @return success : 0-8 error : -1
 */
static uint8_t GetUniformValueTypeMemorySize(UniformValueType uniform_value_type)
{
    if (uniform_value_type == UNIFORM_BOOL || uniform_value_type == UNIFORM_INT8 || uniform_value_type == UNIFORM_UINT8)
        return 1;
    if (uniform_value_type == UNIFORM_INT16 || uniform_value_type == UNIFORM_UINT16)
        return 2;
    if (uniform_value_type == UNIFORM_INT32 || uniform_value_type == UNIFORM_UINT32 || uniform_value_type == UNIFORM_FLOAT)
        return 4;
    if (uniform_value_type == UNIFORM_DOUBLE)
        return 8;
    return 0;
}

/**
 * @description: Push Data Onto a Stack One By One
 * @param datastack - data stack pointer
 * @param args - data pointer
 * @param length - data length
 * @return 
 */
void PushDataIntoStack(uint8_t *datastack,uint8_t* args,uint16_t length)
{
    static int index = 8;    
    for(int i =0; i<length;i++)
    {
        datastack[index] = args[i];
        //printf("DEBUG:%d%4X\n",__LINE__,datapush[8+index]);
        index++;
        //printf("DEBUG:%d  %d  %d\n",__LINE__,index, length);
        if(index >= control_protocol->recipe->protocol_data.data_length){
            index = 8;
        }     
    }
}

/**
 * @description: Read PLC Data By Recipe
 * @param p_recipe - recipe pointer
 * @return success : 0 error : -1
 */
int8_t ReadPlcDataByRecipe(struct ControlRecipe *p_recipe)
{   
    uint16_t data_length = 0;
    uint8_t *s7_data;
    data_length = control_protocol->recipe->protocol_data.data_length;
    s7_data = control_protocol->recipe->protocol_data.data;
    struct CircularAreaApp *circular_area = (struct CircularAreaApp *)control_protocol->args;
    BasicSocketPlc base_socket_plc = {0};
    S7Object s7_plc = {0};
    char plc_ip_string[15] = {0};
        s7_plc = Cli_Create();
        sprintf(plc_ip_string, "%u.%u.%u.%u",
            p_recipe->socket_config.plc_ip[0],
            p_recipe->socket_config.plc_ip[1],
            p_recipe->socket_config.plc_ip[2],
            p_recipe->socket_config.plc_ip[3]);
    int16_t read_item_count = p_recipe->read_item_count;
    uint8_t* p_read_item = (uint8_t*)(p_recipe->read_item);
    while (1) {
        int8_t error = 0;
        while (!error) {
            uint16_t i = 0;
            for (i; i < read_item_count; i++) {
                int is_connected = 0;
                Cli_GetConnected(s7_plc, &is_connected);  
                while (!is_connected) {
                    if (Cli_ConnectTo(s7_plc, plc_ip_string, 0, 1) != 0) {
                        MdelayKTask(1000);
                    } else {
                        break;
                      }
                    }
                TS7DataItem data_info = ((S7ReadItem*)p_read_item + i)->data_info;
                Cli_ReadMultiVars(s7_plc, &data_info, 1);
                uint16_t Size = GetUniformValueTypeMemorySize(((S7ReadItem*)p_read_item + i)->value_type);
                PrintHexNumberList("s7 recv", data_info.pdata,Size);          
                PushDataIntoStack(s7_data,data_info.pdata,Size);
                MdelayKTask(100);
            }
            /*read all variable item data, put them into circular_area*/
            if (i == read_item_count) {
                printf("%s get %d item %d length\n", __func__, i, data_length);
                //  for(int j = 0; j < data_length; j++)
                //      {
                //      printf("DEBUG:%X %d\n",s7_data[j],__LINE__);
                //      }
                CircularAreaAppWrite(circular_area, s7_data, data_length, 0);
            }    
        }
    } 
    return 0; 
}

/**
 * @description: S7 Protocol Init
 * @param p_recipe - recipe pointer
 * @return success : 0 error : -1
 */
int S7ProtocolInit(struct ControlRecipe *p_recipe)
{   
    p_recipe->read_item = PrivMalloc(sizeof(S7ReadItem) * p_recipe->read_item_count);
    if (NULL == p_recipe->read_item) {
        PrivFree(p_recipe->read_item);
        return -1;
    }

    memset(p_recipe->read_item, 0, sizeof(S7ReadItem));

    // p_recipe->ControlProtocolFormatCmd = S7ProtocolFormatCmd;

    p_recipe->done = &s7_protocol_done;

    return 0;
}
