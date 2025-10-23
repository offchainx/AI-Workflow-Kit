# BMAD-METHOD 完全使用指南 - 从零到精通

## 📌 文档信息
- **版本**：v1.0
- **创建日期**：2025-10-23
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
🔍 Analyst Mode Activated

I'm your requirements analyst. I'll help you understand:
- The problem you're solving
- Your target users
- Market opportunities
- Technical feasibility

Please describe your project idea in as much detail as possible.
What problem are you trying to solve?
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
📋 PROJECT BRIEF - AI Fitness Coach

## 1. PROBLEM ANALYSIS

### Core Problem
Traditional fitness coaching faces three barriers:
1. **Cost Barrier**: Personal trainers cost $50-150/hour
2. **Access Barrier**: Limited availability, gym required
3. **Personalization Gap**: Generic workout apps lack individual adaptation

### Your Solution
AI-powered personal fitness coach providing:
- Personalized workout planning
- Real-time form correction
- Adaptive training progression
- Fraction of the cost (<$10/month vs $400/month for PT)

## 2. TARGET USER DEEP DIVE

### Primary Persona: "Fitness Newbie Noah"
- Age: 25
- Occupation: Software developer
- Pain Points:
  - Intimidated by gyms
  - Tried YouTube workouts, but inconsistent
  - Wants guidance but can't afford PT
- Goals: Lose 10kg, build basic strength
- Budget: <$15/month

### Secondary Persona: "Busy Parent Sarah"
- Age: 32
- Limited time (30 min/day max)
- Home workout preferred
- Previous injury concerns

## 3. TECHNICAL FEASIBILITY ANALYSIS

### Movement Recognition
✅ **Feasible**:
- Use MediaPipe / TensorFlow.js for pose estimation
- 30+ key body points detection in real-time
- Accuracy: 85-95% for common exercises

⚠️ **Challenges**:
- Requires good camera angle
- Lighting conditions critical
- Phone/computer camera only (no special hardware)

### AI Coaching Logic
✅ **Feasible**:
- GPT-4 for workout planning and adaptation
- RAG for exercise database and form guidelines
- Rule-based system for form checking (angles, alignment)

### Personalization
✅ **Feasible**:
- Input: Age, weight, fitness level, goals, equipment, injuries
- Output: Progressive workout plan
- Adaptation based on user feedback and performance data

## 4. COMPETITIVE LANDSCAPE

| Competitor | Strength | Weakness | Our Advantage |
|------------|----------|----------|---------------|
| Nike Training Club | Brand, free content | Generic plans | AI personalization |
| Freeletics | AI-driven | Expensive ($60/year) | Better form checking |
| Future Fitness | Real trainers | Very expensive ($150/mo) | AI at 10% cost |
| FitBod | Adaptive workouts | No form checking | Real-time correction |

**Market Gap**: No affordable AI coach with real-time form correction

## 5. MVP SCOPE RECOMMENDATION

### MUST HAVE (MVP Phase 1 - 3 months)
1. ✅ User onboarding (goals, fitness level, equipment)
2. ✅ AI-generated personalized workout plan (text-based)
3. ✅ Exercise video library (20 common exercises)
4. ✅ Basic form checking (5-10 key exercises)
5. ✅ Workout logging and progress tracking

### SHOULD HAVE (Phase 2 - Month 4-6)
6. Real-time voice coaching during workout
7. Expanded exercise library (50+ exercises)
8. Nutrition guidance integration
9. Rest day recommendations

### COULD HAVE (Phase 3 - Month 7+)
10. AR overlays for form guidance
11. Social features (workout buddies)
12. Wearable device integration

### WON'T HAVE (Out of scope)
- Meal delivery service
- Equipment sales
- Group classes

## 6. KEY ASSUMPTIONS TO VALIDATE

1. **Users trust AI form correction** - Test with beta users
2. **Camera quality sufficient** - Test with various devices
3. **Users complete 3+ workouts/week** - Key for retention
4. **Willing to pay $10/month** - Price sensitivity testing needed

## 7. SUCCESS CRITERIA

### North Star Metric
**Weekly Active Users (WAU)** - measures actual usage, not just signups

