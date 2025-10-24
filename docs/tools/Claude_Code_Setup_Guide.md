# Claude Code 项目初始化配置指南

## 📌 版本信息
- **当前版本**：v1.1
- **创建日期**：2025-10-23
- **最近更新**：2025-10-23

### 更新日志
- **v1.1** (2025-10-23)：添加 WebFetch/WebSearch 配置、Claude 模型选择策略、BMAD-METHOD 集成指南
- **v1.0** (2025-10-23)：初始版本，建立 Claude Code 配置模板和初始化流程

---

## 📖 文档说明

**用途**：
- 🚀 快速初始化新 AI 项目的 Claude Code 配置
- 📝 记录所有 Claude Code 相关的配置和最佳实践
- 🔄 作为配置演进的版本记录

**使用场景**：
1. 创建新项目时，按此文档快速配置
2. 团队成员加入时，快速同步配置
3. 配置出问题时，参考此文档排查

---

## 🎯 配置层级说明

Claude Code 支持**两级配置**：

### 1. 全局配置（推荐首次设置）
- **文件路径**：`~/.claude/settings.json`
- **作用范围**：所有项目默认使用
- **优先级**：低（会被项目配置覆盖）
- **适用场景**：通用配置，如默认权限模式、常用工具

### 2. 项目配置（可选）
- **文件路径**：`项目目录/.claude/settings.json`
- **作用范围**：仅当前项目
- **优先级**：高（覆盖全局配置）
- **适用场景**：项目特殊需求，如特定工具权限、团队共享配置

---

## ⚙️ 配置模板

### 🌍 全局配置模板

**文件位置**：`~/.claude/settings.json`

```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Read",
      "Write",
      "Edit",
      "Bash",
      "Glob",
      "Grep",
      "WebFetch",
      "WebSearch"
    ],
    "ask": [
      "Bash(rm:*)",
      "Bash(git push:*)",
      "Bash(npm publish:*)"
    ],
    "deny": [
      "Read(.env)",
      "Read(*.key)",
      "Read(*.pem)"
    ]
  },
  "model": "sonnet"
}
```

**配置说明**：

| 配置项 | 说明 | 推荐值 |
|--------|------|--------|
| `defaultMode` | 默认权限模式 | `"acceptEdits"` = 自动接受编辑 |
| `allow` | 自动允许的工具操作 | 常用工具：Read, Write, Edit, Bash, Glob, Grep, WebFetch, WebSearch |
| `ask` | 需要确认的操作 | 危险操作：删除、推送、发布 |
| `deny` | 禁止的操作 | 敏感文件：.env, *.key, *.pem |
| `model` | 默认使用的模型 | `"sonnet"` = Claude Sonnet（平衡性能和成本） |

---

### 📁 项目配置模板

**文件位置**：`项目目录/.claude/settings.json`

```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Read",
      "Write",
      "Edit",
      "Bash",
      "Glob",
      "Grep",
      "WebFetch",
      "WebSearch"
    ],
    "ask": [
      "Bash(rm:*)",
      "Bash(git push:*)"
    ]
  },
  "model": "sonnet",
  "additionalContext": {
    "projectType": "AI Product",
    "techStack": ["Python", "FastAPI", "React", "PostgreSQL"],
    "aiFramework": "LangChain"
  }
}
```

**项目配置特殊选项**：

| 配置项 | 说明 | 示例 |
|--------|------|------|
| `additionalContext` | 项目上下文信息（可选） | 技术栈、项目类型等 |

---

## 🚀 快速初始化流程

### 方法 1：首次设置全局配置（推荐）

**只需执行一次**，之后所有新项目自动继承配置。

#### 步骤 1：创建全局配置文件

```bash
# 创建 .claude 目录
mkdir -p ~/.claude

# 创建配置文件
cat > ~/.claude/settings.json << 'EOF'
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Read",
      "Write",
      "Edit",
      "Bash",
      "Glob",
      "Grep",
      "WebFetch",
      "WebSearch"
    ],
    "ask": [
      "Bash(rm:*)",
      "Bash(git push:*)",
      "Bash(npm publish:*)"
    ],
    "deny": [
      "Read(.env)",
      "Read(*.key)",
      "Read(*.pem)"
    ]
  },
  "model": "sonnet"
}
EOF

# 验证配置
cat ~/.claude/settings.json
```

#### 步骤 2：验证配置

在 Claude Code 中执行：
```
请告诉我你当前的权限模式和配置
```

**预期结果**：
- 权限模式：Auto-Accept / Accept Edits
- 允许工具：Read, Write, Edit, Bash, Glob, Grep

---

### 方法 2：为新项目创建项目配置

**仅在项目需要特殊配置时使用**

#### 一键初始化命令（复制粘贴到 Claude Code）

```
请帮我初始化 Claude Code 项目配置：

1. 创建 .claude 目录
2. 创建 .claude/settings.json 文件，使用以下配置：
   - defaultMode: acceptEdits
   - 允许：Read, Write, Edit, Bash, Glob, Grep
   - 询问：rm, git push
   - 模型：sonnet

3. 初始化 Git 仓库（如果还没有）
4. 创建 .gitignore 文件（包含常见忽略项）
5. 完成首次 Git commit

请自动执行这些步骤。
```

#### 或者手动执行

```bash
# 进入项目目录
cd /path/to/your/project

# 创建 .claude 目录
mkdir -p .claude

# 创建项目配置
cat > .claude/settings.json << 'EOF'
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Read",
      "Write",
      "Edit",
      "Bash",
      "Glob",
      "Grep",
      "WebFetch",
      "WebSearch"
    ],
    "ask": [
      "Bash(rm:*)",
      "Bash(git push:*)"
    ]
  },
  "model": "sonnet"
}
EOF

# 验证配置
cat .claude/settings.json
```

---

## 🛠 配置选项详解

### 权限模式（defaultMode）

| 模式值 | 说明 | 使用场景 |
|--------|------|----------|
| `"acceptEdits"` | 自动接受所有编辑 | 快速开发、原型设计、信任 Claude 的场景 |
| `"ask"` | 每次操作前询问 | 生产环境、关键代码、学习模式 |
| `"plan"` | 只读模式，不执行修改 | 代码审查、探索陌生代码库 |

### 工具列表

| 工具名 | 功能 | 建议配置 | 说明 |
|--------|------|----------|------|
| `Read` | 读取文件 | ✅ allow | 读取本地文件内容 |
| `Write` | 创建新文件 | ✅ allow | 写入新文件到本地 |
| `Edit` | 编辑现有文件 | ✅ allow | 修改已存在的文件 |
| `Bash` | 执行命令行 | ⚠️ allow（但危险命令放 ask） | 运行 shell 命令 |
| `Glob` | 文件搜索 | ✅ allow | 使用模式匹配查找文件 |
| `Grep` | 内容搜索 | ✅ allow | 在文件中搜索文本 |
| `WebFetch` | 获取网页内容 | ✅ allow | 抓取 URL 内容并分析 |
| `WebSearch` | 搜索网页 | ✅ allow | 搜索互联网获取最新信息 |

### 高级权限规则

#### 允许特定命令模式
```json
"allow": [
  "Bash(npm run:*)",      // 允许所有 npm run 命令
  "Bash(git status)",     // 允许 git status
  "Bash(git diff:*)"      // 允许所有 git diff 命令
]
```

#### 询问危险操作
```json
"ask": [
  "Bash(rm:*)",           // 删除文件需确认
  "Bash(git push:*)",     // 推送代码需确认
  "Bash(npm publish:*)",  // 发布包需确认
  "Bash(curl:*)",         // 网络请求需确认
  "Write(.env:*)"         // 写入环境变量需确认
]
```

#### 禁止敏感操作
```json
"deny": [
  "Read(.env)",           // 禁止读取环境变量
  "Read(*.key)",          // 禁止读取密钥文件
  "Read(*.pem)",          // 禁止读取证书
  "Bash(sudo:*)",         // 禁止 sudo 命令
  "Bash(rm -rf /*)"       // 禁止危险删除
]
```

---

## 🔄 模式切换

### 会话中临时切换模式

**快捷键**：`Shift + Tab` 循环切换
```
Normal Mode → Auto-Accept Mode → Plan Mode → Normal Mode
```

**文字命令**：
```
请切换到 Plan Mode（只读分析模式）
```
```
请切换到 Auto-Accept Mode（自动执行模式）
```
```
请切换到 Normal Mode（询问模式）
```

### 检查当前模式

```
你当前是什么权限模式？
```

---

## 📋 完整项目初始化检查清单

### ✅ 基础配置

- [ ] **全局配置已设置**（`~/.claude/settings.json`）
- [ ] **项目配置已创建**（`.claude/settings.json`）（可选）
- [ ] **权限模式验证**（确认 auto-accept mode 生效）

### ✅ Git 配置

- [ ] **Git 仓库已初始化**（`git init`）
- [ ] **.gitignore 已创建**（包含敏感文件）
- [ ] **首次提交已完成**（建立基准点）

### ✅ 安全措施

- [ ] **敏感文件已保护**（.env, *.key 等不被读取）
- [ ] **危险命令需确认**（rm, git push 等）
- [ ] **定期 Git commit**（方便回退）

### ✅ 文档准备

- [ ] **AI_Product_Development_Framework.md**（产品开发流程）
- [ ] **Claude_Code_Setup_Guide.md**（本文档）
- [ ] **README.md**（项目说明）（可选）

---

## 🎯 常见使用场景配置

### 场景 1：快速原型开发

**推荐配置**：完全自动化
```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": ["*"],
    "ask": ["Bash(git push:*)"]
  }
}
```

### 场景 2：生产项目开发

**推荐配置**：平衡安全与效率
```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": ["Read", "Write", "Edit", "Glob", "Grep"],
    "ask": ["Bash:*"],
    "deny": ["Read(.env)", "Read(*.key)"]
  }
}
```

### 场景 3：代码审查/学习

**推荐配置**：只读模式
```json
{
  "permissions": {
    "defaultMode": "plan",
    "allow": ["Read", "Glob", "Grep"]
  }
}
```

### 场景 4：团队协作项目

**推荐配置**：项目配置 + 版本控制
```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": ["Read", "Write", "Edit", "Bash", "Glob", "Grep"],
    "ask": ["Bash(git push:*)", "Bash(npm publish:*)"]
  }
}
```
**注意**：将 `.claude/settings.json` 提交到 Git，团队成员自动继承配置

---

## ⚠️ 安全最佳实践

### 1. 使用前必做

```bash
# 每次让 Claude 自动工作前
git add .
git commit -m "工作进度保存"
```

### 2. 定期检查

```bash
# 查看 Claude 做了什么改动
git diff HEAD~1

# 查看改动统计
git diff --stat HEAD~1
```

### 3. 出问题时快速回退

```bash
# 回退到上一次 commit
git reset --hard HEAD~1

# 或回退到特定 commit
git reset --hard <commit-hash>
```

### 4. 保护敏感文件

**.gitignore 必须包含**：
```
.env
.env.*
*.key
*.pem
credentials.json
secrets.json
```

**.claude/settings.json 必须配置**：
```json
"deny": [
  "Read(.env)",
  "Read(.env.*)",
  "Read(*.key)",
  "Read(*.pem)",
  "Read(credentials.json)"
]
```

---

## 🐛 常见问题排查

### 问题 1：配置不生效，仍然弹出确认框

**排查步骤**：
1. ✅ 检查配置文件路径是否正确
   ```bash
   cat ~/.claude/settings.json
   cat .claude/settings.json
   ```

2. ✅ 检查 JSON 格式是否正确（无语法错误）
   ```bash
   python -m json.tool ~/.claude/settings.json
   ```

3. ✅ 重启 Claude Code 会话

4. ✅ 询问 Claude 当前模式
   ```
   你当前的权限模式是什么？
   ```

### 问题 2：某些操作仍需确认

**原因**：可能该操作在 `ask` 列表中

**解决**：
- 检查 `ask` 列表，移除不需要确认的操作
- 或将操作添加到 `allow` 列表

### 问题 3：Claude 无法读取某些文件

**原因**：文件可能在 `deny` 列表中

**解决**：
- 检查 `deny` 列表
- 如果是敏感文件，保持禁止（这是安全特性）
- 如果确实需要读取，从 `deny` 移除并添加到 `allow`

### 问题 4：配置冲突

**优先级**：项目配置 > 全局配置

**解决**：
- 检查项目 `.claude/settings.json` 是否覆盖了全局配置
- 删除项目配置以使用全局配置
- 或修改项目配置以满足需求

---

## 📚 相关文档

