#!/bin/bash

echo "===== CPU MONITOR ====="

read_cpu() {
    read -r cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat

    echo $((user + nice + system + idle + iowait + irq + softirq + steal)) $((idle + iowait))
}

read total1 idle1 < <(read_cpu)

sleep 1

read total2 idle2 < <(read_cpu)

total_diff=$((total2 - total1))
idle_diff=$((idle2 - idle1))

cpu_usage=$(awk -v total="$total_diff" -v idle="$idle_diff" 'BEGIN {
    if (total > 0)
        printf "%.2f", (total - idle) * 100 / total
    else
        print "0.00"
}')

echo "CPU Usage: $cpu_usage%"

if (( $(awk -v usage="$cpu_usage" 'BEGIN {print (usage >= 80)}') ))
then
    echo "CPU Status: WARNING"
else
    echo "CPU Status: NORMAL"
fi

echo "======================="
