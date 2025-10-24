# 🚀 n8n 快速实战手册

**从零到部署，30 分钟掌握 n8n 核心**

---

## 📋 目录

1. [5 分钟快速开始](#5-分钟快速开始)
2. [第一个工作流](#第一个工作流)
3. [三个实战项目](#三个实战项目)
4. [与你的项目集成](#与你的项目集成)
5. [生产环境部署](#生产环境部署)
6. [故障排查](#故障排查)

---

## 5 分钟快速开始

### 方法 1：最快体验（npx）

```bash
# 一行命令启动
npx n8n

# 输出：
# Editor: http://localhost:5678
# 打开浏览器访问即可
```

### 方法 2：Docker（推荐生产）

```bash
# 创建数据卷
docker volume create n8n_data

# 运行 n8n
docker run -d \
  --name n8n \
  -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  docker.n8n.io/n8nio/n8n

# 访问 http://localhost:5678
```

### 方法 3：完整生产环境（Docker Compose）

见文末的安装脚本。

---

## 第一个工作流

### 示例：每天自动发送天气预报

**需求**：每天早上 8 点获取天气并发送邮件

```
[Schedule Trigger] → [HTTP Request: 获取天气] → [Gmail: 发送邮件]
```

#### 步骤 1：添加 Schedule Trigger

```
节点：Schedule Trigger
配置：
  - Trigger Interval: Days
  - Days Between Triggers: 1
  - Trigger at Hour: 8
  - Trigger at Minute: 0
```

#### 步骤 2：获取天气数据

```
节点：HTTP Request
配置：
  - Method: GET
  - URL: https://api.openweathermap.org/data/2.5/weather?q=Beijing&appid=YOUR_API_KEY
```

#### 步骤 3：发送邮件

```
节点：Gmail
配置：
  - Operation: Send
  - To: your@email.com
  - Subject: 今日天气预报
  - Message:
    北京天气：{{ $json.weather[0].description }}
    温度：{{ $json.main.temp - 273.15 }}°C
```

**完成！** 每天早上 8 点自动执行。

---

## 三个实战项目

### 项目 1：Personal Knowledge Hub 数据收集

**场景**：自动收集 YouTube 视频到知识库

```
[YouTube Trigger: 新视频]
    ↓
[YouTube: 获取视频详情]
    ↓
[OpenAI: 生成摘要]
    ↓
[Supabase: 存入数据库]
    ↓
[Slack: 发送通知]
```

#### 代码实现

```javascript
// YouTube Trigger 节点
// 配置 YouTube API 凭证

// OpenAI 摘要节点（Code节点）
const openai = require('openai');

const client = new openai.OpenAI({
  apiKey: $credentials.openAiKey
});

const transcript = $json.transcript;  // 从上一节点获取

const response = await client.chat.completions.create({
  model: "gpt-4",
  messages: [{
    role: "user",
    content: `Summarize this video transcript in 3 bullet points:\n\n${transcript}`
  }]
});

return [{
  json: {
    videoId: $json.id,
    title: $json.title,
    summary: response.choices[0].message.content,
    url: $json.url
  }
}];
```

```javascript
// Supabase 插入节点
{
  "operation": "insert",
  "table": "videos",
  "records": [{
    "video_id": "={{ $json.videoId }}",
    "title": "={{ $json.title }}",
    "summary": "={{ $json.summary }}",
    "url": "={{ $json.url }}",
    "created_at": "={{ $now }}"
  }]
}
```

### 项目 2：量化交易信号监控

**场景**：监控加密货币价格，触发交易信号

```
[Schedule: 每分钟]
    ↓
[Binance API: 获取BTC价格]
    ↓
[Code: 计算技术指标]
    ↓
[IF: 是否触发信号？]
    ├─ Yes → [Telegram: 发送通知] → [记录到数据库]
    └─ No  → [结束]
```

#### 核心代码

```javascript
// 技术指标计算
const prices = $json.prices;  // 最近 20 个价格

// 简单移动平均
const sma = prices.reduce((sum, p) => sum + p, 0) / prices.length;

// RSI 计算
const calculateRSI = (prices, period = 14) => {
  let gains = 0, losses = 0;
  for (let i = 1; i < prices.length; i++) {
    const change = prices[i] - prices[i-1];
    if (change > 0) gains += change;
    else losses -= change;
  }
  const rs = (gains/period) / (losses/period);
  return 100 - (100 / (1 + rs));
};

const rsi = calculateRSI(prices);

// 生成信号
let signal = 'HOLD';
if (rsi < 30 && prices[prices.length-1] < sma * 0.98) {
  signal = 'BUY';
} else if (rsi > 70 && prices[prices.length-1] > sma * 1.02) {
  signal = 'SELL';
}

return [{
  json: {
    currentPrice: prices[prices.length-1],
    sma,
    rsi,
    signal,
    timestamp: new Date().toISOString()
  }
}];
```

### 项目 3：一人公司内容自动发布

**场景**：写一篇博客，AI 改写并发布到多平台

```
[Webhook: 接收博客内容]
    ↓
[OpenAI: 生成 Twitter 版本]
    ├─ [Twitter: 发布]
    ↓
[OpenAI: 生成 LinkedIn 版本]
    ├─ [LinkedIn: 发布]
    ↓
[OpenAI: 生成小红书版本]
    ├─ [HTTP Request: 小红书 API]
    ↓
[Airtable: 记录发布数据]
```

#### AI 改写代码

```javascript
// OpenAI 改写节点
const content = $json.blogContent;

const prompts = {
  twitter: `Rewrite this blog post as a Twitter thread (max 280 chars per tweet):
  ${content}

  Format: Return an array of tweets.`,

  linkedin: `Rewrite this blog post as a LinkedIn post (professional tone):
  ${content}`,

  xiaohongshu: `Rewrite this blog post for 小红书 (casual, emoji-rich):
  ${content}`
};

const platform = $json.platform;  // 从参数获取
const prompt = prompts[platform];

const response = await $openai.chat.completions.create({
  model: "gpt-4",
  messages: [{ role: "user", content: prompt }]
});

return [{ json: {
  content: response.choices[0].message.content,
  platform
}}];
```

---

## 与你的项目集成

### Personal Knowledge Hub 完整集成

#### 1. 自动收集书签

```bash
# 使用 Chrome 扩展 + Webhook
浏览器点击"保存" → 发送到 n8n Webhook → 处理并存储
```

```javascript
// Webhook 处理
{
  "url": "{{ $json.url }}",
  "title": "{{ $json.title }}",
  "tags": "{{ $json.tags }}",
  "timestamp": "{{ $now }}"
}
    ↓
[OpenAI: 生成摘要和分类]
    ↓
[Supabase: 存入 bookmarks 表]
```

#### 2. 智能分类

```javascript
// AI 分类节点
const categories = [
  'AI 开发',
  '量化交易',
  '创业',
  '技术文章',
  '其他'
];

const prompt = `Categorize this bookmark into one of these categories: ${categories.join(', ')}

Title: ${$json.title}
URL: ${$json.url}
Content: ${$json.content}

Return only the category name.`;

const response = await $openai.chat.completions.create({
  model: "gpt-4",
  messages: [{ role: "user", content: prompt }]
});

return [{
  json: {
    ...$json,
    category: response.choices[0].message.content.trim()
  }
}];
```

### 量化交易系统集成

#### Binance 价格监控工作流

```json
{
  "name": "Crypto Price Monitor",
  "nodes": [
    {
      "name": "Schedule Trigger",
      "type": "n8n-nodes-base.scheduleTrigger",
      "parameters": {
        "rule": {
          "interval": [{ "field": "minutes", "minutesInterval": 1 }]
        }
      }
    },
    {
      "name": "Binance API",
      "type": "n8n-nodes-base.httpRequest",
      "parameters": {
        "url": "https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT"
      }
    },
    {
      "name": "Calculate Indicators",
      "type": "n8n-nodes-base.code",
      "parameters": {
        "jsCode": "// 见上面的代码示例"
      }
    },
    {
      "name": "Check Signal",
      "type": "n8n-nodes-base.if",
      "parameters": {
        "conditions": {
          "string": [
            { "value1": "={{ $json.signal }}", "value2": "HOLD", "operation": "notEqual" }
          ]
        }
      }
    },
    {
      "name": "Send Telegram",
      "type": "n8n-nodes-base.telegram",
      "parameters": {
        "text": "🚨 Trading Signal: {{ $json.signal }}\nPrice: ${{ $json.currentPrice }}\nRSI: {{ $json.rsi }}"
      }
    }
  ]
}
```

---

## 生产环境部署

### 完整 Docker Compose 配置

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:15
    restart: unless-stopped
    environment:
      POSTGRES_DB: n8n
      POSTGRES_USER: n8n
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data

  n8n:
    image: docker.n8n.io/n8nio/n8n:latest
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=${DB_PASSWORD}
      - N8N_ENCRYPTION_KEY=${ENCRYPTION_KEY}
      - N8N_HOST=${DOMAIN}
      - N8N_PROTOCOL=https
      - WEBHOOK_URL=https://${DOMAIN}/
    volumes:
      - n8n_data:/home/node/.n8n
    depends_on:
      - postgres

volumes:
  postgres_data:
  n8n_data:
```

```bash
# .env 文件
DB_PASSWORD=your_secure_password
ENCRYPTION_KEY=$(openssl rand -hex 32)
DOMAIN=n8n.yourdomain.com
```

### 启动命令

```bash
# 1. 创建配置文件
cat > docker-compose.yml << 'EOF'
# 粘贴上面的配置
EOF

# 2. 创建 .env
cat > .env << EOF
DB_PASSWORD=$(openssl rand -base64 32)
ENCRYPTION_KEY=$(openssl rand -hex 32)
DOMAIN=n8n.yourdomain.com
EOF

# 3. 启动
docker-compose up -d

# 4. 查看日志
docker-compose logs -f n8n
```

---

## 故障排查

### 常见问题

#### 1. Webhook 无法访问

```bash
# 检查端口
netstat -tulpn | grep 5678

# 检查防火墙
sudo ufw allow 5678

# 检查 Nginx 配置
sudo nginx -t
sudo systemctl reload nginx
```

#### 2. 执行超时

```yaml
# docker-compose.yml 中增加
environment:
  - EXECUTIONS_TIMEOUT=600  # 10 分钟
  - EXECUTIONS_TIMEOUT_MAX=3600  # 1 小时
```

#### 3. 内存不足

```yaml
# 限制资源
services:
  n8n:
    deploy:
      resources:
        limits:
          memory: 2G
```

#### 4. 数据库连接失败

```bash
# 检查数据库
docker exec -it n8n_postgres_1 psql -U n8n -d n8n

# 测试连接
\dt  # 列出表
```

---

## 快速命令参考

```bash
# 查看日志
docker logs -f n8n

# 重启
docker-compose restart n8n

# 备份工作流
docker exec n8n \
  cat /home/node/.n8n/workflows/*.json > workflows-backup.json

# 更新到最新版本
docker-compose pull
docker-compose up -d

# 清理旧执行记录
docker exec n8n_postgres_1 psql -U n8n -d n8n -c \
  "DELETE FROM execution_entity WHERE startedAt < NOW() - INTERVAL '30 days';"
```

---

## 下一步

1. **深入学习**：阅读《n8n_完全指南.md》
2. **最佳实践**：查看《n8n_最佳实践.md》
3. **加入社区**：https://community.n8n.io

---

**30 分钟掌握 n8n 核心，现在开始自动化你的工作！** 🚀
