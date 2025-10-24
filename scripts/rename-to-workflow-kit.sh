#!/bin/bash

# 重命名项目为 AI-Workflow-Kit 的脚本

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}重命名项目为 AI-Workflow-Kit${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# 获取当前项目目录
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CURRENT_NAME="$(basename "$CURRENT_DIR")"
PARENT_DIR="$(dirname "$CURRENT_DIR")"
NEW_NAME="AI-Workflow-Kit"
NEW_PATH="$PARENT_DIR/$NEW_NAME"

echo -e "${YELLOW}当前项目路径: $CURRENT_DIR${NC}"
echo -e "${YELLOW}新项目路径: $NEW_PATH${NC}"
echo ""

# 检查新路径是否已存在
if [ -d "$NEW_PATH" ] && [ "$CURRENT_DIR" != "$NEW_PATH" ]; then
    echo -e "${RED}错误: 目标路径已存在: $NEW_PATH${NC}"
    exit 1
fi

if [ "$CURRENT_NAME" == "$NEW_NAME" ]; then
    echo -e "${GREEN}✓ 项目已经是正确的名称: $NEW_NAME${NC}"
    exit 0
fi

echo -e "${BLUE}步骤 1/3: 更新 Git 远程 URL${NC}"
echo ""
echo -e "${YELLOW}请先在 GitHub 上重命名仓库:${NC}"
echo "  1. 访问: https://github.com/offchainx/Adaptive_learning_v1.0/settings"
echo "  2. 在 Repository name 中输入: AI-Workflow-Kit"
echo "  3. 点击 Rename 按钮"
echo ""
read -p "已完成 GitHub 仓库重命名？(y/n) " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}操作已取消。请先在 GitHub 上重命名仓库后再运行此脚本。${NC}"
    exit 0
fi

# 更新 git 远程 URL
echo -e "${GREEN}更新 Git 远程 URL...${NC}"
cd "$CURRENT_DIR"
git remote set-url origin https://github.com/offchainx/AI-Workflow-Kit.git
echo -e "${GREEN}✓ Git 远程 URL 已更新${NC}"
echo ""

echo -e "${BLUE}步骤 2/3: 重命名本地文件夹${NC}"
cd "$PARENT_DIR"
echo -e "${GREEN}重命名: $CURRENT_NAME → $NEW_NAME${NC}"
mv "$CURRENT_DIR" "$NEW_PATH"
echo -e "${GREEN}✓ 本地文件夹已重命名${NC}"
echo ""

echo -e "${BLUE}步骤 3/3: 验证更改${NC}"
cd "$NEW_PATH"
echo -e "${GREEN}新项目路径: $(pwd)${NC}"
echo -e "${GREEN}Git 远程 URL: $(git remote get-url origin)${NC}"
echo ""

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✓ 重命名完成！${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "项目已成功重命名为: $NEW_NAME"
echo "新路径: $NEW_PATH"
echo ""
echo -e "${YELLOW}下一步:${NC}"
echo "  cd $NEW_PATH"
echo "  git pull  # 验证连接"
echo ""
echo -e "${YELLOW}如果安装了全局命令，请重新运行:${NC}"
echo "  cd $NEW_PATH"
echo "  ./scripts/install.sh"
echo ""
