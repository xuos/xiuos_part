include $(KERNEL_ROOT)/services/net/net_server/lwip.mk

api = api_lib.o \
	  api_msg.o \
	  err.o \
	  if_api.o \
	  netbuf.o \
	  netdb.o \
	  netifapi.o \
	  sockets.o \
	  tcpip.o 

core = altcp_alloc.o \
	   altcp_tcp.o \
	   altcp.o \
	   def.o \
	   dns.o \
	   inet_chksum.o \
	   init.o \
	   ip.o \
	   mem.o \
	   memp.o \
	   netif.o \
	   pbuf.o \
	   raw.o \
	   stats.o \
	   sys.o \
	   tcp_in.o \
	   tcp_out.o \
	   tcp.o \
	   timeouts.o \
	   udp.o

ipv4 = autoip.o \
	   dhcp.o \
	   etharp.o \
	   icmp.o \
	   igmp.o \
	   ip4_addr.o \
	   ip4_frag.o \
	   ip4.o 

netif = bridgeif.o \
        ethernet.o \
		zepif.o


libserial = $(KERNEL_ROOT)/services/app/libserial.o
printf = $(KERNEL_ROOT)/services/app/printf.o
libmem = $(KERNEL_ROOT)/services/app/libmem.o
usyscall = $(KERNEL_ROOT)/services/app/usyscall.o 
arch_usyscall = $(KERNEL_ROOT)/services/app/arch_usyscall.o
session = $(KERNEL_ROOT)/services/app/session.o
libipc = $(KERNEL_ROOT)/services/app/libipc.o

lwip: COMPILER lwip_server.o | bin
	@${ld} ${user_ldflags} -e main -o $@ ${api} ${core} ${ipv4} ${netif} lwip_service.o lwip_server.o \
		${board_specs} ${libserial} ${printf} ${libmem} ${usyscall} ${arch_usyscall} ${session} ${libipc}
	@mv *.o bin
	@mv $@ $(KERNEL_ROOT)/services/app

bin:
	@mkdir -p bin

%.o: %.c
	@echo "cc $^"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $^



SRC_DIR += api
SRC_DIR += core
SRC_DIR += netif

include $(KERNEL_ROOT)/compiler.mk
