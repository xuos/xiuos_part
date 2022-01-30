/*
* Copyright (c) 2021 AIIT XUOS Lab
* XiUOS is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*        http://license.coscl.org.cn/MulanPSL2
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
* See the Mulan PSL v2 for more details.
*/

#include "open62541.h"
#include <stdlib.h>
#include "ua_api.h"


#define UA_DEV_IP_LEN 128
#define UA_NODE_LEN 50

typedef struct _ua_dev_t
{
    char ua_remote_ip[UA_DEV_IP_LEN];
    char ua_node[UA_NODE_LEN];
    UA_Client *client;
}ua_dev_t;


int ua_open(void *dev)
{
    ua_dev_t *pdev = (ua_dev_t *)dev;

    pdev->client = UA_Client_new();
    UA_StatusCode retval = UA_Client_connect(pdev->client, pdev->ua_remote_ip);
    if(retval != UA_STATUSCODE_GOOD) {
        UA_Client_delete(pdev->client);
        return (int)retval;
    }
    return EOK;
}

void ua_close(void *dev)
{
    ua_dev_t *pdev = (ua_dev_t *)dev;
    UA_Client_disconnect(pdev->client);
    UA_Client_delete(pdev->client); /* Disconnects the client internally */
}

int ua_read(void* dev, void *buf, size_t len)
{
    ua_dev_t *pdev = (ua_dev_t *)dev;
    ua_get_server_info(pdev->client);
    return EOK;
}

int ua_write(void* dev, const void *buf, size_t len)
{
    ua_dev_t *pdev = (ua_dev_t *)dev;

    return EOK;
}

int ua_ioctl(void* dev, int cmd, void *arg)
{
    return EOK;
}


