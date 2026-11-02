#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "===== 纾佺洏 ====="
df -h / | tail -1

echo "===== 瀹夎 Docker ====="
apt-get install -y -qq docker.io >/dev/null 2>&1
systemctl enable docker >/dev/null 2>&1
systemctl start docker
docker --version

echo "===== 鍋滄帀 Node 鐗?====="
systemctl stop waline 2>/dev/null || true
systemctl disable waline 2>/dev/null || true

echo "===== 娓呯悊鏃ф暟鎹?====="
rm -rf /opt/waline/data
mkdir -p /opt/waline/data

echo "===== 鎷夊彇骞跺惎鍔?Waline 瀹瑰櫒 ====="
docker rm -f waline 2>/dev/null || true
docker pull lizheming/waline:latest 2>&1 | tail -2
docker run -d --name waline \
  --restart unless-stopped \
  -p 127.0.0.1:8360:8360 \
  -v /opt/waline/data:/app/data \
  -e SQLITE_PATH=/app/data \
  -e SITE_NAME="Craig鐨勫崥瀹? \
  -e SITE_URL="https://www.huangzong.xyz" \
  -e SECURE_DOMAINS="www.huangzong.xyz,huangzong.xyz" \
  -e DISABLE_USERAGENT=true \
  -e DISABLE_REGION=true \
  lizheming/waline:latest

sleep 8
echo "===== 鐘舵€?====="
docker ps --filter name=waline --format '{{.Status}}'
ls -la /opt/waline/data | head -5
echo "===== 娴嬭瘯 ====="
curl -sk -o /dev/null -w 'api: %{http_code}\n' -H 'Host: www.huangzong.xyz' -H 'Referer: https://www.huangzong.xyz/' 'https://127.0.0.1/comments/api/comment?path=/&pageSize=1'