### Supporting Metrics
- User Retention: Day 7 > 40%, Day 30 > 25%
- Workout Completion Rate > 70%
- Form Correction Accuracy > 85% (validated by PTs)
- User Satisfaction (NPS) > 50

## 8. TECHNICAL STACK RECOMMENDATION (Preliminary)

**AI/ML**:
- GPT-4 (workout planning)
- MediaPipe (pose estimation)
- LangChain (RAG for exercise knowledge)

**Platform**:
- Web app first (easier MVP)
- Mobile app later (better camera experience)

## 9. RISKS & MITIGATION

| Risk | Impact | Mitigation |
|------|--------|------------|
| Injury liability | High | Disclaimer, form accuracy focus, PT review |
| Low adoption | High | Free trial, demo videos |
| Technical complexity | Medium | Start with simple exercises |
| Competition | Medium | Focus on personalization + cost |

## 10. NEXT STEPS

✅ This brief is complete.

**Recommendation**:
1. Validate core assumption with 10-15 target users (interviews)
2. Build clickable prototype (Figma) to test concept
3. Move to PM agent to define detailed PRD

**Ready to proceed?** Type `*pm` to start PRD creation, or ask me questions about this brief.
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

Next: Type *pm to work with the Product Manager on creating a detailed PRD.

The PM will transform this analysis into specific features, user stories, and success metrics.
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
📋 Product Manager Mode Activated

I've reviewed the Analyst's brief for your AI Fitness Coach project.

I'll help you create a detailed Product Requirements Document (PRD) including:
- Feature specifications
- User stories
- Success metrics
- Technical requirements
- Launch timeline

Let's start by confirming the MVP scope. Based on the brief, I suggest focusing on:

1. Personalized workout planning
2. Exercise video library
3. Basic form checking (5-10 exercises)
4. Progress tracking

Do you want to:
A) Proceed with this scope
B) Add/remove features
C) Discuss specific features in detail
```

#### **步骤 2：确认 MVP 范围**

```
你：A，继续这个范围。但我想确认：基础形态检查具体指哪些？

PM：
Great question! Let me clarify "Basic Form Checking":

**Phase 1 MVP - 5 Core Exercises with Form Check**:

1. **Squat**
   - Check: Knee alignment, back angle, depth
   - Feedback: "Knees tracking over toes? Back straight?"

2. **Push-up**
   - Check: Elbow angle, body alignment, depth
   - Feedback: "Keep core engaged, elbows at 45°"

3. **Plank**
   - Check: Hip alignment, shoulder position
   - Feedback: "Lift hips slightly, avoid sagging"

4. **Lunge**
   - Check: Knee angle, forward lean
   - Feedback: "Front knee behind toes"

5. **Glute Bridge**
   - Check: Hip height, knee angle
   - Feedback: "Squeeze glutes at top"

**Why these 5?**
- Most common beginner exercises
- Clear form rules (angle-based)
- High injury risk if done wrong
- Easier pose estimation (stable positions)

**Detection Method**:
- MediaPipe identifies 33 body landmarks
- Calculate joint angles
- Compare with ideal ranges
- Real-time feedback overlay

**Accuracy Target**: 85%+ (validated with PT)

Shall I proceed with the full PRD based on this?
```

#### **步骤 3：生成完整 PRD**

```
你：是的，请生成完整 PRD

PM：
```

**PM 开始生成 PRD**（这是一个很长的文档，我展示关键部分）：

```markdown
📄 PRODUCT REQUIREMENTS DOCUMENT
# AI Fitness Coach - MVP v1.0

**Product Name**: FitAI Coach
**Version**: 1.0 MVP
**Created**: 2025-10-23
**Owner**: [Your Name]
**Status**: Draft for Review

---

## 1. EXECUTIVE SUMMARY

### Vision
Democratize personal fitness coaching through AI, making expert guidance accessible to everyone at 10% the cost of traditional trainers.

### Mission (MVP)
Deliver personalized workout plans with real-time form correction for 5 core bodyweight exercises, helping fitness newbies start their journey safely and effectively.

### Target Launch
Q2 2025 (3 months development)

---

## 2. PRODUCT OVERVIEW

### 2.1 Problem Statement
- 80% of fitness newbies quit within 3 months
- Personal trainers cost $100+/session (unaffordable for most)
- Generic workout apps lack personalization and form guidance
- **Consequence**: High injury rates, low adherence, wasted potential

