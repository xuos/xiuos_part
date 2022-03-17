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
 * @file plc_socket.c
 * @brief Demo for PLC socket communication function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022.03.16
 */

#include "transform.h"
#include "plc_socket.h"
#include "sys_arch.h"
#include "lwip/sockets.h"
#include "control_file.h"

#define PLC_SOCK_CMD_NUM 10

// for saving PLC command
int plc_cmd_index = 0;

//siemens test
PlcBinCmdType TestPlcCmd[PLC_SOCK_CMD_NUM] =
{
#ifdef SUPPORT_PLC_SIEMENS
    // handshake1 repeat 1
    {
        0, 3000, 22,
        {
            0x03, 0x00, 0x00, 0x16, 0x11, 0xE0, 0x00, 0x00,
            0x02, 0xC8, 0x00, 0xC1, 0x02, 0x02, 0x01, 0xC2,
            0x02, 0x02, 0x01, 0xC0, 0x01, 0x0A
        }
    },
    // handshake2
    {
        1, 500, 25,
        {
            0x03, 0x00, 0x00, 0x19, 0x02, 0xF0, 0x80, 0x32,
            0x01, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x08, 0x00,
            0x00, 0xF0, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00,
            0xF0
        }
    },
    // read command
    {
        2, 1000, 31,
        {
            0x03, 0x00, 0x00, 0x1F, 0x02, 0xF0, 0x80, 0x32,
            0x01, 0x00, 0x00, 0x33, 0x01, 0x00, 0x0E, 0x00,
            0x00, 0x04, 0x01, 0x12, 0x0A, 0x10, 0x02, 0x00,
            0xD2, 0x00, 0x34, 0x84, 0x00, 0x00, 0x00
        }
    }
    // oml plc
#else// SUPPORT_PLC_OML
    {
        0, 1000, 18,
        {
            0x80, 0x00, 0x02, 0x00, 0x03, 0x00, 0x00, 0x7E,
            0x00, 0x00, 0x01, 0x01, 0x82, 0x0F, 0xA0, 0x00,
            0x00, 0x20
        }
    }
#endif
};

//Test information
//SIEMENS ip: 192.168.250.9 port: 102
//S7-200  ip: 192.168.250.8 port: 102
//S7-1200 ip: 192.168.250.6 port: 102
//OML     ip: 192.168.250.3 port: 9600

PlcSocketParamType plc_socket_demo_data = {
    .ip = {192, 168, 250, 3},
    .port = 9600,
    .device_type = PLC_DEV_TYPE_OML,
    .socket_type = SOCK_STREAM, //SOCK_DGRAM, //udp
    .step = 0,
    .cmd_num = 3,
    .buf_size = PLC_TEST_SIZE,
    .buf = NULL,
};

#define OML_HEADER_LEN 78
#define CHECK_OML_HEADER(_s) ((0xC0 == *(_s)) && (0x00 == *(_s + 1)) && (0x02 == *(_s + 2)) && (0x00 == *(_s + 3)))

/******************************************************************************/

static void *PlcSocketStart(void *arg)
{
    int fd = -1;
    int recv_len;
    int step = 0;
    char *recv_buf;
    struct sockaddr_in sock_addr;
    socklen_t addr_len = sizeof(struct sockaddr_in);
    PlcSocketParamType *param = (PlcSocketParamType *)&plc_socket_demo_data;

    plc_print("start %d.%d.%d.%d:%d dev %d sock %d\n",
        param->ip[0],
        param->ip[1],
        param->ip[2],
        param->ip[3],
        param->port,
        param->device_type,
        param->socket_type);

    //malloc memory
    recv_buf = (char *)malloc(param->buf_size);
    if (recv_buf == NULL)
    {
        plc_error("No memory\n");
        return NULL;
    }

    fd = socket(AF_INET, param->socket_type, 0);
    if (fd < 0)
    {
        plc_error("Socket error %d\n", param->socket_type);
        free(recv_buf);
        return NULL;
    }

    plc_print("start %d.%d.%d.%d:%d\n", param->ip[0], param->ip[1], param->ip[2], param->ip[3], param->port);

    sock_addr.sin_family = AF_INET;
    sock_addr.sin_port = htons(param->port);
    sock_addr.sin_addr.s_addr = PP_HTONL(LWIP_MAKEU32(param->ip[0], param->ip[1], param->ip[2], param->ip[3]));
    memset(&(sock_addr.sin_zero), 0, sizeof(sock_addr.sin_zero));

    if (connect(fd, (struct sockaddr *)&sock_addr, sizeof(struct sockaddr)) < 0)
    {
        plc_error("Unable to connect\n");
        closesocket(fd);
        free(recv_buf);
        return NULL;
    }

    lw_notice("client %s connected\n", inet_ntoa(sock_addr.sin_addr));

    while(step < param->cmd_num)
    {
        sendto(fd, TestPlcCmd[step].cmd, TestPlcCmd[step].cmd_len, 0, (struct sockaddr*)&sock_addr, addr_len);
        lw_notice("Send Cmd: %d - ", TestPlcCmd[step].cmd_len);
        for(int i = 0; i < TestPlcCmd[step].cmd_len; i++)
        {
            lw_notice(" %#x",  TestPlcCmd[step].cmd[i]);
        }
        lw_notice("\n");
        MdelayKTask(TestPlcCmd[step].delay_ms);

        memset(recv_buf, 0, param->buf_size);
        while(1)
        {
            recv_len = recvfrom(fd, recv_buf, param->buf_size, 0, (struct sockaddr *)&sock_addr, &addr_len);
            if(recv_len > 0)
            {
                if(param->device_type == PLC_DEV_TYPE_OML)
                {
                    if((recv_len == OML_HEADER_LEN) && (CHECK_OML_HEADER(recv_buf)))
                    {
                        lw_notice("This is Oml package!!!\n");
                    }
                }
                lw_notice("Receive from : %s\n", inet_ntoa(sock_addr.sin_addr));
                lw_notice("Receive data : %d -", recv_len);
                for(int i = 0; i < recv_len; i++)
                {
                    lw_notice(" %#x",  recv_buf[i]);
                }
                lw_notice("\n");
                break;
            }
        }
        step ++;
    }

    closesocket(fd);
    free(recv_buf);
    return NULL;
}

