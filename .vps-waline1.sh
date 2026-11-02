#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "===== 瀹夎 Node.js ====="
apt-get update -qq
apt-get install -y -qq nodejs npm >/dev/null 2>&1
node -v
npm -v

echo "===== 鍒涘缓 Waline 鐩綍 ====="
mkdir -p /opt/waline/data
cd /opt/waline
[ -f package.json ] || npm init -y >/dev/null 2>&1
npm i @waline/vercel@latest --no-audit --no-fund 2>&1 | tail -3

echo "===== 鍖呭叆鍙ｄ俊鎭?====="
node -e "const p=require('/opt/waline/node_modules/@waline/vercel/package.json'); console.log('version:',p.version); console.log('main:',p.main); console.log('exports:',JSON.stringify(p.exports)); console.log('files:',JSON.stringify(p.files).slice(0,200))"
ls /opt/waline/node_modules/@waline/vercel | head -20