### 2.2 Solution
AI-powered personal fitness coach providing:
- Personalized workout plans adapted to user goals and fitness level
- Real-time form correction using computer vision
- Progressive training that adapts to user performance
- Cost: <$10/month (vs $400/month for human PT)

### 2.3 Success Definition
- **North Star Metric**: Weekly Active Workouts per User > 3
- Day 7 Retention > 40%
- Form Correction Accuracy > 85%
- NPS > 50

---

## 3. USER PERSONAS

### Primary: "Newbie Noah" (60% of users)
- Age: 22-28
- Occupation: Knowledge worker
- Fitness Level: Beginner (can do 5 push-ups)
- Goal: Lose weight + build basic strength
- Available Time: 30-45 min, 3-4x/week
- Pain Points:
  - Doesn't know where to start
  - Afraid of doing exercises wrong
  - Can't afford gym/trainer
- Motivation: Health, confidence, appearance

### Secondary: "Busy Parent Sarah" (25% of users)
- Age: 30-40
- Limited time: 20-30 min/day max
- Goal: Stay fit, energy for kids
- Previous injuries: Back pain
- Pain Point: Time-constrained, needs efficiency

### Tertiary: "Comeback Chris" (15% of users)
- Age: 35-45
- Used to be fit, now out of shape
- Goal: Regain previous fitness
- Motivation: Health scare, milestone birthday

---

## 4. FEATURE SPECIFICATIONS (MoSCoW)

### 4.1 MUST HAVE (MVP Launch)

#### Feature 1: Smart Onboarding
**Description**: Collect user data to personalize workout plans

**User Story**:
_As a new user, I want to answer questions about my fitness level and goals, so that I receive a plan tailored to me._

**Acceptance Criteria**:
- [ ] 5-step onboarding flow (< 3 minutes)
- [ ] Questions: Age, Weight, Height, Fitness Level (1-5), Goals (multi-select), Equipment (none/dumbbells/full), Injuries/Limitations, Available Days (3-7), Time per Workout (15/30/45/60 min)
- [ ] Skippable with "Quick Start" option
- [ ] Data saved to user profile
- [ ] Can edit later in settings

**Technical Specs**:
- Frontend form validation
- POST /api/user/onboarding
- Store in PostgreSQL user table

**Design Notes**:
- Progress bar at top (Step 1/5)
- One question per screen (mobile-friendly)
- Visual fitness level selector (stick figures)

---

#### Feature 2: AI Workout Plan Generator
**Description**: Generate personalized 4-week progressive workout plan

**User Story**:
_As a user who completed onboarding, I want to receive a personalized workout plan, so that I know what to do each day._

**Acceptance Criteria**:
- [ ] Generate 4-week plan (28 days)
- [ ] 3-5 workouts per week based on user input
- [ ] Each workout: 20-45 min duration
- [ ] Progressive difficulty (Week 1 easier than Week 4)
- [ ] Exercise variety (rotate exercises)
- [ ] Rest days strategically placed
- [ ] Adapts to user feedback (too easy/hard)

**Technical Specs**:
- GPT-4 prompt with user data
- Exercise database (PostgreSQL)
- Caching: Cache generated plans (Redis, 24h TTL)
- POST /api/workout-plan/generate
- Response time: < 5s

**Example Workout Day**:
```json
{
  "day": 1,
  "title": "Full Body Foundation",
  "duration": "30 min",
  "exercises": [
    {
      "name": "Bodyweight Squat",
      "sets": 3,
      "reps": 10,
      "rest": "60s",
      "form_check_enabled": true,
      "video_url": "/videos/squat.mp4",
      "instructions": "..."
    },
    ...
  ]
}
```

---

#### Feature 3: Exercise Video Library
**Description**: High-quality video demonstrations for each exercise

**User Story**:
_As a user starting an exercise, I want to watch a demo video, so that I understand proper form._

**Acceptance Criteria**:
- [ ] 15-20 exercise videos
- [ ] Each video: 20-40 seconds, looped
- [ ] Multiple angles (front, side)
- [ ] Overlay: Key form points (arrows, text)
- [ ] Slow-motion option
- [ ] Can pause/replay
- [ ] Lightweight (< 5MB per video)

