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

static const char* s_http_addr = "http://0.0.0.0:8000"; // HTTP port
static const char* s_root_dir = "netsetting";

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
    if (ev == MG_EV_OPEN && c->is_listening) {
        s_config.ip = strdup(inet_ntoa(p_netdev->ip_addr));
        s_config.mask = strdup(inet_ntoa(p_netdev->netmask));
        s_config.gw = strdup(inet_ntoa(p_netdev->gw));
        s_config.dns = strdup(inet_ntoa(p_netdev->dns_servers[0]));
    } else if (ev == MG_EV_HTTP_MSG) {
        struct mg_http_message* hm = (struct mg_http_message*)ev_data;
        if (mg_http_match_uri(hm, "/api/config/get")) {
            mg_http_reply(c, 200, "Content-Type: application/json\r\n",
                "{%m:%m,%m:%m,%m:%m,%m:%m}\n",
                MG_ESC("ip"), MG_ESC(s_config.ip),
                MG_ESC("mask"), MG_ESC(s_config.mask),
                MG_ESC("gw"), MG_ESC(s_config.gw),
                MG_ESC("dns"), MG_ESC(s_config.dns));
        } else if (mg_http_match_uri(hm, "/api/config/set")) {
            struct mg_str json = hm->body;
            printf("json: %s\n", json.ptr);
            update_config(json, "$.ip", &s_config.ip);
            update_config(json, "$.mask", &s_config.mask);
            update_config(json, "$.gw", &s_config.gw);
            update_config(json, "$.dns", &s_config.dns);
            mg_http_reply(c, 200, "", "ok\n");

            ip_addr_t ipaddr, maskaddr, gwaddr;
            inet_aton(s_config.ip, &ipaddr);
            inet_aton(s_config.mask, &maskaddr);
            inet_aton(s_config.gw, &gwaddr);
            p_netdev->ops->set_addr_info(p_netdev, &ipaddr, &maskaddr, &gwaddr);

            printf("Board Net Configuration changed to [IP: %s, Mask: %s, GW: %s]\n",
                s_config.ip,
                s_config.mask,
                s_config.gw);
        } else {
            struct mg_http_serve_opts opts = { .root_dir = s_root_dir };
            mg_http_serve_dir(c, ev_data, &opts);
        }
    }
    (void)fn_data;
}

static void* do_net_setting_demo(void* none)
{
    p_netdev = NETDEV_DEFAULT;

    struct mg_mgr mgr; // Event manager
    mg_log_set(MG_LL_DEBUG); // Set to 3 to enable debug
    mg_mgr_init(&mgr); // Initialise event manager
    mg_http_listen(&mgr, s_http_addr, fn, NULL); // Create HTTP listener
    for (;;)
        mg_mgr_poll(&mgr, 10); // Infinite event loop
    mg_mgr_free(&mgr);
    return NULL;
}

int net_setting_demo(int argc, char* argv[])
{
    pthread_t tid = -1;
    pthread_attr_t attr;
    attr.schedparam.sched_priority = 30;
    attr.stacksize = 16384;

    PrivTaskCreate(&tid, &attr, do_net_setting_demo, NULL);

    return 0;
}
SHELL_EXPORT_CMD(SHELL_CMD_PERMISSION(0) | SHELL_CMD_TYPE(SHELL_TYPE_CMD_MAIN) | SHELL_CMD_PARAM_NUM(5), NetSettingDemo, net_setting_demo, webserver to set net configurations);