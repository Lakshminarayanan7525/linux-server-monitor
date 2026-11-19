#!/bin/bash

echo "===== DISK MONITOR ====="

disk_usage=$(df -hP / | awk 'NR==2 {print $5}' | tr -d '%')

df -hP / | awk 'NR==2 {
    print "Total Disk: " $2
    print "Used Disk: " $3
    print "Available Disk: " $4
    print "Disk Usage: " $5
}'

if [ "$disk_usage" -ge 80 ]
then
    echo "Disk Status: WARNING"
else
    echo "Disk Status: NORMAL"
fi

echo "========================"
