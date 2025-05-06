[![pPYJ8PS.png](https://s1.ax1x.com/2023/08/23/pPYJ8PS.png)](https://github.com/ChuqiCloud/QimenIDC)

# QimenIDC - 云原生的多云管理及混合云融合系统 #

![Static Badge](https://img.shields.io/badge/SpringBoot-2.7.5-green?style=flat-square&logo=springboot&logoColor=%236DB33F)
![Static Badge](https://img.shields.io/badge/OpenJDK-17%2B-green?style=flat-square&logo=openjdk&logoColor=%23FFFFFF)
![Static Badge](https://img.shields.io/badge/Proxmox-7.0%2B-green?style=flat-square&logo=proxmox&logoColor=%23E57000)

---

[![Security Status](https://www.murphysec.com/platform3/v31/badge/1694374706311229440.svg)](https://www.murphysec.com/console/report/1694334903591460864/1694374706311229440)

---

[简体中文](./README.md) | [English](./README.en.md)

本项目是一个开源、免费、云原生的多云管理及混合云融合系统，它致力于简化多云环境下的资源管理和操作，提高管理多云的效率。

## Docker镜像

你可以直接使用Docker Hub上的镜像快速部署QimenIDC：

```bash
# 拉取最新版本
docker pull teraccc/qimenidc-server:latest

# 或者拉取特定版本
docker pull teraccc/qimenidc-server:v1.0.0
```

## 主要特性

- **多云管理**：通过隐藏不同云服务商的数据模型和 API 差异，QimenIDC 提供了一套统一的 API，让用户能够像使用单一云平台一样访问多个云服务商。
- **云原生架构**：QimenIDC 是一个云原生系统，充分利用容器化和微服务架构的优势，提供弹性扩展、高可用性和灵活部署等特性。
- **混合云融合**：QimenIDC 通过整合不同的云服务提供商，包括目前已融合的 ProxmoxVE，实现了混合云环境下资源的统一管理和协同操作。
- **简化复杂性**：QimenIDC 通过抽象底层基础设施的细节和差异，提供了简洁而一致的接口，使用户能够轻松地管理和操作多云环境，无需关注底层复杂性。
- **高效管理**：QimenIDC 提供了功能强大的管理工具和自动化机制，帮助用户快速配置、监控和调整多云环境中的资源，从而提高管理效率。

本项目为社区免费开源项目，欢迎大家使用和贡献代码。

企业级用户可等待后续发布的商业版，商业版将提供更多功能和服务。

企业版架构将与社区版完全不同，企业版将采用更规范、更稳定、更安全的架构，以满足企业级用户的需求。

## 开发者API文档

离线文档：
[开发者API文档](/docs/API.md)

最新在线文档：
[https://apifox.com/apidoc/shared-56015960-c9d9-488b-b53d-d9b336ec60bd](https://apifox.com/apidoc/shared-56015960-c9d9-488b-b53d-d9b336ec60bd)

## 前端项目
[前端项目](https://gitee.com/lvyunqi/QimenIDC-Client)

## 快速开始

### 项目结构概述

该项目分主控与节点两部分，主控为管理节点，节点为被管理节点。

被控部署在宿主机上，主控可部署在任意服务器上或者在容器中。

主控最低运行配置要求：

- CPU：2核
- 内存：4G
- 硬盘：20G

### 程序获取

**前置环境：**

- [Java SE Development Kits - 17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)或更高版本
- [MySQL - 5.7](https://dev.mysql.com/downloads/mysql/5.7.html)或更高版本

> 注意：请务必使用MySQL 5.7+与JDK17+版本，否则会导致程序无法正常运行。

你可以直接下载已经构建好的 QimenIDC 发行版

或者，你也可以从源代码构建 QimenIDC，下方有构建指南。

#### 自行构建

QimenIDC 使用 Gradle 进行构建，并且需要在 JDK 17 环境下运行。

**前置：**
- [Git](https://git-scm.com/downloads)

**步骤：**

#### Windows

   ```shell
   git clone https://gitee.com/chuqicloud/QimenIDC.git
   cd QimenIDC
   .\gradlew.bat # 设置开发环境
   .\gradlew build # 编译
   ```

#### Linux (GNU)

   ```bash
    git clone https://gitee.com/chuqicloud/QimenIDC.git
    cd QimenIDC
    chmod +x gradlew # 设置可执行权限
    ./gradlew build # 编译
   ```

你可以在项目根目录下的/build/lib找到输出的jar。

### Docker部署（新增）

现在QimenIDC支持使用Docker进行快速部署，无需手动安装Java和MySQL环境。这种部署方式特别适合希望快速体验系统或在生产环境中以容器方式运行的用户。

#### 前置要求

- [Docker](https://www.docker.com/products/docker-desktop/) 20.10+
- [Docker Compose](https://docs.docker.com/compose/install/) 2.0+

#### 获取源码

通过Git克隆代码仓库：

```bash
git clone https://github.com/TerLand0berver/QimenIDC-docker.git
cd QimenIDC-docker
```

#### 配置调整

部署前可以根据需要调整以下配置：

1. **端口配置**：
   - 应用端口: 默认映射到主机的7555端口
   - 数据库端口: 默认映射到主机的7554端口
   - 可在`docker-compose.yml`文件中修改

2. **数据库配置**：
   - 默认用户名：root
   - 默认密码：123456
   - 默认数据库：pve
   - 可在`docker-compose.yml`和`config/application-prod.yml`中修改

#### 一键部署

我们提供了一键部署脚本，可以自动构建项目并启动Docker容器：

```bash
# 给脚本添加执行权限
chmod +x docker-run.sh

# 运行一键部署脚本
./docker-run.sh
```

脚本会自动执行以下操作：
1. 检查Docker和Docker Compose是否已安装
2. 使用Gradle构建Java应用
3. 使用Docker Compose启动容器
4. 输出访问信息

#### 手动部署步骤

如果您需要手动部署或了解部署流程的详细步骤，可以按照以下步骤操作：

1. **构建项目**
   ```bash
   # Linux
   chmod +x gradlew
   ./gradlew build
   
   # Windows
   .\gradlew.bat build
   ```

2. **启动Docker容器**
   ```bash
   docker-compose up -d
   ```

3. **查看容器状态**
   ```bash
   docker-compose ps
   ```

4. **查看应用日志**
   ```bash
   docker-compose logs -f qimenidc-app
   ```

#### 服务访问

部署成功后，可通过以下地址访问服务：
- **QimenIDC管理界面**: http://localhost:7555
- **MySQL数据库**: localhost:7554

#### 常用操作命令

- **启动服务**：`docker-compose up -d`
- **停止服务**：`docker-compose down`
- **重启服务**：`docker-compose restart`
- **查看日志**：`docker-compose logs -f`
- **进入容器**：`docker-compose exec qimenidc-app /bin/bash`

#### 数据持久化

数据持久化已配置，包括：
- MySQL数据存储在Docker卷`mysql-data`中
- 配置文件通过挂载主机目录实现修改和持久化

#### 生产环境部署建议

对于生产环境，建议额外注意：
1. 修改默认的数据库密码
2. 配置反向代理和HTTPS
3. 根据实际需求调整容器资源限制
4. 设置Docker和主机的自动启动

更多详细信息，请参考[Docker部署指南](./DOCKER-INSTALL.md)。

### 主控部署

请将config目录与jar包放在同一目录下。

配置文件说明：

主配置文件：application.yml

```yaml
config:
   profiles: prod # 配置文件环境，可选值：dev、prod、test
```
profiles的内容与config目录下的文件名对应，例如：profiles为prod时，会加载application-prod.yml文件。

可根据自己的需要修改配置文件。

使用命令行运行：

```shell
java -jar QimenIDC.jar
```

可根据自己服务器的配置修改启动参数。

### 节点部署

被控程序在Controlled目录下，请将Controlled目录下的install.sh文件上传到被控服务器上，然后执行该脚本即可。

或者可以运行以下命令：

```shell
wget -O install.sh http://mirrors.leapteam.cn/software/QAgent/install.sh && bash install.sh
```

注意：如何你不是pve的企业订阅用户，需要先删除pve官方的企业源，否则会导致安装失败。

更换源教程：

[https://bbs.acmecloud.cn/thread-6-1-1.html](https://www.mryunqi.com/archives/576)

### 节点端口开放（宿主机）
    
    7600/tcp
    22/tcp
    8006/tcp
    6080/tcp
    59000-65535/tcp

> 注意需要开启SSH服务

## 社区和支持
官方社区：https://bbs.acmecloud.cn/

如果您有任何问题、建议或反馈，可以加入QQ群：

![qq.jpg](/screenshot/qq.jpg)
## 许可证

QimenIDC 使用 [AGPL-3.0 License](https://www.gnu.org/licenses/agpl-3.0.html) 进行许可。

---

感谢您对 QimenIDC 项目的关注和支持！我们期待您的贡献，希望 QimenIDC 能为您提供便捷的多云管理和混合云融合体验。如果您对该项目有任何疑问或需要帮助，请随时与我们联系。

## 项目截图

![01.png](/screenshot/01.png)

![02.png](/screenshot/02.png)

![03.png](/screenshot/03.png)

![04.png](/screenshot/04.png)

![05.png](/screenshot/05.png)

![06.png](/screenshot/06.png)

![07.png](/screenshot/07.png)

![08.png](/screenshot/08.png)

![10.png](/screenshot/10.png)

![11.png](/screenshot/11.png)