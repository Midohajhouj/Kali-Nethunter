#!/usr/bin/env bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[1;37m')"

KALI_HOME="/data/data/com.termux/files/home/kali-arm64/home/kali"

echo -e "${R} [${W}-${R}]${C} Starting VNC Server...${W}"

# Check if VNC server is already running
if pgrep -x "Xvnc" > /dev/null; then
    echo -e "${R} [${W}-${R}]${G} VNC Server is already running.${W}"
    exit 0
fi

# Start VNC server with XFCE4 desktop environment
dbus-launch vncserver -localhost no -geometry 1280x720 -depth 24 -name kali-desktop -xstartup "$KALI_HOME/.vnc/xstartup" :1

if [[ $? -eq 0 ]]; then
    echo -e "${R} [${W}-${R}]${G} VNC Server started successfully!${W}"
    echo -e "${R} [${W}-${R}]${G} Connect to VNC using your VNC viewer at ${C}localhost:1${W}"
else
    echo -e "${R} [${W}-${R}]${G} Failed to start VNC Server!${W}"
    exit 1
fi
