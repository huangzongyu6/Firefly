#!/bin/bash
echo "--- 娉ㄥ唽鎺ュ彛锛堢┖鏁版嵁锛屽簲杩斿洖瀛楁閿欒鑰岄潪 502锛?--"
curl -s -o /tmp/u.txt -w 'status=%{http_code}\n' -X POST \
  -H 'Content-Type: application/json' \
  -H 'Referer: https://comments.huangzong.xyz/' \
  -d '{"nick":"","email":"","password":""}' \
  'https://comments.huangzong.xyz/api/user'
head -c 200 /tmp/u.txt
echo
echo "--- 鐢ㄦ埛鏁?---"
docker exec waline node /app/check-users.js 2>/dev/null || \
docker exec waline node -e "const D=require('/app/node_modules/better-sqlite3');const db=new D('/app/data/waline.sqlite');console.log('users='+db.prepare('SELECT COUNT(*) c FROM wl_Users').get().c)"
