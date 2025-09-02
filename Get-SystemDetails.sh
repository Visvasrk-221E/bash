#!/bin/bash
# Get-SystemDetails.sh

echo "=== System Information ==="
uname -a

echo -e "\n=== OS Release Info ==="
cat /etc/os-release

echo -e "\n=== CPU Info ==="
grep -E "model name|cpu MHz|vendor_id" /proc/cpuinfo

echo -e "\n=== Memory Info ==="
grep -E "MemTotal|MemFree|MemAvailable" /proc/meminfo

echo -e "\n=== Disk Usage ==="
df -h

echo -e "\n=== Network Interfaces ==="
ip addr show

echo -e "\n=== Uptime ==="
uptime

echo -e "\n=== Logged-in Users ==="
who
