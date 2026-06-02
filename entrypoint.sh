#!/bin/sh
echo "PATH=$PATH"
echo "--- /opt contents ---"
ls /opt/
echo "--- /usr/bin/java ---"
ls /usr/bin/java 2>&1
echo "--- /usr/local/bin/java ---"
ls /usr/local/bin/java 2>&1
echo "--- which java ---"
which java 2>&1
sleep 30
