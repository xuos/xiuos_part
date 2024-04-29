ifeq ($(BOARD), imx6q-sabrelite)
toolchain ?= arm-none-eabi-
user_ldflags = -N -Ttext 0
cflags = -std=c11 -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie
endif
ifeq ($(BOARD), zynq7000-zc702)
toolchain ?= arm-xilinx-eabi-
user_ldflags = --start-group,-lgcc,-lc,--end-group
cflags = -std=c11 -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie
#cflags = -Wall -g -std=c11 -Wno-unused
endif
cc = ${toolchain}gcc
ld = ${toolchain}g++
objdump = ${toolchain}objdump

c_useropts = -O0

INC_DIR = 	-I$(KERNEL_ROOT)/services/app \
			-I$(KERNEL_ROOT)/services/fs/libfs \
		  	-I$(KERNEL_ROOT)/services/lib/memory \
			-I$(KERNEL_ROOT)/services/lib/ipc \
			-I$(KERNEL_ROOT)/services/boards/$(BOARD) 

all: shell_cmd_list.o shell_ext.o shell.o
	@mv $^ ../../app

shell_cmd_list.o: shell_cmd_list.c
	@echo "cc shell_cmd_list"
	@${cc} ${cflags} ${c_useropts} -o $@ -c $<

shell_ext.o: shell_ext.c
	@echo "cc shell_ext"
	@${cc} ${cflags} ${c_useropts} -o $@ -c $<

shell.o: shell.c
	@echo "cc shell"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $<