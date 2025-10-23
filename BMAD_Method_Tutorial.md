# BMAD-METHOD 完全使用指南 - 从零到精通

## 📌 文档信息
- **版本**：v1.1
- **创建日期**：2025-10-23
- **最后更新**：2025-10-23
- **更新内容**：完成英文内容中文化翻译
- **适用对象**：AI 产品开发者、创业者、完全零基础的 BMAD 用户
- **预计学习时间**：2-3 小时（含实战练习）

---

## 📖 目录

- [第 0 章：在开始之前](#第-0-章在开始之前)
- [第 1 章：环境准备（10 分钟）](#第-1-章环境准备10-分钟)
- [第 2 章：设置 AI 代理界面（5 分钟）](#第-2-章设置-ai-代理界面5-分钟)
- [第 3 章：理解 BMAD 工作流程](#第-3-章理解-bmad-工作流程)
- [第 4 章：规划阶段实战](#第-4-章规划阶段实战阶段-1)
- [第 5 章：开发阶段实战](#第-5-章开发阶段实战阶段-2)
- [第 6 章：完整实战案例](#第-6-章完整实战案例)
- [第 7 章：高级技巧](#第-7-章高级技巧)
- [第 8 章：常见问题排查](#第-8-章常见问题排查)
- [附录](#附录)

---

## 第 0 章：在开始之前

### 🤔 BMAD-METHOD 是什么？

**BMAD-METHOD™**（Brand, Mission, Architecture, Development METHOD）是一个革命性的 **AI 代理协作框架**，实现"代理化敏捷驱动开发"。

**简单理解**：
- 传统开发：你 → AI 助手 → 写代码（AI 不断丢失上下文，需要重复解释）
- BMAD 开发：你 → 专业 AI 代理团队 → 完整规划文档 → 带上下文的代码实现

### 🎯 为什么要用 BMAD？

#### **传统 AI 辅助开发的痛点**

**痛点 1：规划不一致**
```
你：帮我设计一个用户系统
AI：好的，我建议使用 JWT
[10分钟后]
你：继续实现数据库设计
AI：我建议使用 Session 认证  ← 前后矛盾！
```

**痛点 2：上下文丢失**
```
你：记住，我们使用 PostgreSQL + Redis 架构
AI：好的，记住了
[新对话]
你：继续开发
AI：你用什么数据库？  ← 上下文丢失！
```

#### **BMAD 的解决方案**

✅ **专业化代理团队**：每个代理专注自己的领域
- Analyst：需求分析专家
- PM：产品经理
- Architect：架构师
- Scrum Master：敏捷教练
- Dev：开发工程师
- QA：质量保证

✅ **知识持久化**：所有决策都写入文档和故事文件
- PRD 文档
- 架构文档
- 开发故事文件（包含完整上下文）

✅ **人机协作迭代**：每一步都可以反馈调整

### 👥 适合谁使用？

✅ **AI 创业者**：需要快速验证想法并开发 MVP
✅ **独立开发者**：想要系统化的开发流程
✅ **小团队**：需要规范的协作方式
✅ **学习者**：想要理解完整的产品开发流程

### 📋 整体流程预览

```
阶段 1：规划阶段（Web UI）
┌─────────────────────────────────────┐
│ *analyst  →  需求分析文档            │
│     ↓                                │
│ *pm       →  PRD（产品需求文档）     │
│     ↓                                │
│ *architect→  架构设计文档            │
│     ↓                                │
│ *scrum    →  开发故事文件（.bmad/）  │
└─────────────────────────────────────┘
                ↓
阶段 2：开发阶段（IDE + Claude Code）
┌─────────────────────────────────────┐
│ Dev 代理读取故事文件                 │
│     ↓                                │
│ 理解完整上下文（架构、需求、设计）   │
│     ↓                                │
│ 实现代码                             │
│     ↓                                │
│ QA 代理验证                          │
│     ↓                                │
│ 迭代改进                             │
└─────────────────────────────────────┘
```

**预计时间**：
- 规划阶段：2-4 小时（取决于项目复杂度）
- 开发阶段：根据功能量级

---

## 第 1 章：环境准备（10 分钟）

### 1.1 检查 Node.js

**为什么需要 Node.js？**
BMAD-METHOD 使用 npm（Node.js 包管理器）进行安装和管理。

#### **步骤 1：检查是否已安装 Node.js**

打开终端（Mac）或命令提示符（Windows），输入：

```bash
node --version
```

**预期输出**：
```
v20.x.x  或更高版本
```

如果显示版本号且 >= v20，跳到 [1.2 安装 BMAD-METHOD](#12-安装-bmad-method)

#### **步骤 2：安装 Node.js（如果还没有）**

**Mac 用户**：
```bash
# 使用 Homebrew（推荐）
brew install node

# 验证安装
node --version
```

**或者访问官网下载**：https://nodejs.org/（选择 LTS 版本）

**Windows 用户**：
- 访问 https://nodejs.org/
- 下载 LTS 版本（例如 v20.x.x）
- 运行安装程序
- 重启终端，验证：`node --version`

### 1.2 安装 BMAD-METHOD

#### **方法 1：快速安装（推荐）**

在你的项目目录中运行：

```bash
# 进入你的项目目录
cd /Users/victorsim/Desktop/Projects/Adaptive_learning_v1.0

# 安装 BMAD-METHOD
npx bmad-method install
```

**这个命令会做什么？**
- ✅ 检测是否已有 BMAD 安装
- ✅ 如果有，只更新变化的文件
- ✅ 自动备份你的自定义配置（创建 `.bak` 文件）
- ✅ 创建 `.bmad/` 目录结构

**预期输出**：
```
✓ Checking Node.js version...
✓ Creating .bmad directory...
✓ Installing BMAD agents...
✓ Setting up configuration...
✓ Installation complete!

Next steps:
1. Set up your Web UI (see documentation)
2. Start planning with *analyst
```

#### **方法 2：克隆仓库（高级用户）**

```bash
git clone https://github.com/bmad-code-org/BMAD-METHOD.git
cd BMAD-METHOD
npm run install:bmad
```

### 1.3 验证安装

检查是否创建了 `.bmad/` 目录：

```bash
ls -la | grep bmad
```

**预期输出**：
```
drwxr-xr-x  .bmad
```

查看目录结构：

```bash
tree .bmad
```

**预期结构**：
```
.bmad/
├── agents/          # AI 代理配置
├── stories/         # 开发故事文件（稍后会生成）
├── templates/       # 文档模板
└── config.json      # BMAD 配置
```

✅ **恭喜！环境准备完成。**

---

## 第 2 章：设置 AI 代理界面（5 分钟）

### 2.1 选择平台

BMAD-METHOD 支持两种 AI 平台：

| 平台 | 优点 | 缺点 | 推荐度 |
|------|------|------|--------|
| **Gemini Gems** (Google) | 免费、快速设置 | 需要 Google 账户 | ⭐⭐⭐⭐⭐ |
| **CustomGPT** (OpenAI) | 功能强大 | 需要 ChatGPT Plus ($20/月) | ⭐⭐⭐⭐ |

**推荐新手使用 Gemini Gems**（本教程以 Gemini 为例）

---

### ⚠️ 重要说明：为什么 BMAD 规划阶段不支持 Claude Code？

**技术限制**：
- BMAD-METHOD 的**规划阶段**（Analyst、PM、Architect、Scrum Master）需要在 **Web UI** 中运行
- 原因：需要上传团队包文件（.txt），并通过系统指令配置 AI 代理角色
- Claude Code（VSCode/Cursor 插件）目前不支持这种配置方式

**BMAD 的两阶段架构**：
```
阶段 1：规划阶段（需要 Web UI）
├─ 平台：Gemini Gems / CustomGPT  ✅
├─ 不支持：Claude Code / Claude.ai  ❌
└─ 产出：PRD + 架构 + 开发故事文件

阶段 2：开发阶段（推荐 Claude Code）
├─ 平台：Claude Code（VSCode/Cursor）✅
├─ 优势：代码实现、测试、调试
└─ 工作方式：读取 .bmad/stories/ 中的故事文件
```

### 💡 推荐工作流方案

**最佳实践**（适合 Claude 用户）：

```
第 1 步：规划阶段
使用 Gemini Gems（免费）进行规划
  ↓
*analyst  → 需求分析
*pm       → PRD 生成
*architect → 架构设计
*scrum    → 生成开发故事文件（.bmad/stories/）
  ↓
第 2 步：开发阶段
切换到 Claude Code（Sonnet 4.5）
  ↓
读取 .bmad/stories/story-001.md
  ↓
Claude Code 实现代码（带完整上下文）
```

**为什么这样组合最优？**
1. **规划阶段**：Gemini 免费且强大，完全满足规划需求
2. **开发阶段**：Claude Sonnet 4.5 代码能力更强，成本效益高
3. **知识持久化**：通过 .bmad/stories/ 文件传递上下文
4. **成本优化**：规划免费，开发使用高性价比模型

### 🔄 替代方案

**方案 1：纯 Gemini 流程**（完全免费）
- 规划：Gemini Gems
- 开发：Gemini API + 本地 IDE
- 适合：预算有限的独立开发者

**方案 2：纯 Claude 流程**（无 BMAD 规划）
- 规划：直接在 Claude Code 中手动规划
- 开发：Claude Code
- 缺点：缺少 BMAD 的结构化规划和上下文持久化

**方案 3：混合流程**（推荐 ⭐）
- 规划：Gemini Gems（BMAD 规划）
- 开发：Claude Code（读取 BMAD 故事）
- 优势：结合两者优点，成本最优

---

### 2.2 下载团队包

#### **步骤 1：访问 BMAD GitHub**

打开浏览器，访问：
```
https://github.com/bmad-code-org/BMAD-METHOD
```

#### **步骤 2：下载团队包文件**

1. 在仓库页面，点击 **Code** → **Download ZIP**
2. 解压文件
3. 找到 `dist/teams/` 目录
4. 选择团队包：

**可用团队包**：
- `team-fullstack.txt` - **推荐新手**：全栈开发团队（前端+后端）
- `team-frontend.txt` - 纯前端团队
- `team-backend.txt` - 纯后端团队
- `team-mobile.txt` - 移动应用团队
- `team-ai.txt` - AI 产品团队

**对于 AI 创业者，推荐使用 `team-fullstack.txt` 或 `team-ai.txt`**

### 2.3 创建 Gemini Gem（AI 代理）

#### **步骤 1：访问 Gemini**

打开浏览器，访问：
```
https://gemini.google.com/
```

登录你的 Google 账户

#### **步骤 2：创建新 Gem**

1. 在 Gemini 界面，点击左上角的 **"Gems"** 图标
2. 点击 **"Create a new Gem"**（创建新 Gem）
3. 你会看到 Gem 配置界面

#### **步骤 3：配置 Gem**

**Gem 名称**：
```
BMAD Agent Team - Fullstack
```

**Gem 描述**（可选）：
```
AI 代理团队，用于产品规划和开发协作
```

**系统指令（Instructions）**：
```
Your critical operating instructions are attached, do not break character as directed
```

**重要**：这句话告诉 AI 严格遵守团队包中的角色设定

#### **步骤 4：上传团队包**

1. 在 Gem 配置界面，找到 **"Knowledge"** 或 **"Files"** 区域
2. 点击 **"Upload file"**
3. 选择你下载的 `team-fullstack.txt` 文件
4. 等待上传完成（通常几秒钟）

#### **步骤 5：保存并测试**

1. 点击 **"Save"** 保存 Gem
2. 点击 **"Chat with [Gem name]"** 开始对话

### 2.4 测试连接

在 Gem 对话框中输入：

```
*help
```

**预期输出**：
```
🎯 BMAD Agent Team - Available Commands

Core Agents:
- *analyst     : Start requirement analysis
- *pm          : Product manager for PRD creation
- *architect   : System architecture design
- *scrum       : Create development stories

Utility:
- *help        : Show this help message
- #bmad-orchestrator : Ask questions about BMAD workflow

Current Mode: Ready for planning
Type *analyst to begin!
```

✅ **如果看到类似输出，说明设置成功！**

❌ **如果没有响应或响应不对，检查：**
- 团队包文件是否正确上传
- 系统指令是否正确设置
- 尝试重新创建 Gem

---

## 第 3 章：理解 BMAD 工作流程

### 3.1 两阶段架构

```
┌─────────────────────────────────────────────────┐
│         阶段 1：代理规划（Agentic Planning）      │
│                                                 │
│  环境：Web UI（Gemini Gems / CustomGPT）        │
│  参与者：你 + AI 代理团队                        │
│  模式：人机协作迭代                              │
│                                                 │
│  流程：                                          │
│  1. Analyst  → 深度需求分析                     │
│  2. PM       → 产品需求文档（PRD）              │
│  3. Architect→ 系统架构设计                     │
│  4. Scrum Master → 开发故事分解                 │
│                                                 │
│  产出：                                          │
│  - 规范级 PRD                                   │
│  - 详细架构文档                                  │
│  - 超详细开发故事（包含完整上下文）             │
└─────────────────────────────────────────────────┘
                     ↓
                交接点：故事文件
                     ↓
┌─────────────────────────────────────────────────┐
│      阶段 2：上下文工程开发（Context Development） │
│                                                 │
│  环境：IDE（VSCode/Cursor）+ Claude Code       │
│  参与者：Dev/QA 代理 + 你                       │
│  模式：基于故事文件的开发                        │
│                                                 │
│  流程：                                          │
│  1. Dev 代理读取故事文件                        │
│  2. 理解：需求 + 架构 + 实现细节                │
│  3. 编写代码                                     │
│  4. QA 验证                                      │
│  5. 反馈到故事文件                               │
│                                                 │
│  关键：所有上下文都嵌入在故事文件中              │
└─────────────────────────────────────────────────┘
```

### 3.2 代理角色详解

#### **🔍 Analyst 代理（分析师）**

**角色定位**：需求分析专家、市场调研员
**主要职责**：
- 深入理解用户想法
- 挖掘真实需求（而非表面需求）
- 分析市场可行性
- 识别技术约束
- 生成项目简报（Project Brief）

**何时使用**：项目最开始，你有一个想法但还不够清晰

**输入示例**：
```
我想做一个 AI 学习助手，帮助学生个性化学习
```

**输出示例**：
```
📋 Project Brief - AI Learning Assistant

## 核心问题
学生在学习过程中面临：
1. 缺乏个性化指导
2. 难以识别知识盲区
3. 学习效率低下

## 目标用户
- 主要：高中生和大学生（15-25 岁）
- 次要：在职学习者

## 价值主张
通过 AI 对话识别学习盲区，生成个性化学习路径

## 技术可行性
- AI 模型：GPT-4 / Claude
- 关键技术：RAG（检索增强生成）
- 数据需求：学科知识库 + 用户学习数据

## 竞品分析
- Khan Academy AI
- Duolingo Max
- 差异化：更深度的知识盲区识别

## 下一步
需要 PM 定义 MVP 功能范围
```

---

#### **📋 PM 代理（产品经理）**

**角色定位**：产品战略家、需求定义者
**主要职责**：
- 将 Analyst 的分析转化为产品需求
- 定义 MVP 功能范围
- 创建用户故事
- 定义成功指标
- 生成 PRD（Product Requirements Document）

**何时使用**：在 Analyst 完成分析后

**输入示例**：
```
基于 Analyst 的分析，请为 AI 学习助手定义 MVP 需求
```

**输出示例**：
```
📄 PRD - AI Learning Assistant v1.0

## 产品概述
产品名称：LearnBuddy
版本：MVP 1.0
目标：帮助学生通过 AI 对话识别学习盲区并获得个性化指导

## 功能需求（MoSCoW 优先级）

### Must Have（MVP 必需）
1. **智能对话系统**
   - 用户可以提问任何学科问题
   - AI 分析问题背后的知识点
   - 响应时间 < 3 秒

2. **知识盲区识别**
   - 基于对话识别用户不理解的概念
   - 可视化展示知识图谱

3. **个性化学习路径**
   - 根据盲区生成学习建议
   - 推荐相关学习资源

### Should Have（重要但非紧急）
4. 学习进度追踪
5. 每日学习报告

### Could Have（锦上添花）
6. 语音交互
7. 移动端 App

### Won't Have（明确不做）
8. 社交功能
9. 游戏化元素

## 用户故事
- 作为学生，我希望提问不懂的问题，以便获得即时解答
- 作为学生，我希望看到我的知识盲区，以便有针对性地学习

## 成功指标
### 北极星指标
- 学生日活跃用户（DAU）

### 关键指标
- 问题解决率 > 80%
- 用户留存率（Day 7）> 40%
- 平均会话时长 > 10 分钟

## 技术约束
- 响应时间 < 3s
- 支持同时 1000 在线用户
- 成本控制：每用户每天 < $0.10

## 下一步
需要 Architect 设计系统架构
```

---

#### **🏗️ Architect 代理（架构师）**

**角色定位**：技术架构师、系统设计专家
**主要职责**：
- 基于 PRD 设计技术架构
- 选择技术栈
- 设计数据模型
- 定义 API 接口
- 考虑可扩展性和性能
- 生成架构文档

**何时使用**：在 PM 完成 PRD 后

**输入示例**：
```
基于 PRD，请设计 LearnBuddy 的系统架构
```

**输出示例**：
```
🏗️ Architecture Document - LearnBuddy

## 技术栈选择

### 前端
- **框架**：React 18 + TypeScript
- **状态管理**：Zustand
- **UI 库**：Tailwind CSS + shadcn/ui
- **实时通信**：WebSocket (Socket.io)
- **理由**：快速开发、类型安全、现代化 UI

### 后端
- **框架**：Python FastAPI
- **AI 集成**：LangChain + OpenAI API
- **数据库**：PostgreSQL（用户数据） + Pinecone（向量数据库）
- **缓存**：Redis
- **理由**：AI 生态成熟、高性能异步框架

### 基础设施
- **部署**：Docker + Kubernetes
- **云服务商**：AWS / Google Cloud
- **监控**：Prometheus + Grafana
- **日志**：ELK Stack

## 系统架构

```
┌─────────────────────────────────────────────┐
│              用户界面层                      │
│  React Web App │ (未来：Mobile App)         │
└───────────────┬─────────────────────────────┘
                │ WebSocket + REST API
┌───────────────▼─────────────────────────────┐
│            API 网关层（FastAPI）             │
│  - 认证/授权                                 │
│  - 速率限制                                  │
│  - 请求路由                                  │
└───────────────┬─────────────────────────────┘
                │
    ┌───────────┴───────────┐
    │                       │
┌───▼─────────┐    ┌────────▼─────────┐
│ 业务逻辑层   │    │   AI 服务层      │
│ - 用户管理   │    │ - GPT-4 调用     │
│ - 会话管理   │    │ - 知识图谱分析   │
│ - 学习追踪   │    │ - RAG 检索       │
└───┬─────────┘    └────────┬─────────┘
    │                       │
    └───────────┬───────────┘
                │
┌───────────────▼─────────────────────────────┐
│              数据层                          │
│  PostgreSQL  │  Pinecone   │   Redis        │
│  (用户数据)   │ (向量存储)  │  (缓存)        │
└─────────────────────────────────────────────┘
```

## 数据模型

### User（用户表）
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(100),
  created_at TIMESTAMP DEFAULT NOW(),
  last_active_at TIMESTAMP
);
```

### ChatSession（对话会话表）
```sql
CREATE TABLE chat_sessions (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  topic VARCHAR(200),
  created_at TIMESTAMP DEFAULT NOW()
);
```

### Message（消息表）
```sql
CREATE TABLE messages (
  id UUID PRIMARY KEY,
  session_id UUID REFERENCES chat_sessions(id),
  role ENUM('user', 'assistant'),
  content TEXT,
  knowledge_gaps JSONB,  -- 识别的知识盲区
  created_at TIMESTAMP DEFAULT NOW()
);
```

### KnowledgeNode（知识节点 - 向量数据库）
- embedding：向量表示（1536 维）
- content：知识点内容
- subject：学科分类
- difficulty_level：难度等级

## API 设计

### 核心 API

#### POST /api/chat
发送消息并获取 AI 响应
```json
Request:
{
  "session_id": "uuid",
  "message": "什么是二次函数？"
}

Response:
{
  "message": "二次函数是...",
  "knowledge_gaps": ["函数概念", "抛物线"],
  "recommendations": [...]
}
```

#### GET /api/knowledge-map/:user_id
获取用户知识图谱
```json
Response:
{
  "nodes": [...],
  "gaps": [...],
  "mastered": [...]
}
```

## 性能考虑
- **缓存策略**：常见问题缓存，减少 AI 调用
- **异步处理**：AI 请求使用异步队列
- **向量检索优化**：使用 Pinecone 索引加速

## 安全考虑
- JWT 认证
- API 速率限制（100 req/min per user）
- 用户数据加密存储
- HTTPS only

## 成本估算
- AI API 调用：~$0.05 per user per day
- 数据库：$50/month
- 向量数据库：$70/month
- 服务器：$100/month
- **总计**：~$220/month（支持 5000 DAU）

## 下一步
需要 Scrum Master 将架构分解为开发故事
```

---

#### **📝 Scrum Master 代理（敏捷教练）**

**角色定位**：任务分解专家、上下文工程师
**主要职责**：
- 将 PRD 和架构文档分解为开发任务
- 创建"超详细"的开发故事文件
- 在故事中嵌入完整上下文
- 确保 Dev 代理能直接理解并执行

**何时使用**：规划完成，准备开发时

**输入示例**：
```
基于 PRD 和架构文档，请生成开发故事
```

**输出**：创建 `.bmad/stories/` 目录下的故事文件

**故事文件示例**（`story-001-setup-backend.md`）：
```markdown
# Story 001: 搭建后端项目基础架构

## 上下文
**项目**：LearnBuddy - AI 学习助手
**架构决策**：使用 Python FastAPI + PostgreSQL + Redis
**相关文档**：architecture.md, prd.md

## 目标
搭建后端项目的基础框架，包括：
- FastAPI 应用初始化
- 数据库连接配置
- Redis 连接配置
- 基础项目结构

## 技术规范
- Python 3.11+
- FastAPI 0.104+
- PostgreSQL 15+
- Redis 7+
- Poetry 作为依赖管理

## 实现细节

### 1. 项目结构
```
backend/
├── app/
│   ├── __init__.py
│   ├── main.py           # FastAPI 应用入口
│   ├── config.py         # 配置文件
│   ├── models/           # 数据模型
│   ├── routes/           # API 路由
│   ├── services/         # 业务逻辑
│   └── utils/            # 工具函数
├── tests/
├── pyproject.toml        # Poetry 依赖
└── .env.example          # 环境变量模板
```

### 2. 依赖项（pyproject.toml）
```toml
[tool.poetry.dependencies]
python = "^3.11"
fastapi = "^0.104.0"
uvicorn = "^0.24.0"
sqlalchemy = "^2.0.0"
asyncpg = "^0.29.0"
redis = "^5.0.0"
pydantic = "^2.5.0"
pydantic-settings = "^2.1.0"
```

### 3. 配置管理（config.py）
```python
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    # Database
    DATABASE_URL: str

    # Redis
    REDIS_HOST: str = "localhost"
    REDIS_PORT: int = 6379

    # API
    API_V1_PREFIX: str = "/api/v1"

    class Config:
        env_file = ".env"

settings = Settings()
```

### 4. FastAPI 应用入口（main.py）
```python
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="LearnBuddy API",
    version="1.0.0"
)

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/health")
async def health_check():
    return {"status": "healthy"}

@app.get("/")
async def root():
    return {"message": "LearnBuddy API"}
```

## 验收标准
- [ ] 项目结构创建完成
- [ ] 所有依赖安装成功
- [ ] FastAPI 应用可以启动
- [ ] 访问 http://localhost:8000/docs 可以看到 API 文档
- [ ] /health 端点返回 {"status": "healthy"}

## 测试命令
```bash
# 安装依赖
poetry install

# 启动应用
poetry run uvicorn app.main:app --reload

# 测试
curl http://localhost:8000/health
```

## 预计时间
30-60 分钟

## 依赖
无（这是第一个故事）

## 后续故事
- Story 002: 实现数据库连接和模型
- Story 003: 实现用户认证系统
```

---

#### **💻 Dev 代理（开发工程师）**

**角色定位**：代码实现者
**主要职责**：
- 读取故事文件
- 理解完整上下文（无需重新询问）
- 编写代码
- 运行测试

**何时使用**：在 Claude Code 中，开发阶段

**使用方式**：
```
在 Claude Code 中：
"请根据 .bmad/stories/story-001-setup-backend.md 实现后端项目搭建"

Dev 代理会：
1. 读取故事文件
2. 理解上下文（项目、架构、需求）
3. 创建项目结构
4. 编写代码
5. 运行测试
```

---

#### **✅ QA 代理（质量保证）**

**角色定位**：质量把关者
**主要职责**：
- 验证实现是否符合故事要求
- 运行测试
- 识别潜在问题
- 反馈到故事文件

**何时使用**：Dev 完成后

---

### 3.3 核心命令速查

| 命令 | 代理 | 作用 | 阶段 |
|------|------|------|------|
| `*analyst` | Analyst | 需求分析 | 规划 |
| `*pm` | PM | PRD 生成 | 规划 |
| `*architect` | Architect | 架构设计 | 规划 |
| `*scrum` | Scrum Master | 生成故事 | 规划→开发 |
| `*help` | - | 显示帮助 | 任何时候 |
| `#bmad-orchestrator` | Orchestrator | 询问工作流 | 任何时候 |

---

## 第 4 章：规划阶段实战（阶段 1）

现在让我们通过一个真实案例，手把手学习如何使用 BMAD 进行规划。

### 4.1 使用 Analyst 代理进行需求分析

#### **场景设定**

假设你想开发一个 **AI 健身教练应用**，但还不确定具体要做什么功能。

#### **步骤 1：启动 Analyst 代理**

在 Gemini Gem 对话框中输入：

```
*analyst
```

**Analyst 响应**：
```
🔍 Analyst 模式已激活

我是你的需求分析师。我将帮助你理解：
- 你要解决的问题
- 你的目标用户
- 市场机会
- 技术可行性

请尽可能详细地描述你的项目想法。
你试图解决什么问题？
```

#### **步骤 2：描述你的想法**

输入：
```
我想做一个 AI 健身教练应用。

背景：
- 很多人想健身但不知道从哪开始
- 请私教太贵（每小时 $100+）
- 现有 App 都是通用训练计划，不够个性化

我的想法：
- 用户告诉 AI 自己的目标（减肥、增肌、改善体态等）
- AI 根据用户情况（身体数据、时间、设备）生成个性化训练计划
- 训练过程中 AI 提供实时指导和纠正

目标用户：
- 健身新手（18-35 岁）
- 想在家健身的人
- 预算有限的人

我不确定：
- 技术上能否实现动作识别和纠正？
- 用户是否真的愿意用 AI 而不是真人教练？
- 如何让 AI 理解用户的身体状况？
```

#### **步骤 3：Analyst 进行深度分析**

**Analyst 响应**（这是一个长回复，我只展示关键部分）：

```
📋 项目简介 - AI 健身教练

## 1. 问题分析

### 核心问题
传统健身教练面临三大障碍：
1. **成本障碍**：私人教练费用 $50-150/小时
2. **访问障碍**：可用性有限，需要去健身房
3. **个性化差距**：通用健身 App 缺乏个性化调整

### 你的解决方案
AI 驱动的个人健身教练提供：
- 个性化训练计划
- 实时动作纠正
- 自适应训练进度
- 成本低廉（<$10/月 vs 私教 $400/月）

## 2. 目标用户深度分析

### 主要用户画像："健身新手 Noah"
- 年龄：25 岁
- 职业：软件开发工程师
- 痛点：
  - 对健身房感到害怕
  - 尝试过 YouTube 健身视频，但不够持续
  - 想要指导但负担不起私教
- 目标：减重 10 公斤，建立基础力量
- 预算：<$15/月

### 次要用户画像："忙碌家长 Sarah"
- 年龄：32 岁
- 时间有限（每天最多 30 分钟）
- 偏好在家锻炼
- 有旧伤顾虑

## 3. 技术可行性分析

### 动作识别
✅ **可行**：
- 使用 MediaPipe / TensorFlow.js 进行姿态估计
- 实时检测 30+ 个关键身体点
- 常见动作准确率：85-95%

⚠️ **挑战**：
- 需要良好的摄像头角度
- 光照条件很关键
- 仅支持手机/电脑摄像头（无需特殊硬件）

### AI 教练逻辑
✅ **可行**：
- GPT-4 用于训练计划和调整
- RAG 用于运动数据库和动作指南
- 基于规则的系统进行动作检查（角度、对齐）

### 个性化
✅ **可行**：
- 输入：年龄、体重、健身水平、目标、设备、伤病史
- 输出：渐进式训练计划
- 基于用户反馈和表现数据进行适应

## 4. 竞争格局

| 竞品 | 优势 | 劣势 | 我们的优势 |
|------|------|------|-----------|
| Nike Training Club | 品牌、免费内容 | 通用计划 | AI 个性化 |
| Freeletics | AI 驱动 | 价格贵（$60/年） | 更好的动作检查 |
| Future Fitness | 真人教练 | 非常贵（$150/月） | AI 成本仅 10% |
| FitBod | 自适应训练 | 无动作检查 | 实时纠正 |

**市场空白**：没有价格实惠且具备实时动作纠正的 AI 教练

## 5. MVP 范围建议

### 必须有（MVP 第 1 阶段 - 3 个月）
1. ✅ 用户引导（目标、健身水平、设备）
2. ✅ AI 生成的个性化训练计划（文本）
3. ✅ 运动视频库（20 个常见动作）
4. ✅ 基础动作检查（5-10 个关键动作）
5. ✅ 训练记录和进度追踪

### 应该有（第 2 阶段 - 第 4-6 个月）
6. 训练过程中的实时语音指导
7. 扩展的运动库（50+ 个动作）
8. 营养指导集成
9. 休息日建议

### 可以有（第 3 阶段 - 第 7 个月+）
10. AR 叠加动作指导
11. 社交功能（训练伙伴）
12. 可穿戴设备集成

### 不会有（超出范围）
- 送餐服务
- 设备销售
- 团体课程

## 6. 需要验证的关键假设

1. **用户信任 AI 动作纠正** - 通过 beta 用户测试
2. **摄像头质量足够** - 通过各种设备测试
3. **用户每周完成 3+ 次训练** - 留存的关键
4. **愿意支付 $10/月** - 需要价格敏感度测试

## 7. 成功标准

### 北极星指标
**每周活跃用户（WAU）** - 衡量实际使用情况，而非仅注册量

### 支撑指标
- 用户留存：第 7 天 > 40%，第 30 天 > 25%
- 训练完成率 > 70%
- 动作纠正准确率 > 85%（由私教验证）
- 用户满意度（NPS）> 50

## 8. 技术栈建议（初步）

**AI/ML**：
- GPT-4（训练计划）
- MediaPipe（姿态估计）
- LangChain（RAG 运动知识）

**平台**：
- 首先开发 Web 应用（MVP 更容易）
- 之后开发移动应用（更好的摄像头体验）

## 9. 风险与缓解

| 风险 | 影响 | 缓解措施 |
|------|------|----------|
| 运动伤害责任 | 高 | 免责声明、专注动作准确性、私教审核 |
| 采用率低 | 高 | 免费试用、演示视频 |
| 技术复杂性 | 中 | 从简单动作开始 |
| 竞争 | 中 | 专注个性化 + 成本优势 |

## 10. 后续步骤

✅ 本简介已完成。

**建议**：
1. 通过 10-15 名目标用户验证核心假设（访谈）
2. 构建可点击原型（Figma）测试概念
3. 移交给 PM 代理定义详细 PRD

**准备好继续了吗？** 输入 `*pm` 开始创建 PRD，或向我提问关于本简介的问题。
```

#### **步骤 4：与 Analyst 互动**

你可以问问题，例如：

```
你：对于健身新手，是否应该先从无器械训练开始？

Analyst：
Excellent question! Yes, I recommend:

**MVP Strategy for Beginners**:
1. Start with bodyweight exercises only (no equipment barrier)
2. Progression: Bodyweight → Dumbbells → Full gym

**Rationale**:
- 95% of target users don't have equipment at home
- Reduces injury risk for newbies
- Simpler pose estimation (no occlusion from weights)

**Suggested MVP Exercise List**:
- Squats, Lunges, Push-ups, Planks, Burpees
- Mountain climbers, Glute bridges
- All can be done in 2m x 2m space

Should I update the brief with this refinement?
```

#### **步骤 5：确认完成**

当你满意分析结果后：

```
你：这个分析很完整，我们进入下一步

Analyst：
Perfect! Your project brief is saved.

下一步：输入 *pm 与产品经理一起创建详细的 PRD。

PM 将把这个分析转化为具体的功能、用户故事和成功指标。
```

✅ **Analyst 阶段完成！**

---

### 4.2 使用 PM 代理生成 PRD

#### **步骤 1：切换到 PM 代理**

在同一个对话中输入：

```
*pm
```

**PM 响应**：
```
📋 产品经理模式已激活

我已经审阅了分析师为你的 AI 健身教练项目准备的简介。

我将帮助你创建详细的产品需求文档（PRD），包括：
- 功能规格
- 用户故事
- 成功指标
- 技术要求
- 发布时间表

让我们先确认 MVP 范围。根据简介，我建议专注于：

1. 个性化训练计划
2. 运动视频库
3. 基础形态检查（5-10 个动作）
4. 进度追踪

你想要：
A) 按此范围继续
B) 增加/删除功能
C) 详细讨论特定功能
```

#### **步骤 2：确认 MVP 范围**

```
你：A，继续这个范围。但我想确认：基础形态检查具体指哪些？

PM：
很好的问题！让我澄清一下"基础形态检查"：

**第 1 阶段 MVP - 5 个核心动作的形态检查**：

1. **深蹲**
   - 检查：膝盖对齐、背部角度、深度
   - 反馈："膝盖在脚尖正上方吗？背部挺直吗？"

2. **俯卧撑**
   - 检查：肘部角度、身体对齐、深度
   - 反馈："保持核心收紧，肘部 45°"

3. **平板支撑**
   - 检查：臀部对齐、肩部位置
   - 反馈："略微抬高臀部，避免下垂"

4. **弓步蹲**
   - 检查：膝盖角度、前倾程度
   - 反馈："前膝盖不超过脚尖"

5. **臀桥**
   - 检查：臀部高度、膝盖角度
   - 反馈："顶部挤压臀部"

**为什么选这 5 个？**
- 最常见的初学者动作
- 明确的形态规则（基于角度）
- 做错了受伤风险高
- 更容易的姿态估计（稳定姿势）

**检测方法**：
- MediaPipe 识别 33 个身体标志点
- 计算关节角度
- 与理想范围比较
- 实时反馈叠加

**准确度目标**：85%+（由私教验证）

我可以基于此继续生成完整 PRD 吗？
```

#### **步骤 3：生成完整 PRD**

```
你：是的，请生成完整 PRD

PM：
```

**PM 开始生成 PRD**（这是一个很长的文档，我展示关键部分）：

```markdown
📄 产品需求文档
# AI 健身教练 - MVP v1.0

**产品名称**：FitAI Coach
**版本**：1.0 MVP
**创建日期**：2025-10-23
**负责人**：[你的名字]
**状态**：草稿待审核

---

## 1. 执行摘要

### 愿景
通过 AI 民主化个人健身指导，让专业指导以传统教练 10% 的成本惠及所有人。

### 使命（MVP）
为 5 个核心自重动作提供个性化训练计划和实时形态纠正，帮助健身新手安全有效地开始健身之旅。

### 目标发布时间
2025 年 Q2（3 个月开发）

---

## 2. 产品概述

### 2.1 问题陈述
- 80% 的健身新手在 3 个月内放弃
- 私人教练每次收费 $100+（大多数人无法负担）
- 通用健身 App 缺乏个性化和形态指导
- **后果**：高受伤率、低坚持度、浪费潜力

### 2.2 解决方案
AI 驱动的个人健身教练提供：
- 根据用户目标和健身水平定制的个性化训练计划
- 使用计算机视觉的实时形态纠正
- 根据用户表现自适应的渐进式训练
- 成本：<$10/月（vs 真人私教 $400/月）

### 2.3 成功定义
- **北极星指标**：每用户每周活跃训练次数 > 3
- 第 7 天留存 > 40%
- 形态纠正准确率 > 85%
- NPS > 50

---

## 3. 用户画像

### 主要画像："新手 Noah"（60% 用户）
- 年龄：22-28
- 职业：知识工作者
- 健身水平：初学者（可以做 5 个俯卧撑）
- 目标：减重 + 建立基础力量
- 可用时间：30-45 分钟，每周 3-4 次
- 痛点：
  - 不知道从哪开始
  - 害怕动作做错
  - 负担不起健身房/教练
- 动机：健康、自信、外观

### 次要画像："忙碌家长 Sarah"（25% 用户）
- 年龄：30-40
- 时间有限：每天最多 20-30 分钟
- 目标：保持健康，为孩子提供精力
- 既往伤病：背痛
- 痛点：时间紧迫，需要高效

### 第三画像："复出 Chris"（15% 用户）
- 年龄：35-45
- 曾经健康，现在走样
- 目标：恢复之前的健康水平
- 动机：健康警告、里程碑生日

---

## 4. 功能规格（MoSCoW）

### 4.1 必须有（MVP 发布）

#### 功能 1：智能引导
**描述**：收集用户数据以个性化训练计划

**用户故事**：
_作为新用户，我想回答关于我的健身水平和目标的问题，以便收到为我量身定制的计划。_

**验收标准**：
- [ ] 5 步引导流程（< 3 分钟）
- [ ] 问题：年龄、体重、身高、健身水平（1-5）、目标（多选）、设备（无/哑铃/全套）、伤病/限制、可用天数（3-7）、每次训练时间（15/30/45/60 分钟）
- [ ] 可通过"快速开始"选项跳过
- [ ] 数据保存到用户档案
- [ ] 之后可在设置中编辑

**技术规格**：
- 前端表单验证
- POST /api/user/onboarding
- 存储在 PostgreSQL 用户表

**设计说明**：
- 顶部进度条（第 1/5 步）
- 每屏一个问题（移动友好）
- 可视化健身水平选择器（简笔人物）

---

#### 功能 2：AI 训练计划生成器
**描述**：生成个性化的 4 周渐进式训练计划

**用户故事**：
_作为完成引导的用户，我想收到个性化的训练计划，以便知道每天该做什么。_

**验收标准**：
- [ ] 生成 4 周计划（28 天）
- [ ] 根据用户输入每周 3-5 次训练
- [ ] 每次训练：20-45 分钟时长
- [ ] 难度递增（第 1 周比第 4 周简单）
- [ ] 动作多样性（轮换动作）
- [ ] 战略性安排休息日
- [ ] 根据用户反馈调整（太简单/太难）

**技术规格**：
- 带用户数据的 GPT-4 提示
- 运动数据库（PostgreSQL）
- 缓存：缓存生成的计划（Redis，24 小时 TTL）
- POST /api/workout-plan/generate
- 响应时间：< 5 秒

**训练日示例**：
```json
{
  "day": 1,
  "title": "全身基础",
  "duration": "30 分钟",
  "exercises": [
    {
      "name": "自重深蹲",
      "sets": 3,
      "reps": 10,
      "rest": "60秒",
      "form_check_enabled": true,
      "video_url": "/videos/squat.mp4",
      "instructions": "..."
    },
    ...
  ]
}
```

---

#### 功能 3：运动视频库
**描述**：每个动作的高质量视频演示

**用户故事**：
_作为开始动作的用户，我想观看演示视频，以便理解正确的形态。_

**验收标准**：
- [ ] 15-20 个运动视频
- [ ] 每个视频：20-40 秒，循环播放
- [ ] 多角度（正面、侧面）
- [ ] 叠加：关键形态要点（箭头、文字）
- [ ] 慢动作选项
- [ ] 可暂停/重播
- [ ] 轻量级（每个视频 < 5MB）

**内容要求**：
- 专业教练演示
- 良好照明、纯色背景
- 高清质量（最低 1080p）

---

#### 功能 4：实时形态检查（5 个动作）
**描述**：计算机视觉检测用户执行动作并给出形态反馈

**用户故事**：
_作为做深蹲的用户，我想让应用告诉我形态是否正确，以便避免受伤并获得效果。_

**验收标准**：
- [ ] 适用于 5 个动作：深蹲、俯卧撑、平板支撑、弓步蹲、臀桥
- [ ] 请求摄像头权限
- [ ] 实时姿态检测（< 100 毫秒延迟）
- [ ] 叠加：骨架可视化
- [ ] 反馈：绿色勾号（形态好）或红色 X + 提示（形态差）
- [ ] 音频反馈选项（语音提示）
- [ ] 在移动和桌面上工作
- [ ] 最低准确率：85%（与专业教练评估相比）

**技术规格**：
- 前端：MediaPipe 库（TensorFlow.js）
- 检测 33 个身体标志点
- 计算关节角度
- 基于规则的检查：
  - 深蹲：膝盖角度 70-110°，背部角度 < 45°
  - 俯卧撑：底部肘部角度 70-90°
  - 平板支撑：臀部-肩部-脚踝对齐 ±10°
- 无服务器端处理（客户端运行，保护隐私 + 速度）

**边缘情况**：
- 光线不佳：显示"改善光线"消息
- 人不完全可见：显示"后退一步"消息
- 多人：显示"画面中只能有一人"

---

#### 功能 5：训练追踪与进度
**描述**：记录完成的训练并可视化进度

**用户故事**：
_作为完成训练的用户，我想看到我的进度，以便保持动力。_

**验收标准**：
- [ ] 一键"完成训练"按钮
- [ ] 追踪：日期、时长、完成的动作、组数/次数
- [ ] 仪表板显示：
  - 当前周连续
  - 完成的总训练次数
  - 进度图表（训练次数/周）
  - 下次训练预览
- [ ] 成就/徽章（5 次训练、10 次训练等）
- [ ] 可标记训练为"太简单"或"太难" → 调整下次计划

**技术规格**：
- POST /api/workout/complete
- 图表：Chart.js
- 数据保留：6 个月

---

### 4.2 应该有（MVP 后，第 4-6 个月）

#### 功能 6：语音指导
- 训练期间的实时音频提示
- "还有 3 次"、"继续"、"休息"
- 激励性短语

#### 功能 7：扩展的运动库
- 50+ 个动作
- 设备变化（哑铃、弹力带）

#### 功能 8：营养指导
- 基础卡路里计算器
- 宏量营养素建议
- 餐食想法（非餐食计划）

#### 功能 9：休息日优化
- 主动恢复建议
- 灵活性练习
- 睡眠/水分追踪

---

### 4.3 可以有（第 3 阶段，第 7 个月+）

#### 功能 10：AR 形态叠加
- 增强现实叠加显示理想形态
- Apple ARKit / Google ARCore

#### 功能 11：社交功能
- 训练伙伴
- 排行榜
- 分享成就

#### 功能 12：可穿戴设备集成
- Apple Watch / Fitbit 同步
- 心率监控

---

### 4.4 不会有（明确超出范围）

- ❌ 送餐服务
- ❌ 设备销售
- ❌ 直播团体课程
- ❌ 与教练直接消息
- ❌ 专业训练（如马拉松准备、健美）

---

## 5. 用户流程

### 5.1 首次用户流程
```
1. 登陆主页
2. 点击"开始免费试用"（无需信用卡）
3. 引导（5 个问题，3 分钟）
4. 生成训练计划（加载：5 秒）
5. 查看"你的计划"仪表板
6. 点击"开始今天的训练"
7. 授予摄像头权限
8. 进行训练（25 分钟）
9. 完成 → 庆祝屏幕
10. 查看进度仪表板
```

### 5.2 回访用户流程
```
1. 打开应用（自动登录）
2. 看到仪表板：下次训练、连续、进度
3. 点击"开始训练"
4. 逐个动作流程
5. 完成 → 更新进度
```

---

## 6. 成功指标

### 6.1 北极星指标
**每周活跃训练（WAW）**：每个活跃用户每周完成的训练次数

**目标**：3+ WAW
**理由**：每周 3 次是获得健身效果的最低要求；与留存率相关

### 6.2 关键绩效指标（KPI）

**获取**：
- 注册数/周：100+（第 1 个月），500+（第 3 个月）
- 试用转付费转化率：> 25%

**激活**：
- 完成引导：> 90%
- 完成首次训练：> 70%

**留存**：
- 第 7 天：> 40%
- 第 30 天：> 25%
- 第 3 个月：> 15%

**参与度**：
- WAW：3+
- 训练完成率：> 70%（开始 → 结束）
- 形态检查使用率：> 60% 的动作

**收入**：
- MRR（月度经常性收入）：第 3 个月达到 $5,000
- ARPU（每用户平均收入）：$10/月
- LTV/CAC > 3

**质量**：
- 形态纠正准确率：> 85%（vs 私教验证）
- NPS（净推荐值）：> 50
- App Store 评分：> 4.5 星

### 6.3 需追踪的分析事件

**用户事件**：
- 用户注册
- 引导完成
- 训练计划生成
- 训练开始
- 动作完成
- 训练完成
- 形态检查使用
- 反馈给出（太简单/太难）
- 订阅购买

**技术事件**：
- 形态检查准确率（每个动作）
- 摄像头错误率
- 加载时间（训练计划生成）
- 崩溃报告

---

## 7. 技术要求

### 7.1 性能
- **页面加载**：< 2 秒
- **训练计划生成**：< 5 秒
- **形态检查延迟**：< 100 毫秒
- **视频加载**：< 3 秒（渐进式加载）
- **99.9% 正常运行时间**

### 7.2 浏览器/设备支持
- **Web**：Chrome、Safari、Firefox（最新 2 个版本）
- **移动 Web**：iOS Safari、Chrome Android
- **屏幕尺寸**：320px - 2560px 宽度
- **未来**：原生移动应用（iOS/Android）

### 7.3 安全性
- 仅 HTTPS
- JWT 认证
- 不存储信用卡信息（使用 Stripe）
- 摄像头访问：请求权限，解释用途
- 静态数据加密

### 7.4 隐私
- 符合 GDPR
- 不出售用户数据
- 摄像头流：绝不上传到服务器（客户端处理）
- 用户可删除账户 + 所有数据

### 7.5 可访问性
- 符合 WCAG 2.1 AA
- 支持屏幕阅读器
- 键盘导航
- 高对比度模式

---

## 8. 设计指南

### 8.1 设计原则
1. **激励性**：庆祝每一个胜利，使用积极语言
2. **清晰**：简单指示，无健身术语
3. **可信赖**：专业、科学支持的指导
4. **高效**：快速开始训练，最少点击

### 8.2 视觉风格
- **颜色**：
  - 主色：活力橙 (#FF6B35)
  - 次色：深蓝 (#004E89)
  - 成功：绿色 (#06D6A0)
  - 警告：黄色 (#F7B32B)
- **字体**：Poppins（标题）、Inter（正文）
- **图像**：真实的人、多元化、充满活力、真实

### 8.3 关键屏幕
1. 仪表板：今天的训练、连续计数器、进度图表
2. 训练进行中：大号动作名称、次数计数器、形态检查叠加
3. 完成：庆祝动画、统计数据、下次训练预览

---

## 9. 商业化

### 9.1 定价
- **免费试用**：7 天，完全访问
- **月费**：$9.99/月
- **年费**：$79.99/年（33% 折扣 = $6.66/月）

### 9.2 免费 vs 付费

**免费（试用）**：
- 所有 MVP 功能
- 限 7 天

**付费（试用后必须）**：
- 无限访问
- 每 4 周新训练
- 进度历史（vs 仅 1 周）
- 优先支持

**未来高级层级（$19.99/月）**：
- 营养计划
- 高级动作
- 1 对 1 私教视频检查（异步）

---

## 10. 发布计划

### 10.1 时间表

**第 1 个月（设计 + 核心开发）**：
- 第 1-2 周：设计原型（Figma）
- 第 3-4 周：前端框架 + 后端 API 设置

**第 2 个月（开发）**：
- 第 5-6 周：引导、训练计划生成器、运动数据库
- 第 7-8 周：形态检查（MVP 5 个动作）、视频库

**第 3 个月（优化 + 发布）**：
- 第 9-10 周：进度追踪、测试、Bug 修复
- 第 11 周：Beta 测试（50 名用户）
- 第 12 周：发布！🚀

### 10.2 Beta 测试
- 招募 50 名 beta 测试者（朋友、健身社区）
- 标准：健身新手、愿意提供反馈
- 测试：Bug、形态检查准确性、用户体验
- 奖励：免费 3 个月订阅作为交换

### 10.3 发布渠道
- Product Hunt
- Reddit（r/fitness、r/bodyweightfitness）
- Instagram/TikTok（演示视频）
- App Store / Google Play
- 落地页 + SEO（Google Ads）

---

## 11. 风险与缓解

| 风险 | 可能性 | 影响 | 缓解措施 |
|------|--------|------|----------|
| 形态检查准确率低 | 中 | 高 | 与私教验证，迭代算法 |
| 用户受伤 | 低 | 严重 | 免责声明、专注形态、私教内容审核 |
| 留存率低（训练无聊） | 中 | 高 | A/B 测试训练风格，增加多样性 |
| 隐私顾虑（摄像头） | 中 | 中 | 清晰消息、客户端处理 |
| 竞争（大型玩家） | 高 | 中 | 专注细分市场（新手）、个性化 |
| 技术复杂性延迟发布 | 中 | 中 | 从简单形态检查开始，后续扩展 |

---

## 12. 待解决问题

- [ ] 是否支持离线模式？（下载计划）
- [ ] 语音指导在 MVP 中还是之后？
- [ ] 最小可行运动库大小？（当前：20）
- [ ] 与 MyFitnessPal/Apple Health 集成？

---

## 13. 附录

### 13.1 运动列表（MVP）

**有形态检查**（5 个）：
1. 自重深蹲
2. 俯卧撑
3. 平板支撑
4. 弓步蹲（向前）
5. 臀桥

**无形态检查**（10 个）：
6. 开合跳
7. 高抬腿
8. 登山者
9. 波比跳
10. 举腿
11. 超人式
12. 侧平板支撑
13. 靠墙静蹲
14. 提踵
15. 手臂环绕

---

**文档状态**：✅ 准备审核
**下一步**：架构设计（*architect）

---

PM：本 PRD 现已完成！

你想要：
A) 审核/修改任何部分
B) 进入架构设计（*architect）
C) 导出此文档

输入你的选择。
```

✅ **PM 阶段完成！你现在有了完整的 PRD。**

---

### 4.3 使用 Architect 代理设计架构

#### **步骤 1：切换到 Architect 代理**

```
你：B，进入架构设计

*architect
```

**Architect 响应**：
```
🏗️ 架构模式已激活

我已经审阅了 FitAI Coach 的 PRD。我将设计一个可扩展、成本效益高的架构，支持：

- 实时形态检查（客户端）
- AI 训练计划生成
- 用户数据管理
- 视频交付
- 支付处理

让我先澄清几个技术决策：

1. **摄像头处理**：客户端（MediaPipe）vs 服务器端？
   我的建议：客户端（隐私 + 无延迟）

2. **视频托管**：自托管 vs CDN（Cloudflare/Vimeo）？
   我的建议：Vimeo（更简单）→ 之后迁移到 CDN

3. **数据库**：仅 PostgreSQL vs + Redis 缓存？
   我的建议：PostgreSQL + Redis（性能）

你同意这些决策，还是想讨论？
```

#### **步骤 2：确认技术决策**

```
你：我同意这些决策。请继续完整架构设计。
```

（由于架构文档会非常长，我在实际实施中会让 Architect 生成完整文档，这里简化说明）

**Architect 会生成**：
- 系统架构图
- 技术栈选择（前端、后端、数据库、AI/ML、基础设施）
- 数据模型（用户、锻炼计划、进度等表结构）
- API 设计（所有端点规范）
- 第三方集成（Stripe、Vimeo、MediaPipe）
- 性能优化策略
- 安全考虑
- 成本估算

✅ **Architect 阶段完成！你现在有了完整的技术架构。**

---

### 4.4 使用 Scrum Master 生成开发故事

#### **步骤 1：切换到 Scrum Master**

```
你：架构看起来不错。现在生成开发故事。

*scrum
```

**Scrum Master 响应**：
```
📝 Scrum Master 模式已激活

我将把 PRD 和架构分解为开发故事。

基于 PRD，我将创建以下故事：
- Sprint 1：项目设置、后端基础、数据库
- Sprint 2：AI 训练计划生成器、运动数据库
- Sprint 3：前端 - 引导、仪表板
- Sprint 4：形态检查（5 个动作）
- Sprint 5：进度追踪、支付
- Sprint 6：测试、优化、发布准备

总计：~45-60 个故事，跨越 6 个 sprint（12 周）

现在我将在 .bmad/stories/ 中生成故事文件

[生成故事中...]

✅ 在 .bmad/stories/ 中生成了 52 个故事

创建的故事文件：
- sprint-01/story-001-project-setup.md
- sprint-01/story-002-backend-api-foundation.md
- sprint-01/story-003-database-setup.md
...
- sprint-04/story-023-form-check-squat.md
...

每个故事包含：
- 完整上下文（PRD + 架构引用）
- 详细实施步骤
- 代码示例
- 验收标准
- 测试用例

准备好开发了！打开你的 IDE 并从 story-001 开始。
```

✅ **规划阶段全部完成！**

现在你有：
1. ✅ Project Brief（Analyst）
2. ✅ 完整 PRD（PM）
3. ✅ 系统架构文档（Architect）
4. ✅ 52 个开发故事文件（Scrum Master）

---

## 第 5 章：开发阶段实战（阶段 2）

规划完成后，现在切换到 IDE 进行实际开发。

### 5.1 故事文件结构详解

打开 `.bmad/stories/sprint-01/story-001-project-setup.md`：

```markdown
# Story 001: Project Setup and Repository Initialization

## 📋 Metadata
- **Sprint**: 1
- **Story Points**: 2
- **Priority**: Critical (Must complete first)
- **Assignee**: Dev Agent
- **Status**: Ready for Development

## 🎯 Context

**Project**: FitAI Coach - AI Personal Fitness Trainer
**Related Documents**:
- PRD: `docs/prd.md`
- Architecture: `docs/architecture.md`

**Background**:
This is the foundation story. We need to set up the monorepo structure that supports:
- React frontend (Web app)
- Python FastAPI backend (API + AI logic)
- Shared docs and configs

**Architectural Decision** (from architecture.md):
- Monorepo structure using pnpm workspaces (frontend) + Poetry (backend)
- Git + GitHub for version control
- Docker for containerization

## 📝 User Story
_As a developer, I want a well-structured project repository, so that the team can collaborate efficiently._

## ✅ Acceptance Criteria
- [ ] Git repository initialized
- [ ] Monorepo structure created with frontend/ and backend/ folders
- [ ] README.md with project overview
- [ ] .gitignore configured for Node.js and Python
- [ ] Backend: Poetry initialized with Python 3.11+
- [ ] Frontend: React + TypeScript initialized with Vite
- [ ] Docker Compose file for local development
- [ ] All dependencies install successfully
- [ ] Can run "Hello World" from both frontend and backend

## 🛠 Implementation Steps

### Step 1: Initialize Git Repository

```bash
# Create project directory
mkdir fitai-coach
cd fitai-coach

# Initialize Git
git init
git branch -M main

# Create initial README
cat > README.md << 'EOF'
# FitAI Coach

AI-powered personal fitness trainer providing personalized workouts and real-time form correction.

## Project Structure
- `frontend/` - React web application
- `backend/` - Python FastAPI API
- `docs/` - Documentation (PRD, Architecture, etc.)

## Getting Started
See [Development Guide](docs/development.md)
EOF

# First commit
git add README.md
git commit -m "Initial commit"
```

### Step 2: Create Project Structure

```bash
# Create directory structure
mkdir -p frontend backend docs scripts .github/workflows

# Create docs
touch docs/prd.md docs/architecture.md docs/development.md
```

### Step 3: Setup Backend (Python + FastAPI)

```bash
cd backend

# Initialize Poetry
poetry init --name fitai-backend --python "^3.11" --no-interaction

# Add dependencies
poetry add fastapi uvicorn sqlalchemy asyncpg redis pydantic pydantic-settings

# Add dev dependencies
poetry add --group dev pytest pytest-asyncio black isort mypy

# Create basic structure
mkdir -p app/{routes,models,services,utils}
touch app/__init__.py
touch app/main.py
touch app/config.py

# Create main.py
cat > app/main.py << 'EOF'
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="FitAI Coach API",
    version="1.0.0",
    description="AI Personal Fitness Trainer API"
)

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],  # Vite dev server
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "FitAI Coach API", "status": "running"}

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
EOF

# Create .env.example
cat > .env.example << 'EOF'
# Database
DATABASE_URL=postgresql://user:password@localhost:5432/fitai

# Redis
REDIS_URL=redis://localhost:6379/0

# OpenAI
OPENAI_API_KEY=your_key_here

# JWT
JWT_SECRET_KEY=your_secret_key
EOF

cd ..
```

### Step 4: Setup Frontend (React + TypeScript + Vite)

```bash
cd frontend

# Create Vite React TypeScript project
npm create vite@latest . -- --template react-ts

# Install dependencies
npm install

# Install additional packages
npm install @tanstack/react-query axios zustand react-router-dom

# Create basic structure
mkdir -p src/{components,pages,services,hooks,store,types,utils}

# Update src/App.tsx
cat > src/App.tsx << 'EOF'
import { useState, useEffect } from 'react'
import './App.css'

function App() {
  const [apiStatus, setApiStatus] = useState('Checking...')

  useEffect(() => {
    fetch('http://localhost:8000/health')
      .then(res => res.json())
      .then(data => setApiStatus(data.status))
      .catch(() => setApiStatus('API not reachable'))
  }, [])

  return (
    <div className="App">
      <h1>FitAI Coach</h1>
      <p>Your AI Personal Trainer</p>
      <p>API Status: {apiStatus}</p>
    </div>
  )
}

export default App
EOF

cd ..
```

### Step 5: Setup Docker Compose

```bash
# Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  postgres:
    image: postgres:15-alpine
    environment:
      POSTGRES_USER: fitai
      POSTGRES_PASSWORD: fitai_dev_password
      POSTGRES_DB: fitai
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data

  backend:
    build: ./backend
    command: poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
    ports:
      - "8000:8000"
    volumes:
      - ./backend:/app
    env_file:
      - ./backend/.env
    depends_on:
      - postgres
      - redis

  frontend:
    build: ./frontend
    command: npm run dev -- --host
    ports:
      - "5173:5173"
    volumes:
      - ./frontend:/app
      - /app/node_modules
    depends_on:
      - backend

volumes:
  postgres_data:
  redis_data:
EOF
```

### Step 6: Create .gitignore

```bash
cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*.egg-info/
.venv/
.env

# Node
node_modules/
dist/
.DS_Store

# IDEs
.vscode/
.idea/
*.swp

# Docker
.dockerignore

# Logs
*.log
EOF
```

### Step 7: Create Development Scripts

```bash
mkdir -p scripts

# Create start script
cat > scripts/dev.sh << 'EOF'
#!/bin/bash
echo "Starting FitAI Coach Development Environment..."
docker-compose up -d postgres redis
cd backend && poetry run uvicorn app.main:app --reload &
cd frontend && npm run dev &
wait
EOF

chmod +x scripts/dev.sh
```

## 🧪 Testing Instructions

### Test Backend
```bash
cd backend
poetry install
poetry run uvicorn app.main:app --reload
# Visit http://localhost:8000/docs (should see Swagger UI)
```

### Test Frontend
```bash
cd frontend
npm install
npm run dev
# Visit http://localhost:5173 (should see "FitAI Coach")
```

### Test Full Stack
```bash
docker-compose up
# Frontend: http://localhost:5173
# Backend API: http://localhost:8000
# API Docs: http://localhost:8000/docs
```

## 📦 Deliverables
- [x] Git repo with proper structure
- [x] Backend with FastAPI hello world
- [x] Frontend with React hello world
- [x] Docker Compose for databases
- [x] All dependencies documented

## ⏱ Estimated Time
1-2 hours

## 🔗 Dependencies
None (first story)

## 📚 Related Stories
- Story 002: Database setup and models
- Story 003: Backend API authentication

## 📌 Notes for Dev Agent
- Make sure Python 3.11+ is installed
- Node.js 18+ required
- Docker Desktop must be running for database setup
- If Docker not available, can use local PostgreSQL/Redis

---

**Story Status**: ✅ Ready for Implementation
**Next**: Open in Claude Code and say "Implement story-001"
```

**故事文件的关键组成部分**：
1. **📋 Metadata**：故事信息（Sprint、优先级、状态）
2. **🎯 Context**：完整上下文（项目、文档引用、架构决策）
3. **✅ Acceptance Criteria**：验收标准（清晰的完成定义）
4. **🛠 Implementation Steps**：详细实现步骤（包含代码示例）
5. **🧪 Testing Instructions**：测试方法
6. **⏱ Estimated Time**：时间估算
7. **🔗 Dependencies**：依赖其他故事

**为什么故事文件如此详细？**
→ **消除上下文丢失**：Dev 代理读取后，无需再问任何背景问题，直接实现。

---

### 5.2 在 Claude Code 中使用故事文件

#### **步骤 1：打开项目**

在终端中：
```bash
cd /Users/victorsim/Desktop/Projects/Adaptive_learning_v1.0/fitai-coach
code .  # 或 cursor .
```

#### **步骤 2：启动 Claude Code**

在 IDE 中打开 Claude Code 面板

#### **步骤 3：让 Dev 代理读取故事**

在 Claude Code 对话框中输入：

```
请实现 .bmad/stories/sprint-01/story-001-project-setup.md 中的任务
```

**Claude Code（Dev 代理）响应**：

```
我已读取 story-001。这是项目初始化任务，我会按照故事中的步骤执行：

1. 初始化 Git 仓库
2. 创建项目结构
3. 设置后端（Python + FastAPI + Poetry）
4. 设置前端（React + TypeScript + Vite）
5. 配置 Docker Compose
6. 创建 .gitignore 和开发脚本

开始实施...

[Claude Code 开始自动执行所有步骤]
```

**Claude Code 会自动**：
- 读取文件
- 创建目录结构
- 生成配置文件
- 安装依赖
- 运行测试命令
- 验证结果

#### **步骤 4：验证完成**

Claude Code 完成后会显示：

```
✅ Story 001 实现完成！

已完成：
- ✅ Git 仓库初始化
- ✅ 项目结构创建
- ✅ 后端 FastAPI 设置（Poetry + 依赖）
- ✅ 前端 React + TypeScript 设置（Vite）
- ✅ Docker Compose 配置
- ✅ .gitignore 创建
- ✅ 开发脚本创建

测试结果：
- ✅ 后端启动成功（http://localhost:8000）
- ✅ 前端启动成功（http://localhost:5173）
- ✅ API 健康检查通过
- ✅ 前端可以调用后端 API

下一个故事：story-002-database-setup.md

要继续吗？
```

#### **步骤 5：继续下一个故事**

```
你：是的，继续 story-002

Claude Code：
我已读取 story-002-database-setup.md

这个故事要求：
- 设置 PostgreSQL 数据库连接
- 创建 SQLAlchemy 模型（User、WorkoutPlan、Exercise 等）
- 设置 Alembic 数据库迁移
- 创建数据库初始化脚本

开始实施...
```

**这个流程会一直持续，直到完成所有 52 个故事！**

---

### 5.3 QA 代理验证

在每个故事完成后，Claude Code 会自动进行 QA 验证：

```
QA Agent: 验证 Story 001

测试内容：
1. ✅ 项目结构符合架构文档
2. ✅ 后端依赖正确安装
3. ✅ 前端依赖正确安装
4. ✅ API 端点响应正确
5. ✅ 前端可以连接后端
6. ✅ Docker Compose 配置正确

发现的问题：
- ⚠️  后端 CORS 配置缺少生产环境域名
- ⚠️  .env.example 缺少部分变量说明

建议修复：
1. 在 CORS allow_origins 添加生产域名环境变量
2. 完善 .env.example 注释

是否修复这些问题？
```

你可以选择：
- 立即修复
- 标记为技术债务，稍后处理
- 忽略（如果不重要）

---

## 第 6 章：完整实战案例

让我们用一个简单的案例，完整走一遍 BMAD 流程。

### 案例：构建一个 AI 待办事项助手

**需求描述**：
一个智能待办事项应用，AI 可以：
- 根据用户的自然语言描述，自动拆分任务
- 智能推荐任务优先级
- 根据截止日期和重要性，生成每日计划

**目标**：学习 BMAD 完整流程，30 分钟内完成规划，3 天内开发完 MVP。

---

### 6.1 Analyst 阶段（5 分钟）

**你在 Gemini Gem 中**：

```
*analyst

我想做一个智能待办事项应用。

背景：
- 传统 TODO 应用（Todoist、Tick Tick）功能齐全，但添加任务很机械
- 需要手动拆分大任务
- 不智能推荐优先级

我的想法：
- 用户用自然语言描述任务，例如"下周前完成季度报告"
- AI 自动拆分成子任务："收集数据"、"分析趋势"、"撰写报告"、"审核修改"
- AI 根据截止日期、重要性，每天早上生成"今日计划"

目标用户：
- 知识工作者（产品经理、程序员、设计师）
- 任务繁多，需要智能规划

不确定：
- 用户是否真的需要 AI 拆分任务？（或许他们更喜欢自己控制）
- 技术上，GPT-4 能否准确理解任务并拆分？
```

**Analyst 分析**（简化版）：

```
📋 PROJECT BRIEF - AI TODO Assistant

## 核心问题
知识工作者面临任务管理混乱：
1. 大任务不知从何下手
2. 优先级判断困难
3. 时间分配不合理

## 你的解决方案
AI 驱动的任务规划：
- 自然语言输入 → AI 拆分子任务
- 智能优先级推荐
- 每日计划自动生成

## 市场机会
- 竞品：Todoist、Notion、TickTick（功能丰富但不智能）
- 差异化：AI 拆分 + 智能规划（类似 Motion 但更简单）

## 技术可行性
✅ 可行：
- GPT-4 任务拆分准确率 > 90%
- RAG 结合用户历史，提升个性化

## 用户验证建议
- 访谈 15 个目标用户
- 问：你最大的任务管理痛点是什么？
- 测试：给 5 个任务，让 GPT-4 拆分，看用户满意度

## 下一步
Type *pm 生成 PRD
```

---

### 6.2 PM 阶段（10 分钟）

```
*pm

基于 Analyst 的分析，请定义 MVP 需求
```

**PM 生成 PRD**（简化版）：

```markdown
## MVP 功能（2-3 周开发）

### Must Have
1. **自然语言任务输入**
   - 输入："下周五前完成产品 PRD"
   - AI 解析：任务名、截止日期、优先级

2. **AI 任务拆分**
   - 用户点击"拆分任务"
   - AI 生成 3-5 个子任务
   - 用户可编辑、删除子任务

3. **智能每日计划**
   - 每天早上 9 点，AI 生成"今日计划"
   - 基于：截止日期、优先级、预估时间
   - 显示：今天应该完成哪些任务

4. **基础任务管理**
   - 添加、编辑、删除任务
   - 标记完成
   - 查看所有任务列表

### Should Have（Phase 2）
5. 日历集成（Google Calendar）
6. 任务标签和分类
7. 重复任务

### Won't Have
- ❌ 团队协作
- ❌ 文件附件
- ❌ 时间追踪

## 成功指标
- 用户日活 > 1 次
- AI 拆分满意度 > 80%
- Day 7 留存 > 50%
```

---

### 6.3 Architect 阶段（10 分钟）

```
*architect

基于 PRD，设计系统架构
```

**Architect 设计**（简化版）：

```markdown
## 技术栈

**前端**：React + TypeScript + Tailwind CSS
**后端**：Python FastAPI
**数据库**：PostgreSQL（任务数据） + Redis（缓存）
**AI**：OpenAI GPT-4（任务拆分和规划）

## 系统架构

```
用户 → React Web App
         ↓
     FastAPI Backend
         ↓
    ┌────┴────┐
GPT-4 API   PostgreSQL
```

## 数据模型

**Task 表**：
- id, user_id, title, description
- deadline, priority (1-5)
- parent_task_id (for subtasks)
- status (todo/in_progress/done)
- created_at, completed_at

## API 设计

- POST /api/tasks - 创建任务（自然语言输入）
- POST /api/tasks/{id}/split - AI 拆分任务
- GET /api/daily-plan - 获取今日计划
- GET /api/tasks - 获取所有任务
- PATCH /api/tasks/{id} - 更新任务状态
```

---

### 6.4 Scrum Master 阶段（5 分钟）

```
*scrum

生成开发故事
```

**Scrum Master 生成**：

```
✅ 已生成 12 个开发故事：

Sprint 1（Week 1）:
- Story 001: 项目搭建
- Story 002: 数据库和模型
- Story 003: 用户认证（简单版）
- Story 004: 任务 CRUD API

Sprint 2（Week 2）:
- Story 005: AI 任务拆分功能
- Story 006: AI 每日计划生成
- Story 007: 前端 - 任务输入界面
- Story 008: 前端 - 任务列表展示

Sprint 3（Week 3）:
- Story 009: 前端 - AI 拆分交互
- Story 010: 前端 - 每日计划界面
- Story 011: 测试和 Bug 修复
- Story 012: 部署上线

Ready for development! Start with story-001.
```

---

### 6.5 开发阶段（Claude Code）

在 Claude Code 中：

```
你：请按顺序实现 .bmad/stories/ 中的所有故事，从 story-001 开始

Claude Code：
好的，我会逐个实现所有 12 个故事。

[30分钟后...]

✅ 所有故事已完成！

项目已部署到：https://ai-todo-assistant.vercel.app

功能验证：
- ✅ 用户可以输入自然语言任务
- ✅ AI 成功拆分任务（测试了 20 个任务，准确率 92%）
- ✅ 每日计划生成正常
- ✅ 所有 CRUD 功能正常

下一步：邀请 beta 测试用户
```

✅ **完整案例完成！从想法到上线，3 天 MVP。**

---

## 第 7 章：高级技巧

### 7.1 如何与代理有效沟通

#### **技巧 1：提供上下文，而非指令**

❌ **不好的提问**：
```
帮我设计一个 App
```

✅ **好的提问**：
```
*analyst

我想做一个 [领域] 的应用。

背景：
- [用户痛点]
- [现有解决方案的不足]

我的想法：
- [核心功能]
- [差异化优势]

目标用户：
- [用户画像]

不确定的地方：
- [具体疑问]
```

#### **技巧 2：迭代对话，而非一次性完成**

与代理对话是**迭代过程**，不要期待一次就完美：

```
第 1 轮：获取初步分析
你：[提供基本想法]
Analyst：[分析 + 建议]

第 2 轮：深化细节
你：[针对某个点深入提问]
Analyst：[更详细的分析]

第 3 轮：调整方向
你：[基于分析调整想法]
Analyst：[更新分析]
```

#### **技巧 3：主动引导代理关注重点**

```
你：*pm

请生成 PRD，但我特别关注：
1. MVP 功能范围（需要控制在 4 周内完成）
2. 技术复杂度（我是独立开发者，技术栈要简单）
3. 成本控制（每月预算 < $100）

请在 PRD 中重点考虑这些约束。
```

---

### 7.2 如何优化输出质量

#### **技巧 1：提供参考文档**

```
*pm

请生成 PRD，参考以下优秀 PRD 的结构：
[粘贴一个你喜欢的 PRD 示例]

我希望输出的 PRD 采用类似的格式和详细程度。
```

#### **技巧 2：明确输出格式**

```
*architect

请生成架构文档，包含以下章节：
1. 技术栈选择（表格对比 3 个方案）
2. 系统架构图（Mermaid 格式）
3. 数据模型（SQL DDL）
4. API 设计（OpenAPI 规范）
5. 成本估算（按模块分解）

每个章节都要详细，不要省略。
```

#### **技巧 3：要求代理自我审查**

```
*pm

PRD 生成后，请自我审查：
1. 是否所有 Must Have 功能都有明确的验收标准？
2. 是否考虑了技术复杂度和开发时间？
3. 是否定义了可衡量的成功指标？
4. 是否遗漏了重要的非功能需求（性能、安全）？

如有不足，请主动补充。
```

---

### 7.3 多轮迭代最佳实践

#### **实践 1：分阶段深入**

不要期待第一次就完美，采用**渐进式细化**：

```
Round 1（广度）：
*analyst → 获取整体概览

Round 2（深度）：
你：*analyst，我想深入讨论 [某个方面]
Analyst → 深度分析该方面

Round 3（调整）：
你：基于你的分析，我调整想法为 [新方向]
Analyst → 更新分析
```

#### **实践 2：跨代理对话**

善用 Orchestrator 协调代理：

```
你：#bmad-orchestrator

我在 PM 阶段，但发现 Analyst 的需求分析不够深入。
我是否应该回到 Analyst 重新分析？还是直接在 PM 中调整？

Orchestrator：
建议回到 Analyst：
- 如果核心用户画像或痛点理解有误
- 如果市场定位不清晰

可以在 PM 中调整：
- 如果只是功能范围调整
- 如果是技术实现细节变更

你的情况是？
```

---

### 7.4 与 Claude Code 的深度集成

#### **技巧 1：故事文件定制**

你可以要求 Scrum Master 定制故事格式：

```
*scrum

生成故事时，请为每个故事添加：
1. 预计开发时间（以小时为单位）
2. 潜在风险和缓解措施
3. 相关的 GitHub Issues 链接格式
4. 代码审查检查清单

这样 Dev 代理可以更高效工作。
```

#### **技巧 2：故事之间的依赖管理**

```
在 Claude Code 中：

你：显示 story-005 的所有依赖故事

Claude Code：
Story 005: AI 任务拆分功能

依赖：
- ✅ Story 001: 项目搭建（已完成）
- ✅ Story 002: 数据库模型（已完成）
- ✅ Story 004: 任务 CRUD API（已完成）
- ⚠️  Story 003: 用户认证（进行中）

建议：等待 Story 003 完成后再开始 Story 005
```

#### **技巧 3：批量处理故事**

```
在 Claude Code 中：

你：请批量实现 Sprint 1 的所有故事（story-001 到 story-004）

Claude Code：
我会按依赖顺序实施：

1. Story 001（无依赖）→ 预计 60 分钟
2. Story 002（依赖 001）→ 预计 90 分钟
3. Story 003（依赖 002）→ 预计 120 分钟
4. Story 004（依赖 002, 003）→ 预计 150 分钟

总预计时间：6.5 小时

开始执行？（你可以离开电脑，我会自动完成并记录）
```

---

## 第 8 章：常见问题排查

### 8.1 安装问题

#### **问题 1：Node.js 版本过低**

**错误信息**：
```
Error: BMAD-METHOD requires Node.js v20 or higher
```

**解决方法**：
```bash
# 检查当前版本
node --version

# 升级 Node.js（Mac）
brew install node

# 或使用 nvm
nvm install 20
nvm use 20
```

#### **问题 2：npm install 失败**

**错误信息**：
```
npm ERR! code EACCES
```

**解决方法**：
```bash
# 清理 npm 缓存
npm cache clean --force

# 重新安装
npx bmad-method install

# 如果还不行，使用 sudo（不推荐，但有时必要）
sudo npx bmad-method install
```

---

### 8.2 代理不响应

#### **问题 1：Gemini Gem 返回通用回复**

**症状**：
```
你：*analyst
Gem：我可以帮你。你想知道什么？
（而不是进入 Analyst 模式）
```

**原因**：团队包文件未正确上传或系统指令错误

**解决方法**：
1. 重新创建 Gem
2. 确保系统指令正确：`Your critical operating instructions are attached, do not break character as directed`
3. 重新上传团队包文件
4. 测试：输入 `*help` 应该显示命令列表

#### **问题 2：代理角色混淆**

**症状**：
```
你：*pm
Analyst（而不是 PM）：我将分析...
```

**解决方法**：
```
你：#bmad-orchestrator

代理角色似乎混淆了，我输入 *pm 但 Analyst 在回复。

Orchestrator：会重置代理状态
```

---

### 8.3 输出质量不佳

#### **问题 1：PRD 过于简略**

**症状**：
PM 生成的 PRD 只有几段文字，缺少详细规范

**解决方法**：
```
你：这个 PRD 太简单了。请重新生成，确保包含：
- 至少 10 个功能的详细规范
- 每个功能的验收标准
- 用户故事（至少 5 个）
- 成功指标（包含具体数值目标）
- 技术要求
- 至少 3000 字

请参考标准 PRD 模板的详细程度。
```

#### **问题 2：架构设计缺少关键信息**

**解决方法**：
```
你：*architect

架构文档需要补充：
1. 数据库表结构（完整的 SQL DDL）
2. 所有 API 端点规范（包含请求/响应示例）
3. 第三方服务集成细节（API 密钥、配置）
4. 错误处理策略
5. 监控和日志方案

请详细补充这些内容。
```

---

### 8.4 故事文件无法使用

#### **问题 1：Claude Code 无法读取故事文件**

**症状**：
```
Claude Code: I cannot find the story file at .bmad/stories/story-001.md
```

**解决方法**：
```bash
# 检查文件是否存在
ls -la .bmad/stories/

# 如果不存在，重新生成
# 回到 BMAD Web UI
*scrum

请重新生成所有故事文件
```

#### **问题 2：故事文件格式错误**

**症状**：
故事文件无法解析，或 Claude Code 理解错误

**解决方法**：
```
在 BMAD Web UI：

你：*scrum

生成的故事文件格式有问题，请使用以下标准格式：

# Story [Number]: [Title]
## Context
## User Story
## Acceptance Criteria
## Implementation Steps
## Testing
## Deliverables

并确保每个章节都有详细内容。
```

---

## 附录

### 附录 A：所有命令速查表

| 命令 | 代理 | 作用 | 示例 |
|------|------|------|------|
| `*analyst` | Analyst | 启动需求分析 | `*analyst` |
| `*pm` | PM | 启动 PRD 生成 | `*pm` |
| `*architect` | Architect | 启动架构设计 | `*architect` |
| `*scrum` | Scrum Master | 生成开发故事 | `*scrum` |
| `*help` | - | 显示所有命令 | `*help` |
| `#bmad-orchestrator` | Orchestrator | 询问工作流问题 | `#bmad-orchestrator 我应该先做架构还是 PRD？` |

### 附录 B：示例对话集

#### **示例 1：与 Analyst 的完整对话**

```
你：*analyst

我想做一个 AI 驱动的个人理财助手。

背景：
- 很多人不知道自己的钱花哪了
- 记账太繁琐，坚持不下来
- 现有 App（Mint、YNAB）功能复杂，学习成本高

我的想法：
- 用户连接银行账户（Plaid API）
- AI 自动分类交易（"星巴克 $5" → "餐饮 > 咖啡"）
- AI 生成月度财务报告和建议（"你这个月外卖支出超出预算 30%"）

目标用户：
- 年轻职场人（25-35 岁）
- 月收入 $3K-$10K
- 想控制支出但懒得记账

不确定：
- 用户是否信任 AI 访问银行账户？
- AI 分类能否准确？（"Amazon $50" 可能是书也可能是电子产品）

Analyst：
📋 项目简介 - AI 个人理财助手

## 1. 问题分析

### 核心痛点
1. **认知差距**：60% 的人不知道钱花在哪里
2. **手动追踪负担**：普通人平均在 2 周内放弃手动记账
3. **复杂性障碍**：传统记账 App 有 50+ 个功能，令人不知所措

### 你的解决方案
通过以下方式实现自动化财务意识：
- 银行自动同步（无需手动输入）
- AI 驱动的交易分类
- 对话式洞察（"你这个月在餐饮上多花了 $200"）

## 2. 竞争格局

| 竞品 | 优势 | 劣势 | 你的优势 |
|------|------|------|---------|
| Mint | 免费、成熟 | 广告、隐私顾虑、UI 复杂 | 清爽的 AI 驱动体验 |
| YNAB | 最佳记账方法 | $99/年、学习曲线陡峭 | 简单、实惠 |
| Copilot | 精美设计 | 仅 iOS、$60/年 | Web + 移动端 |

**市场空白**：没有实惠、AI 驱动、简单的替代品

## 3. 用户信任分析（银行连接的关键）

### 安全要求
- SOC 2 Type II 合规
- 端到端加密
- 使用 Plaid（可信聚合器，非直接银行访问）
- 明确隐私政策："我们绝不出售你的数据"

### 建立信任策略
- 14 天免费试用（无需信用卡，仅查看模式）
- 展示："10,000+ 用户信任我们"社会证明
- 银行 logo："支持 Chase、Bank of America..."
- 解释视频：Plaid 如何工作（你看不到银行凭证）

**需要验证**：调查 50 名目标用户：
- "你会为自动追踪连接银行吗？"（预期 40-60% 会）

## 4. AI 分类可行性

### 技术方法
```
交易："AMAZON.COM $52.99"
↓
GPT-4 + 上下文（用户历史、商家数据库）
↓
分类："购物 > 电子产品"（85% 置信度）
↓
如果置信度低：询问用户一次，永久学习
```

**准确度目标**：90%+（通过 1 万笔真实交易验证）

**关键创新**：学习循环
- 用户纠正一次"Amazon → 图书"
- AI 记住未来 Amazon 购买
- 个性化分类随时间改进

## 5. MVP 范围（8 周）

### 必须有
1. ✅ 银行账户连接（Plaid）
2. ✅ AI 交易分类（10 个类别）
3. ✅ 月度支出概览（图表）
4. ✅ AI 洞察（每月 3 个关键洞察）
5. ✅ 手动纠正（点击重新分类）

### 应该有
6. 预算设置（每个类别）
7. 支出警报（"你在餐饮上超出预算"）

### 不会有
- ❌ 投资追踪
- ❌ 账单支付
- ❌ 信用评分监控

## 6. 收入模型

**定价**：
- 免费：仅查看模式（1 个银行账户、3 个月历史）
- 高级版：$5.99/月 或 $49/年
  - 无限账户
  - 无限历史
  - AI 洞察
  - 预算工具

**单位经济**：
- CAC（客户获取成本）：$15（Google/Facebook 广告）
- LTV（终身价值）：$120（20 个月平均留存 × $6/月）
- LTV/CAC = 8 ✅ 健康

## 7. 关键风险

| 风险 | 概率 | 影响 | 缓解措施 |
|------|------|------|---------|
| 低采用率（信任） | 中 | 高 | 免费试用、安全消息传递 |
| Plaid 成本过高 | 低 | 中 | $0.25/用户/月，已计入定价 |
| AI 分类不准确 | 中 | 中 | 人机协同学习，90% 目标 |
| 监管（PSD2、数据隐私） | 低 | 高 | 法律审查、SOC 2 |

## 8. 成功指标

**北极星**：同步交易的月度活跃用户（MAU）

**关键指标**：
- 试用转付费：> 25%
- 留存（第 3 个月）：> 50%
- AI 分类准确率：> 90%
- NPS：> 40

## 9. 后续步骤

✅ 简介完成。

**建议**：
1. 验证信任假设：调查 50 名用户
2. 测试 AI 分类：获取样本交易，测试准确性
3. 原型：Figma 可点击原型
4. 移交给 *pm 创建详细 PRD

给你的问题：
- 你有 Plaid API 访问权限还是需要申请？
- iOS/Android/Web 优先级？
- 独立创始人还是团队？
```

---

### 附录 C：输出模板示例

（由于篇幅限制，这里提供模板链接位置，实际模板在 BMAD 安装后可在 `.bmad/templates/` 找到）

**可用模板**：
- PRD 模板：`.bmad/templates/prd-template.md`
- 架构文档模板：`.bmad/templates/architecture-template.md`
- 用户故事模板：`.bmad/templates/user-story-template.md`
- API 规范模板：`.bmad/templates/api-spec-template.md`

---

### 附录 D：社区资源

#### **官方资源**
- 📖 [GitHub 仓库](https://github.com/bmad-code-org/BMAD-METHOD)
- 📺 [YouTube 频道](https://www.youtube.com/@bmadcode)
- 💬 [Discord 社区](链接在 GitHub README 中)

#### **学习资源**
- BMAD 官方文档：`docs/` 目录
- User Guide：完整的使用指南
- Core Architecture：系统设计理念

#### **获取帮助**
- Discord：实时问答
- GitHub Issues：Bug 报告和功能请求
- GitHub Discussions：使用讨论和最佳实践分享

---

## 🎉 恭喜完成教程！

你现在已经掌握了 BMAD-METHOD 的完整使用流程，从想法验证到 MVP 上线。

**下一步**：
1. 尝试用 BMAD 规划你的第一个项目
2. 在 Claude Code 中实施开发
3. 加入社区分享经验

**祝你开发顺利！** 🚀

---

**文档结束**
