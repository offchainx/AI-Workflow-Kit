# Claude Code (CC) 指令集参考手册

> 快速查阅 Claude Code 核心功能的使用方法

---

## 目录
1. [CC 调用 MCP](#1-cc-调用-mcp)
2. [CC 调用 Agents](#2-cc-调用-agents)
3. [CC 调用 Git](#3-cc-调用-git)
4. [CC 创建与调用 Skills](#4-cc-创建与调用-skills)

---

## 1. CC 调用 MCP

### 什么是 MCP？
**Model Context Protocol (MCP)** 是一个标准协议，让 Claude Code 可以连接外部工具和数据源。

### 可用的 MCP 服务器类型

| 类型 | 功能 | 示例 |
|------|------|------|
| **文件系统** | 访问本地文件和目录 | 读取配置文件 |
| **数据库** | 连接 SQL/NoSQL 数据库 | PostgreSQL, MongoDB |
| **API 服务** | 调用外部 API | GitHub, Slack, Jira |
| **开发工具** | 集成开发环境工具 | Docker, Kubernetes |
| **搜索引擎** | 网页搜索和抓取 | Brave Search, Exa |

### 配置 MCP 服务器

**1. 找到配置文件位置**
```bash
# macOS
~/Library/Application Support/Claude/claude_desktop_config.json

# Windows
%APPDATA%\Claude\claude_desktop_config.json

# Linux
~/.config/Claude/claude_desktop_config.json
```

**2. 添加 MCP 服务器配置**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/directory"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
      }
    },
    "brave-search": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-brave-search"],
      "env": {
        "BRAVE_API_KEY": "your_api_key_here"
      }
    }
  }
}
```

### 使用 MCP 的方式

**自动调用（推荐）**
```
你: "搜索 React 18 最新文档"
CC: [自动检测到 mcp__brave_search 工具并调用]
```

**MCP 工具命名规则**
- 所有 MCP 工具以 `mcp__` 开头
- 格式: `mcp__<server_name>__<tool_name>`
- 示例: `mcp__github__create_issue`

### 常见 MCP 使用场景

**文件系统访问**
```
你: "读取项目根目录的配置文件"
CC: 使用 mcp__filesystem__read_file
```

**GitHub 操作**
```
你: "在 GitHub 上创建一个 issue"
CC: 使用 mcp__github__create_issue
```

**网页搜索**
```
你: "查找最新的 TypeScript 最佳实践"
CC: 使用 mcp__brave_search__web_search
```

### 检查可用的 MCP 工具

```
你: "显示所有可用的 MCP 工具"
CC: [列出所有以 mcp__ 开头的工具]
```

### MCP 故障排除

| 问题 | 解决方案 |
|------|---------|
| MCP 工具不可用 | 检查配置文件是否正确，重启 Claude Code |
| 权限错误 | 验证 API token 或访问路径权限 |
| 连接超时 | 检查网络连接和防火墙设置 |

---

## 2. CC 调用 Agents

### 什么是 Agents？
Agents 是 Claude Code 的专业助手，每个 agent 专注于特定类型的任务。

### 可用的 Agent 类型

#### **🔍 Explore Agent** (最常用)
**用途**: 快速探索代码库、查找文件、搜索代码

**使用场景**:
```
你: "项目中哪里处理了用户认证？"
CC: [调用 Explore agent, thoroughness: "medium"]

你: "找到所有的 React 组件"
CC: [调用 Explore agent, thoroughness: "quick"]

你: "分析整个项目的架构设计"
CC: [调用 Explore agent, thoroughness: "very thorough"]
```

**速度等级**:
- `quick`: 基本搜索，最快
- `medium`: 适度探索，平衡速度和深度
- `very thorough`: 全面分析，最详细

#### **⚙️ General-Purpose Agent**
**用途**: 处理复杂的多步骤任务

**使用场景**:
```
你: "实现用户导出数据功能，包括测试"
CC: [调用 general-purpose agent]

你: "重构这个模块并确保所有测试通过"
CC: [调用 general-purpose agent]

你: "搜索并修复所有的 TypeScript 类型错误"
CC: [调用 general-purpose agent]
```

#### **📊 Statusline-Setup Agent**
**用途**: 配置 Claude Code 状态栏

#### **🎨 Output-Style-Setup Agent**
**用途**: 创建自定义输出样式

### Agent 调用方式

**完全自动（推荐）**
```
只需用自然语言描述需求，CC 会自动选择合适的 agent
```

**并行调用示例**
```
你: "分析前端和后端的 API 集成"
CC: [并行调用两个 Explore agents]
    → Agent 1: 分析前端 API 调用
    → Agent 2: 分析后端 API 端点
    → 综合结果返回
```

### 最佳实践

**✅ 适合 Explore Agent 的问题**:
- "项目结构是什么样的？"
- "所有的测试文件在哪里？"
- "这个函数在哪些地方被调用？"
- "错误处理是如何实现的？"

**✅ 适合 General-Purpose Agent 的任务**:
- "实现一个新功能"
- "修复所有错误"
- "重构并更新测试"
- "搜索并批量修改代码"

**❌ 不需要 Agent 的情况**:
- 读取单个指定文件
- 搜索特定的类定义
- 简单的单步操作

### Agent 工作流程

```
你的请求
    ↓
CC 分析任务复杂度
    ↓
选择合适的 Agent → Explore (探索代码)
                 → General-Purpose (执行任务)
                 → 直接处理 (简单任务)
    ↓
Agent 执行任务
    ↓
返回结果给你
```

---

## 3. CC 调用 Git

### Git 基本操作

#### **查看状态**
```
你: "查看 git 状态"
CC: git status
```

#### **查看差异**
```
你: "显示修改了什么"
CC: git diff

你: "显示已暂存的修改"
CC: git diff --staged
```

#### **查看历史**
```
你: "查看提交历史"
CC: git log --oneline

你: "查看最近 5 条提交"
CC: git log --oneline -5
```

### 提交更改

**❗ 重要**: 只有你明确要求时，CC 才会创建提交

#### **标准提交流程**
```
你: "提交这些更改"

CC 会自动:
1. 并行运行: git status, git diff, git log
2. 分析所有改动
3. 草拟提交信息
4. 执行: git add .
5. 执行: git commit -m "..."
6. 运行: git status 验证
```

#### **提交信息格式**
```
简洁的改动描述

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

#### **Pre-commit Hook 处理**
```
如果提交失败（pre-commit hook 修改了文件）:
→ CC 检查是否安全 amend
→ 如果是自己的提交: git commit --amend
→ 如果是他人的提交: 创建新提交
```

### 分支操作

```
你: "创建新分支 feature-login"
CC: git checkout -b feature-login

你: "切换到 main 分支"
CC: git checkout main

你: "查看所有分支"
CC: git branch -a

你: "合并 feature-login 到当前分支"
CC: git merge feature-login
```

### 远程操作

```
你: "推送到远程"
CC: git push origin main

你: "拉取最新代码"
CC: git pull

你: "查看远程仓库"
CC: git remote -v
```

### 创建 Pull Request

```
你: "创建 PR"

CC 会自动:
1. 并行运行: git status, git diff, git log, 检查远程分支
2. 分析所有将包含的提交（不只是最新提交！）
3. 草拟 PR 描述
4. 创建新分支（如需要）
5. 推送到远程（如需要）
6. 使用 gh pr create 创建 PR
7. 返回 PR URL
```

**PR 描述格式**:
```markdown
## Summary
- 改动要点 1
- 改动要点 2

## Test plan
- [ ] 测试项 1
- [ ] 测试项 2

🤖 Generated with [Claude Code](https://claude.com/claude-code)
```

### GitHub 操作（使用 gh CLI）

```
你: "查看所有 issues"
CC: gh issue list

你: "查看 PR #123 的详情"
CC: gh pr view 123

你: "查看 PR 评论"
CC: gh api repos/owner/repo/pulls/123/comments

你: "创建新 issue"
CC: gh issue create --title "标题" --body "内容"
```

### Git 安全协议

**✅ CC 会做**:
- 遵循你的明确指示
- 使用标准的 Git 命令
- 推送到功能分支

**❌ CC 不会做**:
- 修改 git config
- 执行 `git push --force`（除非你明确要求）
- 跳过 hooks (`--no-verify`)
- Force push 到 main/master
- 未经请求创建提交

### 常用 Git 命令速查

| 需求 | 命令 |
|------|------|
| 查看状态 | `git status` |
| 查看差异 | `git diff` |
| 添加文件 | `git add <文件>` |
| 提交 | `git commit -m "信息"` |
| 推送 | `git push origin <分支>` |
| 拉取 | `git pull` |
| 创建分支 | `git checkout -b <分支名>` |
| 切换分支 | `git checkout <分支名>` |
| 查看历史 | `git log --oneline` |
| 撤销修改 | `git checkout -- <文件>` |
| 取消暂存 | `git reset HEAD <文件>` |

---

## 4. CC 创建与调用 Skills

### 什么是 Skills？
Skills 是可复用的自定义功能模块，类似于"插件"或"宏"，可以扩展 CC 的能力。

### Skills 与 Slash Commands 的区别

| 特性 | Skills | Slash Commands |
|------|--------|----------------|
| **定义位置** | MCP 服务器 | `.claude/commands/` |
| **调用方式** | CC 自动识别或手动调用 | `/command-name` |
| **功能范围** | 复杂的多步骤任务 | 简单的提示词扩展 |
| **参数支持** | 支持复杂参数 | 仅支持简单参数 |
| **示例** | PDF 处理、Excel 分析 | 代码审查模板 |

### 当前可用的 Skills

根据系统配置，查看可用 skills:
```
你: "显示所有可用的 skills"
CC: [列出 <available_skills> 中的所有 skills]
```

**注意**: 当前配置中可用 skills 列表为空。需要通过 MCP 服务器添加。

### 创建自定义 Skill

**方式 1: 使用 MCP Skill 服务器**

1. **创建 Skill 定义文件**
```json
// skills/my-skill.json
{
  "name": "my-skill",
  "description": "这个 skill 的功能描述",
  "instructions": "详细的执行指令，CC 会按照这些指令执行任务",
  "tools": ["Read", "Write", "Bash"],
  "parameters": {
    "param1": {
      "type": "string",
      "description": "参数 1 的说明"
    }
  }
}
```

2. **配置 MCP 服务器**
```json
// claude_desktop_config.json
{
  "mcpServers": {
    "skills": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-skills", "/path/to/skills/directory"]
    }
  }
}
```

3. **重启 Claude Code**

**方式 2: 使用 Slash Commands (简单场景)**

1. **创建命令文件**
```bash
mkdir -p .claude/commands
touch .claude/commands/my-command.md
```

2. **编写命令内容**
```markdown
<!-- .claude/commands/my-command.md -->
执行以下任务:
1. 读取项目配置文件
2. 验证所有必需字段
3. 生成验证报告
```

3. **使用命令**
```
你: /my-command
CC: [执行 my-command.md 中的指令]
```

### Skill 示例

#### **示例 1: PDF 处理 Skill**
```json
{
  "name": "pdf-analyzer",
  "description": "分析 PDF 文件并提取关键信息",
  "instructions": "1. 读取 PDF 文件\n2. 提取文本内容\n3. 分析文档结构\n4. 生成摘要报告",
  "tools": ["Read", "Write"],
  "parameters": {
    "pdf_path": {
      "type": "string",
      "description": "PDF 文件的路径"
    }
  }
}
```

**调用方式**:
```
你: "分析这个 PDF: /path/to/document.pdf"
CC: [自动识别并调用 pdf-analyzer skill]
```

#### **示例 2: 代码审查 Skill**
```json
{
  "name": "code-reviewer",
  "description": "自动审查代码质量和最佳实践",
  "instructions": "1. 读取指定的代码文件\n2. 检查代码风格\n3. 识别潜在问题\n4. 提供改进建议\n5. 生成审查报告",
  "tools": ["Read", "Grep", "Bash"],
  "parameters": {
    "file_pattern": {
      "type": "string",
      "description": "要审查的文件模式，如 '**/*.ts'"
    }
  }
}
```

### 调用 Skill 的方式

#### **自动调用（推荐）**
```
你: "分析这个 Excel 文件的数据"
CC: [检测到 xlsx skill，自动调用]
```

#### **手动调用**
```
你: "使用 pdf skill 分析这个文档"
CC: [调用 Skill tool 执行 pdf skill]
```

