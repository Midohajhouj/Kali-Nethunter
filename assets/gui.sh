#!/bin/bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[1;37m')"

KALI_HOME="/data/data/com.termux/files/home/kali-arm64/home/kali"

banner() {
    clear
    printf "\e[1;32m#############################################\e[0m\n"
    printf "\e[1;32m#                                           #\e[0m\n"
    printf "\e[1;32m#    \e[1;34mWelcome to Kali Linux NetHunter Tool\e[1;32m    #\e[0m\n"
    printf "\e[1;32m#       \e[1;33mMinimal and Powerful Solution\e[1;32m       #\e[0m\n"
    printf "\e[1;32m#                                           #\e[0m\n"
    printf "\e[1;32m#############################################\e[0m\n"
    printf "\n"
}

install_xfce4() {
    echo -e "${R} [${W}-${R}]${C} Checking if XFCE4 is already installed...${W}"
    if dpkg -l | grep -q "xfce4"; then
        echo -e "${R} [${W}-${R}]${G} XFCE4 is already installed. Skipping installation.${W}"
    else
        echo -e "${R} [${W}-${R}]${C} Installing XFCE4 Desktop Environment...${W}"
        apt update -y
        apt install -y xfce4 xfce4-terminal xfce4-goodies dbus-x11
        if [[ $? -eq 0 ]]; then
            echo -e "${R} [${W}-${R}]${G} XFCE4 Desktop Environment installed successfully!${W}"
        else
            echo -e "${R} [${W}-${R}]${G} Failed to install XFCE4 Desktop Environment!${W}"
            exit 1
        fi
    fi
}

setup_vnc() {
    echo -e "${R} [${W}-${R}]${C} Checking if VNC is already installed...${W}"
    if command -v vncserver &> /dev/null; then
        echo -e "${R} [${W}-${R}]${G} VNC is already installed. Skipping installation.${W}"
    else
        echo -e "${R} [${W}-${R}]${C} Installing VNC Server...${W}"
        apt install -y tigervnc-standalone-server
        if [[ $? -ne 0 ]]; then
            echo -e "${R} [${W}-${R}]${G} Failed to install VNC Server!${W}"
            exit 1
        fi
    fi

    echo -e "${R} [${W}-${R}]${C} Configuring VNC Server...${W}"
    mkdir -p "$KALI_HOME/.vnc"
    echo "#!/bin/bash" > "$KALI_HOME/.vnc/xstartup"
    echo "startxfce4 &" >> "$KALI_HOME/.vnc/xstartup"
    chmod +x "$KALI_HOME/.vnc/xstartup"

    echo -e "${R} [${W}-${R}]${C} Setting VNC Password...${W}"
    echo "Please set a password for VNC (at least 6 characters):"
    vncpasswd -store "$KALI_HOME/.vnc/passwd"

    echo -e "${R} [${W}-${R}]${C} Starting VNC Server...${W}"
    vncserver -localhost no -geometry 1280x720 -depth 24 -name kali-desktop :1

    if [[ $? -eq 0 ]]; then
        echo -e "${R} [${W}-${R}]${G} VNC Server started successfully!${W}"
        echo -e "${R} [${W}-${R}]${G} Connect to VNC using your VNC viewer at ${C}localhost:1${W}"
    else
        echo -e "${R} [${W}-${R}]${G} Failed to start VNC Server!${W}"
        exit 1
    fi
}

start_gui() {
    echo -e "${R} [${W}-${R}]${C} Starting Graphical Desktop Environment...${W}"
    echo -e "${R} [${W}-${R}]${G} Run the following command to start the GUI:${W}"
    echo -e "${R} [${W}-${R}]${G} 1. Start VNC Server: ${C}vncserver -localhost no -geometry 1280x720 -depth 24 -name kali-desktop :1${W}"
    echo -e "${R} [${W}-${R}]${G} 2. Connect to VNC using a VNC viewer at ${C}localhost:1${W}"
    echo -e "${R} [${W}-${R}]${G} 3. To stop the VNC Server, run: ${C}vncserver -kill :1${W}"
}

# Main script execution
banner
install_xfce4
setup_vnc
start_gui
