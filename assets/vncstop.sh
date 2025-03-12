#!/usr/bin/env bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[1;37m')"

KALI_HOME="/data/data/com.termux/files/home/kali-arm64/home/kali"

echo -e "${R} [${W}-${R}]${C} Stopping VNC Server...${W}"

# Kill specific VNC server (e.g., :1)
vncserver -kill :1

# Remove VNC-related files if they exist
if [ -f "$KALI_HOME/.vnc/localhost:1.pid" ]; then
    rm -f "$KALI_HOME/.vnc/localhost:1.pid"
fi

if [ -f "/tmp/.X1-lock" ]; then
    rm -f /tmp/.X1-lock
fi

if [ -d "/tmp/.X11-unix/X1" ]; then
    rm -rf /tmp/.X11-unix/X1
fi

if [[ $? -eq 0 ]]; then
    echo -e "${R} [${W}-${R}]${G} VNC Server stopped successfully!${W}"
else
    echo -e "${R} [${W}-${R}]${G} Failed to stop VNC Server!${W}"
    exit 1
fi
