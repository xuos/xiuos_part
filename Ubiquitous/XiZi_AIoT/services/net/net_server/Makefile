include $(KERNEL_ROOT)/services/net/net_server/lwip.mk

net_server: lwip_server.o COMPILER
	@echo "generate $^"

%.o: %.c
	@echo "cc $^"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $^



SRC_DIR += api
SRC_DIR += core
SRC_DIR += netif

include $(KERNEL_ROOT)/compiler.mk
