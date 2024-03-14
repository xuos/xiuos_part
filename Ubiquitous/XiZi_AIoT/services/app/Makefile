ifeq ($(BOARD), imx6q-sabrelite)
toolchain ?= arm-none-eabi-
user_ldflags = --specs=nosys.specs -Wl,-Map=user.map,-cref -N
cflags = -std=c11 -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie -no-pie
endif
ifeq ($(BOARD), zynq7000-zc702)
toolchain ?= arm-xilinx-eabi-
user_ldflags = -Wl,--start-group,-lgcc,-lc,--end-group -N
cflags = -std=c11 -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic -static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie
board_specs = stub.o
#cflags = -Wall -g -std=c11 
endif

cc = ${toolchain}gcc
ld = ${toolchain}g++
objdump = ${toolchain}objdump
c_useropts = -O0

INC_DIR = 	-I$(KERNEL_ROOT)/services/shell/letter-shell \
			-I$(KERNEL_ROOT)/services/lib/ipc \
			-I$(KERNEL_ROOT)/services/lib/memory \
			-I$(KERNEL_ROOT)/services/fs/libfs \
			-I$(KERNEL_ROOT)/services/boards/$(BOARD) \
			-I$(KERNEL_ROOT)/services/app 

all: init test_fs simple_client simple_server shell fs_server test_priority readme.txt | bin
	../tools/mkfs/mkfs ./fs.img $^
	@mv $(filter-out readme.txt, $^) bin
	@mv *.o bin
	@mv *.asm bin

bin:
	@mkdir -p bin

shell: shell_port.o libserial.o shell_cmd_list.o shell.o shell_ext.o libfs_to_client.o libipc.o session.o usyscall.o
	@${ld} ${user_ldflags} -e main -o $@ $^ ${board_specs}
	@${objdump} -S $@ > $@.asm
	
init: init.o libfs_to_client.o libipc.o session.o libserial.o usyscall.o
	@${ld} ${user_ldflags} -e main -o $@ $^ ${board_specs}
	@${objdump} -S $@ > $@.asm

test_fs: test_fs.o libfs_to_client.o libipc.o session.o libserial.o usyscall.o
	@${ld} ${user_ldflags} -e main -o $@ $^ ${board_specs}
	@${objdump} -S $@ > $@.asm

simple_client: simple_client.o libserial.o libipc.o session.o simple_service.o libfs_to_client.o usyscall.o 
	@${ld} ${user_ldflags} -e main -o $@ $^ ${board_specs}
	@${objdump} -S $@ > $@.asm

simple_server: simple_server.o libserial.o libipc.o session.o simple_service.o usyscall.o
	@${ld} ${user_ldflags} -e main -o $@ $^ ${board_specs}
	@${objdump} -S $@ > $@.asm

fs_server: fs_server.o libfs_to_client.o fs.o libserial.o libipc.o session.o block_io.o usyscall.o
	@${ld} ${user_ldflags} -e main -o $@ $^ ${board_specs}
	@${objdump} -S $@ > $@.asm

test_priority: test_priority.o libserial.o usyscall.o
	@${ld} ${user_ldflags} -e main -o $@ $^ ${board_specs}
	@${objdump} -S $@ > $@.asm

%.o: %.c
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $< 

%.o: %.S
	@${cc} ${cflags} ${c_useropts} -o $@ -c $< 