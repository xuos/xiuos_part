/**
* @file:    test_webserver.c
* @brief:   a application of test webserver function
* @version: 1.0
* @author:  Yao wenying
* @date:    2023/08/20
*/


#include <transform.h>
#include "test_webserver.h"

/**设置ip,网关，子网掩码这部分参考lwip_config_demo.c*/
uint8_t enet_idd = 0;

void LwipShowIP()
{
#ifdef configMAC_ADDR
    char mac_addr0[] = configMAC_ADDR;
#endif

    //打印出来 lwip_eth0_ipaddr
    lw_notice("\r\n************************************************\r\n");
    lw_notice(" Network Configuration\r\n");
    lw_notice("************************************************\r\n");
    lw_notice(" ETH0 IPv4 Address   : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_eth0_ipaddr)[0], ((u8_t *)&lwip_eth0_ipaddr)[1],
        ((u8_t *)&lwip_eth0_ipaddr)[2], ((u8_t *)&lwip_eth0_ipaddr)[3]);
    lw_notice(" ETH0 IPv4 Subnet mask : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_eth0_netmask)[0], ((u8_t *)&lwip_eth0_netmask)[1],
        ((u8_t *)&lwip_eth0_netmask)[2], ((u8_t *)&lwip_eth0_netmask)[3]);
    lw_notice(" ETH0 IPv4 Gateway   : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_gwaddr)[0], ((u8_t *)&lwip_eth0_gwaddr)[1],
        ((u8_t *)&lwip_eth0_gwaddr)[2], ((u8_t *)&lwip_eth0_gwaddr)[3]);
#ifdef configMAC_ADDR
    lw_notice(" ETH0 MAC Address    : %x:%x:%x:%x:%x:%x\r\n", mac_addr0[0], mac_addr0[1], mac_addr0[2],
        mac_addr0[3], mac_addr0[4], mac_addr0[5]);
#endif
#ifdef BOARD_NET_COUNT
    if(BOARD_NET_COUNT > 1)
    {
        char mac_addr1[] = configMAC_ADDR_ETH1;
        lw_notice("\r\n");
        lw_notice(" ETH1 IPv4 Address   : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_eth1_ipaddr)[0], ((u8_t *)&lwip_eth1_ipaddr)[1],
            ((u8_t *)&lwip_eth1_ipaddr)[2], ((u8_t *)&lwip_eth1_ipaddr)[3]);
        lw_notice(" ETH1 IPv4 Subnet mask : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_eth1_netmask)[0], ((u8_t *)&lwip_eth1_netmask)[1],
            ((u8_t *)&lwip_eth1_netmask)[2], ((u8_t *)&lwip_eth1_netmask)[3]);
        lw_notice(" ETH1 IPv4 Gateway   : %u.%u.%u.%u\r\n", ((u8_t *)&lwip_eth1_gwaddr)[0], ((u8_t *)&lwip_eth1_gwaddr)[1],
            ((u8_t *)&lwip_eth1_gwaddr)[2], ((u8_t *)&lwip_eth1_gwaddr)[3]);
        lw_notice(" ETH1 MAC Address    : %x:%x:%x:%x:%x:%x\r\n", mac_addr1[0], mac_addr1[1], mac_addr1[2],
            mac_addr1[3], mac_addr1[4], mac_addr1[5]);
    }
#endif
    lw_notice("************************************************\r\n");
}

