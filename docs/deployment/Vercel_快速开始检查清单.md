# ✅ Vercel 快速开始检查清单

**项目**: Personal Knowledge Hub
**目标**: 10 分钟内完成首次部署

---

## 🎯 总览

```
准备工作 (5分钟) → Git/GitHub (2分钟) → Vercel 部署 (3分钟) → 完成！
```

---

## 📝 部署前检查清单

### ✅ 1. 账号准备

- [ ] **GitHub 账号**
  - 登录：https://github.com
  - 没有？注册：https://github.com/signup

- [ ] **Vercel 账号**
  - 访问：https://vercel.com
  - 用 GitHub 登录（一键登录）

### ✅ 2. 项目状态

- [ ] **代码可以本地运行**
  ```bash
  cd /Users/victorsim/Desktop/Projects/Personal_RAG_v1.0/apps/web
  npm install
  npm run dev
  # 访问 http://localhost:3000 确认正常
  ```

- [ ] **环境变量准备好**
  - 位置：`apps/web/.env`
  - 如果没有，复制示例：
    ```bash
    cp apps/web/.env.example apps/web/.env
    # 然后编辑 .env 填入真实值
    ```

### ✅ 3. Git 仓库

- [ ] **初始化 Git**（如果还没有）
  ```bash
  cd /Users/victorsim/Desktop/Projects/Personal_RAG_v1.0
  git init
  git add .
  git commit -m "Initial commit"
  ```

- [ ] **连接 GitHub**
  - 选项 A（推荐）：使用自动化脚本
    ```bash
    ./deploy-to-vercel.sh
    ```

  - 选项 B：手动创建
    1. 访问 https://github.com/new
    2. 仓库名：`personal-knowledge-hub`
    3. 选择 **Private**
    4. 创建后运行：
       ```bash
       git remote add origin https://github.com/YOUR_USERNAME/personal-knowledge-hub.git
       git branch -M main
       git push -u origin main
       ```

---

## 🚀 Vercel 部署步骤

### 步骤 1：导入项目 (1 分钟)

1. 访问 https://vercel.com/new
2. 选择 **Import Git Repository**
3. 找到 `personal-knowledge-hub` → 点击 **Import**

### 步骤 2：配置项目 (2 分钟)

| 配置项 | 值 | 必填 |
|--------|-----|------|
| Framework Preset | Next.js | ✅ |
| Root Directory | `apps/web` | ✅ |
| Build Command | `npm run build` | ✅ |
| Output Directory | `.next` | ✅ |
| Install Command | `npm install` | ✅ |

**重要**：必须设置 **Root Directory** 为 `apps/web`！

### 步骤 3：环境变量 (2 分钟)

在 **Environment Variables** 部分添加：

| 变量名 | 获取位置 | 环境 |
|--------|---------|------|
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase Dashboard → Project Settings | All |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase Dashboard → API | All |
| `OPENAI_API_KEY` | https://platform.openai.com/api-keys | Production |
| `ANTHROPIC_API_KEY` | https://console.anthropic.com/settings/keys | Production |

**提示**：从你的 `.env` 文件复制值

### 步骤 4：部署 (1 分钟)

1. 点击 **Deploy**
2. 等待 1-3 分钟
3. 🎉 看到 "Congratulations!" 就成功了！

---

## 🔍 部署后检查

### ✅ 验证部署成功

- [ ] **访问 Vercel URL**
  ```
  https://personal-knowledge-hub-xxxx.vercel.app
  ```

- [ ] **测试核心功能**
  - [ ] 页面能正常加载
  - [ ] Supabase 连接正常（检查数据获取）
  - [ ] AI 功能正常（如果有）

- [ ] **查看部署日志**
  - Vercel Dashboard → Deployments → 点击最新部署
  - 检查是否有错误或警告

### ⚠️ 常见问题排查

#### 问题 1：构建失败 "Cannot find module"

**原因**：依赖未安装

**解决**：
```bash
# 本地测试构建
cd apps/web
npm install
npm run build

# 如果成功，提交并重新部署
git add package.json package-lock.json
git commit -m "Update dependencies"
git push
```

#### 问题 2：500 Internal Server Error

**原因**：环境变量缺失或错误

**解决**：
1. Vercel Dashboard → Settings → Environment Variables
2. 检查所有必需变量都已添加
3. 重新部署：Deployments → 最新部署 → **Redeploy**

