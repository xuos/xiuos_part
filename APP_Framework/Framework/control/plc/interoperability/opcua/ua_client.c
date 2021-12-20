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

#define OPC_SERVER "opc.tcp://192.168.250.5:4840"
#define ua_print printf

#ifdef UA_ENABLE_SUBSCRIPTIONS
static void handler_TheAnswerChanged(UA_Client *client, UA_UInt32 subId, void *subContext,
                         UA_UInt32 monId, void *monContext, UA_DataValue *value)
{
    ua_print("The Answer has changed!\n");
}
#endif

static UA_StatusCode nodeIter(UA_NodeId childId, UA_Boolean isInverse, UA_NodeId referenceTypeId, void *handle)
{
    if(isInverse)
    {
        return UA_STATUSCODE_GOOD;
    }

    UA_NodeId *parent = (UA_NodeId *)handle;
    ua_print("%d, %d --- %d ---> NodeId %d, %d\n",
           parent->namespaceIndex, parent->identifier.numeric,
           referenceTypeId.identifier.numeric, childId.namespaceIndex,
           childId.identifier.numeric);

    return UA_STATUSCODE_GOOD;
}

int ua_get_points(UA_Client *client)
{
    /* Listing endpoints */
    UA_EndpointDescription* endpointArray = NULL;
    size_t endpointArraySize = 0;
    UA_StatusCode retval = UA_Client_getEndpoints(client, OPC_SERVER,
                                                  &endpointArraySize, &endpointArray);
    if(retval != UA_STATUSCODE_GOOD)
    {
        UA_Array_delete(endpointArray, endpointArraySize, &UA_TYPES[UA_TYPES_ENDPOINTDESCRIPTION]);
        return EXIT_FAILURE;
    }

    ua_print("%i endpoints found\n", (int)endpointArraySize);
    for(size_t i=0;i<endpointArraySize;i++)
    {
        ua_print("URL of endpoint %i is %.*s\n", (int)i,
               (int)endpointArray[i].endpointUrl.length,
               endpointArray[i].endpointUrl.data);
    }
    UA_Array_delete(endpointArray,endpointArraySize, &UA_TYPES[UA_TYPES_ENDPOINTDESCRIPTION]);
	return EXIT_SUCCESS;
}

void ua_browser_objects(UA_Client *client)
{
    /* Browse some objects */
    ua_print("Browsing nodes in objects folder:\n");
    UA_BrowseRequest bReq;
    UA_BrowseRequest_init(&bReq);
    bReq.requestedMaxReferencesPerNode = 0;
    bReq.nodesToBrowse = UA_BrowseDescription_new();
    bReq.nodesToBrowseSize = 1;
    bReq.nodesToBrowse[0].nodeId = UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER); /* browse objects folder */
    bReq.nodesToBrowse[0].resultMask = UA_BROWSERESULTMASK_ALL; /* return everything */
    UA_BrowseResponse bResp = UA_Client_Service_browse(client, bReq);
    ua_print("%-9s %-16s %-16s %-16s\n", "NAMESPACE", "NODEID", "BROWSE NAME", "DISPLAY NAME");
    for(size_t i = 0; i < bResp.resultsSize; ++i) {
        for(size_t j = 0; j < bResp.results[i].referencesSize; ++j) {
            UA_ReferenceDescription *ref = &(bResp.results[i].references[j]);
            if(ref->nodeId.nodeId.identifierType == UA_NODEIDTYPE_NUMERIC) {
                ua_print("%-9d %-16d %-16.*s %-16.*s\n", ref->nodeId.nodeId.namespaceIndex,
                       ref->nodeId.nodeId.identifier.numeric, (int)ref->browseName.name.length,
                       ref->browseName.name.data, (int)ref->displayName.text.length,
                       ref->displayName.text.data);
            } else if(ref->nodeId.nodeId.identifierType == UA_NODEIDTYPE_STRING) {
                ua_print("%-9d %-16.*s %-16.*s %-16.*s\n", ref->nodeId.nodeId.namespaceIndex,
                       (int)ref->nodeId.nodeId.identifier.string.length,
                       ref->nodeId.nodeId.identifier.string.data,
                       (int)ref->browseName.name.length, ref->browseName.name.data,
                       (int)ref->displayName.text.length, ref->displayName.text.data);
            }
            /* TODO: distinguish further types */
        }
    }
    UA_BrowseRequest_clear(&bReq);
    UA_BrowseResponse_clear(&bResp);
}

