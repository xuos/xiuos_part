// Copyright (c) 2022 Cesanta Software Limited
// All rights reserved
//
// UI example
// It implements the following endpoints:
//    /api/config/get - respond with current config
//    /api/config/set - POST a config change
//    any other URI serves static files from s_root_dir
// Data and results are JSON strings

#include "ip_addr.h"
#include "mongoose.h"
#include "netdev.h"

char index_path[] = "login.html";

static const char* s_http_addr = "http://0.0.0.0:8000"; // HTTP port
static const char* s_root_dir = "webserver";
static const char* s_enable_hexdump = "no";
static const char* s_ssi_pattern = "#.html";

static const char* device_type = "Edu-ARM32";
static const char* web_version = "XUOS Webserver 1.0";
static int enable_4g = 0;

static struct netdev* p_netdev;

static struct config {
    char *ip, *mask, *gw, *dns;
} s_config;

// Try to update a single configuration value
static void update_config(struct mg_str json, const char* path, char** value)
{
    char* jval;
    if ((jval = mg_json_get_str(json, path)) != NULL) {
        free(*value);
        *value = strdup(jval);
    }
}

static void fn(struct mg_connection* c, int ev, void* ev_data, void* fn_data)
{
    if (ev == MG_EV_HTTP_MSG) {
        struct mg_http_message *hm = (struct mg_http_message*)ev_data, tmp = { 0 };
        if (mg_http_match_uri(hm, "/getSystemInfo")) {
            mg_http_reply(c, 200, "Content-Type: application/json\r\n",
                "{%m:%m, %m:%m, %m:%m, %m:%m, %m:%m, %m:%d}\n",
                MG_ESC("ip"), MG_ESC(s_config.ip),
                MG_ESC("deviceType"), MG_ESC(device_type),
                MG_ESC("deviceNo"), MG_ESC("0"),
                MG_ESC("systemTime"), MG_ESC("YYYY:MM:DD hh:mm:ss"),
                MG_ESC("webVersion"), MG_ESC(web_version),
                MG_ESC("statusOf4g"), enable_4g);
        } else if (mg_http_match_uri(hm, "/net/get4gInfo")) {
            mg_http_reply(c, 200, "Content-Type: application/json\r\n",
                "{%m:%m}\n",
                MG_ESC("enable4g"), MG_ESC(enable_4g));
        } else if (mg_http_match_uri(hm, "/net/set4gInfo")) {
            struct mg_str json = hm->body;
            enable_4g = mg_json_get_long(json, "$.enable4g", 0);
            mg_http_reply(c, 200, "Content-Type: application/json\r\n", "{\"status\":\"success\"}\r\n");
            printf("Get enable 4g setting: %d\n", enable_4g);
        } else if (mg_http_match_uri(hm, "/net/getEthernetInfo")) {
            mg_http_reply(c, 200, "Content-Type: application/json\r\n",
                "{%m:%m, %m:%m, %m:%m, %m:%m}\n",
                MG_ESC("ip"), MG_ESC(s_config.ip),
                MG_ESC("netmask"), MG_ESC(s_config.mask),
                MG_ESC("gateway"), MG_ESC(s_config.gw),
                MG_ESC("dns"), MG_ESC(s_config.dns));
        } else if (mg_http_match_uri(hm, "/net/setEthernetInfo")) {
            struct mg_str json = hm->body;
            printf("json: %s\n", json.ptr);
            update_config(json, "$.ip", &s_config.ip);
            update_config(json, "$.netmask", &s_config.mask);
            update_config(json, "$.gateway", &s_config.gw);
            update_config(json, "$.dns", &s_config.dns);
            mg_http_reply(c, 200, "Content-Type: application/json\r\n", "{\"status\":\"success\"}\r\n");

            ip_addr_t ipaddr, maskaddr, gwaddr;
            inet_aton(s_config.ip, &ipaddr);
            inet_aton(s_config.mask, &maskaddr);
            inet_aton(s_config.gw, &gwaddr);
            p_netdev->ops->set_addr_info(p_netdev, &ipaddr, &maskaddr, &gwaddr);

            printf("Board Net Configuration changed to [IP: %s, Mask: %s, GW: %s, DNS: %s]\n",
                s_config.ip,
                s_config.mask,
                s_config.gw,
                s_config.dns);
        } else {
            struct mg_str unknown = mg_str_n("?", 1), *cl;
            struct mg_http_serve_opts opts = { .root_dir = s_root_dir, .ssi_pattern = s_ssi_pattern };
            mg_http_serve_dir(c, hm, &opts);
            mg_http_parse((char*)c->send.buf, c->send.len, &tmp);
            cl = mg_http_get_header(&tmp, "Content-Length");
            if (cl == NULL)
                cl = &unknown;
            MG_INFO(("%.*s %.*s %.*s %.*s", (int)hm->method.len, hm->method.ptr,
                (int)hm->uri.len, hm->uri.ptr, (int)tmp.uri.len, tmp.uri.ptr,
                (int)cl->len, cl->ptr));
        }
    }
    (void)fn_data;
}

extern void LwipSetIPTest(int argc, char* argv[]);
static void* do_webserver_demo(void* none)
{
    p_netdev = NETDEV_DEFAULT;
    s_config.ip = strdup(inet_ntoa(p_netdev->ip_addr));
    s_config.mask = strdup(inet_ntoa(p_netdev->netmask));
    s_config.gw = strdup(inet_ntoa(p_netdev->gw));
    s_config.dns = strdup(inet_ntoa(p_netdev->dns_servers[0]));

    struct mg_mgr mgr; // Event manager
    mg_log_set(MG_LL_INFO); // Set to 3 to enable debug
    // mg_log_set(MG_LL_DEBUG); // Set to 3 to enable debug
    mg_mgr_init(&mgr); // Initialise event manager
    mg_http_listen(&mgr, s_http_addr, fn, NULL); // Create HTTP listener
    for (;;)
        mg_mgr_poll(&mgr, 50); // Infinite event loop
    mg_mgr_free(&mgr);
    return NULL;
}

int webserver_demo(int argc, char* argv[])
{
    LwipSetIPTest(1, NULL);

    pthread_t tid = -1;
    pthread_attr_t attr;
    attr.schedparam.sched_priority = 30;
    attr.stacksize = 0x4000;

    PrivTaskCreate(&tid, &attr, do_webserver_demo, NULL);

    return 0;
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(5), Webserver, webserver_demo, webserver for project);