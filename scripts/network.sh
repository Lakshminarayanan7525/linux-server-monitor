#!/bin/bash

echo "===== NETWORK MONITOR ====="

if ping -c 2 -W 3 google.com > /dev/null 2>&1
then
    echo "Network Status: CONNECTED"
else
    echo "Network Status: DISCONNECTED"
fi

echo "==========================="
