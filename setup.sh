#!/bin/bash

R="$(printf '\033[1;31m')"
G="$(printf '\033[1;32m')"
Y="$(printf '\033[1;33m')"
B="$(printf '\033[1;34m')"
C="$(printf '\033[1;36m')"
W="$(printf '\033[1;37m')"

CURR_DIR=$(realpath "$(dirname "$BASH_SOURCE")")
KALI_HOME="/data/data/com.termux/files/home/kali-arm64/home/kali"
KALI_DIR="$PREFIX/var/lib/proot-distro/installed-rootfs/kali"

# Logging function
log() {
    local LOG_FILE="/data/data/com.termux/files/home/kali-nethunter/logs/script.log"
    local LOG_DIR=$(dirname "$LOG_FILE")
    
    if [ ! -d "$LOG_DIR" ]; then
        mkdir -p "$LOG_DIR" || {
            echo "Failed to create log directory: $LOG_DIR" >&2
            exit 1
        }
    fi
    
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

banner() {
    clear
    printf "${B}##################################################\n"
    printf "${B}##                                              ##\n"
    printf "${B}##  88      a8P         db        88        88  ##\n"
    printf "${B}##  88    .88'         d88b       88        88  ##\n"
    printf "${B}##  88   88'          d8''8b      88        88  ##\n"
    printf "${B}##  88 d88           d8'  '8b     88        88  ##\n"
    printf "${B}##  8888'88.        d8YaaaaY8b    88        88  ##\n"
    printf "${B}##  88P   Y8b      d8''''''''8b   88        88  ##\n"
    printf "${B}##  88     '88.   d8'        '8b  88        88  ##\n"
    printf "${B}##  88       Y8b d8'          '8b 888888888 88  ##\n"
    printf "${B}##        Minimal and Powerful Solution         ##\n"
    printf "${B}############## Coded by LIONMAD ##################${NC}\n\n"
    printf "\e[1;32m### Let's get started with the installation! ###\e[0m\n"
    printf "\n"
}

package() {
    banner
    log "Updating and upgrading packages..."
    echo -e "${R} [${W}-${R}]${C} Updating and upgrading packages...${W}"
    
    # Update and upgrade packages
    yes | pkg update
    yes | pkg upgrade

    log "Installing required dependencies..."
    echo -e "${R} [${W}-${R}]${C} Installing required dependencies...${W}"
    
    # Install dependencies
    packs=(curl tar wget proot)
    for x in "${packs[@]}"; do
        if ! pkg install -y "$x"; then
            log "Failed to install package: $x"
            echo -e "\n${R} [${W}-${R}]${G} Failed to install package: ${Y}$x${C}${W}"
            exit 1
        fi
    done

    if [ ! -d '/data/data/com.termux/files/home/storage' ]; then
        log "Setting up storage..."
        echo -e "${R} [${W}-${R}]${C} Setting up Storage...${W}"
        termux-setup-storage
    fi
}

install_nethunter() {
    echo -e "\n${R} [${W}-${R}]${C} Downloading and Installing Kali Linux NetHunter ...${W}"
    
    # Download the NetHunter installation script
    if ! wget -O install-nethunter-termux "https://offs.ec/2MceZWr"; then
        echo -e "\n${R} [${W}-${R}]${G} Failed to download NetHunter installation script!${W}"
        exit 1
    fi

    # Make the script executable
    chmod +x install-nethunter-termux

    # Run the NetHunter installation script with minimal option
    ./install-nethunter-termux

    if [[ $? -eq 0 ]]; then
        echo -e "\n${R} [${W}-${R}]${G} Kali Linux NetHunter installed successfully!${W}"
    else
        echo -e "\n${R} [${W}-${R}]${G} Error installing Kali Linux NetHunter !${W}"
        exit 1
    fi
}

permission() {
    banner
    echo -e "${R} [${W}-${R}]${C} Setting up Environment...${W}"

    # Setup tools.sh
    if [[ -d "$CURR_DIR/assets" ]] && [[ -e "$CURR_DIR/assets/tools.sh" ]]; then
        cp -f "$CURR_DIR/assets/tools.sh" "$KALI_HOME/tools.sh"
    else
        downloader "$CURR_DIR/user.sh" "https://raw.githubusercontent.com/kali-nethunter/kali-nethunter/master/assets/tools.sh"
        mv -f "$CURR_DIR/tools.sh" "$KALI_HOME/tools.sh"
    fi
    chmod +x "$KALI_HOME/tools.sh"
    
    setup_vnc
    echo "$(getprop persist.sys.timezone)" > "$KALI_DIR/etc/timezone"
    echo "proot-distro login kali" > "$PREFIX/bin/kali"
    chmod +x "$PREFIX/bin/kali"
    termux-reload-settings

    if [[ -e "$PREFIX/bin/kali" ]]; then
        banner
        cat <<EOF
            ${R} [${W}-${R}]${G} Kali Linux NetHunter (CLI) is now Installed on your Termux
            ${R} [${W}-${R}]${G} Restart your Termux to Prevent Some Issues.
            ${R} [${W}-${R}]${G} Type ${C}kali${G} to run Kali CLI.
            ${R} [${W}-${R}]${G} If you Want to Use Kali additional tools then ,
            ${R} [${W}-${R}]${G} Run ${C}nh${G} first & then type ${C}sudo ./tools.sh${W}
EOF
        { echo; sleep 2; exit 0; }
    else
        echo -e "\n${R} [${W}-${R}]${G} Error Installing Distro !${W}"
        exit 1
    fi
}

# Main script execution
package
install_nethunter
permission
