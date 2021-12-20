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

int16 ua_test(void)
{
    UA_Client *client = UA_Client_new();
    UA_StatusCode retval = UA_Client_connect(client, OPC_SERVER);
    if(retval != UA_STATUSCODE_GOOD) {
        UA_Client_delete(client);
        return (int)retval;
    }

    ua_read_time(client);
    ua_run_test(client);

    /* Clean up */
    UA_Client_disconnect(client);
    UA_Client_delete(client); /* Disconnects the client internally */
    return EXIT_SUCCESS;
}

