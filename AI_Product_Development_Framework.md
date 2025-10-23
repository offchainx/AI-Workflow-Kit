# AI 产品开发全流程框架（BMAD 深度整合版）

## 📌 版本信息
- **当前版本**：v2.0
- **创建日期**：2025-10-23
- **最近更新**：2025-10-23

### 更新日志
- **v2.0** (2025-10-23)：深度整合 BMAD-METHOD，将代理协作融入完整产品开发流程
- **v1.1** (2025-10-23)：整合 BMAD-METHOD 代理协作框架，添加 AI 模型选择策略
- **v1.0** (2025-10-23)：初始版本，建立完整的 AI 产品开发 8 阶段框架

---

## 🎯 核心理念：用"故事"驱动开发，用"上下文"持续前进

传统 AI 辅助开发面临两大痛点：
1. **规划不一致**：AI 在不同对话中给出矛盾的建议
2. **上下文丢失**：AI 不断"遗忘"之前的决策和架构

**本框架的解决方案**：采用 **BMAD-METHOD**（代理化敏捷开发）作为核心方法论，通过：
- ✅ **专业化 AI 代理团队**：Analyst、PM、Architect、Scrum Master、Dev、QA
- ✅ **知识持久化**：所有决策写入文档和故事文件
- ✅ **上下文工程**：通过 `.bmad/stories/` 文件传递完整上下文
- ✅ **人机协作迭代**：每一步都可以反馈调整

### 框架定位

本框架 = **传统产品开发方法论** + **BMAD 代理协作** + **AI 产品特殊性**

```
传统产品开发 8 阶段
        +
BMAD 两阶段架构（规划 + 开发）
        +
AI 产品特殊考虑（模型、数据、成本）
        =
完整 AI 产品开发流程
```

---

