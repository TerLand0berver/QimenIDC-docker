# QimenIDC Docker 部署指南

## 项目简介

QimenIDC是一个开源、免费、云原生的多云管理及混合云融合系统，它致力于简化多云环境下的资源管理和操作，提高管理多云的效率。本指南提供了使用Docker和Docker Compose快速部署QimenIDC系统的方法。

## 系统架构

- **主控端**: 使用Docker容器部署，包括QimenIDC服务和MySQL数据库
- **被控节点**: 需安装在PVE宿主机上，直接使用安装脚本部署

## 部署要求

### 主控端 (Docker)
- Docker Engine (20.10+)
- Docker Compose (2.0+)
- 至少2核CPU
- 至少4GB内存
- 至少20GB磁盘空间

### 被控节点 (PVE宿主机)
- Proxmox VE 7.0+
- 需开放端口：7600/tcp, 22/tcp, 8006/tcp, 6080/tcp, 59000-65535/tcp
- SSH服务已启用

## 一键部署

项目提供了一键启动脚本，可以自动构建项目并启动Docker容器：

```bash
# 给脚本添加执行权限
chmod +x docker-run.sh

# 运行一键部署脚本
./docker-run.sh
```

## 手动部署步骤

如果您想手动部署，请按照以下步骤操作：

### 1. 构建项目

```bash
# 构建项目
./gradlew build
```

### 2. 启动Docker容器

```bash
# 使用Docker Compose启动容器
docker-compose up -d
```

### 3. 查看服务状态

```bash
# 查看容器状态
docker-compose ps

# 查看日志
docker-compose logs -f
```

## 配置说明

### 修改配置文件

配置文件位于`config/`目录，您可以根据需要修改配置文件：

- `application.yml`: 主配置文件，定义使用哪个环境配置
- `application-prod.yml`: 生产环境配置
- `application-dev.yml`: 开发环境配置
- `application-test.yml`: 测试环境配置

修改配置后需要重启容器：
```bash
docker-compose restart qimenidc-app
```

### 数据库配置

默认MySQL配置:
- 用户名: root
- 密码: 123456
- 数据库: pve
- 端口: 7554 (外部访问)

若需修改，请编辑`docker-compose.yml`文件中的环境变量和`config/application-prod.yml`文件中的数据库连接信息。

### 服务访问

- QimenIDC服务: http://localhost:7555
- MySQL数据库: localhost:7554

## 被控节点部署

被控节点需直接安装在PVE宿主机上，无法使用Docker方式部署。请按照以下步骤操作：

1. 登录到PVE宿主机
2. 运行以下命令安装被控节点:

```bash
wget -O install.sh http://mirrors.leapteam.cn/software/QAgent/install.sh && bash install.sh
```

3. 按照提示输入Token和端口信息（主控端生成）
4. 安装完成后，在主控端添加该节点

## 常见问题

### 1. Docker容器无法启动

检查日志以找出错误原因:
```bash
docker-compose logs qimenidc-app
```

### 2. 数据库连接失败

确认MySQL容器是否正在运行:
```bash
docker-compose ps mysql
```

检查配置文件中的数据库连接信息是否正确。

### 3. 被控节点连接主控端失败

- 检查防火墙设置，确保端口已开放
- 验证主控端IP地址是否正确
- 检查Token是否输入正确

## 更多信息

更多详细信息，请参阅项目文档和官方社区：
- 官方社区：https://bbs.acmecloud.cn/
- QQ群交流：见README.md中的联系方式 