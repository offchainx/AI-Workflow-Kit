# 🚀 n8n 完整学习包

**从零到生产环境，掌握 n8n 自动化平台**

---

## 📦 包含内容

### 1. 📚 文档

| 文档 | 说明 | 适合人群 |
|------|------|----------|
| [n8n_完全指南.md](n8n_完全指南.md) | 20,000+ 字完整技术指南 | 想深入了解 n8n 的开发者 |
| [n8n_快速实战手册.md](n8n_快速实战手册.md) | 30分钟快速上手 + 3个实战项目 | 想快速开始的实践者 |
| [n8n_最佳实践.md](n8n_最佳实践.md) | 生产级开发规范 | 准备部署到生产环境的团队 |

### 2. 🛠️ 工具

| 工具 | 说明 |
|------|------|
| [install-n8n.sh](install-n8n.sh) | 一键安装脚本（Docker Compose + PostgreSQL） |

### 3. 📋 工作流模板

在 `workflows/` 目录下包含 5 个即用型工作流：

| 工作流 | 功能 | 适用场景 |
|--------|------|----------|
| [youtube-to-knowledge-hub.json](workflows/youtube-to-knowledge-hub.json) | YouTube 视频自动收集 | Personal Knowledge Hub |
| [crypto-price-monitor.json](workflows/crypto-price-monitor.json) | 加密货币监控与交易信号 | 量化交易 |
| [content-auto-publish.json](workflows/content-auto-publish.json) | AI 内容多平台发布 | 一人公司内容营销 |
| [email-ai-responder.json](workflows/email-ai-responder.json) | AI 智能邮件回复 | 客户服务自动化 |
| [data-sync-workflow.json](workflows/data-sync-workflow.json) | 多平台数据同步 | 数据备份与同步 |

---

## 🎯 快速开始

### 方式 1：最快体验（5 分钟）

```bash
# 使用 npx 直接运行
npx n8n

# 访问 http://localhost:5678
```

### 方式 2：生产环境部署（10 分钟）

```bash
# 1. 下载安装脚本
chmod +x install-n8n.sh

# 2. 运行安装（自动配置 Docker + PostgreSQL + 备份）
./install-n8n.sh

# 3. 访问你的 n8n 实例
# 本地: http://localhost:5678
# 生产: https://your-domain.com
```

### 方式 3：导入工作流模板

```bash
# 1. 启动 n8n
docker-compose up -d

# 2. 在 n8n 界面中导入
Settings → Import Workflow → 选择 workflows/*.json
```

---

## 📖 学习路径

### 初学者（0-1 周）

1. **阅读**：[n8n_快速实战手册.md](n8n_快速实战手册.md)
   - 5 分钟快速开始
   - 第一个工作流
   - 3 个实战项目

2. **实践**：导入并运行工作流模板
   - 从简单的 YouTube 收集开始
   - 逐步尝试更复杂的工作流

3. **动手**：根据你的需求修改模板
   - 修改触发条件
   - 调整处理逻辑
   - 连接你的服务

### 进阶者（1-4 周）

1. **深入学习**：[n8n_完全指南.md](n8n_完全指南.md)
   - 架构设计
   - Code 节点高级用法
   - AI 集成
   - 性能优化

2. **构建项目**：
   - Personal Knowledge Hub 完整集成
   - 量化交易系统
   - 一人公司自动化

3. **优化工作流**：
   - 错误处理
   - 性能优化
   - 安全加固

### 生产部署（4+ 周）

1. **阅读**：[n8n_最佳实践.md](n8n_最佳实践.md)
   - 安全最佳实践
   - 性能优化
   - 监控与日志

2. **部署**：使用 [install-n8n.sh](install-n8n.sh)
   - 生产环境配置
   - HTTPS + 域名
   - 备份策略

3. **运维**：
   - 监控告警
   - 日志分析
   - 定期备份

---

## 🎓 推荐项目实战

### 项目 1: Personal Knowledge Hub 自动化

**目标**：自动收集、分类、存储知识

**工作流组合**：
1. YouTube 视频收集
2. 网页书签收集
3. AI 自动分类
4. 多平台同步

**涉及技术**：
- YouTube API
- OpenAI GPT-4
- Supabase
- Telegram Bot

**预计时间**：2-3 天

---

### 项目 2: 加密货币交易助手

**目标**：监控价格，生成交易信号

**工作流组合**：
1. 价格监控（每分钟）
2. 技术指标计算（RSI, MACD, SMA）
3. 信号通知（Telegram）
4. 历史记录（数据库）

**涉及技术**：
- Binance API
- 技术分析算法
- Telegram Bot
- PostgreSQL

**预计时间**：1-2 天

---

### 项目 3: 一人公司内容引擎

**目标**：一次创作，多平台发布

**工作流组合**：
1. Webhook 接收内容
2. AI 改写（Twitter, LinkedIn, 小红书）
3. 自动发布
4. 数据分析

**涉及技术**：
- OpenAI GPT-4
- Twitter API
- LinkedIn API
- 小红书 API

**预计时间**：2-3 天

---

## 🔧 常用命令

### Docker 管理

```bash
# 查看日志
docker-compose logs -f n8n

# 重启服务
docker-compose restart n8n

# 停止服务
docker-compose down

# 更新到最新版本
docker-compose pull
docker-compose up -d
```

### 备份与恢复

```bash
# 备份
./backup-n8n.sh

# 恢复
./restore-n8n.sh backups/db-20251024_120000.sql.gz
```

### 导出/导入工作流

```bash
# 导出所有工作流
docker exec n8n_n8n_1 n8n export:workflow --all --output=/tmp/workflows.json

# 导入工作流
docker exec n8n_n8n_1 n8n import:workflow --input=/tmp/workflows.json
```

---

## 🛟 故障排查

### 常见问题

#### 1. Webhook 无法访问

```bash
# 检查端口
netstat -tulpn | grep 5678

# 检查防火墙
sudo ufw allow 5678

# 检查 Docker 日志
docker-compose logs n8n
```

#### 2. 数据库连接失败

```bash
# 进入数据库容器
docker exec -it n8n_postgres_1 psql -U n8n -d n8n

# 测试连接
\dt  # 列出所有表
```

#### 3. 工作流执行超时

```yaml
# docker-compose.yml 中增加
environment:
  - EXECUTIONS_TIMEOUT=600
  - EXECUTIONS_TIMEOUT_MAX=3600
```

---

## 📞 获取帮助

1. **官方文档**：https://docs.n8n.io
2. **社区论坛**：https://community.n8n.io
3. **GitHub**：https://github.com/n8n-io/n8n
4. **Discord**：https://discord.gg/n8n

---

## 📝 更新日志

### v1.0.0 (2025-10-24)

- ✅ n8n 完全指南（20,000+ 字）
- ✅ 快速实战手册（30 分钟上手）
- ✅ 最佳实践指南（生产级规范）
- ✅ 一键安装脚本
- ✅ 5 个即用型工作流模板

---

## 🎉 开始自动化你的工作吧！

**30 分钟从零开始 → 2 周构建完整系统 → 长期持续优化**

选择适合你的学习路径，立即开始！ 🚀
