ifeq ($(BOARD), imx6q-sabrelite)
toolchain ?= arm-none-eabi-
endif
ifeq ($(BOARD), zynq7000-zc702)
toolchain ?= arm-xilinx-eabi-
endif
cc = ${toolchain}gcc
ld = ${toolchain}g++
objdump = ${toolchain}objdump
user_ldflags = -N -Ttext 0

cflags = -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie -no-pie 
c_useropts = -O0

INC_DIR = 	-I$(KERNEL_ROOT)/services/fs/libfs \
			-I$(KERNEL_ROOT)/services/fs/fs_server/include \
			-I$(KERNEL_ROOT)/services/lib/ipc \
			-I$(KERNEL_ROOT)/services/boards/$(BOARD) \
			-I$(KERNEL_ROOT)/services/app

board: libserial.o usyscall.o
	@mv $^ ../../app

%.o: %.c
	@echo "cc $^"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $^

include $(KERNEL_ROOT)/compiler.mk
