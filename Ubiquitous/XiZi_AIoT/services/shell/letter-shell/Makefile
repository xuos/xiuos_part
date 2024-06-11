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
ifeq ($(BOARD), 3568)
toolchain ?= aarch64-none-elf-
user_ldflags = -N -Ttext 0
cflags = -Wall -O0 -g -std=c11 -mtune=cortex-a55 -nostdlib -nodefaultlibs -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie
endif

cc = ${toolchain}gcc
ld = ${toolchain}g++
objdump = ${toolchain}objdump

c_useropts = -O2

INC_DIR = 	-I$(KERNEL_ROOT)/services/app \
			-I$(KERNEL_ROOT)/services/fs/libfs \
		  	-I$(KERNEL_ROOT)/services/lib/memory \
			-I$(KERNEL_ROOT)/services/lib/serial \
			-I$(KERNEL_ROOT)/services/lib/usyscall \
			-I$(KERNEL_ROOT)/services/lib/ipc \
			-I$(KERNEL_ROOT)/services/boards/$(BOARD) 

all: shell_cmd_list.o shell_ext.o shell.o
	@mv $^ $(KERNEL_ROOT)/services/app

shell_cmd_list.o: shell_cmd_list.c
	@echo "cc shell_cmd_list"
	@${cc} ${cflags} ${c_useropts} -o $@ -c $<

shell_ext.o: shell_ext.c
	@echo "cc shell_ext"
	@${cc} ${cflags} ${c_useropts} -o $@ -c $<

shell.o: shell.c
	@echo "cc shell"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $<