# AI-Workflow-Kit 使用指南

## 📖 简介

AI-Workflow-Kit 是一个完整的 AI 辅助开发工作流模板，整合了业界最佳实践和高效工具配置，旨在通过 Claude Code 和其他 AI 工具最大化开发效率。

### 核心理念

- **知识复用**: 一次配置，多项目使用
- **持续优化**: 工作流随经验积累不断进化
- **开箱即用**: 新项目立即享受完整工作流
- **工具整合**: Claude Code + Vercel + n8n 等工具无缝协作

## 🗂️ 文档体系

### 📚 方法论 (`docs/methodology/`)

核心开发方法和框架指导：

- **[AI_Product_Development_Framework.md](docs/methodology/AI_Product_Development_Framework.md)**
  - AI 产品开发全流程框架
  - 从创意到上线的完整指南
  - 适用场景：新产品启动、项目规划

- **[BMAD_Method_Tutorial.md](docs/methodology/BMAD_Method_Tutorial.md)**
  - BMAD Method 完全教程（Build, Measure, Analyze, Decide）
  - 数据驱动的产品迭代方法
  - 适用场景：产品优化、A/B 测试

### 🛠️ 工具配置 (`docs/tools/`)

开发工具的设置和使用：

- **[Claude_Code_Setup_Guide.md](docs/tools/Claude_Code_Setup_Guide.md)**
  - Claude Code 初始化配置
  - 权限设置、模型选择
  - 适用场景：项目初始化、Claude Code 配置

- **[CC_Instruction_Set.md](docs/tools/CC_Instruction_Set.md)**
  - Claude Code 指令集
  - 高效提示词和命令参考
  - 适用场景：日常开发、提升交互效率

### 🚀 高级技术 (`docs/advanced/`)

深入的技术探索和前沿实践：

- **[Self-Evolving-Agents_深度解析.md](docs/advanced/Self-Evolving-Agents_深度解析.md)**
  - 自我进化 AI Agent 架构
  - 智能系统设计模式
  - 适用场景：复杂系统设计、AI Agent 开发

### 🌐 部署工具 (`docs/deployment/`)

快速部署和上线：

- **[Vercel_部署完全指南.md](docs/deployment/Vercel_部署完全指南.md)**
  - Vercel 部署完整流程
  - 从零开始的详细步骤

- **[Vercel_快速开始检查清单.md](docs/deployment/Vercel_快速开始检查清单.md)**
  - 快速部署检查项
  - 避免常见错误

- **[Vercel_高级技巧与最佳实践.md](docs/deployment/Vercel_高级技巧与最佳实践.md)**
  - 性能优化和高级配置
  - 生产环境最佳实践

### ⚙️ 自动化 (`docs/automation/`)

工作流自动化工具：

- **[n8n_完全指南.md](docs/automation/n8n_完全指南.md)**
  - n8n 工作流自动化平台详解
  - 完整安装和配置指南

- **[n8n_快速实战手册.md](docs/automation/n8n_快速实战手册.md)**
  - 实战案例和模板
  - 快速上手 n8n

## 🔧 工具脚本

### 初始化新项目

```bash
init-ai-project <项目路径>
```

功能：
- 复制完整工作流文档到新项目
- 自动配置 Claude Code 设置
- 生成项目特定的配置文件
- 可选初始化 Git 仓库

示例：
```bash
init-ai-project ~/Desktop/Projects/my-awesome-app
```

### 同步工作流更新

```bash
sync-workflow
```

功能：
- 从 AI-Workflow-Kit 主仓库同步最新文档
- 自动备份现有文档
- 智能合并更新

使用场景：
- 主仓库更新后同步到现有项目
- 获取最新的工具文档和最佳实践

### 全局安装

```bash
./scripts/install.sh
```

功能：
- 添加全局命令到 shell 配置
- 创建系统级别的命令别名
- 随时随地使用工作流工具

## 📋 使用场景

### 场景 1: 启动新项目

1. 初始化项目结构：
   ```bash
   init-ai-project ~/Desktop/Projects/new-project
   ```

2. 进入项目目录：
   ```bash
   cd ~/Desktop/Projects/new-project
   ```

