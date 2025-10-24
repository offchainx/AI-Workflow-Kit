# 🚀 Vercel 部署完全指南

**目标项目**: Personal Knowledge Hub (Next.js 14 + Supabase + AI)

---

## 📋 目录

1. [前置准备](#1-前置准备)
2. [方法一：通过 GitHub 部署（推荐）](#2-方法一通过-github-部署推荐)
3. [方法二：通过 Vercel CLI 部署](#3-方法二通过-vercel-cli-部署)
4. [环境变量配置](#4-环境变量配置)
5. [Monorepo 配置](#5-monorepo-配置)
6. [域名配置](#6-域名配置)
7. [性能优化](#7-性能优化)
8. [常见问题](#8-常见问题)

---

## 1. 前置准备

### ✅ 检查清单

- [ ] Vercel 账号（访问 [vercel.com](https://vercel.com)，用 GitHub 登录）
- [ ] GitHub 账号
- [ ] 项目代码准备好
- [ ] 环境变量列表（稍后配置）

### 📦 你的项目结构

```
Personal_RAG_v1.0/
├── apps/
│   ├── web/          # Next.js 应用（主要部署这个）
│   └── extension/    # Chrome 扩展（不需要部署到 Vercel）
├── package.json
└── README.md
```

---

## 2. 方法一：通过 GitHub 部署（推荐）⭐

这是最推荐的方法，因为：
- ✅ 自动 CI/CD（Git push = 自动部署）
- ✅ 每个 PR 自动生成预览环境
- ✅ 一键回滚到任意历史版本

### 步骤 1：初始化 Git 仓库

```bash
# 进入项目目录
cd /Users/victorsim/Desktop/Projects/Personal_RAG_v1.0

# 初始化 Git（如果还没有）
git init

# 添加所有文件
git add .

# 创建首次提交
git commit -m "Initial commit: Personal Knowledge Hub"
```

### 步骤 2：创建 GitHub 仓库

#### 选项 A：使用 GitHub CLI（推荐）

```bash
# 安装 GitHub CLI（如果还没有）
brew install gh

# 登录 GitHub
gh auth login

# 创建私有仓库并推送
gh repo create personal-knowledge-hub --private --source=. --push
```

#### 选项 B：手动创建

1. 访问 [github.com/new](https://github.com/new)
2. 仓库名称：`personal-knowledge-hub`
3. 选择 **Private**（因为包含 API 密钥）
4. 点击 **Create repository**
5. 在本地推送代码：

```bash
# 添加远程仓库
git remote add origin https://github.com/YOUR_USERNAME/personal-knowledge-hub.git

# 推送代码
git branch -M main
git push -u origin main
```

### 步骤 3：连接 Vercel

#### 3.1 登录 Vercel

访问 [vercel.com](https://vercel.com) → 用 GitHub 登录

#### 3.2 导入项目

1. 点击 **Add New...** → **Project**
2. 选择你的 GitHub 仓库：`personal-knowledge-hub`
3. 点击 **Import**

#### 3.3 配置项目设置

**重要配置：**

| 配置项 | 值 | 说明 |
|--------|-----|------|
| Framework Preset | Next.js | 自动检测 |
| Root Directory | `apps/web` | ⚠️ 重要：因为是 monorepo |
| Build Command | `npm run build` | 默认即可 |
| Output Directory | `.next` | 默认即可 |
| Install Command | `npm install` | 默认即可 |

**Monorepo 特别设置**：

```
Root Directory: apps/web
```

点击 **Edit** 修改根目录：

![Vercel Root Directory](https://i.imgur.com/example.png)

#### 3.4 配置环境变量

在 **Environment Variables** 部分添加：

```bash
# Supabase 配置
NEXT_PUBLIC_SUPABASE_URL=你的_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=你的_supabase_anon_key

# OpenAI API
OPENAI_API_KEY=sk-xxx

# Anthropic API
ANTHROPIC_API_KEY=sk-ant-xxx

# 其他环境变量...
```

**提示**：从你的 `.env` 文件复制这些值。

#### 3.5 部署

点击 **Deploy** → 等待 2-3 分钟 → 🎉 完成！

---

## 3. 方法二：通过 Vercel CLI 部署

适合快速测试或本地部署。

### 步骤 1：安装 Vercel CLI

```bash
npm install -g vercel
```

### 步骤 2：登录

```bash
vercel login
```

### 步骤 3：部署

```bash
# 进入 web 应用目录
cd /Users/victorsim/Desktop/Projects/Personal_RAG_v1.0/apps/web

# 首次部署（会询问配置）
vercel

# 生产环境部署
vercel --prod
```

**交互式问题回答**：

```
? Set up and deploy "~/Projects/Personal_RAG_v1.0/apps/web"? [Y/n] y
? Which scope do you want to deploy to? Your Name
? Link to existing project? [y/N] n
? What's your project's name? personal-knowledge-hub
? In which directory is your code located? ./
? Want to override the settings? [y/N] n
```

---

## 4. 环境变量配置

### 4.1 查看你的 .env 文件

```bash
cat /Users/victorsim/Desktop/Projects/Personal_RAG_v1.0/.env.example
```

### 4.2 在 Vercel 添加环境变量

#### 方法 A：通过 Web UI

1. 访问项目 → **Settings** → **Environment Variables**
2. 添加每个变量

#### 方法 B：通过 CLI（批量导入）

```bash
# 创建环境变量文件
cat > .env.production << 'EOF'
NEXT_PUBLIC_SUPABASE_URL=https://xxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJxxx...
OPENAI_API_KEY=sk-xxx
ANTHROPIC_API_KEY=sk-ant-xxx
EOF

# 导入到 Vercel
vercel env add NEXT_PUBLIC_SUPABASE_URL production < .env.production
```

### 4.3 环境变量类型

Vercel 支持三种环境：

- **Production**：生产环境（主分支）
- **Preview**：预览环境（PR 和其他分支）
- **Development**：本地开发（通过 `vercel env pull` 获取）

**最佳实践**：

```bash
# 敏感 API 密钥：只添加到 Production
OPENAI_API_KEY → Production only

# 公开配置：添加到所有环境
NEXT_PUBLIC_SUPABASE_URL → Production, Preview, Development
```

---

## 5. Monorepo 配置

你的项目是 monorepo 结构，需要特别配置。

### 5.1 Vercel 项目配置文件

在项目根目录创建 `vercel.json`：

```bash
cd /Users/victorsim/Desktop/Projects/Personal_RAG_v1.0
```

创建配置文件：

```json
{
  "buildCommand": "cd apps/web && npm run build",
  "devCommand": "cd apps/web && npm run dev",
  "installCommand": "npm install",
  "framework": "nextjs",
  "outputDirectory": "apps/web/.next"
}
```

### 5.2 在 Vercel UI 设置

**Project Settings** → **General** → **Root Directory**:

```
apps/web
```

### 5.3 验证配置

部署后检查日志，确保构建路径正确：

```
✓ Detected Next.js
✓ Installing dependencies...
✓ Building...
✓ Uploading build artifacts...
```

---

## 6. 域名配置

### 6.1 Vercel 免费域名

每个项目自动获得：

```
https://personal-knowledge-hub.vercel.app
```

### 6.2 自定义域名

#### 步骤 1：添加域名

1. 项目设置 → **Domains**
2. 输入你的域名：`yourdomain.com`
3. 点击 **Add**

#### 步骤 2：配置 DNS

在你的域名注册商（如 Namecheap、GoDaddy）添加 DNS 记录：

**选项 A：使用 A 记录（推荐）**

```
Type: A
Name: @
Value: 76.76.21.21
```

**选项 B：使用 CNAME**

```
Type: CNAME
Name: @
Value: cname.vercel-dns.com
```

#### 步骤 3：等待生效

DNS 传播通常需要 24-48 小时，但一般 10 分钟内就能访问。

### 6.3 免费 SSL 证书

Vercel 自动提供 Let's Encrypt SSL 证书，无需配置！

---

## 7. 性能优化

### 7.1 Next.js 图片优化

确保使用 Next.js Image 组件：

```tsx
import Image from 'next/image'

<Image
  src="/logo.png"
  width={200}
  height={100}
  alt="Logo"
/>
```

### 7.2 启用 ISR（增量静态再生）

对于数据变化不频繁的页面：

```tsx
// app/blog/[slug]/page.tsx
export const revalidate = 3600; // 每小时重新生成

export default async function BlogPost({ params }) {
  const post = await fetchPost(params.slug);
  return <div>{post.content}</div>;
}
```

### 7.3 Edge Functions

将 API 路由部署到 Edge（全球分布）：

```ts
// app/api/hello/route.ts
export const runtime = 'edge'; // 启用 Edge Runtime

export async function GET() {
  return new Response('Hello from the edge!');
}
```

### 7.4 分析性能

启用 Vercel Analytics：

1. 项目设置 → **Analytics**
2. 点击 **Enable**
3. 在代码中添加：

```tsx
// app/layout.tsx
import { Analytics } from '@vercel/analytics/react';

export default function RootLayout({ children }) {
  return (
    <html>
      <body>
        {children}
        <Analytics />
      </body>
    </html>
  );
}
```

---

## 8. 常见问题

### Q1: 构建失败 - "Module not found"

**原因**：依赖未正确安装

**解决**：

```bash
# 清理并重新安装
rm -rf node_modules package-lock.json
npm install

# 本地测试构建
npm run build
```

### Q2: 环境变量无效

**检查**：

1. 变量名是否以 `NEXT_PUBLIC_` 开头（客户端使用）
2. 是否选择了正确的环境（Production/Preview）
3. 重新部署（环境变量修改后需要重新部署）

### Q3: 500 Internal Server Error

**调试**：

1. 查看 Vercel 日志：项目 → **Deployments** → 点击部署 → **Functions** 标签
2. 检查 API 路由代码
3. 验证环境变量

### Q4: Monorepo 构建失败

**确保**：

1. `Root Directory` 设置为 `apps/web`
2. `package.json` 中的依赖完整
3. 如果使用 workspace，在根目录运行 `npm install`

### Q5: 超出免费额度

**监控使用量**：

项目 → **Settings** → **Usage**

**优化建议**：

- 启用 ISR 减少构建次数
- 使用 Next.js 图片优化
- 启用缓存头

### Q6: 如何回滚部署？

1. 项目 → **Deployments**
2. 找到之前的成功部署
3. 点击 **...** → **Promote to Production**

---

## 🎯 针对你的项目的部署清单

### Personal Knowledge Hub 部署步骤

- [ ] **步骤 1**: 初始化 Git 并推送到 GitHub
- [ ] **步骤 2**: 在 Vercel 导入项目，设置 Root Directory 为 `apps/web`
- [ ] **步骤 3**: 配置环境变量：
  - [ ] `NEXT_PUBLIC_SUPABASE_URL`
  - [ ] `NEXT_PUBLIC_SUPABASE_ANON_KEY`
  - [ ] `OPENAI_API_KEY`
  - [ ] `ANTHROPIC_API_KEY`
- [ ] **步骤 4**: 部署并测试
- [ ] **步骤 5**: 配置自定义域名（可选）
- [ ] **步骤 6**: 启用 Analytics（可选）

---

## 📚 延伸阅读

- [Vercel 官方文档](https://vercel.com/docs)
- [Next.js 部署文档](https://nextjs.org/docs/deployment)
- [Monorepo 部署指南](https://vercel.com/docs/monorepos)
- [Environment Variables 最佳实践](https://vercel.com/docs/concepts/projects/environment-variables)

---

## 💡 快速命令参考

```bash
# 安装 Vercel CLI
npm i -g vercel

# 登录
vercel login

# 部署到预览环境
vercel

# 部署到生产环境
vercel --prod

# 查看日志
vercel logs

# 拉取环境变量到本地
vercel env pull

# 查看部署列表
vercel ls

# 移除项目
vercel remove
```

---

**准备好了吗？**

如果你想现在就部署，告诉我，我可以帮你：
1. 初始化 Git 仓库
2. 创建 GitHub 仓库
3. 生成 Vercel 配置文件
4. 准备环境变量清单

让我知道你想从哪一步开始！🚀