**Content Requirements**:
- Professional trainer demonstration
- Good lighting, plain background
- HD quality (1080p minimum)

---

#### Feature 4: Real-Time Form Checking (5 Exercises)
**Description**: Computer vision detects user performing exercise and gives form feedback

**User Story**:
_As a user doing squats, I want the app to tell me if my form is correct, so that I avoid injury and get results._

**Acceptance Criteria**:
- [ ] Works on 5 exercises: Squat, Push-up, Plank, Lunge, Glute Bridge
- [ ] Camera permission requested
- [ ] Real-time pose detection (< 100ms latency)
- [ ] Overlay: Skeleton visualization
- [ ] Feedback: Green checkmark (good form) or Red X + tip (poor form)
- [ ] Audio feedback option (voice cues)
- [ ] Works on mobile and desktop
- [ ] Minimum accuracy: 85% (vs professional trainer assessment)

**Technical Specs**:
- Frontend: MediaPipe library (TensorFlow.js)
- Detects 33 body landmarks
- Calculate joint angles
- Rule-based checking:
  - Squat: knee angle 70-110°, back angle < 45°
  - Push-up: elbow angle 70-90° at bottom
  - Plank: hip-shoulder-ankle alignment ±10°
- No server-side processing (runs client-side for privacy + speed)

**Edge Cases**:
- Poor lighting: Show "Improve lighting" message
- Person not fully visible: Show "Step back" message
- Multiple people: Show "Only one person in frame"

---

#### Feature 5: Workout Tracking & Progress
**Description**: Log completed workouts and visualize progress

**User Story**:
_As a user who completes workouts, I want to see my progress, so that I stay motivated._

**Acceptance Criteria**:
- [ ] One-tap "Complete Workout" button
- [ ] Track: Date, duration, exercises completed, sets/reps
- [ ] Dashboard shows:
  - Current week streak
  - Total workouts completed
  - Progress graph (workouts/week)
  - Next workout preview
- [ ] Achievements/badges (5 workouts, 10 workouts, etc.)
- [ ] Can mark workout as "Too Easy" or "Too Hard" → adapts next plan

**Technical Specs**:
- POST /api/workout/complete
- Chart: Chart.js
- Data retention: 6 months

---

### 4.2 SHOULD HAVE (Post-MVP, Month 4-6)

#### Feature 6: Voice Coaching
- Real-time audio cues during workout
- "3 more reps", "Keep going", "Rest now"
- Motivational phrases

#### Feature 7: Expanded Exercise Library
- 50+ exercises
- Equipment variations (dumbbells, bands)

#### Feature 8: Nutrition Guidance
- Basic calorie calculator
- Macro recommendations
- Meal ideas (no meal plans)

#### Feature 9: Rest Day Optimization
- Active recovery suggestions
- Mobility exercises
- Sleep/hydration tracking

---

### 4.3 COULD HAVE (Phase 3, Month 7+)

#### Feature 10: AR Form Overlay
- Augmented reality overlay showing ideal form
- Apple ARKit / Google ARCore

#### Feature 11: Social Features
- Workout buddies
- Leaderboards
- Share achievements

#### Feature 12: Wearables Integration
- Apple Watch / Fitbit sync
- Heart rate monitoring

---

### 4.4 WON'T HAVE (Explicitly Out of Scope)

- ❌ Meal delivery service
- ❌ Equipment sales
- ❌ Live group classes
- ❌ Direct messaging with trainers
- ❌ Specialized training (e.g., marathon prep, bodybuilding)

---

## 5. USER FLOWS

### 5.1 First-Time User Flow
```
1. Land on homepage
2. Click "Start Free Trial" (no credit card)
3. Onboarding (5 questions, 3 min)
4. Generate Workout Plan (loading: 5s)
5. View "Your Plan" dashboard
6. Click "Start Today's Workout"
7. Grant camera permission
8. Follow workout (25 min)
9. Complete → Celebration screen
10. View progress dashboard
```

### 5.2 Returning User Flow
```
1. Open app (auto-login)
2. See Dashboard: Next workout, streak, progress
3. Click "Start Workout"
4. Exercise by exercise flow
5. Complete → Updated progress
```

---

## 6. SUCCESS METRICS

### 6.1 North Star Metric
**Weekly Active Workouts (WAW)**: # of workouts completed per active user per week

