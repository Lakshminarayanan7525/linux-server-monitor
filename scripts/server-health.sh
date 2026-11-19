#!/bin/bash

echo "================================"
echo "Report Generated: $(date '+%Y-%m-%d %H:%M:%S')"
echo "===== SERVER HEALTH REPORT ====="
echo ""

cpu_output=$(./cpu.sh)
memory_output=$(./memory.sh)
disk_output=$(./disk.sh)

echo "$cpu_output"
echo ""
echo "$memory_output"
echo ""
echo "$disk_output"
echo ""

./process.sh
echo ""
./network.sh

echo ""
echo "===== OVERALL SERVER STATUS ====="

if echo "$cpu_output $memory_output $disk_output" | grep -q "WARNING"
then
    echo "SERVER HEALTH: WARNING"
else
    echo "SERVER HEALTH: HEALTHY"
fi

echo ""
echo "===== HEALTH CHECK COMPLETED ====="
