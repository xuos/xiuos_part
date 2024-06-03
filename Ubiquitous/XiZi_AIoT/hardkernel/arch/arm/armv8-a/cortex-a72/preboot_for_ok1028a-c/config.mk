export CROSS_COMPILE ?= aarch64-none-elf-
export DEVICE = -mtune=cortex-a55 -ffreestanding -fno-common -fno-stack-protector -fno-pie -no-pie
export CFLAGS := $(DEVICE) -Wall -Werror -O2 -g -fno-omit-frame-pointer -fPIC 
# export AFLAGS := -c $(DEVICE) -x assembler-with-cpp -D__ASSEMBLY__ -gdwarf-2
export LFLAGS := $(DEVICE) -Wl,-T -Wl,$(KERNEL_ROOT)/hardkernel/arch/arm/armv8-a/cortex-a72/preboot_for_ok1028a-c/nxp_ls1028.lds -Wl,--start-group,-lgcc,-lc,--end-group
export CXXFLAGS := 

export DEFINES := -DHAVE_CCONFIG_H -DCHIP_LS1028

export ARCH = arm
export ARCH_ARMV = armv8-a