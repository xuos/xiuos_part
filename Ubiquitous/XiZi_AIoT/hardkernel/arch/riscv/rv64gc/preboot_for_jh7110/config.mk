# export CROSS_COMPILE ?= riscv64-linux-gnu-
export CROSS_COMPILE ?= riscv64-unknown-elf-
export ARCH = riscv

# export KBUILD_CFLAGS := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -fno-stack-protector   -Wno-main   -fomit-frame-pointer   -Wdeclaration-after-statement -Wvla -Wno-pointer-sign   -Wno-array-bounds   -fno-strict-overflow -fno-stack-check -Werror=date-time
export KBUILD_CFLAGS := -Wall -Wundef -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -fno-stack-protector   -Wno-main   -fomit-frame-pointer  -Wvla -Wno-pointer-sign   -Wno-array-bounds   -fno-strict-overflow -fno-stack-check -Werror=date-time    
export KBUILD_CPPFLAGS := -D__KERNEL__  
export KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE -m64 

export DEVICE := 
export CFLAGS := $(KBUILD_CFLAGS) -std=c11
# .vmlinux.cmd:1:cmd_vmlinux := sh scripts/link-vmlinux.sh "riscv64-linux-gnu-ld" " -melf64lriscv" " --build-id=sha1";
#export LFLAGS := -melf64lriscv --build-id=sha1 $(KERNEL_ROOT)/hardkernel/arch/riscv/preboot_for_jh7110/jh7110.lds
export LFLAGS := -T $(KERNEL_ROOT)/hardkernel/arch/riscv/rv64gc/preboot_for_jh7110/jh7110.lds
export CXXFLAGS := 

export DEFINES := 
