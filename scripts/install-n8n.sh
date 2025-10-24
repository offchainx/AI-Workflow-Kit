#!/bin/bash

# 🚀 n8n 一键安装脚本
# 支持 Docker Compose 生产级部署
# 作者：Claude Code
# 日期：2025-10-24

set -e  # 遇到错误立即退出

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}🚀 n8n 自动化安装向导${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# 检查命令是否存在
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${RED}❌ $1 未安装${NC}"
        echo -e "   请先安装: $2"
        return 1
    else
        echo -e "${GREEN}✅ $1 已安装${NC}"
        return 0
    fi
}

# 步骤 1：环境检查
echo -e "${YELLOW}📋 步骤 1/6：环境检查${NC}"
echo "----------------------------"

all_deps_ok=true

if ! check_command "docker" "curl -fsSL https://get.docker.com | sh"; then
    all_deps_ok=false
fi

if ! check_command "docker-compose" "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose"; then
    all_deps_ok=false
fi

if [ "$all_deps_ok" = false ]; then
    echo -e "${RED}请先安装缺失的依赖${NC}"
    exit 1
fi

echo ""

# 步骤 2：创建安装目录
echo -e "${YELLOW}📁 步骤 2/6：创建安装目录${NC}"
echo "----------------------------"

read -p "安装目录 [默认: ~/n8n]: " INSTALL_DIR
INSTALL_DIR=${INSTALL_DIR:-~/n8n}
INSTALL_DIR=$(eval echo $INSTALL_DIR)  # 展开 ~

mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

echo -e "${GREEN}✅ 安装目录: $INSTALL_DIR${NC}"
echo ""

# 步骤 3：配置参数
echo -e "${YELLOW}⚙️  步骤 3/6：配置参数${NC}"
echo "----------------------------"

read -p "域名（如: n8n.yourdomain.com）: " DOMAIN
if [ -z "$DOMAIN" ]; then
    DOMAIN="localhost"
fi

read -p "管理员用户名 [默认: admin]: " ADMIN_USER
ADMIN_USER=${ADMIN_USER:-admin}

read -sp "管理员密码: " ADMIN_PASSWORD
echo ""
if [ -z "$ADMIN_PASSWORD" ]; then
    ADMIN_PASSWORD=$(openssl rand -base64 16)
    echo -e "${YELLOW}⚠️  自动生成密码: $ADMIN_PASSWORD${NC}"
fi

echo -e "${GREEN}✅ 配置完成${NC}"
echo ""

# 步骤 4：生成配置文件
echo -e "${YELLOW}📝 步骤 4/6：生成配置文件${NC}"
echo "----------------------------"

# 生成环境变量
cat > .env << EOF
# n8n 配置
DOMAIN=$DOMAIN
ADMIN_USER=$ADMIN_USER
ADMIN_PASSWORD=$ADMIN_PASSWORD

# 数据库
DB_PASSWORD=$(openssl rand -base64 32)

# 安全密钥（32字符）
ENCRYPTION_KEY=$(openssl rand -hex 32)

# 时区
TIMEZONE=Asia/Shanghai
EOF

echo -e "${GREEN}✅ .env 文件已创建${NC}"

# 生成 docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  postgres:
    image: postgres:15-alpine
    restart: unless-stopped
    environment:
      POSTGRES_DB: n8n
      POSTGRES_USER: n8n
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ['CMD-SHELL', 'pg_isready -U n8n']
      interval: 5s
      timeout: 5s
      retries: 10
    networks:
      - n8n-network

  n8n:
    image: docker.n8n.io/n8nio/n8n:latest
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      # 数据库
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=${DB_PASSWORD}

      # 基础配置
      - N8N_HOST=${DOMAIN}
      - N8N_PORT=5678
      - N8N_PROTOCOL=https
      - N8N_ENCRYPTION_KEY=${ENCRYPTION_KEY}

      # 认证
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${ADMIN_USER}
      - N8N_BASIC_AUTH_PASSWORD=${ADMIN_PASSWORD}

      # 执行配置
      - EXECUTIONS_DATA_SAVE_ON_ERROR=all
      - EXECUTIONS_DATA_SAVE_ON_SUCCESS=all
      - EXECUTIONS_DATA_MAX_AGE=336

      # Webhook
      - WEBHOOK_URL=https://${DOMAIN}/

      # 时区
      - GENERIC_TIMEZONE=${TIMEZONE}

      # 日志
      - N8N_LOG_LEVEL=info

    volumes:
      - n8n_data:/home/node/.n8n
    depends_on:
      postgres:
        condition: service_healthy
    networks:
      - n8n-network

