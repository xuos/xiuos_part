include $(KERNEL_ROOT)/services/net/net_server/lwip.mk

objs += bridgeif.o \
        ethernet.o \
		zepif.o

netif:${objs}
	@echo "generate $^"

%.o: %.c
	@echo "cc $^"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $^
	
include $(KERNEL_ROOT)/compiler.mk
