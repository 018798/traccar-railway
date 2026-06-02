#!/bin/sh
echo "--- /opt/traccar contents ---"
ls /opt/traccar/
echo "--- finding java in /opt/traccar ---"
find /opt/traccar -name "java" -type f 2>/dev/null
sleep 30
