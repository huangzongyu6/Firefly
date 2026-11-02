#!/bin/bash
set -e
D=/var/www/huangzong/comments-assets
mkdir -p "$D"
echo "===== 涓嬭浇 Waline 瀹㈡埛绔?====="
curl -fsSL -o "$D/waline.js" https://unpkg.com/@waline/client@v3/dist/waline.js
curl -fsSL -o "$D/waline.css" https://unpkg.com/@waline/client@v3/dist/waline.css
ls -la "$D"
echo "===== 鏉冮檺 ====="
chown -R www-data:www-data /var/www/huangzong
