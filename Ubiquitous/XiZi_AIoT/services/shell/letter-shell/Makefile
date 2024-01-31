toolchain ?= arm-none-eabi-
cc = ${toolchain}gcc
ld = ${toolchain}g++
objdump = ${toolchain}objdump
# user_ldflags = -N -Ttext 0

cflags = -std=c11 -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie -no-pie
c_useropts = -O0

INC_DIR = -I$(KERNEL_ROOT)/services/boards/imx6q-sabrelite -I$(KERNEL_ROOT)/services/lib/ipc -I$(KERNEL_ROOT)/services/fs/include

all: shell_cmd_list.o shell_ext.o shell.o
	@mv shell_cmd_list.o ../../boards/imx6q-sabrelite
	@mv shell_ext.o ../../boards/imx6q-sabrelite
	@mv shell.o ../../boards/imx6q-sabrelite

shell_cmd_list.o: shell_cmd_list.c
	@echo "cc shell_cmd_list"
	@${cc} ${cflags} ${c_useropts} -o $@ -c $<

shell_ext.o: shell_ext.c
	@echo "cc shell_ext"
	@${cc} ${cflags} ${c_useropts} -o $@ -c $<

shell.o: shell.c
	@echo "cc shell"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $<