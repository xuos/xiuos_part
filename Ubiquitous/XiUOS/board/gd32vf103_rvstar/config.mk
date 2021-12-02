
# export CFLAGS := -mcmodel=medany -march=rv32imac -mabi=ilp32 -fno-common -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -O0 -ggdb -fgnu89-inline -Werror
# export AFLAGS := -c -mcmodel=medany -march=rv32imac -mabi=ilp32 -x assembler-with-cpp -ggdb
# export LFLAGS := --specs=nano.specs --specs=nosys.specs -nostartfiles -Wl,--gc-sections,-Map=XiUOS_gd32vf103.map,-cref,-u,_start -T $(BSP_ROOT)/link.lds

# export APPLFLAGS := -mcmodel=medany -march=rv32imac -mabi=ilp32 -nostartfiles -Wl,--gc-sections,-Map=XiUOS_app.map,-cref,-u, -T $(BSP_ROOT)/link_userspace.lds

# export CXXFLAGS := -mcmodel=medany -march=rv32imac -mabi=ilp32 -fno-common -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -O0 -ggdb -Werror

# export CROSS_COMPILE ?=/opt/Nuclei/gcc/bin/riscv-nuclei-elf-

# export DEFINES := -DHAVE_CCONFIG_H -DHAVE_SIGINFO

# export ARCH = risc-v
# export MCU =  GD32VF103


export CFLAGS :=  -march=rv32imac -mabi=ilp32 -fno-common -ffunction-sections -fdata-sections  -O0 -ggdb -fgnu89-inline -Werror
export AFLAGS :=  -march=rv32imac -mabi=ilp32 -x assembler-with-cpp -ggdb
export LFLAGS :=  -march=rv32imac -mabi=ilp32 -nostartfiles -Wl,--gc-sections,-Map=XiUOS_gd32vf103.map,-cref,-u,_start -T $(BSP_ROOT)/link.lds

export APPLFLAGS :=  -nostartfiles -Wl,--gc-sections,-Map=XiUOS_app.map,-cref,-u, -T $(BSP_ROOT)/link_userspace.lds

export CXXFLAGS :=  -fno-common -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -O0 -ggdb -Werror

export CROSS_COMPILE ?=/opt/Nuclei/gcc/bin/riscv-nuclei-elf-

export DEFINES := -DHAVE_CCONFIG_H -DHAVE_SIGINFO

export ARCH = risc-v
export MCU =  GD32VF103



