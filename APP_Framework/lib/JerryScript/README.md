# jerryscript编译步骤，本文档依赖 Ubuntu 20.04 操作系统.
## 1、jerryscript源码下载

JerryScript 源码以子模块的形式保存在xiuos/APP_Framework/lib/JerryScript/jerryscript下，进行编译前需要下载，在xiuos根目录下执行:

```bash
git submodule
git submodule init
git submodule update APP_Framework/lib/JerryScript/jerryscript
```

## 2、jerryscript编译依赖安装

第一次编译需要安装依赖，在APP_Framework/lib/JerryScript路径下，依次执行:

```
jerryscript/tools/apt-get-install-deps.sh
sudo apt install gcc-arm-none-eabi binutils-arm-none-eabi
sudo apt install \
    bison flex gettext texinfo libncurses5-dev libncursesw5-dev \
    gperf automake libtool pkg-config build-essential gperf genromfs \
    libgmp-dev libmpc-dev libmpfr-dev libisl-dev binutils-dev libelf-dev \
    libexpat-dev gcc-multilib g++-multilib picocom u-boot-tools util-linux
```

## 3、jerryscript源码编译

当前在XIZI操作系统下，支持HC32F4A0单片机和STM32F4单片机两个系列的开发板，在APP_Framework/lib/JerryScript路径下，以edu-arm32开发板(HC32F4A0单片机)为例，执行:

```bash
jerryscript/tools/build.py \
    --clean \
    --lto=OFF \
    --jerry-cmdline=OFF \
    --jerry-math=ON \
    --amalgam=ON \
    --mem-heap=70 \
    --profile=es.next \
    --toolchain=${PWD}/jerryscript/cmake/toolchain_mcu_hc32f4a0.cmake
```

如果是STM32F4的单片机，将.cmake指定为toolchain_mcu_stm32f4.cmake即可。

## 4、edu-arm32开发板bin包构建

在xiuos/Ubiquitous/XiZi_IIoT目录下，执行

```makefile
make BOARD=edu-arm32 menuconfig
```

然后在menuconfig界面进入APP_Framework → app lib → lib using JerryScript ，完成勾选；

为了支持文件解析，需要存储js文件，勾选edu-arm32 feature → Using SD CARD device，使用sd卡进行.js文件的保存。

保存并，退出menuconfig

执行

```makefile
make BOARD=BOARD=edu-arm32
```

完成编译，edu-arm32开发板的烧录方式参考xiuos/Ubiquitous/XiZi_IIoT/board/edu-arm32/目录下的README.md。

完成烧录后，插入存有js文件的内存卡，内存卡正确完成挂载后，执行:

```shell
jerrytest xxx.js
```

即可看到执行js文件解析，如果jerrytest没有带文件参数，则执行一条js的语句退出。
