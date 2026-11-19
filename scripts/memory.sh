#!/bin/bash

echo "===== RAM MONITOR ====="

total=$(free -m | awk '/^Mem:/ {print $2}')
used=$(free -m | awk '/^Mem:/ {print $3}')

usage=$(awk -v used="$used" -v total="$total" 'BEGIN {
    if (total > 0)
        printf "%.2f", (used / total) * 100
    else
        print "0.00"
}')

echo "Total RAM: $total MB"
echo "Used RAM: $used MB"
echo "RAM Usage: $usage%"

if (( $(awk -v usage="$usage" 'BEGIN {print (usage >= 80)}') ))
then
    echo "RAM Status: WARNING"
else
    echo "RAM Status: NORMAL"
fi

echo "======================="
