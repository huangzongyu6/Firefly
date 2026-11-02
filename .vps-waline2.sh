#!/bin/bash
set -e

echo "===== 1. 鍚姩鍖呰鍣?====="
cat > /opt/waline/server.js <<'EOF'
const http = require('node:http');
const handler = require('/opt/waline/node_modules/@waline/vercel')({ env: 'production' });
const port = Number(process.env.PORT || 8360);
http.createServer((req, res) => {
  handler(req, res);
}).listen(port, '127.0.0.1', () => {
  console.log('waline listening on 127.0.0.1:' + port);
});
EOF

echo "===== 2. 鐜鍙橀噺 ====="
cat > /opt/waline/.env <<'EOF'
SQLITE_PATH=/opt/waline/data/waline.sqlite
SITE_NAME=Craig鐨勫崥瀹?SITE_URL=https://www.huangzong.xyz
SECURE_DOMAINS=www.huangzong.xyz,huangzong.xyz
DISABLE_USERAGENT=true
DISABLE_REGION=true
EMAIL_NOTIFY=false
EOF

echo "===== 3. systemd 鏈嶅姟 ====="
cat > /etc/systemd/system/waline.service <<'EOF'
[Unit]
Description=Waline comment server
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/waline
EnvironmentFile=/opt/waline/.env
ExecStart=/usr/bin/node /opt/waline/server.js
Restart=always
RestartSec=3
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable waline >/dev/null 2>&1
systemctl restart waline
sleep 3
systemctl is-active waline
echo "--- 鏈湴娴嬭瘯 ---"
curl -s -o /dev/null -w 'root: %{http_code}\n' http://127.0.0.1:8360/
curl -s -o /dev/null -w 'api:  %{http_code}\n' http://127.0.0.1:8360/api/comment?path=/&pageSize=1
echo "--- 鏃ュ織 ---"
journalctl -u waline -n 5 --no-pager
