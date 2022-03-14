## aiit-riscv64-boar编译说明

编译aiit-riscv64-boar，需要有RT-Thread的代码，因为aiit-riscv64-boar的sdk是以软件包方式，更新软件包在""目录执行一下语句：


如果在Linux平台下，可以先执行

    scons --menuconfig

退出后执行
    scons编译。