3. 查看文档索引：
   ```bash
   cat docs/INDEX.md
   ```

4. 启动 Claude Code，参考 `docs/tools/Claude_Code_Setup_Guide.md`

### 场景 2: 开发 AI 产品

1. 阅读开发框架：
   ```bash
   cat docs/methodology/AI_Product_Development_Framework.md
   ```

2. 使用 BMAD Method 规划迭代：
   ```bash
   cat docs/methodology/BMAD_Method_Tutorial.md
   ```

3. 参考指令集高效使用 Claude Code：
   ```bash
   cat docs/tools/CC_Instruction_Set.md
   ```

### 场景 3: 部署上线

1. 查看部署检查清单：
   ```bash
   cat docs/deployment/Vercel_快速开始检查清单.md
   ```

2. 按照完全指南执行部署：
   ```bash
   cat docs/deployment/Vercel_部署完全指南.md
   ```

3. 应用高级优化：
   ```bash
   cat docs/deployment/Vercel_高级技巧与最佳实践.md
   ```

### 场景 4: 设置自动化

1. 安装 n8n：
   ```bash
   ./scripts/install-n8n.sh
   ```

2. 学习 n8n 基础：
   ```bash
   cat docs/automation/n8n_完全指南.md
   ```

3. 实践常用工作流：
   ```bash
   cat docs/automation/n8n_快速实战手册.md
   ```

## 🎯 最佳实践

### 1. 项目初始化时

- ✅ 使用 `init-ai-project` 初始化新项目
- ✅ 根据项目特点阅读对应的方法论文档
- ✅ 配置 Claude Code 权限设置
- ✅ 初始化 Git 仓库并做首次提交

### 2. 开发过程中

- ✅ 经常参考 CC 指令集提升交互效率
- ✅ 遇到架构问题查阅高级技术文档
- ✅ 使用 BMAD Method 进行数据驱动决策
- ✅ 定期同步工作流更新 `sync-workflow`

### 3. 部署和运维

- ✅ 部署前检查 Vercel 快速开始清单
- ✅ 使用 n8n 自动化重复性任务
- ✅ 应用高级技巧优化性能
- ✅ 关注 AI-Workflow-Kit 主仓库更新

### 4. 知识积累

- ✅ 记录项目特定的经验到项目 README
- ✅ 发现新技巧时更新主仓库文档
- ✅ 定期回顾和优化工作流
- ✅ 分享有价值的实践给团队

## 🔄 工作流更新

### 更新主仓库

当你发现新的工具、方法或最佳实践时：

1. 进入 AI-Workflow-Kit 目录
2. 编辑或添加对应的文档
3. 提交更改到 Git
4. 推送到 GitHub（如果使用远程仓库）

### 同步到现有项目

```bash
cd <项目目录>
sync-workflow
```

这会自动：
- 从主仓库复制最新文档
- 创建备份避免数据丢失
- 显示更新的文件列表

## 📞 获取帮助

### 查看命令帮助

```bash
init-ai-project --help
sync-workflow --help
```

### 查看文档索引

```bash
cat docs/INDEX.md
```

### 工作流状态

```bash
workflow-status
```

## 🌟 进阶使用

### 自定义工作流

1. Fork AI-Workflow-Kit 或创建分支
2. 添加你的自定义文档和脚本
3. 修改 `init-ai-project.sh` 适配你的需求
4. 更新此文档说明你的改动

### 团队共享

1. 将 AI-Workflow-Kit 推送到 GitHub 私有仓库
2. 团队成员 clone 仓库到本地
3. 运行 `./scripts/install.sh` 安装全局命令
4. 使用统一的工作流标准

### 持续改进

- 定期回顾工作流的使用效果
- 收集团队反馈
- 更新文档和脚本
- 删除过时或不再使用的内容

## 📈 版本历史

- **v1.0** - 初始版本
  - 基础文档体系
  - 核心脚本工具
  - Claude Code 集成

---

**维护者**: [Your Name]
**最后更新**: 2025-10-24
**仓库**: [GitHub Link]

愉快地使用 AI-Workflow-Kit 提升开发效率！
