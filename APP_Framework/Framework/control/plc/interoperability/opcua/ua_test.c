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

/**
 * @file ua_test.c
 * @brief Test for OpcUa function
 * @version 1.0
 * @author AIIT XUOS Lab
 * @date 2021.11.11
 */

#include <stdlib.h>
#include "open62541.h"
#include "ua_api.h"

//for target NODEID
#define UA_TEST_BROWSER_NODEID UA_NODEID_STRING(3, "ServerInterfaces")
#define UA_TEST_BROWSER_NODEID1 UA_NODEID_NUMERIC(4, 1)
#define UA_TEST_WRITE_NODEID UA_NODEID_NUMERIC(4, 5)


static UA_StatusCode ua_test_read_array(UA_Client *client)
{
    const int item_size = 4;
    UA_ReadValueId test_item[item_size];

    for (int i = 0; i < item_size; i++)
    {
        UA_ReadValueId_init(&test_item[i]);
        test_item[i].attributeId = UA_ATTRIBUTEID_VALUE;
    }

    test_item[0].nodeId = UA_NODEID_NUMERIC(4, 2);
    test_item[1].nodeId = UA_NODEID_NUMERIC(4, 3);
    test_item[2].nodeId = UA_NODEID_NUMERIC(4, 4);
    test_item[3].nodeId = UA_NODEID_NUMERIC(4, 5);

    return ua_read_array_value(client, item_size, test_item);
}

void ua_test_browser_objects(UA_Client *client)
{
    UA_NodeId test_id;
    ua_browser_id(client, UA_TEST_BROWSER_NODEID);
    ua_browser_id(client, UA_TEST_BROWSER_NODEID1);
    test_id = UA_TEST_BROWSER_NODEID1;
    ua_pr_info("Show values in %s:\n", ua_get_nodeid_str(&test_id));
    ua_test_read_array(client);
    return;
}

void ua_test_write_attr(UA_Client *client)
{
    UA_Int32 value;
    char val_str[UA_NODE_LEN];
    UA_NodeId id = UA_TEST_WRITE_NODEID;

    ua_pr_info("--- Test write %s ---\n", ua_get_nodeid_str(&id));
    ua_read_nodeid_value(client, id, &value);
    ua_write_nodeid_value(client, id, itoa(value + 1, val_str, 10));
    ua_read_nodeid_value(client, id, &value);
    ua_pr_info("\n");
}

int ua_test_interact_server(UA_Client *client)
{
    ua_read_time(client);
    ua_test_browser_objects(client);
    ua_test_write_attr(client);
    return EXIT_SUCCESS;
}

int16 ua_test(void)
{
    UA_Client *client = UA_Client_new();
    UA_StatusCode retval = UA_Client_connect(client, OPC_SERVER);
    if(retval != UA_STATUSCODE_GOOD) {
        UA_Client_delete(client);
        return (int)retval;
    }

    ua_read_time(client);

    /* Clean up */
    UA_Client_disconnect(client);
    UA_Client_delete(client); /* Disconnects the client internally */
    return EXIT_SUCCESS;
}

