#!/bin/bash

# AI-Workflow-Kit 全局安装脚本
# 将工作流工具添加到系统 PATH

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# 获取 AI-Workflow-Kit 目录
WORKFLOW_KIT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
SCRIPTS_DIR="$WORKFLOW_KIT_DIR/scripts"

echo -e "${BLUE}AI-Workflow-Kit 全局安装${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# 检查 shell 配置文件
SHELL_CONFIG=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
    SHELL_TYPE="zsh"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
    SHELL_TYPE="bash"
elif [ -f "$HOME/.bash_profile" ]; then
    SHELL_CONFIG="$HOME/.bash_profile"
    SHELL_TYPE="bash"
else
    echo -e "${RED}错误: 未找到 shell 配置文件 (.zshrc 或 .bashrc)${NC}"
    exit 1
fi

echo -e "${GREEN}检测到 shell: $SHELL_TYPE${NC}"
echo -e "${GREEN}配置文件: $SHELL_CONFIG${NC}"
echo ""

# 检查是否已安装
MARKER="# AI-Workflow-Kit aliases"
if grep -q "$MARKER" "$SHELL_CONFIG"; then
    echo -e "${YELLOW}检测到已有 AI-Workflow-Kit 配置${NC}"
    read -p "是否覆盖现有配置？(y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "操作已取消"
        exit 0
    fi

    # 删除旧配置
    echo "删除旧配置..."
    # 使用临时文件删除标记行之间的内容
    sed -i.bak "/# AI-Workflow-Kit aliases/,/# End AI-Workflow-Kit/d" "$SHELL_CONFIG"
fi

# 添加别名和函数到 shell 配置
echo -e "${GREEN}添加全局命令...${NC}"

cat >> "$SHELL_CONFIG" << EOF

# AI-Workflow-Kit aliases
export AI_WORKFLOW_KIT_DIR="$WORKFLOW_KIT_DIR"

# 初始化新项目
alias init-ai-project="$SCRIPTS_DIR/init-ai-project.sh"

# 同步工作流文档
alias sync-workflow="$SCRIPTS_DIR/sync-workflow.sh"

# 快速打开工作流文档索引
alias workflow-docs="cat $WORKFLOW_KIT_DIR/docs/INDEX.md"

# 快速查看工作流状态
alias workflow-status="echo 'AI-Workflow-Kit 路径: $WORKFLOW_KIT_DIR' && ls -lh $WORKFLOW_KIT_DIR/docs/"

# End AI-Workflow-Kit
EOF

echo "  ✓ 全局命令已添加到 $SHELL_CONFIG"
echo ""

# 创建符号链接（可选）
echo -e "${BLUE}是否创建符号链接到 /usr/local/bin？${NC}"
echo -e "${YELLOW}(需要 sudo 权限，可选步骤，可直接使用别名)${NC}"
read -p "创建符号链接？(y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -d "/usr/local/bin" ]; then
        echo "创建符号链接..."
        sudo ln -sf "$SCRIPTS_DIR/init-ai-project.sh" /usr/local/bin/init-ai-project
        sudo ln -sf "$SCRIPTS_DIR/sync-workflow.sh" /usr/local/bin/sync-workflow
        echo "  ✓ 符号链接已创建"
    else
        echo -e "${YELLOW}  ! /usr/local/bin 不存在，跳过创建符号链接${NC}"
    fi
fi

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✓ 安装完成！${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "可用命令:"
echo "  • init-ai-project <路径>  - 初始化新项目"
echo "  • sync-workflow           - 同步工作流文档"
echo "  • workflow-docs           - 查看文档索引"
echo "  • workflow-status         - 查看工作流状态"
echo ""
echo "使配置生效:"
echo "  source $SHELL_CONFIG"
echo ""
echo "或重新打开终端"
echo ""
echo -e "${YELLOW}快速测试:${NC}"
echo "  init-ai-project --help"
echo ""