void ua_browser_nodes(UA_Client *client)
{
    /* Same thing, this time using the node iterator... */
    UA_NodeId *parent = UA_NodeId_new();
    *parent = UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER);
    UA_Client_forEachChildNodeCall(client, UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER),
                                   nodeIter, (void *) parent);
    UA_NodeId_delete(parent);
}

UA_UInt32 ua_start_sub(UA_Client *client)
{
    /* Create a subscription */
    UA_CreateSubscriptionRequest request = UA_CreateSubscriptionRequest_default();
    UA_CreateSubscriptionResponse response = UA_Client_Subscriptions_create(client, request,
                                                                            NULL, NULL, NULL);

    UA_UInt32 subId = response.subscriptionId;
    if(response.responseHeader.serviceResult == UA_STATUSCODE_GOOD)
        ua_print("Create subscription succeeded, id %u\n", subId);

    UA_MonitoredItemCreateRequest monRequest =
        UA_MonitoredItemCreateRequest_default(UA_NODEID_STRING(1, "the.answer"));

    UA_MonitoredItemCreateResult monResponse =
    UA_Client_MonitoredItems_createDataChange(client, response.subscriptionId,
                                              UA_TIMESTAMPSTORETURN_BOTH,
                                              monRequest, NULL, handler_TheAnswerChanged, NULL);
    if(monResponse.statusCode == UA_STATUSCODE_GOOD)
        ua_print("Monitoring 'the.answer', id %u\n", monResponse.monitoredItemId);


    /* The first publish request should return the initial value of the variable */
    UA_Client_run_iterate(client, 1000);
	return subId;
}

void ua_read_attr(UA_Client *client)
{
    /* Read attribute */
    UA_Int32 value = 0;
    ua_print("\nReading the value of node (1, \"the.answer\"):\n");
    UA_Variant *val = UA_Variant_new();
    UA_StatusCode retval = UA_Client_readValueAttribute(client, UA_NODEID_STRING(1, "the.answer"), val);
    if(retval == UA_STATUSCODE_GOOD && UA_Variant_isScalar(val) &&
       val->type == &UA_TYPES[UA_TYPES_INT32]) {
            value = *(UA_Int32*)val->data;
            ua_print("the value is: %i\n", value);
    }
    UA_Variant_delete(val);

    /* Write node attribute */
    value++;
    ua_print("\nWriting a value of node (1, \"the.answer\"):\n");
    UA_WriteRequest wReq;
    UA_WriteRequest_init(&wReq);
    wReq.nodesToWrite = UA_WriteValue_new();
    wReq.nodesToWriteSize = 1;
    wReq.nodesToWrite[0].nodeId = UA_NODEID_STRING_ALLOC(1, "the.answer");
    wReq.nodesToWrite[0].attributeId = UA_ATTRIBUTEID_VALUE;
    wReq.nodesToWrite[0].value.hasValue = true;
    wReq.nodesToWrite[0].value.value.type = &UA_TYPES[UA_TYPES_INT32];
    wReq.nodesToWrite[0].value.value.storageType = UA_VARIANT_DATA_NODELETE; /* do not free the integer on deletion */
    wReq.nodesToWrite[0].value.value.data = &value;
    UA_WriteResponse wResp = UA_Client_Service_write(client, wReq);
    if(wResp.responseHeader.serviceResult == UA_STATUSCODE_GOOD)
            ua_print("the new value is: %i\n", value);
    UA_WriteRequest_clear(&wReq);
    UA_WriteResponse_clear(&wResp);

    /* Write node attribute (using the highlevel API) */
    value++;
    UA_Variant *myVariant = UA_Variant_new();
    UA_Variant_setScalarCopy(myVariant, &value, &UA_TYPES[UA_TYPES_INT32]);
    UA_Client_writeValueAttribute(client, UA_NODEID_STRING(1, "the.answer"), myVariant);
    UA_Variant_delete(myVariant);

}

