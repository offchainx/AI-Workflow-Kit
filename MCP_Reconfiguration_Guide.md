# MCP 重新配置指南

**创建日期**: 2025-10-23
**目标**: 修复 GitHub MCP 和配置 Notion MCP

---

## 🎯 总览

当前状态：
- ❌ **GitHub MCP**: Token 无效，需要重新创建
- ⚠️ **Notion MCP**: 已配置但 workspace 为空，需要正确设置

---

# 第一部分：重新配置 GitHub MCP

## 步骤 1：撤销旧 Token 并创建新 Token

### 1.1 访问 GitHub Token 设置页面

打开浏览器，访问：
```
https://github.com/settings/tokens
```

### 1.2 删除旧 Token

1. 在列表中找到之前创建的 token（可能名为 "Claude Code MCP" 或类似名称）
2. 点击旁边的 **Delete** 按钮
3. 确认删除

### 1.3 创建新 Token

1. 点击右上角的 **Generate new token** 按钮
2. 选择 **Generate new token (classic)**

**配置新 Token**:

```
Note: Claude Code MCP - 2025
Expiration: 90 days (或按需选择)

Select scopes (勾选以下权限):
✅ repo (完整仓库访问)
  ├─ repo:status
  ├─ repo_deployment
  ├─ public_repo
  └─ repo:invite

✅ workflow (访问 GitHub Actions)

✅ read:org (读取组织信息)

✅ read:user (读取用户信息)

✅ user:email (访问邮箱地址)
```

3. 点击页面底部的 **Generate token** 按钮
4. **重要**: 复制生成的 token（格式：`ghp_xxxxxxxxxx`）

⚠️ **注意**: Token 只会显示一次！请立即复制并妥善保存。

---

## 步骤 2：更新 .zshrc 配置

### 2.1 打开终端，编辑 .zshrc

```bash
nano ~/.zshrc
```

### 2.2 找到 GITHUB_TOKEN 行

向下滚动找到这一行：
```bash
export GITHUB_TOKEN=ghp_your_old_token_here
```

### 2.3 替换为新 Token

删除旧的 token，粘贴新复制的 token：
```bash
export GITHUB_TOKEN=ghp_你刚刚复制的新token
```

### 2.4 保存并退出

- 按 `Ctrl+O` (保存)
- 按 `Enter` (确认)
- 按 `Ctrl+X` (退出)

---

## 步骤 3：重新加载配置

### 3.1 在终端中执行

```bash
source ~/.zshrc
```

### 3.2 验证 Token

```bash
# 检查 Token 长度（应该是 40）
echo "Token 长度: ${#GITHUB_TOKEN}"

# 测试 API 访问
curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user
```

**预期输出**: 应该看到你的 GitHub 用户信息（JSON 格式），而不是错误信息。

---

## 步骤 4：重启 Cursor

### 4.1 完全退出 Cursor

按 `Cmd+Q` 退出 Cursor

### 4.2 从终端重新启动

```bash
cd /Users/victorsim/Desktop/Projects/Adaptive_learning_v1.0
open -a "Cursor" .
```

这样 Cursor 会继承新的环境变量。

---

## 步骤 5：测试 GitHub MCP

在 Claude Code 中测试：

```
测试 1: 列出我的所有 GitHub 仓库
测试 2: 搜索我的 Python 仓库
测试 3: 读取 Adaptive_learning_v1.0 仓库的 README
```

---

# 第二部分：重新配置 Notion MCP

## 问题诊断

当前状态：
- ✅ API Token 有效
- ✅ 可以连接 Notion API
- ❌ 搜索返回 0 个结果

**原因**: Notion Integration 可能没有连接到任何页面/数据库。

---

## 步骤 1：检查 Notion Integration

### 1.1 访问 Notion Integrations 页面

```
https://www.notion.so/my-integrations
```

### 1.2 找到或创建 Integration

