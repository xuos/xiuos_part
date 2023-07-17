#include <string.h>
#include <transform.h>
#include <stdbool.h>

/* lwip includes. */
#include "lwip/apps/mqtt.h"
#include "lwip/ip4_addr.h"




static mqtt_client_t *s__mqtt_client_instance = NULL; //mqtt连接句柄，这里一定要设置全局变量，防止 lwip 底层重复申请空间

//MQTT 数据结构体
struct mqtt_recv_buffer
{
    char recv_buffer[1024];  //储存接收的buffer
    uint16_t recv_len;         //记录已接收多少个字节的数据，MQTT的数据分包来的
    uint16_t recv_total;       //MQTT接收数据的回调函数会有个总的大小
};

//结构体初始化
struct mqtt_recv_buffer s__mqtt_recv_buffer_g = {
    .recv_len = 0,
    .recv_total = 0,
};





/*!
* @brief MQTT 处理失败调用的函数
*
* @param [in1] : MQTT 连接句柄
* @param [in2] : MQTT 连接参数指针
*
* @retval: None
*/
void mqtt_error_process_callback(mqtt_client_t * client, void *arg)
{
    
}


/*!
* @brief mqtt 接收数据处理函数接口，需要在应用层进行处理
*        执行条件：mqtt连接成功
*
* @param [in1] : 用户提供的回调参数指针
* @param [in2] : 接收的数据指针
* @param [in3] : 接收数据长度
* @retval: 处理的结果
*/
int mqtt_rec_data_process(void* arg, char *rec_buf, uint64_t buf_len)
{
    lw_print("recv_buffer = %s\n", rec_buf);
    return 0;
}

/*!
* @brief MQTT 订阅的回调函数
*        执行条件：MQTT 连接成功
*
* @param [in] : 用户提供的回调参数指针
* @param [in] : MQTT 订阅结果
* @retval: None
*/
static void bsp_mqtt_request_cb(void *arg, err_t err)
{
    if ( arg == NULL )
    {
        lw_print("bsp_mqtt_request_cb: input error@@\n");
        return;
    }

    mqtt_client_t *client = (mqtt_client_t *)arg;

    if ( err != ERR_OK )
    {
        lw_print("bsp_mqtt_request_cb: FAIL sub, sub again, err = %s\n", lwip_strerr(err));

		//错误处理
		mqtt_error_process_callback(client, arg);
    }
	else
	{
		lw_print("bsp_mqtt_request_cb: sub SUCCESS!\n");
	}
}


/*!
* @brief mqtt 订阅
*        执行条件：连接成功
*
* @param [in1] : mqtt 连接句柄
* @param [in2] : mqtt 发送 topic 指针
* @param [in5] : qos
* @retval: 订阅状态
*/
static err_t bsp_mqtt_subscribe(mqtt_client_t* mqtt_client, char * sub_topic, uint8_t qos)
{
    lw_print("bsp_mqtt_subscribe: Enter\n");
	
	if( ( mqtt_client == NULL) || ( sub_topic == NULL) || ( qos > 2 ) )
	{
        lw_print("bsp_mqtt_subscribe: input error@@\n");
		return ERR_VAL;
	}

	if ( mqtt_client_is_connected(mqtt_client) != true )
	{
		lw_print("bsp_mqtt_subscribe: mqtt is not connected, return ERR_CLSD.\n");
		return ERR_CLSD;
	}

	err_t err;
	err = mqtt_subscribe(mqtt_client, sub_topic, qos, bsp_mqtt_request_cb, (void *)mqtt_client);  // subscribe and call back.

	if (err != ERR_OK)
	{
		lw_print("bsp_mqtt_subscribe: mqtt_subscribe Fail, return:%s \n", lwip_strerr(err));
	}
	else
	{
		lw_print("bsp_mqtt_subscribe: mqtt_subscribe SUCCESS, reason: %s\n", lwip_strerr(err));
	}

	return err;
}

/*!
* @brief MQTT 连接成功的处理函数，需要的话在应用层定义
*
* @param [in1] : MQTT 连接句柄
* @param [in2] : MQTT 连接参数指针
*
* @retval: None
*/

void mqtt_conn_suc_proc(mqtt_client_t *client, void *arg)
{
    char test_sub_topic[] = "/public/TEST/AidenHinGwenWong_sub";
    bsp_mqtt_subscribe(client,test_sub_topic,0);
}


/*!
* @brief MQTT 接收到数据的回调函数
*        执行条件：MQTT 连接成功
*
* @param [in1] : 用户提供的回调参数指针
* @param [in2] : MQTT 收到的分包数据指针
* @param [in3] : MQTT 分包数据长度
* @param [in4] : MQTT 数据包的标志位
* @retval: None
*/
static void bsp_mqtt_incoming_data_cb(void *arg, const u8_t *data, u16_t len, u8_t flags)
{
    if( (data == NULL) || (len == 0) )
    {
        lw_print("mqtt_client_incoming_data_cb: condition error @entry\n");
        return;
    }
    
    if(s__mqtt_recv_buffer_g.recv_len + len < sizeof(s__mqtt_recv_buffer_g.recv_buffer))
    {
        //
        snprintf(&s__mqtt_recv_buffer_g.recv_buffer[s__mqtt_recv_buffer_g.recv_len], len, "%s", data);
        s__mqtt_recv_buffer_g.recv_len += len;
    }
    
    if ( (flags & MQTT_DATA_FLAG_LAST) == MQTT_DATA_FLAG_LAST )
    {
        //处理数据
        mqtt_rec_data_process(arg , s__mqtt_recv_buffer_g.recv_buffer, s__mqtt_recv_buffer_g.recv_len);
        
        //已接收字节计数归0
        s__mqtt_recv_buffer_g.recv_len = 0;            
        
        //清空接收buffer
        memset(s__mqtt_recv_buffer_g.recv_buffer, 0, sizeof(s__mqtt_recv_buffer_g.recv_buffer));
    }


    lw_print("mqtt_client_incoming_data_cb:reveiving incomming data.\n");
}

