#!/bin/bash
echo "--- 鍚?wl_Comment 鐨勬枃浠?---"
grep -rln 'wl_Comment' /opt/waline/node_modules/@waline /opt/waline/node_modules/think-model* 2>/dev/null | head -8
echo "--- 鍚?createTable/sync 鐨勬枃浠?---"
grep -rln 'createTable\|ensureTable\|autoCreate' /opt/waline/node_modules/@waline/vercel/src 2>/dev/null | head -8
echo "--- think-model-sqlite 鐩綍 ---"
ls /opt/waline/node_modules/think-model-sqlite/lib 2>/dev/null