- **[AI 产品开发全流程框架](AI_Product_Development_Framework.md)** - 产品开发完整流程
- **[Claude Code 官方文档](https://docs.claude.com/en/docs/claude-code/)** - 官方配置参考

---

## 🔄 配置更新记录

### v1.1 配置（2025-10-23）

**全局配置**：
- ✅ 默认模式：auto-accept
- ✅ 允许工具：Read, Write, Edit, Bash, Glob, Grep, **WebFetch, WebSearch**
- ✅ 询问操作：rm, git push, npm publish
- ✅ 禁止操作：读取 .env, *.key, *.pem
- ✅ 默认模型：Sonnet

**项目配置**：
- ✅ 继承全局配置
- ✅ 添加 WebFetch/WebSearch 支持
- ✅ 针对 Adaptive_learning_v1.0 项目优化

**新增内容**：
- ✅ Claude 模型选择策略（Haiku/Sonnet/Opus）
- ✅ BMAD-METHOD 集成指南
- ✅ 成本优化建议

### v1.0 配置（2025-10-23）

**全局配置**：
- ✅ 默认模式：auto-accept
- ✅ 允许工具：Read, Write, Edit, Bash, Glob, Grep
- ✅ 询问操作：rm, git push, npm publish
- ✅ 禁止操作：读取 .env, *.key, *.pem

**项目配置**：
- ✅ 继承全局配置
- ✅ 针对 Adaptive_learning_v1.0 项目优化

---

## 💡 使用建议

### 新项目快速开始

**只需一条命令**（复制发送给 Claude Code）：
```
请按照 Claude_Code_Setup_Guide.md 文档为这个新项目初始化 Claude Code 配置、Git 仓库和基础文件结构。
```

### 团队协作

**将配置提交到 Git**：
```bash
git add .claude/settings.json
git commit -m "添加 Claude Code 项目配置"
git push
```

团队成员克隆项目后，自动获得相同配置。

### 持续优化

每次讨论出新的配置优化时：
1. 更新本文档相应章节
2. 更新版本号和更新日志
3. 提交到 Git 保留历史记录

---

---

## 🤖 Claude 模型选择策略

### 可用模型

Claude Code 支持 **Claude 4 系列**三个主要模型：

| 模型 | 版本 | 定价（输入/输出） | 性能 | 适用场景 |
|------|------|------------------|------|----------|
| **Haiku** | 4.5 | $1/$5 per 1M tokens | 快速高效 | 简单任务、批量处理 |
| **Sonnet** | 4.5 | $3/$15 per 1M tokens | 平衡性能 | 日常开发（推荐） |
| **Opus** | 4.1 | $15+/$75+ per 1M tokens | 深度推理 | 复杂架构、代码审查 |

### 模型别名

| 别名 | 实际模型 | 说明 |
|------|---------|------|
| `default` | 根据账户自动选择 | 新手推荐 |
| `sonnet` | Claude Sonnet 4.5 | 最常用 ⭐ |
| `opus` | Claude Opus 4.1 | 最强推理 |
| `haiku` | Claude Haiku 4.5 | 最高性价比 |
| `sonnet[1m]` | Sonnet + 100万 token 上下文 | 超长对话 |
| `opusplan` | Opus（规划）+ Sonnet（执行） | 混合模式 |

### 如何切换模型

#### **会话中动态切换**
```
/model haiku        # 切换到 Haiku（省钱模式）
/model sonnet       # 切换到 Sonnet（默认模式）
/model opus         # 切换到 Opus（深度思考模式）
```

#### **配置文件设置**
```json
{
  "model": "sonnet",
  "permissions": {
    "defaultMode": "acceptEdits"
  }
}
```

### 智能选择策略

#### **按开发阶段选择**

```
阶段 0-1（规划） → opus / opusplan
  理由：需要深度思考架构设计

阶段 2-5（开发） → sonnet
  理由：快速实现 + 代码质量

阶段 6-7（优化） → haiku（日常）+ opus（关键分析）
  理由：成本优化 + 质量保证

生产运行 → haiku
  理由：用户量大，成本是关键
```

#### **按任务类型选择**

| 任务类型 | 推荐模型 | 原因 |
|---------|---------|------|
| 代码格式化、重命名 | **Haiku** | 简单任务，追求速度 |
| 功能开发、Bug 修复 | **Sonnet** | 平衡质量和效率 |
| 架构设计、性能优化 | **Opus** | 需要深度推理 |
| 代码审查 | **Opus** | 捕捉细节问题 |
| 快速原型 | **Haiku** | 快速迭代 |
| 生产环境 | **Haiku + Sonnet** | 主力 Haiku，关键部分 Sonnet |

### 成本优化

**实际成本对比**（10万输入 + 5万输出 tokens）：
- Haiku: $0.35
- Sonnet: $1.05（3倍）
- Opus: $5.25+（15倍）

**节省 60-70% 成本的策略**：
```
80% 任务用 Haiku（简单）
15% 任务用 Sonnet（中等）
5% 任务用 Opus（复杂）
```

---

## 🔗 BMAD-METHOD 集成指南

### 什么是 BMAD-METHOD？

**BMAD-METHOD™** 是一个通用 AI 代理协作框架，实现"代理化敏捷驱动开发"。

- ⭐ GitHub Stars: 19.4k
- 🔓 开源（MIT License）
- 🎯 解决 AI 辅助开发的两大痛点：规划不一致 + 上下文丢失

### 核心代理团队

#### **规划阶段代理**
- 🔍 **Analyst**：需求分析和市场调研
- 📋 **PM**：产品管理和 PRD 生成
- 🏗️ **Architect**：系统架构设计

#### **开发阶段代理**
- 📝 **Scrum Master**：分解为开发故事
- 💻 **Dev**：执行开发任务
- ✅ **QA**：质量验证

### 与 Claude Code 协同

**黄金组合工作流**：
```
BMAD-METHOD（规划层）
    ↓
生成 PRD + 架构 + 开发故事
    ↓
Claude Code（执行层）
    ↓
读取故事 → 实现代码 → 运行测试
```

### 快速开始

#### **安装 BMAD-METHOD**
```bash
npx bmad-method install
```

**要求**：Node.js v20+

#### **配置 Claude Code 与 BMAD 协同**

在 `.claude/settings.json` 中：
```json
{
  "permissions": {
    "defaultMode": "acceptEdits",
    "allow": [
      "Read",
      "Write",
      "Edit",
      "Bash",
      "Glob",
      "Grep",
      "WebFetch",
      "WebSearch"
    ]
  },
  "model": "sonnet",
  "additionalContext": {
    "developmentMethod": "BMAD-METHOD",
    "storyFilesPath": ".bmad/stories/"
  }
}
```

### 使用流程

**1. 规划阶段（BMAD Web UI）**
```
*analyst → 需求分析
*pm → PRD 生成
*architect → 架构设计
*scrum → 生成开发故事（.bmad/stories/）
```

**2. 开发阶段（Claude Code）**
```
在 Claude Code 中：
"请根据 .bmad/stories/story-001.md 实现用户认证功能"

Claude Code 会：
- 读取故事文件（包含完整上下文）
- 理解架构设计
- 实现功能
- 运行测试
```

### 模型推荐

- **BMAD 规划阶段**：使用 **Opus** 或 **OpusPlan**（深度推理）
- **BMAD 开发阶段**：使用 **Sonnet** 或 **Haiku**（高效执行）
- **Claude Code 执行**：使用 **Sonnet**（平衡性能）

### 完整示例

```bash
# 1. 安装 BMAD-METHOD
npx bmad-method install

# 2. 在 BMAD Web UI 中规划
*analyst  # 需求分析
*pm       # PRD
*architect # 架构
*scrum    # 生成故事

# 3. 在 Claude Code 中开发
# 打开 Claude Code，切换到 Sonnet 模型
/model sonnet

# 然后让 Claude 读取故事文件并实现
"请按照 .bmad/stories/ 中的故事顺序，逐个实现功能"
```

### 更多资源

- 📖 [BMAD-METHOD GitHub](https://github.com/bmad-code-org/BMAD-METHOD)
- 📖 [AI 产品开发框架](AI_Product_Development_Framework.md)（包含 BMAD 集成章节）
- 💬 BMAD Discord 社区
- 📺 BMAD YouTube 教程

---

## 📝 下次更新预留位置

### 待添加配置项
- [x] AI 模型选择策略（何时用 Sonnet/Opus/Haiku）
- [x] BMAD-METHOD 集成指南
- [ ] 成本控制配置
- [ ] 性能优化配置
- [ ] 团队协作 hooks 配置

### 待补充场景
- [ ] 大型重构项目配置
- [ ] 多语言项目配置
- [ ] 微服务架构项目配置

---

**文档结束** | 如有疑问或需要补充配置，请随时提出
