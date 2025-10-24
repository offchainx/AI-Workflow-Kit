# 🎯 n8n 完全指南 - Think Hard Edition

**项目**: [n8n - Workflow Automation Platform](https://github.com/n8n-io/n8n)
**星标**: 151k+ | **集成**: 400+ | **开源**: Fair-code License
**重要性**: ⭐⭐⭐⭐⭐ (工作流自动化的终极工具)

---

## 📋 目录

1. [什么是 n8n](#1-什么是-n8n)
2. [为什么选择 n8n](#2-为什么选择-n8n)
3. [核心架构原理](#3-核心架构原理)
4. [节点系统详解](#4-节点系统详解)
5. [工作流设计](#5-工作流设计)
6. [代码能力](#6-代码能力)
7. [AI 集成](#7-ai-集成)
8. [自托管指南](#8-自托管指南)
9. [高级特性](#9-高级特性)
10. [性能优化](#10-性能优化)

---

## 1. 什么是 n8n？

### 1.1 核心定义

**n8n** = **n**ode-View + **N**ode.js + auto**mation**

```
n8n 是一个开源的、可自托管的工作流自动化平台
     ↓
允许你像搭积木一样连接 400+ 应用和服务
     ↓
通过可视化编辑器或代码（JS/Python）
     ↓
创建从简单到复杂的自动化流程
```

### 1.2 三句话总结

1. **工作流自动化平台**
   - 连接不同的应用和服务
   - 自动执行重复性任务
   - 无需编程也能创建复杂流程

2. **开源可自托管**
   - 源代码完全公开（Fair-code License）
   - 可以部署到自己的服务器
   - 数据完全掌控，无供应商锁定

3. **代码 + 无代码混合**
   - 可视化拖拽编辑器（无代码）
   - 支持 JavaScript/Python（有代码）
   - AI 原生集成（LangChain）

### 1.3 典型使用场景

```
场景 1: 自动化数据收集
YouTube 新视频通知 → 下载字幕 → AI 总结 → 存入数据库 → 发送摘要

场景 2: 业务流程自动化
新订单 → 发送确认邮件 → 更新库存 → 通知物流 → 记录到 CRM

场景 3: 社交媒体管理
写博客 → AI 改写多版本 → 定时发布到 Twitter/LinkedIn → 收集互动数据

场景 4: 开发运维自动化
GitHub PR → 运行测试 → 部署到 Staging → 通知团队 → 合并到主分支
```

### 1.4 核心概念

#### Workflow（工作流）

```
工作流 = 一系列自动化步骤的集合

示例：
[触发器] → [操作 1] → [操作 2] → [操作 3] → [结束]
   ↓          ↓          ↓          ↓
新邮件      提取附件    上传到云盘   发送通知
```

#### Node（节点）

```
节点 = 工作流中的单个步骤

类型：
├─ Trigger Node（触发节点）：启动工作流
│   ├─ Webhook：HTTP 请求触发
│   ├─ Schedule：定时触发
│   └─ Manual：手动触发
│
├─ Action Node（操作节点）：执行具体任务
│   ├─ HTTP Request：调用 API
│   ├─ Database：数据库操作
│   └─ Transform Data：数据转换
│
└─ Logic Node（逻辑节点）：控制流程
    ├─ IF：条件判断
    ├─ Switch：多分支
    └─ Loop：循环
```

#### Execution（执行）

```
执行 = 工作流的一次完整运行

模式：
├─ Manual：手动触发执行
├─ Webhook：外部事件触发
├─ Schedule：定时自动执行
└─ Production：生产环境自动执行
```

---

## 2. 为什么选择 n8n？

### 2.1 vs 竞品对比

#### n8n vs Zapier

| 维度 | n8n | Zapier |
|------|-----|--------|
| **部署方式** | 自托管 + 云端 | 仅云端 |
| **代码能力** | ✅ 完整 JS/Python | ⚠️ 非常有限 |
| **数据主权** | ✅ 100% 掌控 | ❌ 存储在 Zapier |
| **成本（自托管）** | 💰 $0 软件费 | 💰💰💰 $20-$2000/月 |
| **集成数量** | 400+ | 7,000+ |
| **AI 能力** | ✅ LangChain 原生 | ⚠️ 基础 AI 节点 |
| **学习曲线** | 📈 中等（需要技术背景） | 📉 低（非技术用户） |
| **适合场景** | 技术团队、复杂工作流 | 非技术用户、简单集成 |

**结论**：
- 如果你是技术人员 → **n8n** 完胜
- 如果需要数据主权 → **n8n** 唯一选择
- 如果高频执行（> 10 万次/月）→ **n8n** 自托管省钱
- 如果非技术且需要海量集成 → Zapier 更合适

#### n8n vs Make (Integromat)

| 维度 | n8n | Make |
|------|-----|------|
| **开源** | ✅ Fair-code | ❌ 闭源 |
| **自托管** | ✅ 完全支持 | ❌ 仅云端 |
| **代码节点** | ✅ JS + Python | ⚠️ JS 有限 |
| **可视化** | ✅ 流程图 | ✅ 流程图（更复杂） |
| **定价** | 💰 免费（自托管） | 💰💰 按操作计费 |
| **AI 集成** | ✅ LangChain 深度 | ⚠️ 基础 AI |
| **社区** | ✅ 活跃开源社区 | ⚠️ 官方支持 |

**结论**：
- 开源需求 → **n8n**
- 复杂可视化流程 → Make 稍好
- 成本控制 → **n8n** 自托管

### 2.2 n8n 的核心优势

#### 优势 1: 数据主权

```
传统云端自动化平台：
你的数据 → 经过第三方服务器 → 到达目标
           ↓
       安全风险、隐私问题、合规困难

n8n 自托管：
你的数据 → 你的服务器 → 目标
           ↓
       完全掌控、符合 GDPR、可内网部署
```

#### 优势 2: 无限执行（自托管模式）

```
Zapier 定价：
├─ Free：100 次/月
├─ Pro：$20/月 → 10,000 次
├─ Team：$50/月 → 50,000 次
└─ Company：$300/月 → 100,000 次

n8n 自托管：
├─ 软件费：$0
├─ 执行次数：无限
├─ 成本：只有服务器费用（$5-20/月）
└─ ROI：第 1 个月就回本
```

**实际案例**：

```
场景：每天处理 10,000 个交易信号
Zapier 成本：$300/月（100,000 次）
n8n 成本：$10/月（DigitalOcean Droplet）
年度节省：$3,480
```

#### 优势 3: 代码灵活性

```javascript
// n8n Code Node 示例
// 复杂数据转换
const items = $input.all();

return items.map(item => {
  // 任意 JavaScript 代码
  const sentiment = analyzeSentiment(item.json.text);
  const category = classifyContent(item.json.content);

  return {
    json: {
      ...item.json,
      sentiment,
      category,
      processedAt: new Date().toISOString()
    }
  };
});
```

**vs Zapier 的 Code 节点**：
- ❌ 时间限制：1 秒
- ❌ 功能受限：无法导入 npm 包
- ❌ 调试困难：无日志

**n8n**：
- ✅ 时间充足：默认 120 秒
- ✅ 完整 Node.js：可导入任何 npm 包
- ✅ 完善调试：详细日志 + 数据预览

#### 优势 4: AI 原生集成

```
n8n AI 能力：
├─ LangChain 集成（70+ AI 节点）
├─ OpenAI、Anthropic、Gemini 原生支持
├─ 向量数据库（Pinecone、Weaviate、Qdrant）
├─ 嵌入模型（Embeddings）
├─ RAG 工作流
├─ AI Agent 编排
└─ 记忆系统

可以实现：
├─ 智能客服
├─ 文档分析
├─ 内容生成
├─ 数据提取
└─ 决策辅助
```

### 2.3 谁应该使用 n8n？

#### ✅ 完美适合

1. **技术团队/开发者**
   - 需要代码灵活性
   - 想要数据主权
   - 高频执行任务

2. **创业公司/个人开发者**
   - 预算有限
   - 需要快速迭代
   - 一人身兼多职

3. **数据敏感型企业**
   - 医疗、金融、法律
   - GDPR/HIPAA 合规要求
   - 内网部署需求

4. **AI/ML 团队**
   - 需要 AI 工作流编排
   - 向量数据库集成
   - 模型调用自动化

#### ⚠️ 可能不适合

1. **完全非技术用户**
   - 建议：Zapier 或 Make

2. **需要海量集成**
   - n8n：400+
   - Zapier：7,000+
   - 建议：混合使用

3. **极简场景**
   - IFTTT 可能更简单

---

## 3. 核心架构原理

### 3.1 技术栈

```
前端（7.8%）
├─ Vue.js 3
├─ TypeScript
├─ Vite
└─ Element Plus

后端（90.6%）
├─ Node.js 18+
├─ TypeScript
├─ Express.js
├─ SQLite/PostgreSQL/MySQL
└─ Redis（可选）

基础设施
├─ Docker
├─ Docker Compose
├─ Kubernetes（可选）
└─ GitHub Actions（CI/CD）
```

### 3.2 架构图

```
┌─────────────────────────────────────────────────┐
│                  用户界面                        │
│  ┌──────────────┐    ┌──────────────┐          │
│  │ 编辑器 (Vue) │    │ 执行视图      │          │
│  └──────────────┘    └──────────────┘          │
└─────────────────────────────────────────────────┘
                    ↕ WebSocket / REST API
┌─────────────────────────────────────────────────┐
│               n8n Server (Node.js)               │
│  ┌─────────────┐  ┌─────────────┐               │
│  │ API Layer   │  │ Workflow    │               │
│  │             │  │ Engine      │               │
│  └─────────────┘  └─────────────┘               │
│                                                  │
│  ┌──────────────────────────────────┐           │
│  │    Node Execution Manager        │           │
│  │  ┌────┐ ┌────┐ ┌────┐ ┌────┐   │           │
│  │  │Node│ │Node│ │Node│ │Node│   │           │
│  │  └────┘ └────┘ └────┘ └────┘   │           │
│  └──────────────────────────────────┘           │
└─────────────────────────────────────────────────┘
                    ↕
┌─────────────────────────────────────────────────┐
│              Database (SQLite/PG)                │
│  ┌──────────────┐  ┌──────────────┐            │
│  │ Workflows    │  │ Executions   │            │
│  └──────────────┘  └──────────────┘            │
│  ┌──────────────┐  ┌──────────────┐            │
│  │ Credentials  │  │ Settings     │            │
│  └──────────────┘  └──────────────┘            │
└─────────────────────────────────────────────────┘
```

### 3.3 工作流执行流程

```
1. 触发阶段
   用户/Webhook/定时器 → 触发工作流
                ↓
   Workflow Engine 接收触发事件
                ↓
   创建 Execution 记录

2. 执行阶段
   加载工作流定义
                ↓
   按拓扑顺序执行节点
   Node 1 → Node 2 → Node 3
     ↓       ↓        ↓
   执行成功？  是 → 下一个节点
     ↓       否 → 错误处理
   记录输出数据

3. 完成阶段
   所有节点执行完成
                ↓
   更新 Execution 状态
                ↓
   存储执行结果
                ↓
   触发 Webhook（如果有）
```

### 3.4 数据流转

```javascript
// 节点间数据传递
{
  "json": {
    // 实际数据
    "id": 123,
    "name": "John Doe",
    "email": "john@example.com"
  },
  "binary": {
    // 二进制数据（如文件）
    "file": {
      "data": "base64_encoded_data",
      "mimeType": "application/pdf",
      "fileName": "document.pdf"
    }
  },
  "pairedItem": {
    // 追溯数据来源
    "item": 0,
    "input": 0
  }
}
```

**数据转换示例**：

```
Node 1 (HTTP Request)
输出: [
  { json: { userId: 1, name: "Alice" } },
  { json: { userId: 2, name: "Bob" } }
]
        ↓
Node 2 (Code - Transform)
代码: items.map(item => ({
  json: {
    id: item.json.userId,
    fullName: item.json.name.toUpperCase()
  }
}))
输出: [
  { json: { id: 1, fullName: "ALICE" } },
  { json: { id: 2, fullName: "BOB" } }
]
        ↓
Node 3 (Database - Insert)
插入数据库
```

---

## 4. 节点系统详解

### 4.1 节点分类

#### Core Nodes（核心节点）

```
数据操作
├─ Code（代码节点）：JS/Python
├─ Function（函数节点）：轻量级 JS
├─ Set（设置节点）：添加/修改字段
├─ Merge（合并节点）：合并多个输入
├─ Split In Batches（批处理）：分批处理
└─ Item Lists（列表操作）：过滤/排序/去重

HTTP/API
├─ HTTP Request：通用 HTTP 请求
├─ Webhook：接收 HTTP 回调
└─ SSE Trigger：Server-Sent Events

数据库
├─ Postgres、MySQL、MongoDB
├─ Redis、Supabase
└─ SQLite（内置）

流程控制
├─ IF：条件分支
├─ Switch：多分支选择
├─ Merge：合并分支
└─ Loop Over Items：循环处理
```

#### Integration Nodes（集成节点）

```
生产力工具
├─ Gmail、Outlook：邮件
├─ Google Drive、Dropbox：文件存储
├─ Notion、Airtable：数据库
└─ Slack、Discord：通讯

开发工具
├─ GitHub、GitLab：版本控制
├─ Docker、Kubernetes：容器
├─ AWS、GCP、Azure：云服务
└─ Jenkins、CircleCI：CI/CD

营销工具
├─ HubSpot、Salesforce：CRM
├─ Mailchimp、SendGrid：邮件营销
├─ Google Analytics：分析
└─ Facebook、Twitter：社交媒体

AI/ML
├─ OpenAI（GPT-4、DALL-E）
├─ Anthropic（Claude）
├─ Google（Gemini）
├─ Pinecone、Weaviate：向量数据库
└─ LangChain：AI 工作流

加密货币
├─ Coinbase、Binance：交易所
├─ CoinGecko、CoinMarketCap：数据
└─ Ethereum、Bitcoin：区块链
```

### 4.2 节点工作原理

#### 节点生命周期

```javascript
// 简化的节点执行流程
class CustomNode {
  async execute(context) {
    // 1. 获取输入数据
    const items = context.getInputData();

    // 2. 获取节点参数
    const apiKey = context.getNodeParameter('apiKey');
    const endpoint = context.getNodeParameter('endpoint');

    // 3. 执行操作
    const results = [];
    for (const item of items) {
      try {
        const response = await axios.post(endpoint, item.json, {
          headers: { 'Authorization': `Bearer ${apiKey}` }
        });
        results.push({ json: response.data });
      } catch (error) {
        // 4. 错误处理
        if (context.continueOnFail()) {
          results.push({ json: { error: error.message } });
        } else {
          throw error;
        }
      }
    }

    // 5. 返回输出
    return [results];
  }
}
```

#### 节点配置示例

```typescript
// HTTP Request 节点配置
{
  "parameters": {
    "method": "POST",
    "url": "https://api.example.com/data",
    "authentication": "predefinedCredentialType",
    "nodeCredentialType": "httpHeaderAuth",
    "sendHeaders": true,
    "headerParameters": {
      "parameter": [
        {
          "name": "Content-Type",
          "value": "application/json"
        }
      ]
    },
    "sendBody": true,
    "bodyParameters": {
      "parameter": [
        {
          "name": "userId",
          "value": "={{ $json.id }}"  // 表达式引用
        }
      ]
    }
  }
}
```

### 4.3 表达式系统

n8n 使用双花括号 `{{ }}` 来引用数据和执行表达式：

```javascript
// 基础引用
{{ $json.fieldName }}              // 当前节点的 JSON 数据
{{ $node['节点名'].json.field }}   // 其他节点的数据
{{ $parameters.paramName }}        // 节点参数

// 内置变量
{{ $now }}                         // 当前时间戳
{{ $today }}                       // 今天日期
{{ $execution.id }}                // 执行 ID
{{ $workflow.id }}                 // 工作流 ID

// JavaScript 表达式
{{ $json.price * 1.1 }}                    // 计算
{{ $json.name.toUpperCase() }}             // 字符串操作
{{ $json.items.map(i => i.price) }}        // 数组操作
{{ $json.age >= 18 ? 'Adult' : 'Minor' }}  // 条件

// 日期处理
{{ $now.plus(7, 'days').format('yyyy-MM-dd') }}
{{ DateTime.fromISO($json.date).diff(DateTime.now(), 'days') }}

// JSON 路径
{{ $json['user.name'] }}           // 带特殊字符的字段
{{ $json.items[0].price }}         // 数组索引
```

**实际应用示例**：

```javascript
// 场景：根据订单金额计算折扣
{
  "discountAmount": "={{ $json.totalAmount >= 1000 ? $json.totalAmount * 0.1 : 0 }}",
  "finalPrice": "={{ $json.totalAmount - $json.discountAmount }}",
  "message": "={{ $json.discountAmount > 0 ? 'Congratulations! You saved $' + $json.discountAmount : 'No discount applied' }}"
}
```

---

## 5. 工作流设计

### 5.1 工作流模式

#### 模式 1: 线性流程

```
最简单的模式，按顺序执行

[Trigger] → [Node 1] → [Node 2] → [Node 3] → [End]

示例：
新邮件 → 提取附件 → 上传到 Google Drive → 发送确认
```

#### 模式 2: 条件分支

```
基于条件选择不同路径

         ┌─ [Yes] → [Action A]
[IF] ────┤
         └─ [No]  → [Action B]

示例：
订单 → 检查金额
         ├─ >$1000 → 审批流程
         └─ <$1000 → 直接处理
```

#### 模式 3: 并行执行

```
同时执行多个任务，然后合并

       ┌─ [Task A] ─┐
[Split]┼─ [Task B] ─┼ [Merge]
       └─ [Task C] ─┘

示例：
新用户
  ├─ 发送欢迎邮件
  ├─ 创建 CRM 记录
  └─ 通知销售团队
      ↓
  合并结果
```

#### 模式 4: 循环处理

```
对每个项目执行相同操作

[Get Items] → [Loop] → [Process] → [Next Item]
                 ↓
              [All Done]

示例：
获取 100 个客户
  ↓
循环每个客户
  ├─ 查询订单
  ├─ 计算总消费
  └─ 更新等级
```

#### 模式 5: 错误处理

```
捕获并处理错误

[Node] ──Error→ [Error Trigger] → [Handle Error]
   ↓
[Success]

示例：
API 调用
  ├─ 成功 → 处理数据
  └─ 失败 → 记录错误 → 发送通知 → 重试
```

### 5.2 最佳实践

#### 1. 模块化设计

```
❌ 不好：所有逻辑都在一个工作流中

✅ 好：拆分成多个子工作流

Main Workflow:
  ├─ [Trigger]
  ├─ [Execute Workflow: Data Validation]
  ├─ [Execute Workflow: Process Data]
  └─ [Execute Workflow: Send Notifications]

优势：
- 可复用
- 易测试
- 易维护
```

#### 2. 错误处理

```javascript
// 在 Code 节点中
try {
  const result = await riskyOperation();
  return [{ json: result }];
} catch (error) {
  // 记录详细错误
  console.error('Operation failed:', {
    message: error.message,
    stack: error.stack,
    input: $input.all()
  });

  // 返回错误信息
  return [{ json: { error: error.message, failedAt: new Date() } }];
}
```

#### 3. 数据验证

```javascript
// 在处理前验证数据
const items = $input.all();

// 检查必需字段
const validated = items.filter(item => {
  const required = ['email', 'name', 'phone'];
  return required.every(field => item.json[field]);
});

// 记录无效数据
const invalid = items.filter(item => !validated.includes(item));
if (invalid.length > 0) {
  console.warn('Invalid items:', invalid);
}

return validated;
```

#### 4. 性能优化

```javascript
// ❌ 不好：逐个处理（慢）
for (const item of items) {
  await apiCall(item);
}

// ✅ 好：批量处理（快）
const batchSize = 100;
for (let i = 0; i < items.length; i += batchSize) {
  const batch = items.slice(i, i + batchSize);
  await apiBatchCall(batch);
}

// ✅ 更好：并发处理（最快）
const promises = items.map(item => apiCall(item));
const results = await Promise.all(promises);
```

### 5.3 调试技巧

#### 1. 数据检查节点

```
在关键位置插入 Code 节点：

console.log('Current data:', JSON.stringify($input.all(), null, 2));
console.log('Node parameters:', $parameters);
console.log('Workflow variables:', $vars);

return $input.all(); // 透传数据
```

#### 2. 使用 Sticky Notes

```
在编辑器中添加注释：

┌─────────────────────┐
│  📝 重要提示         │
│  这个节点处理付款    │
│  失败时会重试 3 次   │
└─────────────────────┘
```

#### 3. Pin Data（固定数据）

```
在测试时固定输入数据：

右键节点 → Pin Data → 输入测试数据

好处：
- 无需每次都触发上游节点
- 可以测试边缘情况
- 加速开发迭代
```

---

## 6. 代码能力

### 6.1 Code 节点详解

#### JavaScript 节点

```javascript
// 完整的 Node.js 环境
// 可以使用所有内置模块

// 1. 基础数据处理
const items = $input.all();

const processed = items.map(item => {
  return {
    json: {
      // 数据转换
      userId: item.json.id,
      fullName: `${item.json.firstName} ${item.json.lastName}`,
      // 计算字段
      age: new Date().getFullYear() - new Date(item.json.birthDate).getFullYear(),
      // 条件逻辑
      status: item.json.isActive ? 'active' : 'inactive'
    }
  };
});

return processed;
```

```javascript
// 2. 外部 API 调用
const axios = require('axios');

const results = [];

for (const item of $input.all()) {
  const response = await axios.get(`https://api.example.com/user/${item.json.userId}`, {
    headers: {
      'Authorization': `Bearer ${$credentials.apiKey}`
    }
  });

  results.push({
    json: {
      ...item.json,
      apiData: response.data
    }
  });
}

return results;
```

```javascript
// 3. 复杂数据转换
const _ = require('lodash');

const items = $input.all();

// 分组
const grouped = _.groupBy(items, item => item.json.category);

// 聚合
const aggregated = Object.entries(grouped).map(([category, items]) => ({
  json: {
    category,
    count: items.length,
    totalAmount: _.sumBy(items, i => i.json.amount),
    avgAmount: _.meanBy(items, i => i.json.amount)
  }
}));

return aggregated;
```

#### Python 节点（Beta）

```python
# n8n 现在支持 Python！

# 1. 数据处理
import pandas as pd

# 转换为 DataFrame
data = [item['json'] for item in _input.all()]
df = pd.DataFrame(data)

# Pandas 操作
df['total'] = df['price'] * df['quantity']
df['discount'] = df['total'] * 0.1

# 转回 n8n 格式
return [{'json': row.to_dict()} for _, row in df.iterrows()]
```

```python
# 2. 机器学习
from sklearn.linear_model import LinearRegression
import numpy as np

# 获取训练数据
items = _input.all()
X = np.array([[i['json']['feature1'], i['json']['feature2']] for i in items])
y = np.array([i['json']['target'] for i in items])

# 训练模型
model = LinearRegression()
model.fit(X, y)

# 预测
predictions = model.predict(X)

# 返回结果
return [{'json': {'prediction': float(p)}} for p in predictions]
```

### 6.2 可用的 npm 包

```javascript
// 常用库（已预装）
const axios = require('axios');       // HTTP 请求
const lodash = require('lodash');     // 实用工具
const moment = require('moment');     // 日期处理
const cheerio = require('cheerio');   // HTML 解析

// 数据处理
const Papa = require('papaparse');    // CSV 解析
const xml2js = require('xml2js');     // XML 解析

// 加密
const crypto = require('crypto');     // 加密/哈希
const bcrypt = require('bcrypt');     // 密码哈希

// 文件处理
const fs = require('fs');             // 文件系统
const path = require('path');         // 路径处理

// 自定义导入（需要配置）
// 在 n8n 设置中启用 npm 包安装
const customLib = require('your-custom-library');
```

### 6.3 高级技巧

#### 1. 访问环境变量

```javascript
// 读取环境变量
const apiKey = $env.MY_API_KEY;
const dbUrl = $env.DATABASE_URL;

// 安全实践：敏感信息存储在环境变量而非代码
```

#### 2. 使用凭证

```javascript
// 访问存储的凭证
const credentials = await $getCredentials('openaiApi');

const response = await axios.post('https://api.openai.com/v1/chat/completions', {
  model: 'gpt-4',
  messages: [...]
}, {
  headers: {
    'Authorization': `Bearer ${credentials.apiKey}`
  }
});
```

#### 3. 工作流变量

```javascript
// 设置工作流变量（跨节点共享）
$vars.userCount = items.length;
$vars.processedAt = new Date().toISOString();

// 在后续节点中访问
const count = $vars.userCount;
```

#### 4. 二进制数据处理

```javascript
// 处理文件
const items = $input.all();

for (const item of items) {
  if (item.binary.file) {
    const buffer = Buffer.from(item.binary.file.data, 'base64');

    // 处理文件（例如：调整图片大小）
    const sharp = require('sharp');
    const resized = await sharp(buffer)
      .resize(800, 600)
      .toBuffer();

    item.binary.file.data = resized.toString('base64');
  }
}

return items;
```

---

## 7. AI 集成

### 7.1 LangChain 集成

n8n 是唯一原生集成 LangChain 的工作流平台。

#### AI Agent 架构

```
┌──────────────────────────────────────┐
│         LangChain Agent              │
│  ┌────────────────────────────────┐  │
│  │  LLM (GPT-4/Claude/Gemini)    │  │
│  └────────────────────────────────┘  │
│               ↓                       │
│  ┌────────────────────────────────┐  │
│  │  Memory (Conversation Buffer)  │  │
│  └────────────────────────────────┘  │
│               ↓                       │
│  ┌────────────────────────────────┐  │
│  │  Tools                         │  │
│  │  ├─ Web Search                │  │
│  │  ├─ Calculator                │  │
│  │  ├─ Database Query            │  │
│  │  └─ Custom API                │  │
│  └────────────────────────────────┘  │
└──────────────────────────────────────┘
```

#### 基础 AI 工作流

```
示例：智能文档问答

[用户提问]
    ↓
[Load Document] → 切分文本
    ↓
[Generate Embeddings] → 向量化
    ↓
[Store in Vector DB] → Pinecone/Weaviate
    ↓
[Retrieve Relevant Chunks] → 语义搜索
    ↓
[LLM with Context] → GPT-4 回答
    ↓
[返回答案]
```

### 7.2 常用 AI 节点

#### OpenAI 节点

```javascript
// Chat 模式
{
  "model": "gpt-4",
  "messages": [
    {
      "role": "system",
      "content": "You are a helpful assistant for a trading platform."
    },
    {
      "role": "user",
      "content": "={{ $json.userQuestion }}"
    }
  ],
  "temperature": 0.7,
  "max_tokens": 500
}
```

#### Embeddings 节点

```javascript
// 生成文本嵌入向量
{
  "model": "text-embedding-3-small",
  "input": "={{ $json.documentContent }}"
}

// 输出：1536 维向量
```

#### Vector Store 节点

```javascript
// Pinecone 插入
{
  "operation": "insert",
  "index": "knowledge-base",
  "vectors": [
    {
      "id": "={{ $json.id }}",
      "values": "={{ $json.embedding }}",
      "metadata": {
        "text": "={{ $json.originalText }}",
        "source": "={{ $json.source }}"
      }
    }
  ]
}

// Pinecone 查询
{
  "operation": "query",
  "index": "knowledge-base",
  "vector": "={{ $json.queryEmbedding }}",
  "topK": 5
}
```

### 7.3 实战 AI 工作流

#### 工作流 1: RAG 系统

```
用户问题："什么是 n8n？"
    ↓
[Embeddings] → 问题向量化
    ↓
[Pinecone Query] → 检索相关文档
    ↓
[Aggregate Context] → 合并上下文
    ↓
[OpenAI Chat] → 基于上下文回答
    prompt: "根据以下信息回答问题：
             上下文：{{ $json.retrievedDocs }}
             问题：{{ $json.userQuestion }}"
    ↓
返回答案
```

#### 工作流 2: 内容生成管道

```
输入主题："AI in Trading"
    ↓
[GPT-4: 大纲生成]
    ↓
[Loop: 每个章节]
    ├─ [GPT-4: 章节内容]
    ├─ [GPT-4: 相关案例]
    └─ [DALL-E: 配图生成]
    ↓
[Merge: 合并章节]
    ↓
[Format to Markdown]
    ↓
[Publish to Blog]
```

#### 工作流 3: AI 客服

```
[Webhook: 接收消息]
    ↓
[Load Conversation History] → 从数据库
    ↓
[OpenAI Chat]
    messages: [
      ...historyMessages,
      { role: "user", content: newMessage }
    ]
    ↓
[Branch: 需要人工介入？]
    ├─ Yes → [通知人工客服]
    └─ No  → [自动回复]
    ↓
[Save to History]
```

### 7.4 AI 最佳实践

#### 1. Prompt Engineering

```javascript
// ❌ 不好：模糊的 prompt
"Write about trading"

// ✅ 好：具体的 prompt
`You are an expert financial analyst with 10 years of experience in algorithmic trading.

Task: Analyze the following trading data and provide:
1. A summary of key trends
2. Potential trading opportunities
3. Risk factors to consider

Data:
${JSON.stringify($json.tradingData, null, 2)}

Format your response in markdown with clear sections.`
```

#### 2. 成本控制

```javascript
// Token 计数
const estimateTokens = (text) => {
  // 粗略估计：1 token ≈ 4 字符
  return Math.ceil(text.length / 4);
};

const inputText = $json.content;
const estimatedTokens = estimateTokens(inputText);

// 如果超过限制，截断或总结
if (estimatedTokens > 3000) {
  // 使用更便宜的模型先总结
  const summary = await summarizeWithCheaperModel(inputText);
  return summary;
} else {
  // 使用 GPT-4
  return await processWithGPT4(inputText);
}
```

#### 3. 错误处理

```javascript
// AI 调用可能失败，需要重试机制
const maxRetries = 3;
let attempt = 0;

while (attempt < maxRetries) {
  try {
    const response = await callOpenAI(prompt);
    return response;
  } catch (error) {
    attempt++;
    if (attempt >= maxRetries) {
      // 降级：使用缓存或默认响应
      return getCachedResponse(prompt) || getDefaultResponse();
    }
    // 指数退避
    await sleep(Math.pow(2, attempt) * 1000);
  }
}
```

---

## 8. 自托管指南

### 8.1 安装方式对比

| 方式 | 优点 | 缺点 | 适用场景 |
|------|------|------|----------|
| **npx** | 最快，零配置 | 临时，无持久化 | 快速测试 |
| **Docker** | 隔离，易部署 | 需要 Docker 知识 | 生产环境 |
| **npm** | 灵活，可定制 | 需要管理依赖 | 开发环境 |
| **Docker Compose** | 完整栈，一键启动 | 配置复杂 | 生产（推荐） |
| **Kubernetes** | 高可用，可扩展 | 复杂度高 | 企业级 |

### 8.2 Docker 部署（推荐）

#### 基础部署

```bash
# 1. 创建数据卷
docker volume create n8n_data

# 2. 运行容器
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -e N8N_BASIC_AUTH_ACTIVE=true \
  -e N8N_BASIC_AUTH_USER=admin \
  -e N8N_BASIC_AUTH_PASSWORD=your_password \
  -v n8n_data:/home/node/.n8n \
  docker.n8n.io/n8nio/n8n

# 3. 访问
# http://localhost:5678
```

#### 生产级 Docker Compose

```yaml
# docker-compose.yml
version: '3.8'

services:
  postgres:
    image: postgres:15
    restart: unless-stopped
    environment:
      POSTGRES_USER: n8n
      POSTGRES_PASSWORD: ${DB_PASSWORD}
      POSTGRES_DB: n8n
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ['CMD-SHELL', 'pg_isready -U n8n']
      interval: 5s
      timeout: 5s
      retries: 10

  n8n:
    image: docker.n8n.io/n8nio/n8n:latest
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      # 数据库
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=${DB_PASSWORD}

      # 基础配置
      - N8N_PROTOCOL=https
      - N8N_HOST=${DOMAIN}
      - N8N_PORT=5678
      - N8N_ENCRYPTION_KEY=${ENCRYPTION_KEY}

      # 认证
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${AUTH_USER}
      - N8N_BASIC_AUTH_PASSWORD=${AUTH_PASSWORD}

      # 执行配置
      - EXECUTIONS_MODE=queue
      - EXECUTIONS_DATA_SAVE_ON_ERROR=all
      - EXECUTIONS_DATA_SAVE_ON_SUCCESS=all
      - EXECUTIONS_DATA_MAX_AGE=336  # 14 days

      # Webhook
      - WEBHOOK_URL=https://${DOMAIN}/

      # 时区
      - GENERIC_TIMEZONE=Asia/Shanghai

      # API
      - N8N_API_ENABLED=true

    volumes:
      - n8n_data:/home/node/.n8n
      - ./workflows:/home/node/.n8n/workflows  # 工作流备份
    depends_on:
      postgres:
        condition: service_healthy

  # Redis（用于队列）
  redis:
    image: redis:7
    restart: unless-stopped
    volumes:
      - redis_data:/data

volumes:
  postgres_data:
  n8n_data:
  redis_data:
```

```bash
# .env 文件
DB_PASSWORD=your_secure_password
ENCRYPTION_KEY=your_32_char_encryption_key
DOMAIN=n8n.yourdomain.com
AUTH_USER=admin
AUTH_PASSWORD=your_auth_password
```

### 8.3 环境变量详解

```bash
# 数据库配置
DB_TYPE=postgresdb                    # sqlite, postgresdb, mysqldb, mariadb
DB_POSTGRESDB_HOST=localhost
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=n8n
DB_POSTGRESDB_USER=n8n
DB_POSTGRESDB_PASSWORD=password

# 安全
N8N_ENCRYPTION_KEY=your_key           # 加密凭证
N8N_BASIC_AUTH_ACTIVE=true            # 启用基础认证
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=password

# 网络
N8N_PROTOCOL=https                    # http 或 https
N8N_HOST=n8n.yourdomain.com
N8N_PORT=5678
WEBHOOK_URL=https://n8n.yourdomain.com/

# 执行
EXECUTIONS_MODE=regular               # regular 或 queue
EXECUTIONS_TIMEOUT=300                # 秒
EXECUTIONS_TIMEOUT_MAX=3600
N8N_LOG_LEVEL=info                    # error, warn, info, verbose, debug

# 性能
N8N_PAYLOAD_SIZE_MAX=16               # MB
N8N_METRICS=true                      # 启用监控指标

# 外部服务
N8N_EXTERNAL_STORAGE_S3_HOST=s3.amazonaws.com  # 文件存储
N8N_EXTERNAL_STORAGE_S3_BUCKET=n8n-files
```

### 8.4 SSL/HTTPS 配置

#### 使用 Nginx 反向代理

```nginx
# /etc/nginx/sites-available/n8n
server {
    listen 80;
    server_name n8n.yourdomain.com;

    # Redirect to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name n8n.yourdomain.com;

    # SSL 证书（Let's Encrypt）
    ssl_certificate /etc/letsencrypt/live/n8n.yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/n8n.yourdomain.com/privkey.pem;

    # SSL 优化
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    # 反向代理
    location / {
        proxy_pass http://localhost:5678;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # WebSocket 支持（重要！）
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        # 超时配置
        proxy_connect_timeout 300s;
        proxy_send_timeout 300s;
        proxy_read_timeout 300s;
    }
}
```

```bash
# 自动获取 SSL 证书
sudo certbot --nginx -d n8n.yourdomain.com
```

### 8.5 备份策略

```bash
# 1. 数据库备份
docker exec n8n_postgres_1 pg_dump -U n8n n8n > backup-$(date +%Y%m%d).sql

# 2. 工作流备份
docker cp n8n:/home/node/.n8n/workflows ./workflows-backup-$(date +%Y%m%d)

# 3. 凭证备份（加密）
docker cp n8n:/home/node/.n8n/credentials.json ./credentials-backup-$(date +%Y%m%d).json

# 4. 自动化备份脚本
cat > backup-n8n.sh << 'EOF'
#!/bin/bash
BACKUP_DIR="/backups/n8n"
DATE=$(date +%Y%m%d)

# 数据库
docker exec n8n_postgres_1 pg_dump -U n8n n8n | gzip > "$BACKUP_DIR/db-$DATE.sql.gz"

# 工作流
docker cp n8n:/home/node/.n8n/workflows "$BACKUP_DIR/workflows-$DATE"
tar -czf "$BACKUP_DIR/workflows-$DATE.tar.gz" "$BACKUP_DIR/workflows-$DATE"
rm -rf "$BACKUP_DIR/workflows-$DATE"

# 清理旧备份（保留 30 天）
find "$BACKUP_DIR" -name "*.gz" -mtime +30 -delete

echo "Backup completed: $DATE"
EOF

chmod +x backup-n8n.sh

# 添加到 crontab（每天凌晨 2 点）
0 2 * * * /path/to/backup-n8n.sh
```

### 8.6 监控与维护

```bash
# 查看日志
docker logs -f n8n

# 查看资源使用
docker stats n8n

# 检查健康状态
curl http://localhost:5678/healthz

# 更新到最新版本
docker pull docker.n8n.io/n8nio/n8n:latest
docker-compose down
docker-compose up -d

# 数据库维护
docker exec -it n8n_postgres_1 psql -U n8n -c "VACUUM FULL;"
```

---

## 9. 高级特性

### 9.1 Webhook 深度使用

#### 基础 Webhook

```
Webhook URL: https://n8n.yourdomain.com/webhook/unique-id

POST /webhook/user-signup
{
  "email": "user@example.com",
  "name": "John Doe"
}

n8n 工作流：
[Webhook Trigger] → [Validate Data] → [Save to DB] → [Send Welcome Email]
```

#### 高级 Webhook 功能

```javascript
// 1. 验证签名（GitHub/Stripe 风格）
const crypto = require('crypto');

const signature = $webhookHeaders['x-hub-signature-256'];
const payload = JSON.stringify($input.all()[0].json);
const secret = $env.WEBHOOK_SECRET;

const expectedSignature = 'sha256=' + crypto
  .createHmac('sha256', secret)
  .update(payload)
  .digest('hex');

if (signature !== expectedSignature) {
  throw new Error('Invalid signature');
}

return $input.all();
```

```javascript
// 2. IP 白名单
const allowedIPs = ['192.168.1.100', '203.0.113.0'];
const clientIP = $webhookHeaders['x-forwarded-for'] || $webhookHeaders['x-real-ip'];

if (!allowedIPs.includes(clientIP)) {
  throw new Error('Unauthorized IP');
}
```

```javascript
// 3. 自定义响应
// 在 Webhook 节点设置
{
  "options": {
    "responseCode": 200,
    "responseData": "Success",
    "responseHeaders": {
      "Content-Type": "application/json"
    }
  }
}

// 在 Code 节点中返回自定义响应
return [{
  json: {
    success: true,
    message: "Data processed",
    id: processedId
  }
}];
```

### 9.2 子工作流

```
主工作流可以调用其他工作流作为子模块

Main Workflow:
  [Trigger]
       ↓
  [Execute Workflow: Validate User]
       ↓
  [Execute Workflow: Process Payment]
       ↓
  [Execute Workflow: Send Notifications]

优势：
- 代码复用
- 易于测试
- 模块化管理
```

#### 调用子工作流

```javascript
// Execute Workflow 节点配置
{
  "workflowId": "123",  // 子工作流 ID
  "waitForExecution": true,  // 等待子工作流完成
  "input": {
    "userId": "={{ $json.userId }}",
    "action": "process"
  }
}

// 获取子工作流返回值
const result = $node["Execute Workflow"].json;
```

### 9.3 错误处理工作流

```
[Error Trigger] → 捕获任何工作流的错误
     ↓
[Code: 分析错误]
     ↓
[Branch: 错误类型？]
     ├─ Network Error → [Retry Workflow]
     ├─ Data Error → [Notify Admin]
     └─ Unknown → [Log to Sentry] → [Slack Alert]
```

```javascript
// Error Trigger 可访问的数据
{
  "execution": {
    "id": "12345",
    "retryOf": null,
    "mode": "trigger",
    "startedAt": "2025-01-01T00:00:00.000Z",
    "stoppedAt": "2025-01-01T00:05:00.000Z",
    "workflowId": "67890",
    "workflowData": {...}
  },
  "error": {
    "message": "Connection timeout",
    "stack": "Error: Connection timeout\n    at ...",
    "node": "HTTP Request"
  }
}
```

### 9.4 批处理优化

```
问题：处理 10,000 条记录，API 有频率限制

❌ 不好：
[Get 10000 Items] → [Loop: API Call] → 10000 次请求 → 超时/失败

✅ 好：
[Get 10000 Items]
     ↓
[Split In Batches: 100 items]
     ↓
[HTTP Request: Batch API] → 100 次请求
     ↓
[Wait: 1 second]  // 避免频率限制
     ↓
[Loop back if more batches]
     ↓
[Merge Results]
```

### 9.5 缓存策略

```javascript
// 使用 Redis 缓存 API 响应
const redis = require('redis');
const client = redis.createClient({ url: process.env.REDIS_URL });

await client.connect();

const cacheKey = `api:user:${userId}`;

// 检查缓存
let userData = await client.get(cacheKey);

if (!userData) {
  // 缓存未命中，调用 API
  const response = await axios.get(`https://api.example.com/user/${userId}`);
  userData = JSON.stringify(response.data);

  // 存入缓存，1 小时过期
  await client.setEx(cacheKey, 3600, userData);
}

return [{ json: JSON.parse(userData) }];
```

---

## 10. 性能优化

### 10.1 工作流优化

#### 1. 减少节点数量

```
❌ 不好（8 个节点）：
[HTTP Request] → [Set] → [Set] → [Set] → [IF] → [Set] → [Set] → [HTTP Request]

✅ 好（3 个节点）：
[HTTP Request] → [Code: 合并所有逻辑] → [HTTP Request]
```

#### 2. 并行执行

```
串行（慢）：
[Task A] → [Task B] → [Task C]  // 30 秒

并行（快）：
       ┌─ [Task A] ─┐
[Split]┼─ [Task B] ─┼ [Merge]  // 10 秒
       └─ [Task C] ─┘
```

#### 3. 数据库优化

```javascript
// ❌ 不好：N+1 查询
for (const user of users) {
  const orders = await db.query('SELECT * FROM orders WHERE userId = ?', [user.id]);
}

// ✅ 好：批量查询
const userIds = users.map(u => u.id);
const orders = await db.query('SELECT * FROM orders WHERE userId IN (?)', [userIds]);
const ordersMap = groupBy(orders, 'userId');
```

### 10.2 系统配置优化

#### Docker 资源限制

```yaml
# docker-compose.yml
services:
  n8n:
    deploy:
      resources:
        limits:
          cpus: '2'
          memory: 2G
        reservations:
          cpus: '1'
          memory: 1G
```

#### 数据库调优

```sql
-- PostgreSQL 配置优化
-- /var/lib/postgresql/data/postgresql.conf

shared_buffers = 256MB
effective_cache_size = 1GB
maintenance_work_mem = 128MB
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1
effective_io_concurrency = 200
work_mem = 10MB
min_wal_size = 1GB
max_wal_size = 4GB
```

### 10.3 监控指标

```javascript
// 在关键节点添加性能监控
const startTime = Date.now();

// 执行操作
const result = await heavyOperation();

const duration = Date.now() - startTime;

// 记录到监控系统（Prometheus/Grafana）
await axios.post('http://prometheus-pushgateway:9091/metrics/job/n8n', {
  metric: 'workflow_execution_duration',
  value: duration,
  labels: {
    workflow: $workflow.name,
    node: $node.name
  }
});
```

---

## 🎯 总结

### 核心价值

1. **自托管** = 数据主权 + 无限执行
2. **代码能力** = 无限可能性
3. **AI 原生** = 智能自动化
4. **开源社区** = 持续进化

### 学习路径

```
第 1 天：理解核心概念
   ├─ Workflow、Node、Execution
   └─ 创建第一个简单工作流

第 2-3 天：掌握节点系统
   ├─ Trigger、Action、Logic 节点
   └─ 表达式和数据引用

第 4-7 天：高级特性
   ├─ Code 节点（JS/Python）
   ├─ Webhook 和 API
   └─ 子工作流和错误处理

第 2 周：AI 集成
   ├─ LangChain 工作流
   ├─ RAG 系统
   └─ AI Agent 编排

第 3-4 周：生产部署
   ├─ Docker Compose 部署
   ├─ SSL/HTTPS 配置
   ├─ 监控和备份
   └─ 性能优化
```

### 下一步

- 阅读《n8n_快速上手指南.md》开始实战
- 查看《n8n_与你的项目集成.md》了解定制方案
- 参考《n8n_最佳实践.md》优化工作流

---

**n8n 是自动化的终极工具，掌握它将让你的生产力提升 10 倍！** 🚀
