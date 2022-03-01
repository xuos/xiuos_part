#!/usr/bin/env bash

export current=$(pwd)
export nuttx=$current/..
export top=$current/../../..

chmod -R +x $top
find $top -name Kconfig -exec dos2unix -q {} \;

cp -rf $current/nuttx $nuttx
cp -rf $current/apps $nuttx
cp -rf $nuttx/aiit-arm32-board  $nuttx/nuttx/boards/arm/stm32

cd ../nuttx
