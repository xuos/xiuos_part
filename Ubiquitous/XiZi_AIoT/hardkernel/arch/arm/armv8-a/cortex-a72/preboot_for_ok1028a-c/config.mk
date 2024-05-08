export CROSS_COMPILE ?= aarch64-linux-gnu-
export DEVICE = -march=armv8-a -mtune=cortex-a72  -ftree-vectorize -ffast-math 
export CFLAGS := $(DEVICE) -Wall -O0 -g -gdwarf-2
export AFLAGS := -c $(DEVICE) -x assembler-with-cpp -D__ASSEMBLY__ -gdwarf-2
# export LFLAGS := $(DEVICE) -Wl,-Map=XiZi-imx6q-sabrelite.map,-cref,-u,_boot_start -T $(KERNEL_ROOT)/hardkernel/arch/arm/armv7-a/cortex-a9/preboot_for_imx6q-sabrelite/nxp_imx6q_sabrelite.lds
export LFLAGS := $(DEVICE) --specs=nosys.specs -Wl,-Map=XiZi-ok1028a-c.map,-cref,-u,_start -T $(KERNEL_ROOT)/hardkernel/arch/arm/armv8-a/cortex-a72/preboot_for_ok1028a-c/nxp_ls1028.lds
export CXXFLAGS := 

ifeq ($(CONFIG_LIB_MUSLLIB), y)
export LFLAGS += -nostdlib -nostdinc -fno-builtin -nodefaultlibs
export LIBCC := -lgcc
export LINK_MUSLLIB := $(KERNEL_ROOT)/lib/musllib/libmusl.a
endif

export DEFINES := -DHAVE_CCONFIG_H -DCHIP_LS1028

export ARCH = arm
export ARCH_ARMV = armv8-a