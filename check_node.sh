#!/bin/bash
# 3x-ui / xray Shadowsocks 节点一键诊断脚本

PORT=${1:-12345}   # 传参指定端口，不传默认 12345

echo ">>> 检查 xray/sing-box 进程"
ps -ef | grep -E "xray|sing-box" | grep -v grep

echo -e "\n>>> 检查端口监听 (PORT=$PORT)"
ss -tulnp | grep $PORT || echo "⚠️ 未发现端口 $PORT 的监听"

echo -e "\n>>> 检查防火墙规则"
if command -v ufw >/dev/null 2>&1; then
    ufw status | grep $PORT || echo "未在 ufw 中发现端口 $PORT"
fi

if command -v iptables >/dev/null 2>&1; then
    iptables -L -n | grep $PORT || echo "未在 iptables 中发现端口 $PORT"
fi

echo -e "\n>>> 外网连通性测试 (如 curl 未安装请先 apt/yum 安装)"
curl -I --connect-timeout 5 telnet://$(curl -s ifconfig.me):$PORT || echo "⚠️ 无法从本机测试外网连通性"