1. 如果没有 Integration，点击 **+ New integration**
2. 如果已有，点击查看详情

**基本设置**:
```
Name: Claude Code MCP
Type: Internal integration
Associated workspace: [选择你的 workspace]

Capabilities:
✅ Read content
✅ Update content
✅ Insert content
```

3. 复制 **Internal Integration Token**（如果需要更新）

---

## 步骤 2：连接 Integration 到页面

### 2.1 在 Notion 中打开你想访问的页面

例如：「一人公司创业」、「项目列表」、「AI开发流程」等页面。

### 2.2 连接 Integration

1. 点击页面右上角的 **...** (更多选项)
2. 滚动到底部，找到 **Connections**
3. 点击 **+ Add connections**
4. 搜索并选择你的 Integration（如 "Claude Code MCP"）
5. 点击 **Confirm**

### 2.3 对所有重要页面重复此操作

为以下类型的页面添加连接：
- ✅ 创业相关页面
- ✅ 项目管理数据库
- ✅ AI 开发流程文档
- ✅ 任务列表

---

## 步骤 3：更新 MCP 配置（如果需要）

### 3.1 检查当前配置

```bash
cat "/Users/victorsim/Library/Application Support/Cursor/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json" | grep -A 10 "notion"
```

### 3.2 如果需要更新 Token

当前 Token: `ntn_your_notion_token_here`

如果你创建了新的 Integration 或需要更新 Token：

1. 打开配置文件：
```bash
nano "/Users/victorsim/Library/Application Support/Cursor/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json"
```

2. 找到 `"notion"` 部分，更新 Token：
```json
"notion": {
  "command": "npx",
  "args": [
    "-y",
    "@suekou/mcp-notion-server"
  ],
  "env": {
    "NOTION_API_TOKEN": "你的新token"
  },
  "autoApprove": [
    "notion_create_database_item",
    "notion_query_database"
  ]
}
```

3. 保存并退出

---

## 步骤 4：创建测试内容

### 4.1 在 Notion 中创建测试页面

创建一个新页面，包含以下结构：

```
页面标题：AI 开发流程框架

## 一人公司创业

### 项目列表
- Adaptive Learning 系统
- BMAD Method 实践
- MCP 集成方案

### AI 开发流程
1. 需求分析 (Analyst)
2. 产品规划 (PM)
3. 架构设计 (Architect)
4. 开发实现 (Dev)
5. 质量保证 (QA)
```

### 4.2 连接 Integration

确保这个测试页面已连接到你的 Integration（参考步骤 2.2）。

---

## 步骤 5：测试 Notion MCP

### 5.1 重启 Cursor

```bash
# 完全退出
Cmd+Q

# 从终端重启
cd /Users/victorsim/Desktop/Projects/Adaptive_learning_v1.0
open -a "Cursor" .
```

### 5.2 在 Claude Code 中测试

```
测试 1: 搜索我的 Notion 页面
测试 2: 读取「AI 开发流程框架」页面内容
测试 3: 在 Notion 中创建一个新任务
```

---

## 步骤 6：高级 Notion 操作

### 6.1 使用数据库 ID 直接访问

如果你有数据库：

1. 打开 Notion 数据库页面
2. 复制页面 URL，格式类似：
   ```
   https://notion.so/workspace/xxxxx?v=yyyyy
   ```
3. `xxxxx` 部分就是 Database ID

4. 在 Claude Code 中：
   ```
   读取 Notion 数据库 [database_id] 的所有项目
   ```

### 6.2 Notion MCP 可用操作

```
✅ 搜索页面: 「搜索 Notion 中包含'AI'的页面」
✅ 读取页面: 「读取 Notion 页面 [page_id] 的内容」
✅ 创建页面: 「在 Notion 中创建页面：新任务」
✅ 更新页面: 「更新 Notion 页面 [page_id] 的标题」
✅ 查询数据库: 「查询 Notion 数据库 [db_id] 的所有项目」
✅ 创建数据库项: 「在数据库中创建新项目」
```

