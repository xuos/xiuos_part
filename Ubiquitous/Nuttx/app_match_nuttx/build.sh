#!/usr/bin/env bash

export current=$(pwd)
export nuttx=$current/..
export top=$current/../../..

chmod -R +x $top
find $top -name Kconfig -exec dos2unix -q {} \;

cp -rf $current/nuttx $nuttx
cp -rf $current/apps $nuttx

cd ../nuttx