/*!
* @brief MQTT 接收到数据的回调函数
*        执行条件：MQTT 连接成功
*
* @param [in] : 用户提供的回调参数指针
* @param [in] : MQTT 收到数据的topic
* @param [in] : MQTT 收到数据的总长度
* @retval: None
*/
static void bsp_mqtt_incoming_publish_cb(void *arg, const char *topic, u32_t tot_len)
{
    if( (topic == NULL) || (tot_len == 0) )
    {
        lw_print("bsp_mqtt_incoming_publish_cb: condition error @entry\n");
        return;
    }

	lw_print("bsp_mqtt_incoming_publish_cb: topic = %s.\n",topic);
	lw_print("bsp_mqtt_incoming_publish_cb: tot_len = %d.\n",tot_len);
	s__mqtt_recv_buffer_g.recv_total = tot_len;    //需要接收的总字节
	s__mqtt_recv_buffer_g.recv_len = 0;            //已接收字节计数归0
    
    //清空接收buffer
    memset(s__mqtt_recv_buffer_g.recv_buffer, 0, sizeof(s__mqtt_recv_buffer_g.recv_buffer));
}


/*!
* @brief MQTT 连接状态的回调函数
*
* @param [in] : MQTT 连接句柄
* @param [in] : 用户提供的回调参数指针
* @param [in] : MQTT 连接状态
* @retval: None
*/
static void bsp_mqtt_connection_cb(mqtt_client_t *client, void *arg, mqtt_connection_status_t status)
{
    if( client == NULL )
    {
        lw_print("bsp_mqtt_connection_cb: condition error @entry\n");
        return;
    }
    lw_print("status:%d",status);
    if ( status == MQTT_CONNECT_ACCEPTED ) //Successfully connected
    {
		lw_print("bsp_mqtt_connection_cb: Successfully connected\n");
        
        // 注册接收数据的回调函数
		mqtt_set_inpub_callback(client, bsp_mqtt_incoming_publish_cb, bsp_mqtt_incoming_data_cb, arg);  
        
        
        
        //成功处理函数
		mqtt_conn_suc_proc(client, arg);
    }
	else
	{
		lw_print("bsp_mqtt_connection_cb: Fail connected, status = %s\n", lwip_strerr(status) );
        //错误处理
		mqtt_error_process_callback(client, arg);
	}
}

static err_t bsp_mqtt_connect(void)
{
    lw_print("bsp_mqtt_connect: Enter!\n");
	err_t ret;

    struct mqtt_connect_client_info_t  mqtt_connect_info = {
		"Hc_MQTT_Test",  /* 这里需要修改，以免在同一个服务器两个相同ID会发生冲突 */
		NULL,   /* MQTT 服务器用户名 */
		NULL,   /* MQTT 服务器密码 */
		60,     /* 与 MQTT 服务器保持连接时间，时间超过未发送数据会断开 */
		"/public/TEST/AidenHinGwenWong_pub",/* MQTT遗嘱的消息发送topic */
		"Offline_pls_check", /* MQTT遗嘱的消息，断开服务器的时候会发送 */
		0,  /* MQTT遗嘱的消息 Qos */
		0   /* MQTT遗嘱的消息 Retain */
	};
    
    ip_addr_t server_ip;
    ip4_addr_set_u32(&server_ip, ipaddr_addr("120.76.100.197"));  //MQTT服务器IP

    uint16_t server_port = 18830;  //注意这里是 MQTT 的 TCP 连接方式的端口号！！！！

    if (s__mqtt_client_instance == NULL)
    {
        // 句柄==NULL 才申请空间，否则无需重复申请
	    s__mqtt_client_instance = mqtt_client_new();
    }

	if (s__mqtt_client_instance == NULL)
	{
        //防止申请失败
		lw_print("bsp_mqtt_connect: s__mqtt_client_instance malloc fail @@!!!\n");
		return ERR_MEM;
	}

    //进行连接,注意：如果需要带入 arg ，arg必须是全局变量，局部变量指针会被回收，大坑！！！！！
    ret = mqtt_client_connect(s__mqtt_client_instance, &server_ip, server_port, bsp_mqtt_connection_cb, NULL, &mqtt_connect_info);

    /******************
    小提示：连接错误不需要做任何操作，mqtt_client_connect 中注册的回调函数里面做判断并进行对应的操作
    *****************/
    
    lw_print("bsp_mqtt_connect: connect to mqtt %s\n", lwip_strerr(ret));

	return ret;
}


/* ===========================================
                 初始化接口函数
============================================== */

/*!
* @brief 封装 MQTT 初始化接口
*        执行条件：无
*
* @retval: 无
*/
void MQTTOnline(void)
{	
    lw_print("Mqtt init...");
        
    // 连接服务器
    bsp_mqtt_connect();
    
    // 发送消息到服务器
    // char message_test[] = "Hello mqtt server";
    // for(int i = 0; i < 10; i++)
    // {
    //     bsp_mqtt_publish(s__mqtt_client_instance,"/public/TEST/AidenHinGwenWong_pub",message_test,sizeof(message_test),1,0);
    //     PrivTaskDelay(1000);  
    // }
    
}


PRIV_SHELL_CMD_FUNCTION(MQTTOnline, a tcp send sample, PRIV_SHELL_CMD_MAIN_ATTR);