void PlcGetParamCmd(char *cmd)
{
    const char s[2] = ",";
    char *token;
    uint16_t cmd_index = 0;
    char bin_cmd[PLC_BIN_CMD_LEN] = {0};
    token = strtok(cmd, s);
    while(token != NULL)
    {
        sscanf(token, "%x", &bin_cmd[cmd_index]);
        plc_print("%d - %s %d\n", cmd_index, token, bin_cmd[cmd_index]);
        token = strtok(NULL, s);
        cmd_index ++;
    }
    TestPlcCmd[plc_cmd_index].cmd_len = cmd_index;
    memcpy(TestPlcCmd[plc_cmd_index].cmd, bin_cmd, cmd_index);
    plc_print("get %d cmd len %d\n", plc_cmd_index, TestPlcCmd[plc_cmd_index].cmd_len);
    plc_cmd_index ++;
    plc_socket_demo_data.cmd_num = plc_cmd_index;
}

void PlcShowUsage(void)
{
    plc_notice("------------------------------------\n");
    plc_notice("PlcSocket [ip].[ip].[ip].[ip]:[port]\n");
    plc_notice("PlcSocket support other param:\n");
    plc_notice("plc=[] 0: OML 1:SIEMENS\n");
    plc_notice("tcp=[] 0: udp 1:tcp\n");
    plc_notice("ip=[ip.ip.ip.ip]\n");
    plc_notice("port=port\n");
    plc_notice("------------------------------------\n");
}

void PlcCheckParam(int argc, char *argv[])
{
    int i;
    PlcSocketParamType *param = &plc_socket_demo_data;
    plc_cmd_index = 0;

    for(i = 0; i < argc; i++)
    {
        char *str = argv[i];
        int is_tcp = 0;
        char cmd_str[PLC_BIN_CMD_LEN] = {0};

        plc_print("check %d %s\n", i, str);

        if(sscanf(str, "ip=%d.%d.%d.%d",
            &param->ip[0],
            &param->ip[1],
            &param->ip[2],
            &param->ip[3]) == 4)
        {
            plc_print("find ip %d %d %d %d\n", param->ip[0], param->ip[1], param->ip[2], param->ip[3]);
            continue;
        }

        if(sscanf(str, "port=%d", &param->port) == 1)
        {
            plc_print("find port %d\n", param->port);
            continue;
        }

        if(sscanf(str, "tcp=%d", &is_tcp) == 1)
        {
            plc_print("find tcp %d\n", is_tcp);
            param->socket_type = is_tcp ? SOCK_STREAM:SOCK_DGRAM;
            continue;
        }

        if(sscanf(str, "plc=%d", &param->device_type) == 1)
        {
            plc_print("find device %d\n", param->device_type);
            continue;
        }

        if(sscanf(str, "cmd=%s", cmd_str) == 1)
        {
            plc_print("find cmd %s\n", cmd_str);
            PlcGetParamCmd(cmd_str);
            continue;
        }
    }

    if(argc >= 2)
    {
        if(sscanf(argv[1], "%d.%d.%d.%d:%d",
            &param->ip[0],
            &param->ip[1],
            &param->ip[2],
            &param->ip[3],
            &param->port) != EOF)
        {
            return;
        }

        if(sscanf(argv[1], "%d.%d.%d.%d",
            &param->ip[0],
            &param->ip[1],
            &param->ip[2],
            &param->ip[3]) != EOF)
        {
            return;
        }
    }
    else
    {
        PlcShowUsage();
    }
}

void PlcGetParamFromFile(char *file)
{

}

void PlcSocketTask(int argc, char *argv[])
{
    int result = 0;
    pthread_t th_id;

    pthread_attr_t attr;
    attr.schedparam.sched_priority = LWIP_DEMO_TASK_PRIO;
    attr.stacksize = LWIP_TASK_STACK_SIZE;
    PlcSocketParamType *param = &plc_socket_demo_data;

    PlcCheckParam(argc, argv);

    lwip_config_net(lwip_ipaddr, lwip_netmask, param->ip);
    PrivTaskCreate(&th_id, &attr, PlcSocketStart, param);
}


SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(3),
     PlcSocket, PlcSocketTask, Test PLC Socket);