**Target**: 3+ WAW
**Rationale**: 3x/week is minimum for fitness results; correlates with retention

### 6.2 Key Performance Indicators (KPIs)

**Acquisition**:
- Signups/week: 100+ (Month 1), 500+ (Month 3)
- Trial-to-paid conversion: > 25%

**Activation**:
- Complete onboarding: > 90%
- Complete first workout: > 70%

**Retention**:
- Day 7: > 40%
- Day 30: > 25%
- Month 3: > 15%

**Engagement**:
- WAW: 3+
- Workout completion rate: > 70% (start → finish)
- Form check usage: > 60% of exercises

**Revenue**:
- MRR (Monthly Recurring Revenue): $5,000 by Month 3
- ARPU (Average Revenue Per User): $10/month
- LTV/CAC > 3

**Quality**:
- Form correction accuracy: > 85% (vs PT validation)
- NPS (Net Promoter Score): > 50
- App Store rating: > 4.5 stars

### 6.3 Analytics Events to Track

**User Events**:
- User signed up
- Onboarding completed
- Workout plan generated
- Workout started
- Exercise completed
- Workout completed
- Form check used
- Feedback given (too easy/hard)
- Subscription purchased

**Technical Events**:
- Form check accuracy (per exercise)
- Camera error rate
- Loading time (workout plan generation)
- Crash reports

---

## 7. TECHNICAL REQUIREMENTS

### 7.1 Performance
- **Page Load**: < 2s
- **Workout Plan Generation**: < 5s
- **Form Check Latency**: < 100ms
- **Video Load**: < 3s (progressive loading)
- **99.9% Uptime**

### 7.2 Browser/Device Support
- **Web**: Chrome, Safari, Firefox (latest 2 versions)
- **Mobile Web**: iOS Safari, Chrome Android
- **Screen Sizes**: 320px - 2560px width
- **Future**: Native mobile apps (iOS/Android)

### 7.3 Security
- HTTPS only
- JWT authentication
- No storage of credit card info (use Stripe)
- Camera access: Ask permission, explain usage
- Data encryption at rest

### 7.4 Privacy
- GDPR compliant
- No selling of user data
- Camera stream: Never uploaded to server (client-side processing)
- Users can delete account + all data

### 7.5 Accessibility
- WCAG 2.1 AA compliance
- Screen reader support
- Keyboard navigation
- High contrast mode

---

## 8. DESIGN GUIDELINES

### 8.1 Design Principles
1. **Motivating**: Celebrate every win, use positive language
2. **Clear**: Simple instructions, no fitness jargon
3. **Trustworthy**: Professional, science-backed guidance
4. **Efficient**: Quick to start workout, minimal clicks