## 📖 快速导航
- [阶段 0：想法验证与战略定位](#阶段-0想法验证与战略定位)
- [阶段 1：需求定义与 MVP 范围界定](#阶段-1需求定义与-mvp-范围界定)
- [阶段 2：技术选型与架构设计](#阶段-2技术选型与架构设计)
- [阶段 3：数据策略与准备](#阶段-3数据策略与准备)
- [阶段 4：快速原型验证](#阶段-4快速原型验证)
- [阶段 5：MVP 开发](#阶段-5mvp-开发)
- [阶段 6：内测与优化](#阶段-6内测与优化)
- [阶段 7：上线准备与发布](#阶段-7上线准备与发布)
- [BMAD 集成全景图](#bmad-集成全景图)
- [关键检查清单](#关键检查清单)
- [常见陷阱速查](#常见陷阱速查)
- [推荐工具清单](#推荐工具清单)

---

## 🗺️ BMAD 集成全景图

### BMAD 如何融入 8 个阶段？

```
┌─────────────────────────────────────────────────────────────┐
│  BMAD 规划阶段（Agentic Planning）                           │
│  环境：Gemini Gems / CustomGPT Web UI                       │
├─────────────────────────────────────────────────────────────┤
│  阶段 0：想法验证    →  *analyst  （需求分析代理）          │
│  阶段 1：需求定义    →  *pm       （产品经理代理）          │
│  阶段 2：技术选型    →  *architect（架构师代理）            │
│  阶段 3：数据策略    →  人工主导 + Architect 建议           │
│  阶段 4：快速原型    →  人工主导（验证假设）                │
└─────────────────────────────────────────────────────────────┘
                            ↓
                  *scrum（生成开发故事）
                            ↓
              .bmad/stories/*.md（故事文件）
                            ↓
┌─────────────────────────────────────────────────────────────┐
│  BMAD 开发阶段（Context Development）                        │
│  环境：Claude Code（VSCode/Cursor + Sonnet 4.5）           │
├─────────────────────────────────────────────────────────────┤
│  阶段 5：MVP 开发    →  Dev 代理读取故事 → 实现代码         │
│                     →  QA 代理验证质量                       │
│  阶段 6：内测优化    →  基于反馈更新故事 → 迭代开发         │
│  阶段 7：上线发布    →  持续监控 → 新故事 → 功能迭代        │
└─────────────────────────────────────────────────────────────┘
```

### 关键创新：故事文件的"上下文魔法"

**传统开发的痛点**：
```
第 1 天：你告诉 AI "用 PostgreSQL + Redis"
第 3 天：AI 问你 "用什么数据库？"  ← 上下文丢失！
```

**BMAD 的解决方案**：
```
Scrum Master 生成故事文件：
.bmad/stories/story-001-database-setup.md

文件内容：
---
## 上下文
项目：AI 学习助手
架构决策：PostgreSQL（用户数据）+ Pinecone（向量数据）+ Redis（缓存）
相关文档：architecture.md, prd.md

## 实现细节
[包含完整的技术规范、代码示例、验收标准]
---

Claude Code 读取这个文件 → 完整上下文 → 正确实现
```

**上下文持久化的三大价值**：
1. **跨会话记忆**：即使新开对话，AI 也能理解全局
2. **团队协作**：新成员读取故事即可上手
3. **知识积累**：项目历史完整保留

### 工作流示例：开发一个 AI 聊天机器人

**第 1-4 阶段：规划（Gemini Gems）**
```bash
你：我想做一个 AI 客服机器人
*analyst  # Analyst 深度分析需求和市场
*pm       # PM 生成完整 PRD
*architect # Architect 设计系统架构
*scrum    # Scrum Master 生成 52 个开发故事
```

**产出**：
- `docs/project-brief.md` - 需求分析
- `docs/prd.md` - 产品需求文档
- `docs/architecture.md` - 系统架构
- `.bmad/stories/sprint-01/story-001.md` ~ `story-052.md`

**第 5-7 阶段：开发（Claude Code）**
```bash
# 在 Claude Code 中
你：请根据 .bmad/stories/story-001-project-setup.md 初始化项目

Claude Code：
[读取 story-001.md]
- 理解：这是一个 AI 客服机器人项目
- 架构：React + FastAPI + PostgreSQL + Pinecone
- 需求：支持多渠道接入、知识库 RAG、对话历史
[开始实现...]
```

**关键优势**：
- ✅ Claude 无需反复询问架构决策
- ✅ 所有代码符合统一的技术栈
- ✅ 新功能开发时，上下文自动保持一致

---

## 🎯 完整开发流程（8 个阶段）

### 阶段 0：想法验证与战略定位
**⏱ 时间**：1-2 周
**🎯 核心目标**：确认这个想法值得投入资源
**🤖 BMAD 代理**：Analyst（需求分析专家）

#### 工作流程

**Step 1：启动 Analyst 代理**
```bash
# 在 Gemini Gems Web UI 中
*analyst
```

**Step 2：描述你的想法**
```
你：我想做一个 [描述你的 AI 产品想法]

背景：
- [目标用户的痛点]
- [现有解决方案的不足]
- [你的创新点]

不确定的地方：
- [技术可行性疑问]
- [市场接受度疑问]
- [商业模式疑问]
```

**Step 3：Analyst 深度分析**

Analyst 会生成包含以下内容的 **Project Brief**（项目简介）：

```markdown
📋 PROJECT BRIEF

## 1. 问题分析
- 核心痛点识别
- 目标用户画像
- 痛点严重性评估

## 2. 竞争格局
- 竞品对比矩阵
- 差异化定位
- 市场空白识别

## 3. 技术可行性
- AI 能力边界评估
- 数据获取可行性
- 技术风险识别

## 4. MVP 范围建议
- Must Have（必须有）
- Should Have（应该有）
- Could Have（可以有）
- Won't Have（不会有）

## 5. 关键假设验证
- 需要验证的核心假设
- 验证方法建议

## 6. Go/No-Go 建议
```

**Step 4：人机协作迭代**
```
你：[针对分析提出问题或要求调整]
Analyst：[基于你的反馈优化分析]
```

#### 产出物
- [ ] ✅ Project Brief（由 Analyst 生成）
- [ ] 一页纸产品概述
- [ ] 用户画像与痛点地图
- [ ] 竞品对比矩阵
- [ ] 技术可行性评估
- [ ] Go/No-Go 决策文档

#### BMAD 的价值

**传统方式**：
- 你需要自己做所有分析
- 分析框架可能不完整
- 容易遗漏关键风险

**BMAD Analyst**：
- ✅ 结构化分析框架（10+ 个分析维度）
- ✅ 人机协作迭代优化
- ✅ 生成规范级文档
- ✅ 识别你忽视的风险点

#### 实战示例

**输入**：
```
我想做一个 AI 健身教练应用
- 很多人想健身但不知道从哪开始
- 私教太贵（$100+/小时）
- 现有 App 都是通用计划，不够个性化
```

**Analyst 产出**（部分）：
```markdown
## 核心问题
传统健身教练面临三大障碍：
1. 成本障碍：私教 $50-150/小时
2. 访问障碍：需要去健身房
3. 个性化差距：通用 App 缺乏调整

## 技术可行性
✅ 动作识别：MediaPipe（准确率 85-95%）
✅ 个性化计划：GPT-4 + RAG
⚠️ 挑战：光照条件、摄像头角度

## MVP 建议（3 个月）
Must Have:
1. 用户引导（目标、水平、设备）
2. AI 生成训练计划
3. 基础动作检查（5-10 个动作）
4. 进度追踪
```

#### 常见陷阱与解决

| 陷阱 | BMAD 解决方案 |
|------|---------------|
| 技术驱动而非需求驱动 | Analyst 强制先分析痛点再谈技术 |
| 高估 AI 能力 | Analyst 提供技术可行性边界评估 |
| 遗漏竞品 | Analyst 系统性竞品分析 |
| MVP 范围过大 | Analyst 用 MoSCoW 方法界定边界 |

#### 进入下一阶段的标准

- ✅ 核心痛点清晰且严重
- ✅ 技术可行性评估为"可行"
- ✅ 有明确的差异化定位
- ✅ MVP 范围清晰（2-3 个核心功能）
- ✅ 关键假设可验证
- ✅ 团队决定 **Go**

**下一步**：输入 `*pm` 启动产品经理代理，进入需求定义阶段

---

### 阶段 1：需求定义与 MVP 范围界定
**⏱ 时间**：1-2 周
**🎯 核心目标**：定义最小可行产品的边界
**🤖 BMAD 代理**：PM（产品经理专家）

#### 工作流程

**Step 1：从 Analyst 切换到 PM**
```bash
# 在 Gemini Gems Web UI 的同一对话中
*pm
```

**PM 自动**：
- ✅ 读取 Analyst 生成的 Project Brief
- ✅ 理解项目背景、用户、竞品
- ✅ 基于此生成详细 PRD

**Step 2：PM 生成规范级 PRD**

PM 会生成包含以下内容的 **Product Requirements Document**：

```markdown
📄 PRODUCT REQUIREMENTS DOCUMENT

## 1. 执行摘要
- 产品愿景
- MVP 使命
- 目标发布时间

## 2. 产品概述
- 问题陈述
- 解决方案
- 成功定义（北极星指标）

## 3. 用户画像（详细）
- 主要画像（60%）
- 次要画像（25%）
- 第三画像（15%）
- 每个画像的痛点、目标、动机

## 4. 功能规格（MoSCoW 方法）
### 4.1 Must Have（MVP 必须有）
- 功能 1：[名称]
  - 描述
  - 用户故事
  - 验收标准（可勾选清单）
  - 技术规格
  - 设计说明

### 4.2 Should Have（第 2 阶段）
### 4.3 Could Have（第 3 阶段）
### 4.4 Won't Have（明确排除）

## 5. 用户流程
- 首次用户流程（逐步）
- 回访用户流程

## 6. 成功指标
- 北极星指标
- 获取指标（Acquisition）
- 激活指标（Activation）
- 留存指标（Retention）
- 收入指标（Revenue）
- 质量指标（Quality）

## 7. 技术要求
- 性能要求
- 浏览器/设备支持
- 安全性要求
- 隐私合规（GDPR）
- 可访问性（WCAG）

## 8. 设计指南
- 设计原则
- 视觉风格
- 关键屏幕

## 9. 商业化
- 定价策略
- 免费 vs 付费对比

## 10. 发布计划
- 开发时间表（按月/周）
- Beta 测试计划
- 发布渠道

## 11. 风险与缓解
| 风险 | 可能性 | 影响 | 缓解措施 |

## 12. 待解决问题
- [ ] 开放性问题列表
```

**Step 3：人机协作优化**
```
你：我想调整 MVP 范围，去掉功能 X
PM：好的，我将更新 PRD，并调整相关的用户故事和时间表
```

#### 产出物
- [ ] ✅ 完整 PRD（50-100 页，由 PM 生成）
- [ ] MVP 功能清单（2-3 个核心功能）
- [ ] 用户故事地图
- [ ] 北极星指标定义
- [ ] 功能优先级矩阵

#### BMAD 的价值

**传统方式**：
- PRD 写作耗时 1-2 周
- 容易遗漏细节
- 格式不统一
- 缺少明确的验收标准

**BMAD PM**：
- ✅ 30 分钟生成初稿（vs 2 周手写）
- ✅ 规范级格式（行业标准）
- ✅ 每个功能包含详细验收标准
- ✅ 自动生成用户故事
- ✅ 一致性保证（所有功能对齐同一愿景）

#### AI 产品特殊考虑

PM 会特别关注 AI 产品的独特需求：

**技术指标**：
- 模型准确率目标（如 85%+ 形态纠正准确率）
- 响应时间要求（如 < 3 秒生成计划）
- 单位成本限制（如 < $0.10 per user per day）

**业务指标**：
- 用户留存率（D1/D7/D30）
- AI 功能使用率
- 用户满意度（NPS）

**失败场景处理**：
- AI 不确定时的降级方案
- 错误提示友好性
- 人工兜底机制

#### 实战示例

**Analyst 产出** → **PM 扩展**

Analyst 说："MVP 需要基础动作检查（5-10 个动作）"

PM 扩展为：
```markdown
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
```

#### 进入下一阶段的标准

- ✅ PRD 完整且团队认可
- ✅ MVP 功能清单明确（≤5 个核心功能）
- ✅ 每个功能有清晰的验收标准
- ✅ 北极星指标定义并可衡量
- ✅ 技术约束明确（性能、成本、准确率）
- ✅ 发布时间表可行（通常 3-4 个月）

**下一步**：输入 `*architect` 启动架构师代理，进入技术架构设计阶段

---

### 阶段 2：技术选型与架构设计
**⏱ 时间**：1-2 周
**🎯 核心目标**：建立技术基础设施决策框架
**🤖 BMAD 代理**：Architect（架构师专家）

#### 工作流程

**Step 1：从 PM 切换到 Architect**
```bash
# 在 Gemini Gems Web UI 的同一对话中
*architect
```

**Architect 自动**：
- ✅ 读取 PRD（产品需求文档）
- ✅ 理解功能要求、性能目标、成本约束
- ✅ 基于此设计系统架构

**Step 2：Architect 生成完整架构文档**

```markdown
🏗️ ARCHITECTURE DOCUMENT

## 1. 技术栈选择
### 前端
- 框架：React / Next.js
- 状态管理：Zustand / Redux
- UI 库：Tailwind CSS + shadcn/ui
- 实时通信：WebSocket (Socket.io)
- 理由：[为什么选择这些技术]

### 后端
- 框架：Python FastAPI / Node.js Express
- AI 集成：LangChain + OpenAI API
- 数据库：PostgreSQL + Pinecone
- 缓存：Redis
- 理由：[为什么选择这些技术]

### AI 模型策略
- 主模型：GPT-4 / Claude Opus（复杂任务）
- 辅助模型：GPT-3.5 / Claude Haiku（简单任务）
- 成本优化策略：智能路由、缓存、批处理

### 基础设施
- 部署：Docker + Kubernetes / Vercel + AWS Lambda
- 云服务商：AWS / Google Cloud / Azure
- 监控：Prometheus + Grafana
- 日志：ELK Stack

## 2. 系统架构图
[详细的架构层次图]

## 3. 数据模型
[完整的数据库表结构设计]

## 4. API 设计
[所有核心 API 端点规范]

## 5. 性能优化策略
- 缓存策略：Redis 多层缓存
- 异步处理：消息队列
- CDN：静态资源加速

## 6. 安全考虑
- 认证：JWT / OAuth
- 授权：RBAC
- API 速率限制
- 数据加密

## 7. 成本估算
[详细的月度成本预算]

## 8. 技术风险与缓解
| 风险 | 缓解措施 |
```

#### BMAD 的价值

**传统方式**：
- 架构师需要几天设计
- 可能遗漏关键组件
- 文档不够详细

**BMAD Architect**：
- ✅ 1 小时生成完整架构（vs 几天手动设计）
- ✅ 考虑所有层次（前端、后端、数据、基础设施、安全）
- ✅ 自动生成数据模型和 API 设计
- ✅ 提供成本估算
- ✅ 识别技术风险

#### AI 产品架构的特殊考虑

Architect 会特别关注 AI 产品的架构需求：

```
典型 AI 产品架构层次

┌─────────────────────────────────────┐
│  用户界面层（React + WebSocket）     │
└───────────────┬─────────────────────┘
                ↓
┌───────────────▼─────────────────────┐
│  API 网关层（认证、速率限制、路由）  │
└───────────────┬─────────────────────┘
                ↓
    ┌──────────┴──────────┐
    │                     │
┌───▼──────┐    ┌────────▼────────┐
│ 业务逻辑层│    │  AI 服务层      │
│ - 用户管理│    │ - 提示工程      │
│ - 会话管理│    │ - 模型调用      │
│ - 权限控制│    │ - 向量检索（RAG）│
└───┬──────┘    └────────┬────────┘
    │                     │
    └──────────┬──────────┘
               ↓
┌──────────────▼──────────────────┐
│  数据层                          │
│  PostgreSQL | Pinecone |  Redis │
│  (用户数据)  (向量库)  (缓存)   │
└─────────────────────────────────┘
```

**关键设计点**：
1. **提示工程层**：独立管理提示词模板和上下文
2. **智能缓存**：减少 AI API 调用成本
3. **向量检索优化**：RAG 性能提升
4. **成本监控**：实时追踪 AI API 费用

#### 进入下一阶段的标准

- ✅ 架构文档完整
- ✅ 技术栈选择有明确理由
- ✅ 数据模型设计完成
- ✅ API 接口定义清晰
- ✅ 成本估算在预算内
- ✅ 技术风险可控
- ✅ 团队有能力实施该架构

**下一步**（关键转折点）：输入 `*scrum` 启动 Scrum Master，生成开发故事文件

**为什么这是关键转折点？**
- Scrum Master 将 PRD + 架构 → 分解为 40-60 个开发故事
- 每个故事包含**完整上下文**（项目背景、架构决策、实现细节）
- 这些故事文件成为"知识传承"的载体
- 之后切换到 Claude Code 读取故事进行开发

---

### 阶段 3：数据策略与准备
**⏱ 时间**：2-4 周（与开发并行）
**🎯 核心目标**：建立数据资产
**👤 主导**：人工 + Architect 建议

#### BMAD 在此阶段的作用

数据准备主要是人工主导，但 Architect 在架构文档中会提供：
- 数据模型设计（数据库表结构）
- 数据获取建议（API、数据集、爬虫）
- 向量化策略（RAG 应用）

#### 关键活动（简化）
- 数据需求分析：根据 PRD 确定所需数据
- 数据获取：公开数据集、API、UGC
- RAG 知识库构建：文档收集 → 分块 → 向量化 → Pinecone
- 数据处理脚本：清洗、格式化、版本控制（DVC）

#### 产出物
- [ ] 知识库（如 RAG 应用需要）
- [ ] 数据处理脚本
- [ ] 数据管理规范

---

### 阶段 4：快速原型验证
**⏱ 时间**：1-2 周
**🎯 核心目标**：验证核心假设
**👤 主导**：人工快速搭建

#### 为什么需要原型？

在全面开发前，快速验证：
- AI 输出质量是否达标？
- 用户交互是否流畅？
- 成本是否可控？

#### 快速原型方法
- **Streamlit/Gradio**（推荐）：Python 快速搭建界面
- **Vercel AI SDK**：TypeScript 快速搭建聊天界面

#### 产出物
- [ ] 可交互原型（Streamlit/Gradio）
- [ ] 用户测试反馈（5-10 人）
- [ ] 验证结果文档（是否 Go）

---

### 🎯 关键转折点：生成开发故事（Scrum Master）

**在进入阶段 5 之前**，必须先完成这一步：

```bash
# 在 Gemini Gems Web UI 中
*scrum
```

**Scrum Master 的任务**：
1. 读取 PRD +架构文档
2. 将整个项目分解为 40-60 个开发故事
3. 按 Sprint（2 周）组织故事
4. 每个故事包含完整上下文

**生成的故事文件结构**：
```
.bmad/
└── stories/
    ├── sprint-01/
    │   ├── story-001-project-setup.md
    │   ├── story-002-database-setup.md
    │   └── story-003-auth-system.md
    ├── sprint-02/
    │   ├── story-004-ai-integration.md
    │   └── ...
    └── ...
```

**每个故事文件包含**：
```markdown
# Story 001: 项目初始化

## 上下文
项目：AI 学习助手
架构：React + FastAPI + PostgreSQL + Pinecone
相关文档：prd.md, architecture.md

## 目标
搭建项目基础架构...

## 实现细节
[完整的代码示例、命令、验收标准]
```

**为什么这一步如此重要？**
- ✅ 故事文件 = 上下文的"时间胶囊"
- ✅ 任何开发者读取故事 → 立即理解全局
- ✅ Claude Code 读取故事 → 无需反复询问架构

---

### 阶段 5：MVP 开发（BMAD 开发阶段）
**⏱ 时间**：4-8 周
**🎯 核心目标**：开发可发布的最小可行产品
**🤖 BMAD 代理**：Dev（开发工程师）+ QA（质量保证）
**💻 执行环境**：Claude Code（VSCode/Cursor + Sonnet 4.5）

#### 🔄 关键变化：从规划到开发

**环境切换**：
```
Gemini Gems（规划阶段）
        ↓
已生成：PRD + 架构 + 故事文件
        ↓
Claude Code（开发阶段）← 现在切换到这里
```

#### 工作流程

**Step 1：切换到 Claude Code**

打开 VSCode/Cursor，确保：
- ✅ Claude Code 扩展已安装
- ✅ `.bmad/stories/` 目录存在（由 Scrum Master 生成）
- ✅ 可以看到所有故事文件

**Step 2：按故事顺序开发**

```bash
# 在 Claude Code 中
你：请根据 .bmad/stories/sprint-01/story-001-project-setup.md 初始化项目

Claude Code（Dev 代理）：
[自动读取 story-001.md]

理解上下文：
- 项目：AI 学习助手
- 架构：React + FastAPI + PostgreSQL + Pinecone
- 需求：支持智能答疑、学习追踪

开始实施：
1. 创建项目结构...
2. 初始化 Git 仓库...
3. 配置 package.json...
[完整实现...]

✅ 验证验收标准：
- [x] 项目结构创建完成
- [x] 所有依赖安装成功
- [x] 可以启动开发服务器
```

**关键优势**：
- ✅ Claude 无需你重复解释架构（故事文件已包含）
- ✅ 所有代码符合统一技术栈（PRD + 架构已定义）
- ✅ 验收标准清晰（每个故事都有 checklist）

**Step 3：逐个完成故事**

```bash
# Story 002: 数据库设置
你：请实现 story-002-database-setup.md

Claude Code：
[读取 story-002.md]
- 理解：需要 PostgreSQL + Pinecone
- 表结构：users, chat_sessions, messages
- 向量数据库：knowledge_nodes
[实现...]

# Story 003: 认证系统
你：请实现 story-003-auth-system.md

Claude Code：
[读取 story-003.md]
- 理解：JWT 认证
- API: /api/auth/register, /api/auth/login
- 中间件：auth_middleware
[实现...]

# 依此类推，直到完成所有故事
```

**Step 4：QA 代理验证**

```bash
你：请作为 QA 检查当前实现是否符合 story-001 到 story-003 的验收标准

Claude Code（QA 代理）：
正在验证...

Story 001 ✅ 全部通过
Story 002 ⚠️ 发现问题：
  - Pinecone 连接缺少错误处理
  建议：添加 try-catch 和重试机制

Story 003 ✅ 全部通过
```

#### BMAD 开发的"魔法"

**传统开发的痛点**：
```
第 1 天：你告诉 AI "用 React + FastAPI"
第 3 天：AI 问 "用什么前端框架？" ← 忘了！
第 5 天：AI 实现了 Express 后端 ← 矛盾！
```

**BMAD 开发的解决方案**：
```
所有上下文在故事文件中
        ↓
Claude Code 每次读取故事
        ↓
始终理解全局架构
        ↓
代码一致性 100%
```

#### 敏捷开发流程（整合 BMAD）

**Sprint 1（Week 1-2）**：
- Day 1-2：Story 001-003（项目基础）
- Day 3-5：Story 004-006（核心功能 1）
- Day 6-10：Story 007-010（核心功能 2）
- Sprint Review：Demo 给团队

**Sprint 2（Week 3-4）**：
- 继续后续故事...

**每日站会**（15 分钟）：
- 昨天：完成 story-005
- 今天：实现 story-006
- 阻碍：Pinecone API 配额不足

#### 开发规范

**代码规范**：
- ESLint/Prettier（前端）
- Black/Flake8（后端）
- 故事文件中已包含代码示例

**测试策略**：
- 单元测试：每个故事都有测试要求
- 集成测试：API 测试在故事中定义
- AI 质量测试：评估集 ≥100 用例
- E2E 测试：关键流程

**Git 工作流**：
```bash
# 每个故事一个分支
git checkout -b story-001-project-setup
# 实现...
git add .
git commit -m "Implement story-001: Project setup"
git push origin story-001-project-setup
# PR review
```

#### 产出物
- [ ] ✅ 功能完整的 MVP（按故事逐步构建）
- [ ] 测试报告（每个故事的验收标准）
- [ ] 性能基准数据
- [ ] 技术债务清单

#### 进入下一阶段的标准

- ✅ 所有 Must Have 故事完成
- ✅ 核心功能可用且稳定
- ✅ 测试覆盖率 > 60%
- ✅ 性能达标（P95 < 3s）
- ✅ AI 功能质量达标（准确率 > 80%）

---

### 阶段 6：内测与优化（BMAD 持续迭代阶段）
**⏱ 时间**：2-3 周
**🎯 核心目标**：真实环境验证并快速迭代
**🤖 BMAD 代理**：Scrum Master（更新故事）+ Dev（实现优化）+ QA（验证改进）
**💻 执行环境**：Claude Code（继续使用相同环境）

#### 🔄 BMAD 迭代工作流

**传统优化的问题**：
```
发现 Bug → 修复代码 → 上线
        ↓
过了一周，AI 忘记了这个 Bug 的背景
        ↓
又重复犯同样的错误
```

**BMAD 迭代的解决方案**：
```
用户反馈 → Scrum Master 创建新故事
        ↓
.bmad/stories/story-015-optimize-response-time.md
（包含：问题背景、数据证据、优化目标、验收标准）
        ↓
Dev 读取故事 → 实现优化 → QA 验证
        ↓
所有改进决策永久记录 ✅
```

#### 📊 灰度发布 + BMAD 反馈循环

**Week 1：种子用户测试**
```bash
# 1. 部署到测试环境
git checkout -b staging
git push staging main

# 2. 收集反馈（内部团队 + 5-10 种子用户）
- 用户行为埋点（Mixpanel/Amplitude）
- 会话录制（FullStory/Hotjar）
- AI 输出质量评分

# 3. 分析问题，创建优化故事
# 假设发现：AI 响应时间过慢（5-8 秒）

# 回到 Gemini Gems（Scrum Master）
*scrum
"用户反馈 AI 响应时间 5-8 秒，目标优化到 2 秒以内。
现有技术栈：FastAPI + GPT-4 + Redis 缓存。
请创建优化故事。"

# 产出：.bmad/stories/story-015-optimize-response-time.md
```

**Week 2：实施优化（Dev 代理）**
```bash
# 在 Claude Code 中
# 读取优化故事
cat .bmad/stories/story-015-optimize-response-time.md

# Dev 代理理解上下文：
# - 为什么慢？（没有缓存命中）
# - 优化目标是什么？（2 秒以内）
# - 架构约束是什么？（不能改变核心流程）

# 实施优化
1. 提示词压缩（减少 token 数量）
2. 增加智能缓存层
3. 对常见查询启用预计算

# QA 验证
pytest tests/test_response_time.py
# 验证通过：P95 响应时间 1.8 秒 ✅

# 提交代码
git add .
git commit -m "Optimize AI response time to <2s

Based on story-015:
- Compressed prompt templates (-40% tokens)
- Added intelligent caching layer
- Pre-computed common queries

Metrics: P95 response time: 1.8s (was 6.2s)

🤖 Generated with Claude Code"
```

**Week 3：扩展用户 + 新一轮优化**
```bash
# 扩展到 200-500 用户
# 发现新问题 → 创建新故事 → 继续迭代
```

#### 🎯 BMAD 优化三大重点

**1. 性能优化故事示例**
```markdown
.bmad/stories/story-016-caching-strategy.md

## 上下文
项目：AI 学习助手
问题：重复查询导致成本高、响应慢
数据：70% 查询是重复的，每天 API 成本 $120

## 优化方案
1. Redis 缓存层：缓存相似查询结果
2. 语义缓存：embedding 相似度 > 0.95 视为重复
3. TTL 策略：用户数据 5 分钟，通用知识 24 小时

## 验收标准
- [ ] 缓存命中率 > 60%
- [ ] API 成本降低 50%
- [ ] P95 响应时间 < 2s
```

**2. 成本优化故事示例**
```markdown
.bmad/stories/story-017-cost-reduction.md

## 上下文
项目：AI 学习助手
问题：80% 查询是简单问题，但用 GPT-4（$0.03/1K）
成本：每月 $3,600

## 优化方案
1. 查询分级：简单问题用 GPT-3.5-turbo（$0.001/1K）
2. 智能路由：根据复杂度自动选择模型
3. 提示词压缩：减少系统提示词 token

## 验收标准
- [ ] 80% 查询路由到 GPT-3.5
- [ ] 月成本降至 < $800
- [ ] 用户满意度保持 > 4.5/5
```

**3. 体验优化故事示例**
```markdown
.bmad/stories/story-018-streaming-ux.md

## 上下文
项目：AI 学习助手
问题：用户等待 AI 回复时无反馈，感觉"卡死"
数据：20% 用户在 3 秒内关闭页面

## 优化方案
1. 流式输出：OpenAI Streaming API
2. 打字机效果：逐字显示
3. 友好错误提示：API 失败时显示降级方案

## 验收标准
- [ ] 首字响应 < 500ms
- [ ] 实现流式输出
- [ ] 3 秒内关闭率 < 5%
```

#### 📈 产出物

**技术产出**
- [ ] 优化后的产品版本
- [ ] 更新的故事文件（记录所有优化决策）
- [ ] 性能测试报告
- [ ] 成本分析报告

**BMAD 知识库产出**
- [ ] `.bmad/stories/` 包含所有优化故事
- [ ] `.bmad/optimization-log.md` 记录迭代历程
- [ ] 团队知识沉淀（下次遇到类似问题直接查阅）

**关键价值**：
每一次优化都有完整上下文记录，未来遇到类似问题时，AI 可以读取历史故事，避免重复试错

---

### 阶段 7：上线准备与发布（BMAD 持续运营阶段）
**⏱ 时间**：1-2 周准备 + 持续迭代
**🎯 核心目标**：确保生产环境稳定可靠并成功发布
**🤖 BMAD 代理**：全团队协作（Scrum Master → Dev → QA）
**💻 执行环境**：Claude Code（开发）+ 监控系统（数据收集）

#### 🚀 BMAD 赋能的上线准备

**传统上线的挑战**：
```
上线后发现问题 → 紧急修复
        ↓
新团队成员加入 → 不知道之前为什么这么做
        ↓
重复踩坑
```

**BMAD 上线的优势**：
```
.bmad/ 目录包含完整历史
├── stories/          # 所有开发故事
├── architecture.md   # 架构决策记录
├── prd.md           # 产品需求文档
└── lessons-learned.md # 经验教训
        ↓
任何人（包括新 AI）读取后立即理解全局
        ↓
知识永不丢失 ✅
```

#### ✅ 生产环境检查清单（BMAD 加持）

**第 1 步：基础设施检查故事**
```bash
# 在 Gemini Gems（Scrum Master）
*scrum
"项目即将上线，需要创建生产环境检查清单故事。
技术栈：FastAPI + PostgreSQL + Redis + Docker + AWS。
请生成部署检查故事。"

# 产出：.bmad/stories/story-020-production-deployment.md
```

**故事内容示例**：
```markdown
.bmad/stories/story-020-production-deployment.md

## 上下文
项目：AI 学习助手
阶段：生产环境上线
架构：FastAPI + PostgreSQL + Redis + Docker + AWS ECS

## 检查清单

### 基础设施
- [ ] AWS ECS 集群部署完成
- [ ] RDS PostgreSQL（主从备份）配置
- [ ] ElastiCache Redis 集群部署
- [ ] CloudFront CDN 配置
- [ ] Route 53 域名解析（api.example.com）
- [ ] SSL 证书（Let's Encrypt）

### 安全性
- [ ] API 密钥存储在 AWS Secrets Manager
- [ ] 速率限制：100 req/min per user
- [ ] AWS WAF DDoS 防护启用
- [ ] 数据库连接加密（TLS 1.3）
- [ ] CORS 策略限制为前端域名

### 监控告警
- [ ] Sentry 错误追踪（error rate > 5%）
- [ ] CloudWatch 日志聚合
- [ ] Datadog APM（P95 > 3s 告警）
- [ ] OpenAI API 成本告警（$100/day）
- [ ] Slack 告警通知

### 成本控制
- [ ] OpenAI API 配额：$500/day
- [ ] 用户请求限制：50 queries/day（免费用户）
- [ ] Redis TTL 策略防止内存爆炸
- [ ] CloudWatch 成本仪表盘

## 验收标准
- [ ] 压力测试通过（1000 并发用户）
- [ ] 监控告警测试通过
- [ ] 灾难恢复演练完成
```

**第 2 步：在 Claude Code 执行检查**
```bash
# 读取检查故事
cat .bmad/stories/story-020-production-deployment.md

# 执行检查脚本
python scripts/pre-deployment-check.py

# 输出：
# ✅ Database: Connected (latency: 12ms)
# ✅ Redis: Connected (memory: 45% used)
# ✅ API Keys: Valid and encrypted
# ✅ SSL Certificate: Valid until 2025-12-01
# ✅ Monitoring: Sentry & Datadog configured
# ⚠️ WARNING: Rate limiting not configured

# 修复问题
# Claude Code 读取架构文档 + 故事上下文
# 实现 rate limiting middleware

# 再次检查
python scripts/pre-deployment-check.py
# ✅ All checks passed!
```

#### 📋 运营准备（BMAD 文档生成）

**用户文档生成**
```bash
# 在 Gemini Gems（PM）
*pm
"基于 PRD 和已实现功能，生成用户使用指南。
目标用户：大学生和职场人士。
包含：快速开始、核心功能、常见问题。"

# 产出：docs/user-guide.md
```

**技术文档同步**
```bash
# .bmad/architecture.md 自动成为开发文档
# 所有故事文件就是开发历史记录
# 新团队成员 onboarding：
1. 阅读 .bmad/prd.md（理解产品目标）
2. 阅读 .bmad/architecture.md（理解技术架构）
3. 按顺序阅读 .bmad/stories/（理解开发决策）
```

#### 🚀 BMAD 支持的发布策略

**Day 1：软发布**
```bash
# 1. 部署到生产环境
git checkout main
git pull origin main
./deploy.sh production

# 2. 监控关键指标（实时）
- Sentry：错误率
- Datadog：API 响应时间
- OpenAI Dashboard：Token 使用量
- Google Analytics：用户行为

# 3. 发现问题 → 立即创建故事
# 假设：API 响应时间 P95 = 4.5s（目标 < 3s）

# 回到 Gemini Gems（Scrum Master）
*scrum
"生产环境 P95 响应时间 4.5s，超出 3s 目标。
可能原因：数据库查询未优化、Redis 缓存命中率低。
请创建紧急优化故事。"

# 产出：.bmad/stories/story-021-emergency-perf-fix.md
```

**Week 1-2：逐步扩大 + 持续迭代**
```bash
# 每天的工作流程：
1. 查看监控仪表盘
2. 收集用户反馈
3. 识别高优先级问题
4. 创建新故事（Scrum Master）
5. 实现修复（Dev + Claude Code）
6. 验证并发布（QA）

# BMAD 的优势：
每个问题都有完整的上下文记录
→ 未来遇到类似问题直接查阅历史故事
→ 避免重复试错
```

**Week 3-4：正式发布**
```bash
# 营销准备
- Landing Page（基于 PRD 价值主张）
- 产品演示视频
- 首批用户案例

# BMAD 知识库此时已包含：
.bmad/
├── stories/           # 30+ 开发故事（完整历史）
├── prd.md            # 产品定义
├── architecture.md   # 架构文档
├── optimization-log.md # 优化记录
└── production-runbook.md # 运维手册
```

#### 📊 持续监控指标（BMAD 数据驱动迭代）

**北极星指标**
- 活跃用户数
- 核心功能使用次数
- 用户生成价值

**用户增长**
- 新用户、激活率、留存率（D1/D7/D30）

**用户参与**
- 使用频率、会话时长、功能深度

**商业指标**
- 转化率、ARPU、LTV/CAC

**技术指标**
- API 成功率、响应时间、AI 质量分数、单位成本

**BMAD 增强：数据驱动故事生成**
```bash
# 每周数据回顾 → 自动生成优化方向
# 示例：发现 D7 留存率仅 15%（目标 > 30%）

# 在 Gemini Gems（Analyst）
*analyst
"D7 留存率 15%，远低于目标 30%。
用户数据显示：60% 用户只用过一次就流失。
请分析原因并提出改进建议。"

# Analyst 分析 → PM 更新 PRD → Scrum Master 生成新故事
# → Dev 实现留存功能（如：每日推送、成就系统）
```

#### 🔄 BMAD 迭代节奏

**紧急修复（Hot Fix）**
```bash
# 发现严重 Bug → 立即创建故事 → Dev 修复 → 30 分钟内上线
*scrum "紧急：用户无法登录，错误 500..."
→ .bmad/stories/story-hotfix-001.md
→ Claude Code 修复
→ git commit & deploy
```

**小优化（Weekly）**
```bash
# 每周积累的小改进
*scrum "本周优化：缓存策略、错误提示、UI 调整..."
→ .bmad/stories/story-weekly-improvements.md
→ 批量实现并测试
→ 周五发布
```

**新功能（Bi-weekly）**
```bash
# 基于用户反馈的新功能
*analyst → *pm → *architect → *scrum
→ 完整的 BMAD 规划流程
→ 生成新的开发故事
→ Dev 实现（完整上下文）
→ 发布
```

#### 🎯 BMAD 在生产环境的终极价值

**传统方式的痛点**：
```
6 个月后：
"为什么我们当初用 PostgreSQL 而不是 MongoDB？"
"为什么缓存 TTL 设置成 5 分钟？"
"这个 API 为什么这么设计？"

没有人记得了 → 只能重新调研 → 浪费时间
```

**BMAD 的解决方案**：
```
6 个月后：
"为什么我们当初用 PostgreSQL 而不是 MongoDB？"
→ 读取 .bmad/stories/story-003-database-selection.md
→ 完整的技术调研、对比表、决策理由

"为什么缓存 TTL 设置成 5 分钟？"
→ 读取 .bmad/stories/story-016-caching-strategy.md
→ 数据分析、实验结果、性能指标

所有决策都有完整记录 ✅
知识永不丢失 ✅
新 AI 读取后立即理解全局 ✅
```

---

## 🎬 端到端实战案例：用 BMAD 开发 AI 学习助手

### 项目背景
**产品想法**：开发一个 AI 驱动的个性化学习助手，帮助大学生更高效地学习。

**时间线**：6 周从想法到 MVP 上线

**团队**：1 个人（你）+ BMAD AI 代理团队

---

### 📅 Week 1：规划阶段（Gemini Gems）

#### Day 1-2：需求分析（Analyst）

```bash
# 在 Gemini Gems 创建 Analyst 代理
# 上传团队包文件：bmad-analyst.txt

*analyst
"产品想法：AI 学习助手，帮助大学生更高效学习。
目标用户：大学生、考研学生。
请进行需求分析和市场调研。"
```

**Analyst 产出**：
```markdown
.bmad/analysis.md

## 市场调研
- 竞品：Quizlet, Khan Academy, ChatGPT
- 差异化机会：个性化学习路径、智能知识图谱

## 用户痛点
1. 学习材料太多，不知道从哪里开始
2. 知识点之间缺乏联系，难以形成体系
3. 缺乏个性化的学习建议

## MVP 核心功能建议
1. 智能问答（基于用户上传的学习材料）
2. 知识图谱可视化
3. 个性化学习路径推荐
```

#### Day 3-4：产品需求文档（PM）

```bash
*pm
"基于 @analysis.md 的分析结果，生成 PRD。
MVP 目标：4 周开发，6 周上线。
技术约束：个人开发，预算有限（API 成本 < $100/月）。"
```

**PM 产出**：
```markdown
.bmad/prd.md

## 产品定位
智能学习助手，帮助大学生构建知识体系

## 核心功能（MVP）
1. **智能问答**：上传 PDF/文档，AI 回答问题
2. **知识图谱**：自动提取概念并可视化关系
3. **学习路径**：基于知识图谱推荐学习顺序

## 非功能需求
- 响应时间 < 3s
- 支持 PDF 最大 10MB
- API 成本 < $0.05/query

## 用户故事（MoSCoW）
**Must Have**：
- 作为学生，我可以上传 PDF 并提问
- 作为学生，我可以查看知识图谱

**Should Have**：
- 作为学生，我可以获得个性化学习路径

**Could Have**：
- 作为学生，我可以分享我的学习进度

**Won't Have**（本版本不做）：
- 社交功能、直播课程
```

#### Day 5-6：架构设计（Architect）

```bash
*architect
"基于 @prd.md，设计系统架构。
技术栈偏好：Python（熟悉），云平台：AWS。
预算限制：月成本 < $200。"
```

**Architect 产出**：
```markdown
.bmad/architecture.md

## 技术选型

### 后端
- **框架**：FastAPI（高性能、异步）
- **数据库**：PostgreSQL（用户数据、文档元数据）
- **向量数据库**：Pinecone（免费层，1M 向量）
- **缓存**：Redis（AWS ElastiCache）

### AI/ML
- **LLM**：GPT-3.5-turbo（$0.001/1K tokens，便宜）
- **Embedding**：text-embedding-3-small（$0.00002/1K tokens）
- **知识图谱提取**：SpaCy + NetworkX

### 前端
- **框架**：React + TypeScript
- **UI 库**：Tailwind CSS + shadcn/ui
- **图谱可视化**：React Flow

### 基础设施
- **部署**：Docker + AWS ECS
- **存储**：S3（PDF 文件）
- **监控**：Sentry（错误追踪）+ CloudWatch

## 系统架构图
[详细的架构图和数据流...]

## 成本估算
- OpenAI API: $50/月（预估 50K queries）
- Pinecone: $0（免费层）
- AWS: $100/月（ECS + RDS + Redis）
总计：$150/月 ✅
```

#### Day 7：生成开发故事（Scrum Master）

```bash
*scrum
"基于 @prd.md 和 @architecture.md，生成开发故事。
按照 MoSCoW 优先级排序。
每个故事包含：上下文、任务、验收标准。"
```

**Scrum Master 产出**：
```bash
.bmad/stories/
├── story-001-project-setup.md
├── story-002-database-schema.md
├── story-003-pdf-upload-api.md
├── story-004-embedding-generation.md
├── story-005-qa-endpoint.md
├── story-006-knowledge-graph-extraction.md
├── story-007-frontend-qa-interface.md
├── story-008-knowledge-graph-visualization.md
├── story-009-learning-path-algorithm.md
└── story-010-deployment-setup.md
```

---

### 📅 Week 2-4：开发阶段（Claude Code）

#### Week 2：核心功能开发

**Day 1：环境切换**
```bash
# 从 Gemini Gems 切换到 Claude Code（VSCode）
# 克隆项目并打开
git clone <your-repo>
cd ai-learning-assistant
cursor .  # 或 code .

# 在 Claude Code 中开始第一个故事
```

**Story 001：项目初始化**
```bash
# 在 Claude Code 对话框中
"读取 .bmad/stories/story-001-project-setup.md 并执行"

# Claude Code 理解上下文：
# - 项目名称：AI Learning Assistant
# - 技术栈：FastAPI + PostgreSQL + Redis + React
# - 架构决策：见 .bmad/architecture.md

# Claude Code 自动执行：
1. 初始化 FastAPI 项目结构
2. 配置 Poetry/pip dependencies
3. 设置 Docker Compose（PostgreSQL + Redis）
4. 创建 .env.example
5. 编写 README.md
6. 初始化 Git 仓库

# 提交
git add .
git commit -m "Initialize project structure

Based on story-001:
- FastAPI backend setup
- Docker Compose for local development
- Poetry dependency management

🤖 Generated with Claude Code"
```

**Story 002-005：后端 API 开发**
```bash
# Story 002：数据库设计
"读取 .bmad/stories/story-002-database-schema.md 并实现"

# Claude Code 产出：
- models/user.py
- models/document.py
- alembic/versions/001_initial_schema.py

# Story 003：PDF 上传 API
"读取 .bmad/stories/story-003-pdf-upload-api.md 并实现"

# Claude Code 产出：
- api/routes/documents.py
- services/pdf_processor.py
- tests/test_document_upload.py

# 运行测试
pytest tests/test_document_upload.py
# ✅ All tests passed

# Story 004：Embedding 生成
"读取 .bmad/stories/story-004-embedding-generation.md 并实现"

# Claude Code 理解上下文：
# - 使用 text-embedding-3-small（成本考虑）
# - 分块策略：500 tokens/chunk，100 overlap
# - 存储：Pinecone

# Claude Code 产出：
- services/embedding_service.py
- services/pinecone_client.py

# Story 005：问答接口
"读取 .bmad/stories/story-005-qa-endpoint.md 并实现"

# Claude Code 产出：
- api/routes/qa.py
- services/qa_service.py（RAG 实现）
- tests/test_qa.py

# 测试
curl -X POST http://localhost:8000/api/qa \
  -H "Content-Type: application/json" \
  -d '{"question": "什么是机器学习？", "document_id": "123"}'

# ✅ 响应时间：1.2s，质量良好
```

#### Week 3：知识图谱功能

**Story 006-008：知识图谱**
```bash
# Story 006：知识图谱提取
"读取 .bmad/stories/story-006-knowledge-graph-extraction.md 并实现"

# Claude Code 产出：
- services/knowledge_graph_service.py
- utils/nlp_processor.py（SpaCy + NetworkX）

# Story 007：前端问答界面
"读取 .bmad/stories/story-007-frontend-qa-interface.md 并实现"

# Claude Code 产出（React）：
- src/components/QuestionInput.tsx
- src/components/AnswerDisplay.tsx
- src/hooks/useQA.ts

# Story 008：知识图谱可视化
"读取 .bmad/stories/story-008-knowledge-graph-visualization.md 并实现"

# Claude Code 产出：
- src/components/KnowledgeGraphView.tsx（React Flow）
- src/utils/graphLayout.ts
```

#### Week 4：学习路径 + 测试

**Story 009-010：完善功能**
```bash
# Story 009：学习路径推荐
"读取 .bmad/stories/story-009-learning-path-algorithm.md 并实现"

# Claude Code 产出：
- services/learning_path_service.py
- algorithms/graph_traversal.py

# Story 010：部署配置
"读取 .bmad/stories/story-010-deployment-setup.md 并实现"

# Claude Code 产出：
- Dockerfile
- docker-compose.prod.yml
- .github/workflows/deploy.yml
- scripts/deploy.sh

# 本地测试完整流程
docker-compose up
# ✅ 所有功能正常运行
```

---

### 📅 Week 5：内测优化（BMAD 迭代）

**发现问题 1：响应时间慢**
```bash
# 用户反馈：首次查询需要 5-8 秒

# 回到 Gemini Gems（Scrum Master）
*scrum
"用户反馈响应时间 5-8 秒，目标 < 3s。
现有流程：PDF 解析 → Embedding → Pinecone 查询 → GPT-3.5。
请创建优化故事。"

# 产出：.bmad/stories/story-011-optimize-response-time.md
```

**在 Claude Code 实现优化**
```bash
"读取 .bmad/stories/story-011-optimize-response-time.md 并实现"

# Claude Code 优化：
1. 预处理：上传时就生成 embedding（而非查询时）
2. 缓存：Redis 缓存相似查询
3. 并行处理：同时查询 Pinecone 和准备 prompt

# 测试结果：
- P95 响应时间：1.8s ✅
- 缓存命中率：65% ✅

git commit -m "Optimize QA response time to <2s

Based on story-011:
- Pre-generate embeddings on upload
- Add Redis caching for similar queries
- Parallel processing for vector search

Metrics: P95 1.8s (was 6.2s)

🤖 Generated with Claude Code"
```

**发现问题 2：成本超预算**
```bash
# 监控显示：API 成本 $180/月（超出 $50 预算）

*scrum
"API 成本 $180/月，超出 $50 预算。
分析：80% 查询是简单问题，不需要 GPT-3.5。
请创建成本优化故事。"

# 产出：.bmad/stories/story-012-cost-reduction.md

# Claude Code 实现：
1. 查询分类器：简单问题用规则引擎（$0）
2. 智能缓存：相似度 > 0.95 直接返回缓存
3. Prompt 压缩：减少系统提示词 token

# 结果：
- 月成本降至 $45 ✅
- 用户满意度保持 4.6/5 ✅
```

---

### 📅 Week 6：上线发布

**生产环境部署**
```bash
# 读取部署检查清单
cat .bmad/stories/story-020-production-deployment.md

# 执行部署
./scripts/deploy.sh production

# 监控关键指标
- Sentry：0 errors ✅
- Datadog：P95 响应时间 1.9s ✅
- OpenAI Dashboard：$1.50/day ✅

# 正式发布
- 在 Product Hunt 发布
- 在大学论坛分享
- 首周获得 200 用户 🎉
```

---

### 🎯 6 周后的成果

**产品成果**
- ✅ MVP 成功上线
- ✅ 200+ 活跃用户
- ✅ D7 留存率 35%
- ✅ 用户满意度 4.6/5

**BMAD 知识库**
```
.bmad/
├── prd.md                    # 产品定义
├── architecture.md           # 架构文档
├── analysis.md              # 市场分析
├── stories/                 # 12 个开发故事
│   ├── story-001-project-setup.md
│   ├── story-002-database-schema.md
│   ├── ...
│   └── story-012-cost-reduction.md
├── optimization-log.md      # 优化记录
└── production-runbook.md    # 运维手册
```

**关键价值**
1. **完整上下文**：任何时候重新打开项目，AI 读取 `.bmad/` 立即理解全局
2. **决策记录**：为什么用 Pinecone？为什么是 500 tokens/chunk？一切都有记录
3. **可复用性**：下次做类似项目，直接参考这次的故事文件
4. **团队协作**：新成员加入，阅读 `.bmad/` 即可快速上手

---

### 💡 关键经验教训

**BMAD 让个人开发者拥有团队级生产力**
```
传统方式：
- 想法 → 直接写代码 → 改来改去 → 放弃（3 个月）

BMAD 方式：
- 想法 → Analyst 分析 → PM 定义 → Architect 设计 → 有计划地开发
- 遇到问题 → 创建新故事 → 有上下文地解决
- 6 周 MVP 上线 ✅
```

**故事文件是"时间机器"**
```
3 个月后重新打开项目：
- 传统方式："这代码是谁写的？为什么这么设计？"（忘记了）
- BMAD 方式：读取 .bmad/stories/ → 立即回忆起完整上下文

6 个月后团队扩展：
- 传统方式：新人问一堆问题 → 你花 2 周解释
- BMAD 方式：新人阅读 .bmad/ → 自己理解 → 1 天上手
```

**成本控制从第一天开始**
```
BMAD 强制你在架构阶段就考虑成本：
- Architect 阶段：估算 $150/月
- Story 创建：每个故事都包含成本考虑
- 开发过程：持续监控，超预算立即优化
- 结果：实际成本 $45/月（比预算低 90%）
```

---

## ✅ 关键检查清单

### MVP 上线最终检查清单

**产品维度**
- [ ] 核心功能可用且稳定
- [ ] 用户体验流畅
- [ ] 有明确的价值传递
- [ ] 关键指标可衡量

**技术维度**
- [ ] 代码质量达标（测试覆盖率 > 60%）
- [ ] 性能达标（P95 响应时间 < 3s）
- [ ] 安全措施到位
- [ ] 监控告警完善

**AI 维度**
- [ ] 模型输出质量达标（准确率 > 80%）
- [ ] 成本可控（单次调用成本明确）
- [ ] 失败场景有降级方案
- [ ] 持续优化机制建立

**运营维度**
- [ ] 用户文档完备
- [ ] 支持渠道就绪
- [ ] 法律文件齐全（隐私政策、服务条款）
- [ ] 发布计划清晰

---

## 🚨 常见陷阱速查

### 1. 过度承诺 AI 能力
**问题**：宣传 AI 能做任何事
**应对**：明确使用场景、设置合理预期、提供人工兜底

### 2. 忽视数据质量
**问题**：以为有模型就够了
**应对**：投入 30-50% 时间在数据上、建立数据质量监控

### 3. 成本失控
**问题**：没有成本监控机制
**应对**：从 Day 1 监控单位成本、设置用量上限、多层缓存

### 4. 缺乏评估体系
**问题**：凭感觉判断 AI 效果
**应对**：建立标准评估集、定期人工评审、A/B 测试验证

### 5. 忽视用户教育
**问题**：假设用户懂 AI
**应对**：提供使用示例、引导式体验、及时反馈机制

---

## 🛠 推荐工具清单

### 项目管理
- **任务管理**：Linear / Jira
- **文档协作**：Notion / Confluence
- **设计协作**：Figma

### 开发工具
- **代码管理**：GitHub / GitLab
- **IDE**：Cursor / VSCode
- **API 测试**：Postman / Insomnia

### AI 开发工具
- **应用框架**：LangChain / LlamaIndex
- **实验跟踪**：Weights & Biases
- **提示词管理**：PromptLayer
- **调试监控**：LangSmith

### AI 代理协作（推荐 ⭐）
- **BMAD-METHOD**：代理化敏捷开发框架
  - GitHub: https://github.com/bmad-code-org/BMAD-METHOD
  - Stars: 19.4k
  - 用途：规划、架构、开发全流程 AI 代理协作
  - 快速开始：`npx bmad-method install`

### 监控分析
- **错误追踪**：Sentry
- **用户分析**：Mixpanel / Amplitude
- **系统监控**：Grafana / Datadog

### 成本管理
- **LLM 成本监控**：Langfuse
- **用量计费**：OpenMeter

### 快速原型
- **无代码平台**：Bubble / Webflow
- **Python 原型**：Streamlit / Gradio
- **自动化工作流**：Zapier / Make

---

## 💡 使用建议

### 给 AI 创业者的建议

1. **先从一个具体场景切入**
   - 不要做"通用 AI 助手"
   - 选择一个垂直领域深耕

2. **MVP 要"真"的小**
   - 第一版只做 1-2 个核心功能
   - 目标是 4-6 周上线，不是 6 个月

3. **建立数据飞轮**
   - 从 Day 1 收集用户反馈
   - 用真实数据优化模型/提示词
   - 让产品随使用变得更好

4. **控制成本结构**
   - 清楚每个用户的边际成本
   - 设计可持续的定价模型

5. **快速验证，快速失败**
   - 每个假设都要用最快方式验证
   - 不要爱上你的方案，爱上你的问题

### 如何使用本框架

- **初期规划**：按阶段顺序阅读，制定项目计划
- **执行过程**：对照检查清单确保不遗漏关键环节
- **遇到问题**：查看"常见陷阱"部分寻找解决方案
- **工具选型**：参考推荐工具清单进行决策

---

---

## 🤖 BMAD-METHOD 集成指南

### 什么是 BMAD-METHOD？

**BMAD-METHOD™** 是一个通用 AI 代理协作框架，实现"代理化敏捷驱动开发"（Agentic Agile Driven Development）。

**核心特点**：
- ⭐ 19.4k GitHub Stars
- 🔓 开源（MIT License）
- 🏆 解决 AI 辅助开发的两大痛点：规划不一致 + 上下文丢失

### 核心方法论

#### **阶段 1：代理规划（Agentic Planning）**
专业化 AI 代理团队 + 人机协作
- 🔍 **Analyst 代理**：需求分析和市场调研
- 📋 **PM 代理**：产品管理和 PRD 生成
- 🏗️ **Architect 代理**：系统架构设计

**产出**：规范级 PRD + 详细架构文档

#### **阶段 2：上下文工程开发**
上下文驱动的代码实现
- 📝 **Scrum Master 代理**：分解为超详细开发故事
- 💻 **Dev 代理**：读取故事文件（嵌入完整上下文）执行开发
- ✅ **QA 代理**：自动化质量验证

**创新**：通过故事文件实现异步协作和知识持久化

### 快速开始

#### **安装（1 条命令）**
```bash
npx bmad-method install
```

**系统要求**：Node.js v20+

#### **Web UI 快速路径（2 分钟）**
1. 下载团队包：`team-fullstack.txt`
2. 创建 Gemini Gem 或 CustomGPT
3. 上传团队包，开始规划

### 核心命令

| 命令 | 代理 | 用途 | 对应阶段 |
|------|------|------|----------|
| `*analyst` | Analyst | 需求分析 | 阶段 0 |
| `*pm` | PM | PRD 生成 | 阶段 1 |
| `*architect` | Architect | 架构设计 | 阶段 2 |
| `*scrum` | Scrum Master | 创建开发故事 | 阶段 5 |
| `*help` | - | 查看命令 | 任何时候 |

### 与 Claude Code 协同工作流

**黄金组合**：
```
BMAD-METHOD（规划层）
    ↓
生成 PRD + 架构 + 开发故事
    ↓
Claude Code（执行层）
    ↓
读取故事 → 实现代码 → 运行测试
```

**实际操作**：
```
# 1. 规划阶段（BMAD Web UI）
*analyst → 需求分析
*pm → PRD 生成
*architect → 架构设计
*scrum → 生成开发故事

# 2. 开发阶段（Claude Code）
在 Claude Code 中：
"请根据 .bmad/stories/story-001.md 实现用户认证功能"

Claude Code 自动：
- 读取故事文件（包含完整上下文）
- 理解架构设计
- 实现功能
- 运行测试
```

### 使用场景示例

#### **场景：开发 AI 聊天机器人**

**第 1 步：想法验证（BMAD Analyst）**
```
你：我想做一个教育行业的 AI 辅导机器人
*analyst

Analyst：
- 目标用户：K-12 学生和教师
- 核心痛点：个性化学习、即时答疑
- 技术可行性：RAG + GPT-4
```

**第 2 步：需求定义（BMAD PM）**
```
*pm

PM：生成 PRD
- Must Have: 智能答疑、学习追踪
- Should Have: 个性化推荐
- 北极星指标：学生日活 + 问题解决率
```

**第 3 步：架构设计（BMAD Architect）**
```
*architect

Architect：
- 前端：React + WebSocket
- 后端：Python FastAPI
- AI: GPT-4 + RAG (Pinecone)
- 数据库：PostgreSQL + Redis
```

**第 4 步：开发执行（BMAD + Claude Code）**
```
*scrum  # 生成开发故事

然后在 Claude Code 中：
"请按照 .bmad/stories/ 中的故事顺序实现功能"
```

### 最佳实践

1. **规划阶段必须使用 Web UI**
   - 推荐：Gemini Gems（免费）或 CustomGPT（需 ChatGPT Plus）
   - 原因：BMAD 规划需要上传团队包文件，必须在 Web UI 中运行
   - ⚠️ 不支持：Claude Code、Claude.ai（无法上传团队包）

2. **开发阶段推荐 Claude Code**
   - 推荐：Claude Code（Sonnet 4.5）
   - 原因：强大的代码能力 + 完整 IDE 集成
   - 工作方式：读取 `.bmad/stories/` 中的故事文件执行开发

3. **保持更新**
   ```bash
   npx bmad-method install  # 定期运行
   ```

4. **理解工作流图**
   - 查看 BMAD GitHub README 中的工作流图
   - 理解 PRD + 架构如何创建
   - 理解代理如何通过故事文件协作

### 社区资源

- 📖 [GitHub Repository](https://github.com/bmad-code-org/BMAD-METHOD)
- 💬 Discord 社区
- 📺 YouTube 教程

---

## 📝 下次讨论时更新

本文档会根据深入讨论持续优化，重点关注：
- [x] BMAD-METHOD 集成指南
- [ ] 具体 AI 创业想法的定制化流程
- [ ] 特定阶段的深度展开
- [ ] 实际案例补充
- [ ] 模板文件添加

---

**文档结束** | 如有疑问或需要深入探讨某个阶段，请随时提出
