ifeq ($(BOARD), imx6q-sabrelite)
toolchain ?= arm-none-eabi-
cflags = -std=c11 -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie 
user_ldflags = -N -Ttext 0
endif
ifeq ($(BOARD), zynq7000-zc702)
toolchain ?= arm-xilinx-eabi-
cflags = -std=c11 -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie 
user_ldflags = -N -Ttext 0
endif
ifeq ($(BOARD), ok1028a-c)
toolchain ?= aarch64-none-elf-
user_ldflags = -N 
cflags = -Wall -g -std=c11 -mtune=cortex-a55 -nostdlib -nodefaultlibs -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie  
endif

cc = ${toolchain}gcc
ld = ${toolchain}g++
objdump = ${toolchain}objdump

c_useropts = -O2

INC_DIR = 	-I$(KERNEL_ROOT)/services/fs/libfs \
			-I$(KERNEL_ROOT)/services/lib/ipc \
		  	-I$(KERNEL_ROOT)/services/lib/memory \
			-I$(KERNEL_ROOT)/services/lib/serial \
			-I$(KERNEL_ROOT)/services/lib/usyscall \
			-I$(KERNEL_ROOT)/services/boards/$(BOARD) \
			-I$(KERNEL_ROOT)/services/app

fs_server: libfs.o
	@mv $^ $(KERNEL_ROOT)/services/app

%.o: %.c
	@echo "cc $^"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $^