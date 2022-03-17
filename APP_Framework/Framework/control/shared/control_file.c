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
 * @file control_file.c
 * @brief control relative file operation
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022-03-17
 */

#include <stdio.h>
#include "cJSON.h"
#include "transform.h"
#include "control_file.h"

#define CTL_FILE_NAME "/plc/control_cmd.txt"

#define TEST_PLC_CMD_TXT \
    "cmd=03,00,00,16,11,E0,00,00,02,C8,00,C1,02,02,01,C2,02,02,01,C0,01,0A\r\n\r\n" \
    "cmd=03,00,00,19,02,F0,80,32,01,00,00,00,0D,00,08,00,00,F0,00,00,01,00,01,00,F0\r\n\r\n" \
    "cmd=03,00,00,1F,02,F0,80,32,01,00,00,33,01,00,0E,00,00,04,01,12,0A,10,02,00,D2,00,34,84,00,00,00\r\n\r\n" \
    "port=102\r\n" \
    "ip=192.168.250.6\r\n"


#define TEST_PLC_JSON_TXT \
"{ \r\n"\
"    \"S1200\": [ \r\n"\
"        { \"ip\": \"192.168.250.6\"}, \r\n"\
"        { \"port\": 102}, \r\n"\
"        { \"cmd\": [3, 0, 0, 22, 17, 224, 0, 0, 2, 200, 0, 193, 2, 2, 1, 194, 2, 2, 1, 192, 1, 10]}\r\n"\
"    ] \r\n"\
"}"
//"        { \"cmd\": [3, 0, 0, 25, 2, 240, 128, 50, 1, 0, 0, 0, 13, 0, 8, 0, 0, 240, 0, 0, 1, 0, 1, 0, 240]},\r\n" \
//"        { \"cmd\": [3, 0, 0, 31, 2, 240, 128, 50, 1, 0, 0, 51, 1, 0, 14, 0, 0, 4, 1, 18, 10, 16,  2, 0, 210, 0, 52, 132, 0, 0, 0]}\r\n" \


FILE *CtlFileInit(void)
{
    FILE *fd = NULL;

    fd = fopen(CTL_FILE_NAME, "a+");
    if(fd == NULL)
    {
        ctl_error("open file %s failed\n", CTL_FILE_NAME);
    }

    return fd;
}

void CtlFileClose(FILE *fd)
{
    fclose(fd);
}

void CtlFileRead(FILE *fd, int size, char *buf)
{
    fread(buf, size, 1, fd);
    ctl_print("read file %d: %s\n", size, buf);
}

void CtlFileWrite(FILE *fd, int size, char *buf)
{
    size_t write_size = 0;
    write_size = fwrite(buf, strlen(buf) + 1, 1, fd);
    ctl_print("write size %d: %s\n", size, buf);
}

void CtlFileTest(void)
{
    FILE *fd = CtlFileInit();
    char *file_buf = TEST_PLC_JSON_TXT;
    CtlFileWrite(fd, strlen(file_buf), file_buf);
    CtlFileRead(fd, CTL_FILE_SIZE, file_buf);
    CtlFileClose(fd);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
    CtlTestFile, CtlFileTest, Test control file);

#ifdef LIB_USING_CJSON

void CtlParseJsonData(char *buf)
{
    cJSON *file_dat = NULL;
    cJSON *ip_dat = NULL;
    cJSON *port_dat = NULL;
    cJSON *cmd_dat = NULL;

    file_dat = cJSON_Parse(buf);
    if(file_dat == NULL)
    {
        ctl_error("ctrl parse failed\n");
        return;
    }

    ip_dat = cJSON_GetObjectItem(file_dat, "ip");
    port_dat = cJSON_GetObjectItem(file_dat, "port");
    cmd_dat = cJSON_GetObjectItem(file_dat, "cmd");

    ctl_print("ip  : %s\n", ip_dat->string);
    ctl_print("port: %d\n", port_dat->valueint);
    ctl_print("cmd : %s\n", cmd_dat->valueint);
}

void CtlParseFileTest(void)
{
    char file_buf[CTL_FILE_SIZE] = {0};
    FILE *fd = CtlFileInit();
    CtlFileRead(fd, CTL_FILE_SIZE, file_buf);
    CtlFileClose(fd);
    CtlParseJsonData(file_buf);
}

SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(0),
    CtlParseFile, CtlParseFileTest, Parse control file);

#endif

