#!/bin/bash
docker rm -f waline 2>/dev/null || true
rm -rf /opt/waline/data
mkdir -p /opt/waline/data

docker run -d --name waline \
  --restart unless-stopped \
  -p 127.0.0.1:8360:8360 \
  -v /opt/waline/data:/app/data \
  -e SQLITE_PATH=/app/data \
  -e SITE_URL=https://www.huangzong.xyz \
  -e SECURE_DOMAINS=www.huangzong.xyz,huangzong.xyz \
  -e DISABLE_USERAGENT=true \
  -e DISABLE_REGION=true \
  lizheming/waline:latest

sleep 12
echo "===== 瀹瑰櫒鐘舵€?====="
docker ps -a --filter name=waline
echo "===== 鏃ュ織 ====="
docker logs --tail 15 waline 2>&1
echo "===== 鏁版嵁鐩綍 ====="
ls -la /opt/waline/data | head -5
echo "===== 鎺ュ彛娴嬭瘯 ====="
curl -s -o /dev/null -w 'direct=%{http_code}\n' -H 'Referer: https://www.huangzong.xyz/' 'http://127.0.0.1:8360/api/comment?path=/&pageSize=1'
curl -sk -o /dev/null -w 'nginx=%{http_code}\n' -H 'Host: www.huangzong.xyz' -H 'Referer: https://www.huangzong.xyz/' 'https://127.0.0.1/comments/api/comment?path=/&pageSize=1'
