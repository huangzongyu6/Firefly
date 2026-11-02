#!/bin/bash
echo "--- 鍚?CREATE TABLE 鐨勬枃浠?---"
grep -rln 'CREATE TABLE' /opt/waline/node_modules/@waline/vercel/src 2>/dev/null | head -5
echo "--- .sql 鏂囦欢 ---"
find /opt/waline/node_modules/@waline/vercel -name '*.sql' 2>/dev/null | head -5
echo "--- package scripts ---"
node -e "const p=require('/opt/waline/node_modules/@waline/vercel/package.json'); console.log(JSON.stringify(p.scripts))"
echo "--- 鐩綍 ---"
ls /opt/waline/node_modules/@waline/vercel
echo "--- src 鐩綍 ---"
ls /opt/waline/node_modules/@waline/vercel/src
