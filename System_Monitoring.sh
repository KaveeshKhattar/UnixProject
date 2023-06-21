#!/bin/bash

# Get CPU usage percentage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get Memory usage percentage
memory_usage=$(free | awk '/Mem/ {print $3/$2 * 100.0}')

# Get disk usage percentage of root directory
disk_usage=$(df -h | awk '$NF=="/"{print $5}' | sed 's/%//')

# Print system status
echo "CPU Usage: $cpu_usage%"
echo "Memory Usage: $memory_usage%"
echo "Disk Usage: $disk_usage%"