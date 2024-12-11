#!/bin/bash

# 定义目标目录
target_dir="/mnt/hgfs/share"

# 检查目标目录是否存在
if [ ! -d "$target_dir" ]; then
  echo "错误: 目标目录 $target_dir 不存在，脚本将退出。"
  exit 1
fi

# 执行 make clean 操作
# echo "执行 make BOARD=stm32f103-nano clean..."
# make BOARD=stm32f103-nano clean
# if [ $? -ne 0 ]; then
#   echo "错误: make BOARD=stm32f103-nano clean 失败，脚本将退出。"
#   exit 1
# fi

# 执行 make 操作
echo "执行 make BOARD=stm32f103-nano ..."
make BOARD=stm32f103-nano 
if [ $? -ne 0 ]; then
  echo "错误: make BOARD=stm32f103-nano 失败，脚本将退出。"
  exit 1
fi

arm-none-eabi-objdump -d ./build/XiZi-stm32f103-nano.elf > ./build/obj.S


# 定义源文件路径和名称
source_files=(
  "./build/obj.S"
  "./build/XiZi-stm32f103-nano.bin"
  "./build/XiZi-stm32f103-nano.elf"
  "./build/XiZi-stm32f103-nano.hex"
  "./build/XiZi-stm32f103-nano.map"
)



# 复制文件，如果有同名文件则覆盖
for file in "${source_files[@]}"; do
  if [ -f "$file" ]; then
    cp -f "$file" "$target_dir"
    echo "文件 $file 已复制到 $target_dir（如果已存在则被覆盖）"
  else
    echo "警告: 文件 $file 不存在，跳过复制操作。"
  fi
done