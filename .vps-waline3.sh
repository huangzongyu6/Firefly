#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
echo "===== 娣诲姞 NodeSource 22 婧?====="
curl -fsSL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource.sh
bash /tmp/nodesource.sh >/dev/null 2>&1 || true
apt-get install -y -qq nodejs >/dev/null 2>&1
echo "node: $(node -v) | npm: $(npm -v)"

echo "===== 閲嶈渚濊禆锛堟崲 Node 鐗堟湰鍚庨噸瑁呮洿绋筹級====="
cd /opt/waline
rm -rf node_modules package-lock.json
npm i @waline/vercel@latest --no-audit --no-fund 2>&1 | tail -2

echo "===== 閲嶅惎鏈嶅姟 ====="
systemctl restart waline
sleep 5
systemctl is-active waline || true
echo "--- 绔彛 ---"
ss -tlnp | grep 8360 || echo "8360 鏈洃鍚?
echo "--- 娴嬭瘯 ---"
curl -s -o /dev/null -w 'root: %{http_code}\n' http://127.0.0.1:8360/ || true
curl -s -o /dev/null -w 'api:  %{http_code}\n' 'http://127.0.0.1:8360/api/comment?path=/&pageSize=1' || true