---

# 第三部分：验证配置

## 完整测试清单

### ✅ GitHub MCP 测试

```bash
# 在终端中
curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user
```

在 Claude Code 中：
```
1. 列出我的所有 GitHub 仓库
2. 搜索包含 'python' 的仓库
3. 在当前仓库创建一个 issue: 测试 MCP 配置
```

### ✅ Notion MCP 测试

在 Claude Code 中：
```
1. 搜索 Notion 中的所有页面
2. 读取「AI 开发流程」相关页面
3. 创建新页面：MCP 配置完成
```

### ✅ 联动测试

```
从 Notion 读取项目列表，为每个项目在 GitHub 创建 issue
```

---

# 故障排查

## GitHub MCP 常见问题

### 问题 1: 仍然显示 "Bad credentials"

**解决方案**:
```bash
# 1. 确认 Token 已更新
echo $GITHUB_TOKEN

# 2. 确认从终端启动 Cursor
cd /Users/victorsim/Desktop/Projects/Adaptive_learning_v1.0
open -a "Cursor" .

# 3. 检查 Token 权限
# 访问 https://github.com/settings/tokens
# 确保包含 repo, workflow, read:org 权限
```

### 问题 2: Token 长度不是 40

**解决方案**:
```bash
# 检查 .zshrc
cat ~/.zshrc | grep GITHUB_TOKEN

# 确保没有多余的空格或换行
nano ~/.zshrc
# 格式应该是：export GITHUB_TOKEN=ghp_xxxxxxxxxxxx
```

## Notion MCP 常见问题

### 问题 1: 搜索返回 0 结果

**原因**: Integration 未连接到页面

**解决方案**:
1. 打开 Notion 页面
2. 点击右上角 ... → Connections
3. 添加你的 Integration

### 问题 2: 权限错误

**解决方案**:
1. 访问 https://www.notion.so/my-integrations
2. 检查 Integration 权限：
   - ✅ Read content
   - ✅ Update content
   - ✅ Insert content

### 问题 3: Token 无效

**解决方案**:
1. 重新生成 Integration Token
2. 更新 MCP 配置文件
3. 重启 Cursor

---

# 快速参考

## 重启 Cursor 的正确方式

```bash
# 1. 完全退出 Cursor (Cmd+Q)

# 2. 在终端中
cd /Users/victorsim/Desktop/Projects/Adaptive_learning_v1.0
source ~/.zshrc

# 3. 从终端启动
open -a "Cursor" .
```

## 验证环境变量

```bash
# GitHub Token
echo "GitHub Token 长度: ${#GITHUB_TOKEN}"

# Notion Token (从配置文件)
cat "/Users/victorsim/Library/Application Support/Cursor/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json" | grep NOTION_API_TOKEN
```

## 测试 API 连接

```bash
# GitHub
curl -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user

# Notion
curl -X POST "https://api.notion.com/v1/search" \
  -H "Authorization: Bearer ntn_your_token" \
  -H "Notion-Version: 2022-06-28" \
  -H "Content-Type: application/json" \
  -d '{}'
```

---

# 完成后的能力

配置完成后，你将能够：

## GitHub MCP
✅ 自动列出和搜索仓库
✅ 读取代码文件内容
✅ 创建 Issues 和 Pull Requests
✅ 管理仓库设置
✅ 查看提交历史

## Notion MCP
✅ 搜索所有已连接的页面
✅ 读取页面和数据库内容
✅ 创建新页面和数据库项
✅ 更新现有内容
✅ 组织和管理项目

## 联动能力
✅ Notion → GitHub: 从任务创建 Issues
✅ GitHub → Notion: 同步开发状态
✅ Browser → Notion: 保存研究笔记
✅ 跨平台工作流自动化

---

**准备好了吗？按照上面的步骤操作，完成后告诉我，我们一起测试！** 🚀
