p = '/etc/nginx/sites-enabled/huangzong.conf'
s = open(p, encoding='utf-8').read()
block = '''    location ^~ /comments/ {
        proxy_pass http://127.0.0.1:8360/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        client_max_body_size 10m;
    }

'''
if '/comments/' in s:
    print('comments location exists')
else:
    i = s.find('    location / {')
    assert i != -1, 'location / not found'
    s = s[:i] + block + s[i:]
    open(p, 'w', encoding='utf-8').write(s)
    print('inserted comments location')
