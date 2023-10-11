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
 * @file freemodbustcpserver.c
 * @brief PLC fREEMODBUSTCP SERVER app
 * @version 3.0
 * @author AIIT XUOS Lab
 * @date 2023.7.31
 */

#include <control.h>

void ControlMtcpsTest(void)
{
    int i, j = 1;
    int read_data_length = 0;
    uint8_t read_data[128] = {0};
    ControlProtocolType freemodbus_tcp_protocol = ControlProtocolFind();
    if (NULL == freemodbus_tcp_protocol) {
        printf("%s get freemodbus tcp protocol %p failed\n", __func__, freemodbus_tcp_protocol);
        return;
    }
    printf("%s get freemodbus tcp protocol %p successfull\n", __func__, freemodbus_tcp_protocol);
   
    printf("%4X %4X %4X\n",freemodbus_tcp_protocol->name,freemodbus_tcp_protocol->recipe,freemodbus_tcp_protocol->done);
    
    if (CONTROL_REGISTERED == freemodbus_tcp_protocol->protocol_status) {
        ControlProtocolOpen(freemodbus_tcp_protocol);
        // for (;;) {
        //     read_data_length = ControlProtocolRead(modbus_tcp_protocol, read_data, sizeof(read_data));
        //     printf("%s read [%d] modbus tcp data %d using receipe file\n", __func__, i, read_data_length);
        //     if (read_data_length) {
        //         for (j = 0; j < read_data_length; j ++) {
        //             printf("j %d data 0x%x\n", j, read_data[j]);
        //         }
        //     }
        //     i++;
        //     memset(read_data, 0, sizeof(read_data));          
            PrivTaskDelay(10000);
        // }
        //ControlProtocolClose(modbus_tcp_protocol);
    }
}

PRIV_SHELL_CMD_FUNCTION(ControlMtcpsTest, M Demo, PRIV_SHELL_CMD_MAIN_ATTR);