void ua_call_remote(UA_Client *client)
{
    /* Call a remote method */
    UA_Variant input;
    UA_String argString = UA_STRING("Hello Server");
    UA_Variant_init(&input);
    UA_Variant_setScalarCopy(&input, &argString, &UA_TYPES[UA_TYPES_STRING]);
    size_t outputSize;
    UA_Variant *output;
    UA_StatusCode retval = UA_Client_call(client, UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER),
                            UA_NODEID_NUMERIC(1, 62541), 1, &input, &outputSize, &output);
    if(retval == UA_STATUSCODE_GOOD) {
        ua_print("Method call was successful, and %lu returned values available.\n",
               (unsigned long)outputSize);
        UA_Array_delete(output, outputSize, &UA_TYPES[UA_TYPES_VARIANT]);
    } else {
        ua_print("Method call was unsuccessful, and %x returned values available.\n", retval);
    }
    UA_Variant_clear(&input);
}


void ua_add_nodes(UA_Client *client)
{
    /* Add new nodes*/
    /* New ReferenceType */
    UA_NodeId ref_id;
    UA_ReferenceTypeAttributes ref_attr = UA_ReferenceTypeAttributes_default;
    ref_attr.displayName = UA_LOCALIZEDTEXT("en-US", "NewReference");
    ref_attr.description = UA_LOCALIZEDTEXT("en-US", "References something that might or might not exist");
    ref_attr.inverseName = UA_LOCALIZEDTEXT("en-US", "IsNewlyReferencedBy");
    UA_StatusCode retval = UA_Client_addReferenceTypeNode(client,
                                            UA_NODEID_NUMERIC(1, 12133),
                                            UA_NODEID_NUMERIC(0, UA_NS0ID_ORGANIZES),
                                            UA_NODEID_NUMERIC(0, UA_NS0ID_HASSUBTYPE),
                                            UA_QUALIFIEDNAME(1, "NewReference"),
                                            ref_attr, &ref_id);
    if(retval == UA_STATUSCODE_GOOD )
        ua_print("Created 'NewReference' with numeric NodeID %u\n", ref_id.identifier.numeric);

    /* New ObjectType */
    UA_NodeId objt_id;
    UA_ObjectTypeAttributes objt_attr = UA_ObjectTypeAttributes_default;
    objt_attr.displayName = UA_LOCALIZEDTEXT("en-US", "TheNewObjectType");
    objt_attr.description = UA_LOCALIZEDTEXT("en-US", "Put innovative description here");
    retval = UA_Client_addObjectTypeNode(client,
                                         UA_NODEID_NUMERIC(1, 12134),
                                         UA_NODEID_NUMERIC(0, UA_NS0ID_BASEOBJECTTYPE),
                                         UA_NODEID_NUMERIC(0, UA_NS0ID_HASSUBTYPE),
                                         UA_QUALIFIEDNAME(1, "NewObjectType"),
                                         objt_attr, &objt_id);
    if(retval == UA_STATUSCODE_GOOD)
        ua_print("Created 'NewObjectType' with numeric NodeID %u\n", objt_id.identifier.numeric);

    /* New Object */
    UA_NodeId obj_id;
    UA_ObjectAttributes obj_attr = UA_ObjectAttributes_default;
    obj_attr.displayName = UA_LOCALIZEDTEXT("en-US", "TheNewGreatNode");
    obj_attr.description = UA_LOCALIZEDTEXT("de-DE", "Hier koennte Ihre Webung stehen!");
    retval = UA_Client_addObjectNode(client,
                                     UA_NODEID_NUMERIC(1, 0),
                                     UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER),
                                     UA_NODEID_NUMERIC(0, UA_NS0ID_ORGANIZES),
                                     UA_QUALIFIEDNAME(1, "TheGreatNode"),
                                     UA_NODEID_NUMERIC(1, 12134),
                                     obj_attr, &obj_id);
    if(retval == UA_STATUSCODE_GOOD )
        ua_print("Created 'NewObject' with numeric NodeID %u\n", obj_id.identifier.numeric);

    /* New Integer Variable */
    UA_NodeId var_id;
    UA_VariableAttributes var_attr = UA_VariableAttributes_default;
    var_attr.displayName = UA_LOCALIZEDTEXT("en-US", "TheNewVariableNode");
    var_attr.description =
        UA_LOCALIZEDTEXT("en-US", "This integer is just amazing - it has digits and everything.");
    UA_Int32 int_value = 1234;
    /* This does not copy the value */
    UA_Variant_setScalar(&var_attr.value, &int_value, &UA_TYPES[UA_TYPES_INT32]);
    var_attr.dataType = UA_TYPES[UA_TYPES_INT32].typeId;
    retval = UA_Client_addVariableNode(client,
                                       UA_NODEID_NUMERIC(1, 0), // Assign new/random NodeID
                                       UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER),
                                       UA_NODEID_NUMERIC(0, UA_NS0ID_ORGANIZES),
                                       UA_QUALIFIEDNAME(0, "VariableNode"),
                                       UA_NODEID_NULL, // no variable type
                                       var_attr, &var_id);
    if(retval == UA_STATUSCODE_GOOD )
        ua_print("Created 'NewVariable' with numeric NodeID %u\n", var_id.identifier.numeric);

}

