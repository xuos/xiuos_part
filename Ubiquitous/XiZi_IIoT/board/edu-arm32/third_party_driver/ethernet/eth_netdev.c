
#include <connect_ethernet.h>
#include <inet.h>
#include <lwip/dhcp.h>
#include <lwip/netif.h>
#include <netdev.h>
#include <xs_kdbg.h>

static const uint32_t NETIF_NAME_LEN = 2;

static int lwip_netdev_set_up(struct netdev* netdev)
{
    netif_set_up((struct netif*)netdev->user_data);
    return ERR_OK;
}

static int lwip_netdev_set_down(struct netdev* netif)
{
    netif_set_down((struct netif*)netif->user_data);
    return ERR_OK;
}

#ifndef ip_2_ip4
#define ip_2_ip4(ipaddr) (ipaddr)
#endif
static int lwip_netdev_set_addr_info(struct netdev* netdev, ip_addr_t* ip_addr, ip_addr_t* netmask, ip_addr_t* gw)
{
    if (ip_addr && netmask && gw) {
        netif_set_addr((struct netif*)netdev->user_data, ip_2_ip4(ip_addr), ip_2_ip4(netmask), ip_2_ip4(gw));
    } else {
        if (ip_addr) {
            netif_set_ipaddr((struct netif*)netdev->user_data, ip_2_ip4(ip_addr));
        }
        if (netmask) {
            netif_set_netmask((struct netif*)netdev->user_data, ip_2_ip4(netmask));
        }
        if (gw) {
            netif_set_gw((struct netif*)netdev->user_data, ip_2_ip4(gw));
        }
    }
}

#ifdef LWIP_DNS
static int lwip_netdev_set_dns_server(struct netdev* netdev, uint8_t dns_num, ip_addr_t* dns_server)
{
#if LWIP_VERSION_MAJOR == 1U /* v1.x */
    extern void dns_setserver(u8_t numdns, ip_addr_t * dnsserver);
#else /* >=2.x */
    extern void dns_setserver(uint8_t dns_num, const ip_addr_t* dns_server);
#endif /* LWIP_VERSION_MAJOR == 1U */

    dns_setserver(dns_num, dns_server);
    return ERR_OK;
}
#endif

#ifdef LWIP_DHCP
static int lwip_netdev_set_dhcp(struct netdev* netdev, bool is_enabled)
{
    netdev_low_level_set_dhcp_status(netdev, is_enabled);

    if (true == is_enabled) {
        dhcp_start((struct netif*)netdev->user_data);
    } else {
        dhcp_stop((struct netif*)netdev->user_data);
    }

    return ERR_OK;
}
#endif

static int lwip_netdev_set_default(struct netdev* netdev)
{
    netif_set_default((struct netif*)netdev->user_data);
    return ERR_OK;
}

static const struct netdev_ops lwip_netdev_ops = {
    .set_up = lwip_netdev_set_up,
    .set_down = lwip_netdev_set_down,
    .set_addr_info = lwip_netdev_set_addr_info,
#ifdef LWIP_DNS
    .set_dns_server = lwip_netdev_set_dns_server,
#endif
#ifdef LWIP_DHCP
    .set_dhcp = lwip_netdev_set_dhcp,
#endif
    .set_default = lwip_netdev_set_default,
};

static inline int netdev_set_flags(struct netif* lwip_netif)
{
    CHECK(lwip_netif);
    struct netdev* netdev = netdev_get_by_name(lwip_netif->name);
    if (netdev == NULL) {
        return -ERR_IF;
    }

    netdev->mtu = lwip_netif->mtu;
    // set flags
    if (lwip_netif->flags | NETIF_FLAG_BROADCAST) {
        netdev->flags |= NETDEV_FLAG_BROADCAST;
    }
    if (lwip_netif->flags | NETIF_FLAG_ETHARP) {
        netdev->flags |= NETDEV_FLAG_ETHARP;
    }
    if (lwip_netif->flags | NETIF_FLAG_IGMP) {
        netdev->flags |= NETDEV_FLAG_IGMP;
    }
#if LWIP_VERSION_MAJOR >= 2U /* >= v2.x */
    if (lwip_netif->flags & NETIF_FLAG_MLD6) {
        netdev->flags |= NETDEV_FLAG_MLD6;
    }
#endif /* LWIP_VERSION_MAJOR >= 2U */

#if LWIP_DHCP
    netdev_low_level_set_dhcp_status(netdev, true);
#else
    netdev_low_level_set_dhcp_status(netdev, false);
#endif

    return ERR_OK;
}

int lwip_netdev_add(struct netif* lwip_netif)
{
    CHECK(lwip_netif);

    struct netdev* netdev = calloc(1, sizeof(struct netdev));
    if (netdev == NULL) {
        return -ERR_IF;
    }

    // init netdev
    char netif_name[NETIF_NAME_LEN + 1];
    strncpy(netif_name, lwip_netif->name, NETIF_NAME_LEN);
    // register netdev
    int result = netdev_register(netdev, netif_name, (void*)lwip_netif);
    // set values of netdev
    netdev_set_flags(lwip_netif);
    netdev->ops = &lwip_netdev_ops;
    netdev->hwaddr_len = lwip_netif->hwaddr_len;
    memcpy(netdev->hwaddr, lwip_netif->hwaddr, lwip_netif->hwaddr_len);
    netdev->ip_addr = lwip_netif->ip_addr;
    netdev->gw = lwip_netif->gw;
    netdev->netmask = lwip_netif->netmask;

    return result;
}

void lwip_netdev_del(struct netif* lwip_netif)
{
    char name[NETIF_NAME_LEN + 1];
    struct netdev* netdev;

    CHECK(lwip_netif);

    strncpy(name, lwip_netif->name, NETIF_NAME_LEN);
    netdev = netdev_get_by_name(name);
    netdev_unregister(netdev);
    free(netdev);
}