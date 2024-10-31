#!/bin/bash

# 检查是否传入参数
if [ $# -eq 0 ]; then
    echo "请提供镜像名称"
    exit 1
fi

# 环境变量设置
ALIYUN_REGISTRY="registry.cn-hangzhou.aliyuncs.com"
ALIYUN_NAME_SPACE="kami123"
platform_prefix="linux_arm64_"
name_space_prefix=""

# 获取镜像名和tag
image_name_tag=$1

# 写入文件
echo "--platform=linux/arm64 $1" > images.txt
echo "docker pull $ALIYUN_REGISTRY/$ALIYUN_NAME_SPACE/${platform_prefix}${name_space_prefix}$image_name_tag" >> images.txt

# git操作
git add .
git commit -m "update"
git push

