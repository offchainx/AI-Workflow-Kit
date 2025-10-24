# AI-Workflow-Kit 快速开始

3 步开始使用 AI-Workflow-Kit 高效开发工作流。

## 🚀 第一次使用

### 步骤 1: 全局安装（仅需一次）

```bash
cd /Users/victorsim/Desktop/Projects/AI-Workflow-Kit
./scripts/install.sh
```

这会添加全局命令到你的 shell 配置。

**重要**: 安装后需要重新加载 shell 配置：

```bash
source ~/.zshrc
```

或者重新打开终端。

### 步骤 2: 验证安装

```bash
init-ai-project --help
```

如果看到帮助信息，说明安装成功！

### 步骤 3: 初始化新项目

```bash
init-ai-project ~/Desktop/Projects/my-new-project
```

按照提示完成项目初始化，包括：
- 复制工作流文档
- 配置 Claude Code
- 初始化 Git（可选）

## 📖 快速参考

### 常用命令

| 命令 | 功能 | 示例 |
|------|------|------|
| `init-ai-project <路径>` | 初始化新项目 | `init-ai-project ~/Projects/app` |
| `sync-workflow` | 同步工作流更新 | `sync-workflow` |
| `workflow-docs` | 查看文档索引 | `workflow-docs` |
| `workflow-status` | 查看工作流状态 | `workflow-status` |

### 核心文档路径

初始化后，新项目会包含：

```
your-project/
├── docs/
│   ├── methodology/      # 方法论
│   ├── tools/           # 工具配置
│   ├── advanced/        # 高级技术
│   ├── deployment/      # 部署指南
│   ├── automation/      # 自动化
│   └── INDEX.md         # 📌 从这里开始
├── .claude/
│   ├── settings.json
│   └── settings.local.json
└── README.md
```

## 🎯 典型工作流

### 新项目开发

1. **初始化项目**
   ```bash
   init-ai-project ~/Projects/awesome-app
   cd ~/Projects/awesome-app
   ```

2. **查看文档索引**
   ```bash
   cat docs/INDEX.md
   ```

3. **启动 Claude Code**
   - 打开项目文件夹
   - Claude Code 会自动使用 `.claude/` 配置

4. **开始开发**
   - 参考 `docs/tools/CC_Instruction_Set.md` 高效使用 Claude Code
   - 遵循 `docs/methodology/AI_Product_Development_Framework.md` 开发流程

### 部署项目

1. **查看检查清单**
   ```bash
   cat docs/deployment/Vercel_快速开始检查清单.md
   ```

2. **执行部署**
   ```bash
   cat docs/deployment/Vercel_部署完全指南.md
   ```

### 同步工作流更新

当 AI-Workflow-Kit 主仓库更新后：

```bash
cd ~/Projects/awesome-app
sync-workflow
```

## 💡 关键文档推荐

### 必读（5分钟）

1. **[docs/INDEX.md](docs/INDEX.md)** - 文档导航地图
2. **[docs/tools/Claude_Code_Setup_Guide.md](docs/tools/Claude_Code_Setup_Guide.md)** - Claude Code 配置
3. **[docs/deployment/Vercel_快速开始检查清单.md](docs/deployment/Vercel_快速开始检查清单.md)** - 部署检查项

### 深入学习（30分钟）

1. **[docs/methodology/AI_Product_Development_Framework.md](docs/methodology/AI_Product_Development_Framework.md)** - AI 产品开发框架
2. **[docs/methodology/BMAD_Method_Tutorial.md](docs/methodology/BMAD_Method_Tutorial.md)** - BMAD 方法教程
3. **[docs/tools/CC_Instruction_Set.md](docs/tools/CC_Instruction_Set.md)** - Claude Code 指令集

### 高级进阶（按需）

1. **[docs/advanced/Self-Evolving-Agents_深度解析.md](docs/advanced/Self-Evolving-Agents_深度解析.md)** - 自我进化 Agent
2. **[docs/deployment/Vercel_高级技巧与最佳实践.md](docs/deployment/Vercel_高级技巧与最佳实践.md)** - Vercel 高级技巧
3. **[docs/automation/n8n_完全指南.md](docs/automation/n8n_完全指南.md)** - n8n 自动化

## ⚠️ 常见问题

### Q: 命令找不到？

**A**: 确保运行了 `source ~/.zshrc` 或重启终端。

### Q: 如何更新工作流？

**A**: 在项目目录运行 `sync-workflow`。

### Q: settings.local.json 是什么？

**A**: 项目特定的 Claude Code 权限配置，自动生成。

### Q: 可以自定义工作流吗？

**A**: 可以！修改 AI-Workflow-Kit 中的文档和脚本，然后同步到项目。

## 📚 下一步

- 📖 阅读完整指南: [WORKFLOW_README.md](WORKFLOW_README.md)
- 🗂️ 浏览文档索引: [docs/INDEX.md](docs/INDEX.md)
- 🔧 了解工具脚本: [scripts/](scripts/)
- 💬 提出建议或问题: [GitHub Issues]

## 🎉 就这么简单！

现在你已经准备好使用 AI-Workflow-Kit 开始高效开发了。

记住：
- ✅ 新项目用 `init-ai-project`
- ✅ 更新用 `sync-workflow`
- ✅ 不懂看 `docs/INDEX.md`

Happy Coding! 🚀
