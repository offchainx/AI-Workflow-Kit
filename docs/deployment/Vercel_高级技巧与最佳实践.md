# 🔥 Vercel 高级技巧与最佳实践

**深度指南 - Think Hard Edition**

---

## 📋 目录

1. [架构理解](#1-架构理解)
2. [成本优化](#2-成本优化)
3. [性能调优](#3-性能调优)
4. [安全最佳实践](#4-安全最佳实践)
5. [CI/CD 高级配置](#5-cicd-高级配置)
6. [监控与调试](#6-监控与调试)
7. [Serverless Functions 深度](#7-serverless-functions-深度)
8. [Edge Network 利用](#8-edge-network-利用)

---

## 1. 架构理解

### 1.1 Vercel 的工作原理

```
开发者 Git Push
    ↓
GitHub Webhook 触发
    ↓
Vercel Build System
    ↓
├─ Static Assets → CDN (Edge Network)
├─ API Routes → Serverless Functions (AWS Lambda)
├─ Middleware → Edge Functions (Cloudflare Workers)
└─ ISR Pages → Serverless + Cache
    ↓
部署到全球 70+ 节点
```

### 1.2 请求路径

```
用户请求 yourdomain.com
    ↓
DNS → Vercel Edge Network (最近的节点)
    ↓
Edge Cache 检查
    ↓
├─ Hit → 直接返回（< 50ms）
└─ Miss → 转发到 Serverless Function
         ↓
      执行 Next.js SSR
         ↓
      返回并缓存到 Edge
```

**关键洞察**：
- 静态资源（图片、CSS、JS）→ 永久缓存在 Edge
- 动态页面（SSR）→ 第一次慢，后续从 Edge 缓存返回
- API 路由 → 每次都执行（除非自定义缓存）

### 1.3 构建过程

```bash
# 1. 安装依赖
npm install

# 2. 预构建（Next.js）
next build
  ├─ 静态页面 → HTML 文件
  ├─ SSR 页面 → Serverless Functions
  └─ API 路由 → Serverless Functions

# 3. 优化
  ├─ 代码分割（Code Splitting）
  ├─ Tree Shaking
  ├─ 图片优化
  └─ 字体优化

# 4. 部署
  ├─ 上传静态资源到 CDN
  ├─ 部署 Serverless Functions
  └─ 更新路由配置
```

---

## 2. 成本优化

### 2.1 免费额度最大化

**Hobby 计划限制**：
- 带宽：100 GB/月
- 构建时长：6000 分钟/月
- Serverless 执行：100,000 次/天
- Edge Functions：100,000 次/天

**优化策略**：

#### A. 减少构建次数

```json
// vercel.json
{
  "git": {
    "deploymentEnabled": {
      "main": true,
      "develop": true,
      "feature/*": false  // 不自动部署 feature 分支
    }
  }
}
```

#### B. 启用激进缓存

```tsx
// next.config.js
module.exports = {
  async headers() {
    return [
      {
        source: '/static/:path*',
        headers: [
          {
            key: 'Cache-Control',
            value: 'public, max-age=31536000, immutable',
          },
        ],
      },
    ];
  },
};
```

#### C. 使用 ISR 代替 SSR

```tsx
// ❌ SSR - 每次请求都执行
export async function getServerSideProps() {
  const data = await fetchData();
  return { props: { data } };
}

// ✅ ISR - 每小时只执行一次
export const revalidate = 3600;

export default async function Page() {
  const data = await fetchData();
  return <div>{data}</div>;
}
```

**节省效果**：
- SSR：每次请求都消耗 Serverless 执行时间
- ISR：每小时只执行一次，其余请求从 CDN 返回

#### D. 图片优化

```tsx
// ❌ 直接使用 <img>
<img src="/large-image.png" />

// ✅ 使用 Next.js Image
import Image from 'next/image'

<Image
  src="/large-image.png"
  width={800}
  height={600}
  quality={75}  // 默认 75，可降低到 50-60
  placeholder="blur"
/>
```

**效果**：
- 自动 WebP/AVIF 转换
- 响应式图片（根据设备大小）
- 减少 50-80% 带宽

### 2.2 监控用量

```bash
# 通过 Vercel CLI 查看使用量
vercel inspect usage

# 或访问 Dashboard
# https://vercel.com/[username]/[project]/settings/usage
```

**设置用量警告**：

项目设置 → **Usage** → **Set Usage Limit** → 90 GB

---

## 3. 性能调优

### 3.1 Core Web Vitals 优化

Vercel 提供内置的性能监控，针对三大指标优化：

#### LCP (Largest Contentful Paint) < 2.5s

**优化方法**：

```tsx
// 1. 预加载 LCP 元素
// app/layout.tsx
export default function RootLayout({ children }) {
  return (
    <html>
      <head>
        <link
          rel="preload"
          href="/hero-image.jpg"
          as="image"
        />
      </head>
      <body>{children}</body>
    </html>
  );
}

// 2. 优先加载关键 CSS
// next.config.js
module.exports = {
  experimental: {
    optimizeCss: true,
  },
};
```

#### FID (First Input Delay) < 100ms

**优化方法**：

```tsx
// 延迟加载非关键组件
import dynamic from 'next/dynamic'

const HeavyComponent = dynamic(
  () => import('./HeavyComponent'),
  { ssr: false }
)
```

#### CLS (Cumulative Layout Shift) < 0.1

**优化方法**：

```tsx
// 始终指定图片尺寸
<Image
  src="/image.jpg"
  width={800}
  height={600}
  // 防止布局偏移
/>

// 为字体设置 font-display
// app/layout.tsx
import { Inter } from 'next/font/google'

const inter = Inter({
  subsets: ['latin'],
  display: 'swap',  // 避免 FOIT
})
```

### 3.2 Lighthouse 得分优化

目标：Performance > 90

```bash
# 本地测试
npm install -g lighthouse
lighthouse http://localhost:3000 --view

# 部署后测试
lighthouse https://your-app.vercel.app --view
```

**常见问题修复**：

| 问题 | 解决方案 |
|------|----------|
| Unused JavaScript | 使用动态导入 `dynamic()` |
| Render-blocking CSS | 使用 `next/font` 和 CSS-in-JS |
| Large Network Payloads | 启用压缩、代码分割 |
| Non-composited animations | 只使用 `transform` 和 `opacity` |

### 3.3 数据库查询优化

针对你的 Supabase 集成：

```tsx
// ❌ 每次请求都查询数据库
export default async function Page() {
  const { data } = await supabase.from('posts').select();
  return <div>{data.map(...)}</div>;
}

// ✅ 使用 React Cache（Next.js 14+）
import { cache } from 'react'

const getPosts = cache(async () => {
  const { data } = await supabase.from('posts').select();
  return data;
});

export default async function Page() {
  const data = await getPosts();
  return <div>{data.map(...)}</div>;
}
```

**进一步优化**：

```tsx
// 使用 unstable_cache 和 ISR
import { unstable_cache } from 'next/cache'

const getCachedPosts = unstable_cache(
  async () => {
    const { data } = await supabase.from('posts').select();
    return data;
  },
  ['posts'],
  { revalidate: 3600 }  // 1小时缓存
);
```

---

## 4. 安全最佳实践

### 4.1 环境变量管理

**原则**：

1. **绝对不要**提交 `.env` 文件到 Git
2. 使用 `.env.example` 作为模板
3. 区分客户端和服务端变量

```bash
# .env.example
# Supabase
NEXT_PUBLIC_SUPABASE_URL=your_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_anon_key_here

# Server-side only (不要加 NEXT_PUBLIC_)
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
OPENAI_API_KEY=sk-xxx
ANTHROPIC_API_KEY=sk-ant-xxx
```

**安全检查**：

```tsx
// ❌ 危险！暴露服务端密钥到客户端
const apiKey = process.env.OPENAI_API_KEY;
console.log(apiKey);  // 会被打包到客户端 JS！

// ✅ 正确：只在服务端使用
// app/api/chat/route.ts
export async function POST(req: Request) {
  const apiKey = process.env.OPENAI_API_KEY;  // 仅在服务端执行
  // ... 调用 OpenAI API
}
```

### 4.2 CORS 配置

```tsx
// app/api/your-endpoint/route.ts
export async function GET(request: Request) {
  const origin = request.headers.get('origin');

  // 白名单验证
  const allowedOrigins = [
    'https://yourdomain.com',
    'https://www.yourdomain.com',
  ];

  if (!origin || !allowedOrigins.includes(origin)) {
    return new Response('Forbidden', { status: 403 });
  }

  return new Response('OK', {
    headers: {
      'Access-Control-Allow-Origin': origin,
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    },
  });
}
```

### 4.3 Rate Limiting

```tsx
// 使用 Vercel Edge Config + KV
import { kv } from '@vercel/kv';

export async function POST(request: Request) {
  const ip = request.headers.get('x-forwarded-for');
  const key = `rate-limit:${ip}`;

  const requests = await kv.incr(key);

  if (requests === 1) {
    await kv.expire(key, 60);  // 1分钟过期
  }

  if (requests > 10) {
    return new Response('Rate limit exceeded', { status: 429 });
  }

  // 处理请求...
}
```

### 4.4 Content Security Policy

```tsx
// next.config.js
const securityHeaders = [
  {
    key: 'Content-Security-Policy',
    value: [
      "default-src 'self'",
      "script-src 'self' 'unsafe-eval' 'unsafe-inline'",
      "style-src 'self' 'unsafe-inline'",
      "img-src 'self' data: https:",
      "font-src 'self' data:",
      "connect-src 'self' https://api.openai.com https://*.supabase.co",
    ].join('; '),
  },
  {
    key: 'X-Frame-Options',
    value: 'DENY',
  },
  {
    key: 'X-Content-Type-Options',
    value: 'nosniff',
  },
];

module.exports = {
  async headers() {
    return [
      {
        source: '/:path*',
        headers: securityHeaders,
      },
    ];
  },
};
```

---

## 5. CI/CD 高级配置

### 5.1 自定义构建流程

```json
// vercel.json
{
  "buildCommand": "npm run build:custom",
  "framework": "nextjs",
  "installCommand": "npm ci",
  "devCommand": "npm run dev",
  "ignoreCommand": "git diff --quiet HEAD^ HEAD ./apps/web"
}
```

**`ignoreCommand` 解释**：

- 只有当 `apps/web` 目录有变化时才构建
- 其他目录（如 `apps/extension`）改动不触发构建

### 5.2 多环境部署

```json
// vercel.json
{
  "github": {
    "enabled": true,
    "autoAlias": true
  },
  "env": {
    "API_URL": "https://api.production.com"
  },
  "build": {
    "env": {
      "STAGING": "@staging-env"
    }
  }
}
```

**分支策略**：

- `main` → Production (`yourdomain.com`)
- `develop` → Staging (`develop.yourdomain.com`)
- `feature/*` → Preview (`feature-xxx-git-xxx.vercel.app`)

### 5.3 集成测试

```bash
# .github/workflows/test.yml
name: Tests

on:
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
      - run: npm ci
      - run: npm test
      - run: npm run build

      # 只有测试通过才部署到 Vercel
      - uses: amondnet/vercel-action@v20
        if: success()
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.ORG_ID }}
          vercel-project-id: ${{ secrets.PROJECT_ID }}
```

---

## 6. 监控与调试

### 6.1 实时日志

```bash
# 查看实时日志
vercel logs --follow

# 过滤错误
vercel logs --filter error

# 查看特定部署
vercel logs <deployment-url>
```

### 6.2 Vercel Analytics

```tsx
// app/layout.tsx
import { Analytics } from '@vercel/analytics/react';
import { SpeedInsights } from '@vercel/speed-insights/next';

export default function RootLayout({ children }) {
  return (
    <html>
      <body>
        {children}
        <Analytics />
        <SpeedInsights />
      </body>
    </html>
  );
}
```

**收集的数据**：

- Page Views
- Unique Visitors
- Top Pages
- Top Referrers
- Core Web Vitals

### 6.3 错误追踪

集成 Sentry：

```bash
npm install @sentry/nextjs
npx @sentry/wizard@latest -i nextjs
```

```tsx
// sentry.client.config.ts
import * as Sentry from '@sentry/nextjs';

Sentry.init({
  dsn: process.env.NEXT_PUBLIC_SENTRY_DSN,
  tracesSampleRate: 1.0,
  environment: process.env.VERCEL_ENV || 'development',
});
```

### 6.4 性能监控

```tsx
// app/api/metrics/route.ts
export async function POST(request: Request) {
  const metrics = await request.json();

  // 记录 Web Vitals
  console.log({
    metric: metrics.name,
    value: metrics.value,
    page: metrics.pathname,
  });

  return new Response('OK');
}

// app/layout.tsx
'use client'

import { useReportWebVitals } from 'next/web-vitals'

export function WebVitals() {
  useReportWebVitals((metric) => {
    fetch('/api/metrics', {
      method: 'POST',
      body: JSON.stringify(metric),
    });
  });

  return null;
}
```

---

## 7. Serverless Functions 深度

### 7.1 冷启动优化

**问题**：首次请求慢（500ms - 2s）

**解决方案**：

```tsx
// 减少依赖大小
// ❌ 导入整个库
import _ from 'lodash';

// ✅ 只导入需要的函数
import debounce from 'lodash/debounce';

// 或使用更小的替代品
import { debounce } from 'radash';
```

**预热函数**：

```bash
# 使用 cron job 定期访问
# vercel.json
{
  "crons": [
    {
      "path": "/api/warmup",
      "schedule": "*/5 * * * *"
    }
  ]
}
```

### 7.2 函数配置

```tsx
// app/api/heavy-task/route.ts
export const runtime = 'nodejs';  // 或 'edge'
export const maxDuration = 60;    // Pro 计划可设置为 60s
export const dynamic = 'force-dynamic';
export const revalidate = 0;

export async function GET() {
  // 长时间运行的任务
}
```

**Runtime 选择**：

| 特性 | Node.js Runtime | Edge Runtime |
|------|-----------------|--------------|
| 冷启动 | ~500ms | ~0ms |
| 执行时间 | 10s (Hobby) / 60s (Pro) | 30s |
| 内存 | 1024 MB | 128 MB |
| 适用场景 | 复杂计算、数据库操作 | 简单转发、A/B测试 |

### 7.3 流式响应

对于 AI 应用（如你的 Personal Knowledge Hub）：

```tsx
// app/api/chat/route.ts
export const runtime = 'edge';

export async function POST(req: Request) {
  const { messages } = await req.json();

  const stream = await fetch('https://api.openai.com/v1/chat/completions', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`,
    },
    body: JSON.stringify({
      model: 'gpt-4',
      messages,
      stream: true,
    }),
  });

  return new Response(stream.body, {
    headers: {
      'Content-Type': 'text/event-stream',
    },
  });
}
```

---

## 8. Edge Network 利用

### 8.1 Edge Middleware

在用户请求到达 Serverless Function 之前拦截：

```tsx
// middleware.ts
import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

export function middleware(request: NextRequest) {
  // A/B 测试
  const bucket = Math.random() < 0.5 ? 'a' : 'b';
  const url = request.nextUrl.clone();
  url.pathname = `/experiment/${bucket}${url.pathname}`;

  // 地理位置路由
  const country = request.geo?.country || 'US';
  if (country === 'CN') {
    url.pathname = `/cn${url.pathname}`;
  }

  // 认证
  const token = request.cookies.get('token');
  if (!token && url.pathname.startsWith('/dashboard')) {
    return NextResponse.redirect(new URL('/login', request.url));
  }

  return NextResponse.rewrite(url);
}

export const config = {
  matcher: '/:path*',
};
```

### 8.2 Edge Config

快速全球配置（< 1ms 读取）：

```bash
# 安装
npm install @vercel/edge-config

# 创建 Edge Config（在 Vercel Dashboard）
# 存储配置：{ "featureFlag": true, "maxUsers": 1000 }
```

```tsx
// app/api/feature/route.ts
import { get } from '@vercel/edge-config';

export const runtime = 'edge';

export async function GET() {
  const featureFlag = await get('featureFlag');

  return Response.json({ enabled: featureFlag });
}
```

---

## 🎯 总结：Vercel 使用金字塔

```
                    /\
                   /  \
                  / 高级 \
                 /--------\
                / Edge 功能  \
               /--------------\
              / 性能优化 ISR     \
             /------------------\
            / 环境变量 + 域名配置    \
           /----------------------\
          /  基础部署（Git + Vercel） \
         /--------------------------\
```

**学习路径**：

1. **第1周**：基础部署，理解 Git → Vercel 流程
2. **第2周**：环境变量、域名配置
3. **第3周**：性能优化（ISR、图片优化）
4. **第4周**：高级功能（Edge Functions、Middleware）

---

## 🚀 实战练习

### 项目：Personal Knowledge Hub 优化

1. **部署基础版本**
   - [ ] Git push 到 GitHub
   - [ ] 连接 Vercel
   - [ ] 配置环境变量

2. **性能优化**
   - [ ] 启用 ISR（revalidate: 3600）
   - [ ] 使用 Next.js Image 组件
   - [ ] 运行 Lighthouse，得分 > 90

3. **高级功能**
   - [ ] 添加 Vercel Analytics
   - [ ] 配置 Edge Middleware（认证）
   - [ ] 实现流式 AI 响应

4. **监控**
   - [ ] 集成 Sentry
   - [ ] 设置用量警告
   - [ ] 配置 Uptime 监控

---

**完成这些后，你就掌握了 Vercel 的 80% 功能！** 🎉
