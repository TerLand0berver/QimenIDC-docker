#!/bin/bash

echo "==========================================="
echo "     QimenIDC Docker 一键启动脚本         "
echo "==========================================="
echo ""

# 检查Docker是否已安装
if ! [ -x "$(command -v docker)" ]; then
  echo "错误: Docker 未安装." >&2
  echo "请先安装Docker和Docker Compose"
  exit 1
fi

# 检查Docker Compose是否已安装
if ! [ -x "$(command -v docker-compose)" ]; then
  if ! [ -x "$(command -v docker compose)" ]; then
    echo "错误: Docker Compose 未安装." >&2
    echo "请先安装Docker Compose"
    exit 1
  fi
fi

# 构建应用
echo "正在构建QimenIDC应用..."
./gradlew build

if [ $? -ne 0 ]; then
  echo "构建失败，请检查错误信息"
  exit 1
fi

# 启动Docker Compose
echo "正在启动Docker容器..."
docker-compose up -d

if [ $? -eq 0 ]; then
  echo ""
  echo "QimenIDC服务已成功启动！"
  echo "应用访问地址: http://localhost:7555"
  echo "MySQL数据库: localhost:7554"
  echo ""
  echo "使用以下命令查看日志:"
  echo "docker-compose logs -f"
  echo ""
else
  echo "启动失败，请检查错误信息"
fi 