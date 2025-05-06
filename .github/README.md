# GitHub Actions 工作流配置

本目录包含了QimenIDC的GitHub Actions工作流配置文件，用于自动化构建和发布Docker镜像。

## 工作流说明

### docker-build.yml

此工作流用于构建和推送QimenIDC的Docker镜像到Docker Hub。

**触发条件**：
- 推送到master分支
- 推送版本标签 (v*.*.*)
- 创建Pull Request到master分支

**主要步骤**：
1. 检出代码仓库
2. 设置JDK 17环境
3. 使用Gradle构建项目
4. 设置Docker多平台构建环境
5. 构建Docker镜像并推送到Docker Hub (仅非PR事件)

**支持平台**：
- linux/amd64
- linux/arm64

## 环境变量和密钥

工作流需要以下GitHub Secrets配置：

- `DOCKER_USERNAME`: Docker Hub用户名
- `DOCKER_TOKEN`: Docker Hub访问令牌 (不是密码)

可以在仓库的Settings -> Secrets and variables -> Actions中添加这些密钥。

## 标签策略

Docker镜像会使用以下标签策略：
- 分支引用 (例如: master)
- 语义化版本 (例如: v1.0.0, v1.0)
- Git SHA
- latest (仅默认分支) 