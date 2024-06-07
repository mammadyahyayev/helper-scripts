#!/bin/bash

#########################################
#           HOW TO USE GUIDE?           #
#########################################
# The script will help you to kill process that is running on given port.

# How to run:
# ./kill_port.sh 8080

# Check if a port number is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: ./kill_port.sh <port_number>"
    exit 1
fi

PORT=$1

# Find the PID using the specified port
PID=$(netstat -ano | grep ":$PORT" | head -n 1 | awk '{print $5}')

# Check if PID is found
if [ -z "$PID" ]; then
    echo "No process found using port $PORT."
    exit 1
fi

# Kill the process using the found PID
taskkill //pid $PID //f
echo "Process with PID $PID using port $PORT is killed."