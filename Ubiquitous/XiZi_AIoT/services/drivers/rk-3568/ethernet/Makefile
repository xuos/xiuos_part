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

cflags = -std=c11  -g \
	-Wno-unused -Wno-format -fno-common -ffreestanding -fno-builtin -static \
	-Wno-unaligned-access -fdce -Wall -Werror -Wno-uninitialized -Wno-strict-aliasing -fdiagnostics-show-option \
	-mapcs -marm -mfpu=neon -ftree-vectorize -fno-math-errno -funsafe-math-optimizations -fno-signed-zeros -mfloat-abi=softfp \
	-fno-omit-frame-pointer -fno-stack-protector -fno-pie 

# cflags = -std=c11 -march=armv7-a -mtune=cortex-a9 -nostdlib -nodefaultlibs -mfloat-abi=soft -fno-pic \
# 	-static -fno-builtin -fno-strict-aliasing -Wall -ggdb -Wno-unused -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie 

c_useropts = -O0

INC_DIR = 	-I$(KERNEL_ROOT)/services/app \
		  	-I$(KERNEL_ROOT)/services/boards/$(BOARD) \
			-I$(KERNEL_ROOT)/services/lib/serial \
			-I$(KERNEL_ROOT)/services/drivers/rk-3568/include \
			-I$(KERNEL_ROOT)/services/lib/usyscall \
		  	-I$(KERNEL_ROOT)/services/lib/ipc \
		  	-I$(KERNEL_ROOT)/services/lib/memory 


all: gmac.o gmac_3568.o test_gmac.o hal_base.o hal_bsp.o hal_pinctrl_v2.o hal_cru.o hal_cache.o hal_gpio.o hal_timer.o hal_cru_rk3568.o
	@mv $^ $(KERNEL_ROOT)/services/app

%.o: %.c
	@echo "cc $^"
	@${cc} ${cflags} ${c_useropts} ${INC_DIR} -o $@ -c $^