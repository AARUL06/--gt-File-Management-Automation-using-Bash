#!/bin/bash

threshold=90  

# Monitor CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk -F',' '{print $1}' | awk '{print $2}' | cut -d. -f1)

# Debugging output 
echo "Current CPU Usage: $cpu_usage%"

# Check if CPU usage exceeds threshold
if [ "$cpu_usage" -gt "$threshold" ]; then
    echo "High CPU usage detected! Current usage: $cpu_usage%, exceeds threshold: $threshold%" | mail -s "CPU Usage Alert" root@localhost
fi
