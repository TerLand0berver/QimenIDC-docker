FROM openjdk:17-slim

WORKDIR /app

# 创建配置目录
RUN mkdir -p /app/config

# 复制配置文件
COPY ./config/ /app/config/

# 复制JAR文件
COPY ./build/libs/QimenIDC-Server.jar /app/QimenIDC-Server.jar

# 暴露端口
EXPOSE 8080

# 启动命令
CMD ["java", "-jar", "QimenIDC-Server.jar"] 