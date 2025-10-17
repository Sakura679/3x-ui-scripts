### 创建缺失文件（若系统中缺失则使用下方命令）
```
mkdir -p /run/openrc
touch /run/openrc/softlevel
```

### debian系统
上传安装包后安装  将文件上传至 ```/usr/local``` 目录下
```
bash <(curl -Ls https://raw.githubusercontent.com/Sakura679/3x-ui-scripts/refs/heads/main/install_by_tar_gz_file.sh)
```
或
```
VERSION=v2.6.6 && bash <(curl -Ls "https://raw.githubusercontent.com/mhsanaei/3x-ui/$VERSION/install.sh") $VERSION
```

### alpine系统
上传安装包后安装  将文件上传至 ```/usr/local``` 目录下
```
bash <(curl -Ls https://raw.githubusercontent.com/Sakura679/3x-ui-scripts/refs/heads/main/install_for_alpine_by_tar_gz_file.sh)
```
或
```
bash <(curl -Ls https://raw.githubusercontent.com/Sakura679/3x-ui-scripts/refs/heads/main/install_for_alpine.sh)
```

### 如果更新系统卡住，请更换镜像源
```
cat > /etc/apk/repositories <<'EOF'
https://mirrors.aliyun.com/alpine/v3.22/main/
https://mirrors.aliyun.com/alpine/v3.22/community/
EOF
```
