#!/bin/bash
set -e
echo "===== 1. 鍋滄骞舵竻鐞?====="
docker rm -f waline 2>/dev/null || true
rm -f /opt/waline/data/waline.sqlite

echo "===== 2. 涓嬭浇棰勭疆鏁版嵁搴?====="
curl -fsSL -o /opt/waline/data/waline.sqlite https://raw.githubusercontent.com/walinejs/waline/main/assets/waline.sqlite
chmod 666 /opt/waline/data/waline.sqlite
ls -la /opt/waline/data/

echo "===== 3. 鐢熸垚 JWT 瀵嗛挜骞跺惎鍔?====="
JWT=$(head -c 32 /dev/urandom | od -An -tx1 | tr -d ' \n')
echo "JWT_TOKEN=$JWT" > /opt/waline/jwt.env
docker run -d --name waline \
  --restart unless-stopped \
  -p 127.0.0.1:8360:8360 \
  -v /opt/waline/data:/app/data \
  -e SQLITE_PATH=/app/data \
  -e JWT_TOKEN="$JWT" \
  -e SITE_URL=https://www.huangzong.xyz \
  -e SECURE_DOMAINS=www.huangzong.xyz,huangzong.xyz \
  -e DISABLE_USERAGENT=true \
  -e DISABLE_REGION=true \
  lizheming/waline:latest

sleep 12
echo "===== 4. 娴嬭瘯 ====="
curl -s -o /dev/null -w 'direct api: %{http_code}\n' -H 'Referer: https://www.huangzong.xyz/' 'http://127.0.0.1:8360/api/comment?path=/&pageSize=1'
curl -sk -o /dev/null -w 'nginx  api: %{http_code}\n' -H 'Host: www.huangzong.xyz' -H 'Referer: https://www.huangzong.xyz/' 'https://127.0.0.1/comments/api/comment?path=/&pageSize=1'
echo "--- 杩斿洖鍐呭 ---"
curl -sk -H 'Host: www.huangzong.xyz' -H 'Referer: https://www.huangzong.xyz/' 'https://127.0.0.1/comments/api/comment?path=/&pageSize=1' | head -c 150
echo
