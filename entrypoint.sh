#!/bin/sh
echo "=== Finding Java ==="
find / -name "java" -type f 2>/dev/null | head -10
echo "=== PATH: $PATH ==="
sleep 60