void LwipSetIP(int argc, char *argv[])
{
    if(argc >= 4)
    {
        printf("lw: [%s] ip %s mask %s gw %s netport %s\n", __func__, argv[1], argv[2], argv[3], argv[4]);
        sscanf(argv[1], "%d.%d.%d.%d", &lwip_ipaddr[0], &lwip_ipaddr[1], &lwip_ipaddr[2], &lwip_ipaddr[3]);
        sscanf(argv[2], "%d.%d.%d.%d", &lwip_netmask[0], &lwip_netmask[1], &lwip_netmask[2], &lwip_netmask[3]);
        sscanf(argv[3], "%d.%d.%d.%d", &lwip_gwaddr[0], &lwip_gwaddr[1], &lwip_gwaddr[2], &lwip_gwaddr[3]);
        sscanf(argv[4], "%d", &enet_idd);

        if(0 == enet_idd)
        {
            printf("save eth0 info\n");
            memcpy(lwip_eth0_ipaddr, lwip_ipaddr, 20);
            memcpy(lwip_eth0_netmask, lwip_netmask, 20);
            memcpy(lwip_eth0_gwaddr, lwip_gwaddr, 20);
        }
        else if(1 == enet_idd)
        {
            printf("save eth1 info\n");
            memcpy(lwip_eth1_ipaddr, lwip_ipaddr, 20);
            memcpy(lwip_eth1_netmask, lwip_netmask, 20);
            memcpy(lwip_eth1_gwaddr, lwip_gwaddr, 20);
        }
    }
    else if(argc == 2)
    {
        printf("lw: [%s] set eth0 ipaddr %s \n", __func__, argv[1]);
        sscanf(argv[1], "%d.%d.%d.%d", &lwip_ipaddr[0], &lwip_ipaddr[1], &lwip_ipaddr[2], &lwip_ipaddr[3]);
        memcpy(lwip_eth0_ipaddr, lwip_ipaddr, strlen(lwip_ipaddr));
    }
    // sys_thread_new("SET ip address", LwipSetIPTask, &enet_id, LWIP_TASK_STACK_SIZE, LWIP_DEMO_TASK_PRIO);
    printf("lw: [%s] config netport id[%d]\n", __func__, enet_idd);
    lwip_config_net(enet_idd, lwip_ipaddr, lwip_netmask, lwip_gwaddr);
}

void AddrUpdate()
{
    char * local_ip = "192.168.1.10";
    char * local_mask="255.255.255.0";
    char * local_gw = "192.168.1.1";
    char * port= "0";

    char *argv[5];
    argv[1] = local_ip;
    argv[2] = local_mask;
    argv[3] = local_gw;
    argv[4] = port;
    LwipSetIP(4, argv); 
    
}


//设置socket
//循环监听socket并修改ip，单线程

static void tcpecho_thread(void *arg){
    int sock=-1, connected;
    char *recv_data ;
    struct sockaddr_in server_addr, client_addr;
    socklen_t sin_size;
    int recv_data_len;

    recv_data = (char *) malloc(RECV_DATA);

    if(recv_data == NULL){
        printf("No memory");
        goto __exit;
    }

    sock = socket(AF_INET, SOCK_STREAM, 0);
    if(sock < 0){
        printf("Socket error\n");
        goto __exit;
    }
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);
    memset(&(server_addr.sin_zero), 0, sizeof(server_addr.sin_zero));

    if(bind(sock,(struct sockaddr *)&server_addr, sizeof(struct sockaddr)) == 1){
        printf("Unable to bind\n");
        goto __exit;
    }
    if (listen(sock, 5) == -1)
    {
        printf("Listen error\n");
        goto __exit;
    }

    while(1){
        sin_size = sizeof(struct sockaddr_in);
        connected = accept(sock, (struct sockaddr *)&client_addr, &sin_size);

        printf("new client connected from (%s, %d)\n",
            inet_ntoa(client_addr.sin_addr), ntohs(client_addr.sin_port));

        {
            int flag = 1;

            setsockopt(connected,
                    IPPROTO_TCP,     /* set option at TCP level */
                    TCP_NODELAY,     /* name of option */
                    (void *) &flag, /* the cast is historical cruft */
                    sizeof(int));    /* length of option value */
        }


        recv_data_len = recv(connected, recv_data, RECV_DATA, 0);


        printf("recv %d len data\n",recv_data_len);
        recv_data[recv_data_len] = '\0';

        // write(connected,recv_data,recv_data_len);
        printf("%s\n", recv_data);
        if (connected >= 0)
            closesocket(connected);

        connected = -1;
    }
    __exit:
    if (sock >= 0) closesocket(sock);
    if (recv_data) free(recv_data);
}

void TestWebserver(){
    AddrUpdate();
    LwipShowIP();
}

PRIV_SHELL_CMD_FUNCTION(TestWebserver, Implement web_server, PRIV_SHELL_CMD_MAIN_ATTR);