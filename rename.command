#!/bin/bash

# 解析-n参数
while getopts "n:" opt; do
  case $opt in
    n)
      name=$OPTARG
      ;;
    \?)
      echo "Usage: cmd -n <name>"
      exit 1
      ;;
  esac
done

# 检查参数
if [ -z "$name" ]; then
  echo "参数 -n name 为必需参数"
  echo "Usage: cmd -n <name>"
  exit 1
fi

# 定义路径
file_path="bin/example.gdextension"
new_file_path="bin/${name}.gdextension"

# 检查文件是否存在
if [ ! -f "$file_path" ]; then
  echo "文件 $file_path 不存在"
  exit 1
fi

# 替换文件内容
sed "s/EXTENSION-NAME/$name/g" "$file_path" > "$new_file_path"

# 移除旧文件（可选）
rm "$file_path"

echo "文件已更新并重命名为 $new_file_path"