#### **完全限定名调用**
```
你: "使用 ms-office-suite:pdf 处理文件"
CC: [调用特定 suite 中的 skill]
```

### Skill 最佳实践

**创建 Skill 的场景**:
- ✅ 重复性高的多步骤任务
- ✅ 需要特定领域知识的操作
- ✅ 复杂的数据处理流程
- ✅ 标准化的工作流程

**不需要 Skill 的场景**:
- ❌ 简单的单步操作
- ❌ 一次性的任务
- ❌ 已有工具可以直接完成的任务

### Skill 开发指南

**1. 设计原则**
- 单一职责: 每个 skill 只做一件事
- 清晰的参数: 参数命名要明确
- 详细的说明: instructions 要具体可执行

**2. 指令编写**
```markdown
# 好的指令示例
1. 读取 {file_path} 文件
2. 解析 JSON 内容
3. 验证必需字段: name, version, description
4. 如果缺少字段，输出错误列表
5. 如果验证通过，输出成功信息

# 不好的指令示例
处理文件并验证
```

**3. 工具权限**
只授予必需的工具权限:
```json
{
  "tools": ["Read", "Write"],  // ✅ 明确需要的工具
  // 避免: "tools": ["*"]      // ❌ 过度授权
}
```

### Skills 故障排除

| 问题 | 解决方案 |
|------|---------|
| Skill 不可用 | 检查 MCP 配置，重启 CC |
| Skill 执行失败 | 查看 instructions 是否清晰 |
| 参数错误 | 验证参数定义和类型 |
| 权限不足 | 检查 tools 列表是否包含所需工具 |

---

## 快速参考卡片

### CC 核心命令
```bash
# MCP 相关
"列出所有 MCP 工具"
"使用 [工具名] 做 [任务]"

# Agents 相关
"找到所有 [内容]"           # 触发 Explore agent
"实现 [功能]"                # 触发 general-purpose agent
"分析 [代码/架构]"           # 触发 Explore agent (thorough)

# Git 相关
"查看状态"                   # git status
"提交更改"                   # git add + commit
"创建 PR"                    # gh pr create
"推送代码"                   # git push

# Skills 相关
"使用 [skill-name]"         # 手动调用 skill
/command-name               # 调用 slash command
```

### 工作流程示例

**完整的功能开发流程**:
```
1. 你: "分析当前的用户认证实现"
   CC: [Explore agent 分析代码]

2. 你: "实现 OAuth 登录功能"
   CC: [general-purpose agent 实现功能]

3. 你: "运行测试"
   CC: [Bash: npm test]

4. 你: "提交更改"
   CC: [Git: add + commit]

5. 你: "创建 PR"
   CC: [gh pr create]
```

---

## 附录

### 配置文件位置

**Claude Desktop 配置**:
```
macOS:    ~/Library/Application Support/Claude/claude_desktop_config.json
Windows:  %APPDATA%\Claude\claude_desktop_config.json
Linux:    ~/.config/Claude/claude_desktop_config.json
```

**项目配置**:
```
.claude/
├── commands/          # Slash commands
│   └── my-cmd.md
└── config.json        # 项目配置（如有）
```

### 常见问题

**Q: CC 什么时候会自动调用 agents？**
A: 当任务需要多次搜索、探索代码库或执行复杂多步骤操作时。

**Q: 如何知道 CC 调用了哪个 agent？**
A: CC 会在响应中告诉你："我将调用 Explore agent..."

**Q: Skills 和 Slash Commands 该选哪个？**
A: 简单提示词用 Slash Commands，复杂工具用 Skills。

**Q: 可以阻止 CC 自动提交代码吗？**
A: 不用担心，CC 只在你明确要求时才会提交代码。

**Q: MCP 工具配置后不生效？**
A: 确保重启了 Claude Code，并检查配置文件 JSON 格式是否正确。

### 学习资源

- **官方文档**: https://docs.claude.com/en/docs/claude-code
- **MCP 文档**: https://modelcontextprotocol.io
- **GitHub CLI**: https://cli.github.com/manual/

---

**提示**: 将此文档加入书签，需要时快速查阅！

最后更新: 2025-10-23
