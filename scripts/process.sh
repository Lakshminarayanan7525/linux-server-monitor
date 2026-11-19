#!/bin/bash

echo "===== PROCESS MONITOR ====="

process="bash"

if pgrep -x "$process" > /dev/null
then
    echo "$process : RUNNING"
else
    echo "$process : NOT RUNNING"
fi

echo "==========================="