volumes:
  postgres_data:
  n8n_data:

networks:
  n8n-network:
    driver: bridge
EOF

echo -e "${GREEN}✅ docker-compose.yml 文件已创建${NC}"

# 创建备份脚本
cat > backup-n8n.sh << 'BACKUP_SCRIPT'
#!/bin/bash
BACKUP_DIR="./backups"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BACKUP_DIR"

echo "开始备份 n8n..."

# 备份数据库
docker-compose exec -T postgres pg_dump -U n8n n8n | gzip > "$BACKUP_DIR/db-$DATE.sql.gz"

# 备份工作流
docker cp n8n_n8n_1:/home/node/.n8n/workflows "$BACKUP_DIR/workflows-$DATE"
tar -czf "$BACKUP_DIR/workflows-$DATE.tar.gz" "$BACKUP_DIR/workflows-$DATE"
rm -rf "$BACKUP_DIR/workflows-$DATE"

# 清理30天前的备份
find "$BACKUP_DIR" -name "*.gz" -mtime +30 -delete

echo "备份完成: $BACKUP_DIR"
ls -lh "$BACKUP_DIR"
BACKUP_SCRIPT

chmod +x backup-n8n.sh

echo -e "${GREEN}✅ backup-n8n.sh 脚本已创建${NC}"
echo ""

# 步骤 5：启动服务
echo -e "${YELLOW}🚀 步骤 5/6：启动服务${NC}"
echo "----------------------------"

docker-compose pull
docker-compose up -d

echo -e "${GREEN}✅ n8n 服务已启动${NC}"
echo ""

# 步骤 6：验证安装
echo -e "${YELLOW}🔍 步骤 6/6：验证安装${NC}"
echo "----------------------------"

echo "等待服务启动..."
sleep 10

if docker-compose ps | grep -q "Up"; then
    echo -e "${GREEN}✅ 服务运行正常${NC}"
else
    echo -e "${RED}❌ 服务启动失败${NC}"
    echo "查看日志: docker-compose logs -f"
    exit 1
fi

# 完成
echo ""
echo -e "${BLUE}================================${NC}"
echo -e "${GREEN}✅ n8n 安装完成！${NC}"
echo -e "${BLUE}================================${NC}"
echo ""
echo -e "${YELLOW}📝 访问信息：${NC}"
echo -e "   URL: http://localhost:5678"
if [ "$DOMAIN" != "localhost" ]; then
    echo -e "   生产URL: https://$DOMAIN"
fi
echo -e "   用户名: $ADMIN_USER"
echo -e "   密码: $ADMIN_PASSWORD"
echo ""
echo -e "${YELLOW}🔧 常用命令：${NC}"
echo -e "   查看日志: docker-compose logs -f n8n"
echo -e "   重启服务: docker-compose restart"
echo -e "   停止服务: docker-compose down"
echo -e "   备份数据: ./backup-n8n.sh"
echo ""
echo -e "${YELLOW}📚 下一步：${NC}"
echo -e "   1. 配置 SSL（使用 Nginx + Let's Encrypt）"
echo -e "   2. 导入工作流模板"
echo -e "   3. 设置定时备份"
echo ""
echo -e "${GREEN}🎉 开始自动化你的工作吧！${NC}"
