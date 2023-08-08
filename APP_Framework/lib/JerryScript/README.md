# jerryscript编译步骤，依赖 Ubuntu 20.04 操作系统.
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

在APP_Framework/lib/JerryScript路径下，以stm32f4discovery开发板为例，执行:

```bash
jerryscript/tools/build.py \
    --clean \
    --lto=OFF \
    --jerry-cmdline=OFF \
    --jerry-math=ON \
    --amalgam=ON \
    --mem-heap=70 \
    --profile=es.next \
    --toolchain=${PWD}/jerryscript/cmake/toolchain_mcu_stm32f4.cmake
```

## 4、stm32f4discovery开发板bin包构建

在xiuos/Ubiquitous/XiZi_IIoT目录下，执行

```makefile
make BOARD=stm32f407-st-discovery menuconfig
```

然后在menuconfig界面进入APP_Framework → app lib → lib using JerryScript ，完成勾选，保存退出。

执行

```makefile
make BOARD=stm32f407-st-discovery
```

完成编译。