### 8.2 Visual Style
- **Colors**:
  - Primary: Energetic Orange (#FF6B35)
  - Secondary: Deep Blue (#004E89)
  - Success: Green (#06D6A0)
  - Warning: Yellow (#F7B32B)
- **Typography**: Poppins (headings), Inter (body)
- **Imagery**: Real people, diverse, energetic, authentic

### 8.3 Key Screens
1. Dashboard: Today's workout, streak counter, progress graph
2. Workout In Progress: Large exercise name, rep counter, form check overlay
3. Completion: Celebration animation, stats, next workout preview

---

## 9. MONETIZATION

### 9.1 Pricing
- **Free Trial**: 7 days, full access
- **Monthly**: $9.99/month
- **Annual**: $79.99/year (33% discount = $6.66/month)

### 9.2 Free vs Paid

**Free (Trial)**:
- All MVP features
- Limited to 7 days

**Paid (Required after trial)**:
- Unlimited access
- New workouts every 4 weeks
- Progress history (vs 1 week only)
- Priority support

**Future Premium Tier ($19.99/mo)**:
- Nutrition plans
- Advanced exercises
- 1-on-1 PT video check-ins (async)

---

## 10. LAUNCH PLAN

### 10.1 Timeline

**Month 1 (Design + Core Dev)**:
- Week 1-2: Design mockups (Figma)
- Week 3-4: Frontend skeleton + Backend API setup

**Month 2 (Development)**:
- Week 5-6: Onboarding, Workout Plan Generator, Exercise DB
- Week 7-8: Form Check (MVP 5 exercises), Video Library

**Month 3 (Polish + Launch)**:
- Week 9-10: Progress Tracking, Testing, Bug fixes
- Week 11: Beta testing (50 users)
- Week 12: Launch! 🚀

### 10.2 Beta Testing
- Recruit 50 beta testers (friends, fitness communities)
- Criteria: Fitness newbies, willingness to give feedback
- Test for: Bugs, form check accuracy, user experience
- Offer: Free 3-month subscription in exchange

### 10.3 Launch Channels
- Product Hunt
- Reddit (r/fitness, r/bodyweightfitness)
- Instagram/TikTok (demo videos)
- App Store / Google Play
- Landing page + SEO (Google Ads)

---

## 11. RISKS & MITIGATION

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Low form check accuracy | Medium | High | Validate with PTs, iterate algorithms |
| Users injure themselves | Low | Critical | Disclaimers, form focus, PT content review |
| Low retention (boring workouts) | Medium | High | A/B test workout styles, add variety |
| Privacy concerns (camera) | Medium | Medium | Clear messaging, client-side processing |
| Competition (big players) | High | Medium | Focus on niche (newbies), personalization |
| Technical complexity delays launch | Medium | Medium | Start with simpler form checks, expand later |

---

## 12. OPEN QUESTIONS

- [ ] Should we support offline mode? (Download plans)
- [ ] Voice coaching in MVP or later?
- [ ] Minimum viable exercise library size? (Current: 20)
- [ ] Integration with MyFitnessPal/Apple Health?

---

## 13. APPENDIX

### 13.1 Exercise List (MVP)

**With Form Check** (5):
1. Bodyweight Squat
2. Push-up
3. Plank
4. Lunge (forward)
5. Glute Bridge

**Without Form Check** (10):
6. Jumping Jacks
7. High Knees
8. Mountain Climbers
9. Burpees
10. Leg Raises
11. Superman
12. Side Plank
13. Wall Sit
14. Calf Raises
15. Arm Circles

---

**Document Status**: ✅ Ready for Review
**Next Step**: Architecture design (*architect)

---

PM: This PRD is now complete!

Would you like to:
A) Review/modify any sections
B) Proceed to Architecture (*architect)
C) Export this document

Type your choice.
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
🏗️ Architecture Mode Activated

I've reviewed the PRD for FitAI Coach. I'll design a scalable, cost-effective architecture that supports:

- Real-time form checking (client-side)
- AI workout plan generation
- User data management
- Video delivery
- Payment processing

Let me start by clarifying a few technical decisions:

1. **Camera Processing**: Client-side (MediaPipe) vs Server-side?
   My recommendation: Client-side (privacy + no latency)

2. **Video Hosting**: Self-hosted vs CDN (Cloudflare/Vimeo)?
   My recommendation: Vimeo (easier) → Migrate to CDN later

3. **Database**: PostgreSQL only vs + Redis cache?
   My recommendation: PostgreSQL + Redis (performance)

Do you approve these decisions, or want to discuss?
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
📝 Scrum Master Mode Activated

I'll break down the PRD and Architecture into development stories.

Based on the PRD, I'll create stories for:
- Sprint 1: Project setup, Backend foundation, Database
- Sprint 2: AI workout plan generator, Exercise DB
- Sprint 3: Frontend - Onboarding, Dashboard
- Sprint 4: Form Check (5 exercises)
- Sprint 5: Progress tracking, Payment
- Sprint 6: Testing, Polish, Launch prep

Total: ~45-60 stories across 6 sprints (12 weeks)

I'll now generate the story files in .bmad/stories/

[Generating stories...]

✅ Generated 52 stories in .bmad/stories/

Story files created:
- sprint-01/story-001-project-setup.md
- sprint-01/story-002-backend-api-foundation.md
- sprint-01/story-003-database-setup.md
...
- sprint-04/story-023-form-check-squat.md
...

Each story contains:
- Full context (PRD + Architecture refs)
- Detailed implementation steps
- Code examples
- Acceptance criteria
- Test cases

Ready for development! Open your IDE and start with story-001.
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
Gem：I can help you with that. What would you like to know?
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
Analyst（而不是 PM）: I'll analyze...
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
📋 PROJECT BRIEF - AI Personal Finance Assistant

## 1. PROBLEM ANALYSIS

### Core Pain Points
1. **Awareness Gap**: 60% of people don't know where their money goes
2. **Manual Tracking Burden**: Average person gives up manual budgeting in 2 weeks
3. **Complexity Barrier**: Traditional budgeting apps have 50+ features, overwhelming

### Your Solution
Automated financial awareness through:
- Bank auto-sync (no manual input)
- AI-powered transaction categorization
- Conversational insights ("You spent $200 more on dining this month")

## 2. COMPETITIVE LANDSCAPE

| Competitor | Strength | Weakness | Your Advantage |
|------------|----------|----------|----------------|
| Mint | Free, established | Ads, privacy concerns, overwhelming UI | Clean AI-driven experience |
| YNAB | Best budgeting method | $99/year, steep learning curve | Simple, affordable |
| Copilot | Beautiful design | iOS only, $60/year | Web + Mobile |

**Market Gap**: No affordable, AI-driven, simple alternative

## 3. USER TRUST ANALYSIS (Critical for bank connections)

### Security Requirements
- SOC 2 Type II compliance
- End-to-end encryption
- Use Plaid (trusted aggregator, not direct bank access)
- Clear privacy policy: "We never sell your data"

### Trust-Building Strategies
- 14-day free trial (no credit card, view-only mode)
- Show: "10,000+ users trust us" social proof
- Bank logos: "Works with Chase, Bank of America..."
- Explainer video: How Plaid works (you don't see bank credentials)

**Validation Needed**: Survey 50 target users:
- "Would you connect your bank for automated tracking?" (expect 40-60% yes)

## 4. AI CATEGORIZATION FEASIBILITY

### Technical Approach
```
Transaction: "AMAZON.COM $52.99"
↓
GPT-4 + Context (user history, merchant database)
↓
Categorization: "Shopping > Electronics" (85% confidence)
↓
If low confidence: Ask user once, learn forever
```

**Accuracy Target**: 90%+ (validated with 10K real transactions)

**Key Innovation**: Learning loop
- User corrects "Amazon → Books" once
- AI remembers for future Amazon purchases
- Personalized categorization improves over time

## 5. MVP SCOPE (8 weeks)

### MUST HAVE
1. ✅ Bank account connection (Plaid)
2. ✅ AI transaction categorization (10 categories)
3. ✅ Monthly spending overview (charts)
4. ✅ AI insights (3 key insights per month)
5. ✅ Manual correction (tap to recategorize)

### SHOULD HAVE
6. Budget setting (per category)
7. Spending alerts ("You're over budget in Dining")

### WON'T HAVE
- ❌ Investment tracking
- ❌ Bill pay
- ❌ Credit score monitoring

## 6. REVENUE MODEL

**Pricing**:
- Free: View-only mode (1 bank account, 3 months history)
- Premium: $5.99/month or $49/year
  - Unlimited accounts
  - Unlimited history
  - AI insights
  - Budget tools

**Unit Economics**:
- CAC (Customer Acquisition Cost): $15 (Google/Facebook Ads)
- LTV (Lifetime Value): $120 (20 months avg retention × $6/mo)
- LTV/CAC = 8 ✅ Healthy

## 7. KEY RISKS

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Low adoption (trust) | Medium | High | Free trial, security messaging |
| Plaid costs too high | Low | Medium | $0.25/user/mo, factored into pricing |
| AI categorization inaccurate | Medium | Medium | Human-in-loop learning, 90% target |
| Regulatory (PSD2, data privacy) | Low | High | Legal review, SOC 2 |

## 8. SUCCESS METRICS

**North Star**: Monthly Active Users (MAU) who sync transactions

**Key Metrics**:
- Trial-to-paid: > 25%
- Retention (Month 3): > 50%
- AI categorization accuracy: > 90%
- NPS: > 40

## 9. NEXT STEPS

✅ Brief complete.

**Recommendations**:
1. Validate trust assumption: Survey 50 users
2. Test AI categorization: Get sample transactions, test accuracy
3. Prototype: Figma clickable mockup
4. Move to *pm for detailed PRD

Questions for you:
- Do you have Plaid API access or need to apply?
- iOS/Android/Web priority?
- Solo founder or team?
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
