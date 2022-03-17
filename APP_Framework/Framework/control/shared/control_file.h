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
 * @file control_file.h
 * @brief control relative API
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2022-03-17
 */

#ifndef __CONTROL_FILE_H_
#define __CONTROL_FILE_H_

#define CTL_FILE_SIZE 1024

#define ctl_print KPrintf
#define ctl_error KPrintf

FILE *CtlFileInit(void);
void CtlFileClose(FILE *fd);
void CtlFileRead(FILE *fd, int size, char *buf);
void CtlFileWrite(FILE *fd, int size, char *buf);

#endif

