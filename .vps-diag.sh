#!/bin/bash
echo "===== 瀹瑰櫒鐘舵€?====="
docker ps -a --filter name=waline --format '{{.Names}} | {{.Status}} | {{.Ports}}'
echo "===== 绔彛 ====="
ss -tlnp | grep 8360 || echo "8360 鏈洃鍚?
echo "===== 瀹瑰櫒鍐呮祴璇?====="
curl -s -o /dev/null -w 'container: %{http_code}\n' -H 'Referer: https://comments.huangzong.xyz/' 'http://127.0.0.1:8360/api/comment?path=/&pageSize=1'
echo "===== 瀹瑰櫒鏃ュ織 ====="
docker logs --tail 20 waline 2>&1 | tail -15
echo "===== nginx 閿欒鏃ュ織 ====="
tail -5 /var/log/nginx/error.log