#### 问题 3：页面显示但功能异常

**原因**：Supabase 或 API 密钥配置错误

**解决**：
1. 检查 Supabase URL 和密钥
2. 检查 API 密钥是否有效
3. 查看浏览器控制台和 Vercel 日志

---

## 📊 环境变量完整清单

### 你的项目需要的环境变量

根据 `apps/web/package.json` 分析：

#### 必需（否则无法运行）

```bash
# Supabase（后端数据库）
NEXT_PUBLIC_SUPABASE_URL=https://xxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJxxx...

# AI API（根据你使用的功能）
OPENAI_API_KEY=sk-xxx              # 如果使用 OpenAI
ANTHROPIC_API_KEY=sk-ant-xxx       # 如果使用 Claude
```

#### 可选（增强功能）

```bash
# Supabase 服务端密钥（如果需要管理员操作）
SUPABASE_SERVICE_ROLE_KEY=eyJxxx...

# Sentry 错误追踪
NEXT_PUBLIC_SENTRY_DSN=https://xxx@xxx.ingest.sentry.io/xxx

# Vercel Analytics（自动启用，无需配置）
```

### 获取这些密钥

#### 1. Supabase

1. 登录 https://supabase.com
2. 选择你的项目
3. Settings → API
4. 复制：
   - `URL` → `NEXT_PUBLIC_SUPABASE_URL`
   - `anon public` → `NEXT_PUBLIC_SUPABASE_ANON_KEY`

#### 2. OpenAI

1. 访问 https://platform.openai.com/api-keys
2. 点击 **Create new secret key**
3. 复制密钥（只显示一次！）
4. 设置为 `OPENAI_API_KEY`

#### 3. Anthropic (Claude)

1. 访问 https://console.anthropic.com/settings/keys
2. 点击 **Create Key**
3. 复制密钥
4. 设置为 `ANTHROPIC_API_KEY`

---

## 🎯 快速命令参考

### 一键部署脚本

```bash
# 运行自动化部署准备脚本
cd /Users/victorsim/Desktop/Projects/Personal_RAG_v1.0
./deploy-to-vercel.sh
```

### 手动部署命令

```bash
# 1. Git 初始化
git init
git add .
git commit -m "Initial commit"

# 2. 推送到 GitHub
git remote add origin https://github.com/YOUR_USERNAME/personal-knowledge-hub.git
git push -u origin main

# 3. 通过 CLI 部署到 Vercel
npm i -g vercel
cd apps/web
vercel --prod
```

### 更新部署

```bash
# 修改代码后
git add .
git commit -m "Update: 描述你的改动"
git push

# Vercel 会自动部署！
```

---

## 📈 部署后优化（可选）

### 1. 添加自定义域名

1. Vercel Dashboard → Settings → Domains
2. 输入你的域名
3. 按提示配置 DNS

### 2. 启用 Analytics

```bash
cd apps/web
npm install @vercel/analytics
```

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

### 3. 性能优化

- [ ] 运行 Lighthouse 测试
  ```bash
  npm install -g lighthouse
  lighthouse https://your-app.vercel.app --view
  ```

- [ ] 启用 ISR（增量静态再生）
  ```tsx
  // 在页面中添加
  export const revalidate = 3600; // 每小时更新
  ```

- [ ] 优化图片
  ```tsx
  // 使用 Next.js Image
  import Image from 'next/image'
  <Image src="/photo.jpg" width={800} height={600} />
  ```

---

## 🆘 需要帮助？

### 官方资源

- Vercel 文档：https://vercel.com/docs
- Next.js 文档：https://nextjs.org/docs
- Vercel 支持：https://vercel.com/support

### 项目特定文档

- `Vercel_部署完全指南.md` - 完整部署流程
- `Vercel_高级技巧与最佳实践.md` - 性能优化和高级功能

---

## ✅ 完成标志

你已成功部署，如果：

- ✅ Vercel URL 可以访问
- ✅ 功能正常工作
- ✅ 没有错误日志
- ✅ Core Web Vitals 良好（可选）

---

**🎉 恭喜！你的 Personal Knowledge Hub 已成功部署到 Vercel！**

下一步：
1. 分享你的应用链接
2. 配置自定义域名（可选）
3. 添加监控和分析
4. 持续迭代和优化

**Happy Deploying! 🚀**
