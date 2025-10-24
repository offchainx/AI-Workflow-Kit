#!/bin/bash

# AI-Workflow-Kit 工作流同步脚本
# 从主仓库同步最新的工作流文档

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# 默认的 AI-Workflow-Kit 路径
DEFAULT_WORKFLOW_KIT_DIR="/Users/victorsim/Desktop/Projects/AI-Workflow-Kit"

# 显示帮助信息
show_help() {
    echo -e "${BLUE}AI-Workflow-Kit 工作流同步脚本${NC}"
    echo ""
    echo "使用方法:"
    echo "  sync-workflow.sh [选项]"
    echo ""
    echo "选项:"
    echo "  -s, --source <路径>    指定 AI-Workflow-Kit 源路径（默认: $DEFAULT_WORKFLOW_KIT_DIR）"
    echo "  -h, --help            显示帮助信息"
    echo ""
    echo "示例:"
    echo "  sync-workflow.sh"
    echo "  sync-workflow.sh -s ~/Documents/AI-Workflow-Kit"
    echo ""
}

# 解析参数
WORKFLOW_KIT_DIR="$DEFAULT_WORKFLOW_KIT_DIR"

while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--source)
            WORKFLOW_KIT_DIR="$2"
            shift 2
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo -e "${RED}未知参数: $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

# 检查是否在项目根目录
if [ ! -d ".claude" ]; then
    echo -e "${RED}错误: 请在项目根目录运行此脚本（包含 .claude 文件夹）${NC}"
    exit 1
fi

# 检查 AI-Workflow-Kit 路径是否存在
if [ ! -d "$WORKFLOW_KIT_DIR" ]; then
    echo -e "${RED}错误: AI-Workflow-Kit 路径不存在: $WORKFLOW_KIT_DIR${NC}"
    echo -e "${YELLOW}提示: 使用 -s 参数指定正确的路径${NC}"
    exit 1
fi

if [ ! -d "$WORKFLOW_KIT_DIR/docs" ]; then
    echo -e "${RED}错误: 源路径中未找到 docs 文件夹: $WORKFLOW_KIT_DIR${NC}"
    exit 1
fi

echo -e "${BLUE}开始同步工作流文档...${NC}"
echo -e "${BLUE}源路径: $WORKFLOW_KIT_DIR${NC}"
echo ""

# 创建备份
BACKUP_DIR=".workflow_backup_$(date +%Y%m%d_%H%M%S)"
if [ -d "docs" ]; then
    echo -e "${YELLOW}创建备份: $BACKUP_DIR${NC}"
    cp -r docs "$BACKUP_DIR"
fi

# 统计更新信息
UPDATED_FILES=0
NEW_FILES=0
UNCHANGED_FILES=0

# 同步文档
echo -e "${GREEN}同步文档...${NC}"

# 确保 docs 目录存在
mkdir -p docs

# 使用 rsync 同步（如果可用），否则使用 cp
if command -v rsync &> /dev/null; then
    # 使用 rsync 进行智能同步
    rsync -av --itemize-changes "$WORKFLOW_KIT_DIR/docs/" docs/ | while read line; do
        if [[ $line =~ ^">" ]]; then
            filename=$(echo "$line" | awk '{print $2}')
            if [[ $line =~ ^">f+" ]]; then
                echo "  ➕ 新增: $filename"
                ((NEW_FILES++))
            elif [[ $line =~ ^">f.st" ]] || [[ $line =~ ^">f..t" ]]; then
                echo "  📝 更新: $filename"
                ((UPDATED_FILES++))
            fi
        fi
    done
else
    # 使用 cp 进行复制
    echo "  使用 cp 命令同步（建议安装 rsync 以获得更好的体验）"
    cp -rv "$WORKFLOW_KIT_DIR/docs/"* docs/
fi

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✓ 工作流文档同步完成${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# 显示统计信息
if [ -d "$BACKUP_DIR" ]; then
    echo "备份位置: $BACKUP_DIR"
fi

echo ""
echo "下一步:"
echo "  1. 查看更新内容: git diff docs/"
echo "  2. 如需恢复备份: mv $BACKUP_DIR docs"
echo "  3. 如满意更新: rm -rf $BACKUP_DIR"
echo ""
echo -e "${YELLOW}提示: 备份会保留原有文档，可安全删除${NC}"
echo ""