int ua_run_test(UA_Client *client)
{
	UA_StatusCode retval;

	/* Listing endpoints */
	retval = ua_get_points(client);
	if(retval != UA_STATUSCODE_GOOD) {
		UA_Client_delete(client);
		return EXIT_FAILURE;
	}

    /* Connect to a server */
    /* anonymous connect would be: retval = UA_Client_connect(client, "opc.tcp://localhost:4840"); */
	retval = UA_Client_connect(client, OPC_SERVER);
    if(retval != UA_STATUSCODE_GOOD) {
        UA_Client_delete(client);
        return EXIT_FAILURE;
    }

	ua_browser_objects(client);

    /* Same thing, this time using the node iterator... */
	ua_browser_nodes(client);

#ifdef UA_ENABLE_SUBSCRIPTIONS
	UA_Int32 subId = ua_start_sub(client);
#endif

	ua_read_attr(client);

#ifdef UA_ENABLE_SUBSCRIPTIONS
    /* Take another look at the.answer */
    UA_Client_run_iterate(client, 100);
    /* Delete the subscription */
    if(UA_Client_Subscriptions_deleteSingle(client, subId) == UA_STATUSCODE_GOOD)
        ua_print("Subscription removed\n");
#endif

#ifdef UA_ENABLE_METHODCALLS
	ua_call_remote(client);
#endif

#ifdef UA_ENABLE_NODEMANAGEMENT
	ua_add_nodes(client);
#endif

    return EXIT_SUCCESS;
}

void ua_read_time(UA_Client *client)
{
    /* Read the value attribute of the node. UA_Client_readValueAttribute is a
    * wrapper for the raw read service available as UA_Client_Service_read. */
    UA_Variant value; /* Variants can hold scalar values and arrays of any type */
    UA_Variant_init(&value);

    /* NodeId of the variable holding the current time */
    const UA_NodeId nodeId = UA_NODEID_NUMERIC(0, UA_NS0ID_SERVER_SERVERSTATUS_CURRENTTIME);
    UA_StatusCode retval = UA_Client_readValueAttribute(client, nodeId, &value);

    if(retval == UA_STATUSCODE_GOOD && UA_Variant_hasScalarType(&value, &UA_TYPES[UA_TYPES_DATETIME]))
    {
        UA_DateTime raw_date = *(UA_DateTime *) value.data;
        UA_DateTimeStruct dts = UA_DateTime_toStruct(raw_date);
        UA_LOG_INFO(UA_Log_Stdout, UA_LOGCATEGORY_USERLAND, "date is: %u-%u-%u %u:%u:%u.%03u\n",
            dts.day, dts.month, dts.year, dts.hour, dts.min, dts.sec, dts.milliSec);
    }
    /* Clean up */
    UA_Variant_clear(&value);
}

