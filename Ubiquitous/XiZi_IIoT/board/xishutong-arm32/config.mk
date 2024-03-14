export CROSS_COMPILE ?=/usr/bin/arm-none-eabi-

export CFLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -ffunction-sections -fdata-sections -Dgcc -O2 -gdwarf-2 -g -fgnu89-inline -Wa,-mimplicit-it=thumb 
# export CFLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g -fgnu89-inline -Wa,-mimplicit-it=thumb -Werror
export AFLAGS := -c -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -ffunction-sections -fdata-sections -x assembler-with-cpp -Wa,-mimplicit-it=thumb  -gdwarf-2
export LFLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -ffunction-sections -fdata-sections -Wl,--gc-sections,-Map=XiZi-xishutong-arm32.map,-cref,-u,Reset_Handler -T $(BSP_ROOT)/link.lds
export CXXFLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -ffunction-sections -fdata-sections -Dgcc -O2 -Werror
# export CXXFLAGS := -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -ffunction-sections -fdata-sections -Dgcc -O0 -gdwarf-2 -g -Werror

export APPLFLAGS := 

export DEFINES := -DHAVE_CCONFIG_H -DHC32F4A0 -DUSE_DDL_DRIVER -DHAVE_SIGINFO

ifeq ($(CONFIG_RESOURCES_LWIP), y)
export LINK_LWIP := $(KERNEL_ROOT)/resources/ethernet/LwIP/liblwip.a
endif

ifeq ($(CONFIG_APPLICATION_WEBSERVER), y)
export LINK_MONGOOSE := $(KERNEL_ROOT)/../../APP_Framework/Applications/webserver/mongoose.a
endif

export ARCH = arm
