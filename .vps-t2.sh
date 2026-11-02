#!/bin/bash
docker exec waline node -e "const D=require('/app/node_modules/better-sqlite3');const db=new D('/app/data/waline.sqlite');const u=db.prepare('SELECT id,display_name,email,type,createdAt FROM wl_Users').all();console.log(JSON.stringify(u,null,1))"
