#!/bin/bash

# AI-Workflow-Kit 项目初始化脚本
# 使用方法: init-ai-project <项目完整路径>

set -e  # 遇到错误立即退出

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 获取当前脚本所在目录（AI-Workflow-Kit 目录）
WORKFLOW_KIT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# 显示帮助信息
show_help() {
    echo -e "${BLUE}AI-Workflow-Kit 项目初始化脚本${NC}"
    echo ""
    echo "使用方法:"
    echo "  init-ai-project <项目完整路径>"
    echo ""
    echo "示例:"
    echo "  init-ai-project ~/Desktop/Projects/my-new-project"
    echo "  init-ai-project /Users/username/Documents/awesome-app"
    echo ""
}

# 检查参数
if [ $# -eq 0 ]; then
    echo -e "${RED}错误: 请提供项目路径${NC}"
    show_help
    exit 1
fi

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_help
    exit 0
fi

PROJECT_PATH="$1"
PROJECT_NAME=$(basename "$PROJECT_PATH")

# 检查目标路径是否已存在
if [ -d "$PROJECT_PATH" ]; then
    echo -e "${YELLOW}警告: 目录 $PROJECT_PATH 已存在${NC}"
    read -p "是否继续初始化该项目？(y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "操作已取消"
        exit 0
    fi
else
    echo -e "${BLUE}创建项目目录: $PROJECT_PATH${NC}"
    mkdir -p "$PROJECT_PATH"
fi

cd "$PROJECT_PATH"

echo -e "${BLUE}开始初始化 AI 工作流...${NC}"

# 1. 复制文档
echo -e "${GREEN}[1/5] 复制工作流文档...${NC}"
if [ -d "$WORKFLOW_KIT_DIR/docs" ]; then
    cp -r "$WORKFLOW_KIT_DIR/docs" ./
    echo "  ✓ 文档已复制"
else
    echo -e "${YELLOW}  ! 未找到 docs 文件夹${NC}"
fi

# 2. 复制 .claude 配置
echo -e "${GREEN}[2/5] 配置 Claude Code...${NC}"
mkdir -p .claude

# 复制 settings.json
if [ -f "$WORKFLOW_KIT_DIR/templates/.claude/settings.json" ]; then
    cp "$WORKFLOW_KIT_DIR/templates/.claude/settings.json" .claude/
    echo "  ✓ settings.json 已复制"
elif [ -f "$WORKFLOW_KIT_DIR/.claude/settings.json" ]; then
    cp "$WORKFLOW_KIT_DIR/.claude/settings.json" .claude/
    echo "  ✓ settings.json 已复制"
fi

# 生成适配当前项目的 settings.local.json
cat > .claude/settings.local.json << EOF
{
  "permissions": {
    "allow": [
      "Read(//$PROJECT_PATH/**)",
      "Bash(git add:*)",
      "Bash(git commit:*)",
      "Read(//$(dirname "$PROJECT_PATH")/.claude/**)"
    ],
    "deny": [],
    "ask": []
  }
}
EOF
echo "  ✓ settings.local.json 已生成（已适配项目路径）"

# 3. 初始化 Git（可选）
echo -e "${GREEN}[3/5] Git 配置...${NC}"
if [ ! -d ".git" ]; then
    read -p "是否初始化 Git 仓库？(y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git init

        # 创建 .gitignore
        cat > .gitignore << 'EOF'
# 依赖
node_modules/
venv/
__pycache__/
*.pyc

# 环境变量
.env
.env.local
.env.*.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# 系统文件
.DS_Store
Thumbs.db

# 日志
*.log
logs/

# 构建产物
dist/
build/
*.egg-info/
EOF
        echo "  ✓ Git 仓库已初始化"
        echo "  ✓ .gitignore 已创建"
    fi
else
    echo "  • Git 仓库已存在，跳过初始化"
fi

# 4. 创建项目 README
echo -e "${GREEN}[4/5] 创建项目文档...${NC}"
if [ ! -f "README.md" ]; then
    cat > README.md << EOF
# $PROJECT_NAME

## 项目描述
[在此添加项目描述]

## 开发环境设置

本项目已集成 AI-Workflow-Kit，使用 Claude Code 进行高效开发。

### 快速开始

1. 打开项目文件夹
2. 启动 Claude Code
3. 查看工作流文档：\`docs/\` 文件夹

### 工作流文档

- **方法论**: \`docs/methodology/\` - AI 产品开发框架和 BMAD Method
- **工具配置**: \`docs/tools/\` - Claude Code 设置指南
- **高级技术**: \`docs/advanced/\` - Self-Evolving Agents 等
- **部署工具**: \`docs/deployment/\` - Vercel 部署指南
- **自动化**: \`docs/automation/\` - n8n 工作流自动化

查看完整文档索引：[docs/INDEX.md](docs/INDEX.md)

## 技术栈
[在此添加技术栈]

## 项目结构
\`\`\`
$PROJECT_NAME/
├── docs/           # AI 工作流文档
├── .claude/        # Claude Code 配置
└── README.md       # 项目说明
\`\`\`

## 开发指南
[在此添加开发指南]

---

本项目使用 [AI-Workflow-Kit](https://github.com/yourusername/AI-Workflow-Kit) 工作流
EOF
    echo "  ✓ README.md 已创建"
else
    echo "  • README.md 已存在，跳过创建"
fi

# 5. 显示总结
echo -e "${GREEN}[5/5] 初始化完成！${NC}"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✓ 项目已成功初始化: $PROJECT_NAME${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "已复制的内容:"
echo "  • 工作流文档 → docs/"
echo "  • Claude Code 配置 → .claude/"
echo "  • 项目 README → README.md"
echo ""
echo "下一步:"
echo "  1. cd $PROJECT_PATH"
echo "  2. 启动 Claude Code"
echo "  3. 查看工作流文档: cat docs/INDEX.md"
echo ""
echo -e "${YELLOW}提示: 工作流文档会随着主仓库更新，可使用 sync-workflow.sh 同步最新版本${NC}"
echo ""
