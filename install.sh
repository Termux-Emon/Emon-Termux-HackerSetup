#!/bin/bash

# Colors
RED='\033[1;31m'
GRN='\033[1;32m'
CYN='\033[1;36m'
NC='\033[0m'

clear
echo -e "${RED}
███████╗███╗   ███╗ ██████╗ ███╗   ██╗
██╔════╝████╗ ████║██╔═══██╗████╗  ██║
█████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ${GRN}[Welcome, Emon!]
${NC}"

echo -e "${CYN}🔁 Starting Emon-Termux-HackerSetup...${NC}"
sleep 1

# Update & Upgrade
echo -e "${GRN}📦 Updating packages...${NC}"
pkg update -y && pkg upgrade -y

# Install essential packages
echo -e "${GRN}📥 Installing essential packages...${NC}"
pkg install -y python git curl wget neofetch termux-api figlet toilet tsu

# Download Welcome MP3
echo -e "${GRN}🔊 Adding Welcome voice...${NC}"
mkdir -p $HOME/.config/emon
curl -L -o $HOME/.config/emon/sound.mp3 "https://github.com/Termux-Emon/Emon-Termux-HackerSetup/raw/main/Welcome%20to%20Emon-Termux%E2%80%91HackerSetup.mp3"

# Create custom banner with autoplay sound
echo -e "${GRN}🎨 Setting up hacker-style banner...${NC}"
cat > $HOME/.config/emon/banner.sh << 'EOF'
termux-media-player play $HOME/.config/emon/sound.mp3
clear
echo -e "\033[1;31m
███████╗███╗   ███╗ ██████╗ ███╗   ██╗
██╔════╝████╗ ████║██╔═══██╗████╗  ██║
█████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ \033[1;32m[Welcome, Emon!]\033[0m"
echo -e "\033[1;36m🧠 System Armed. Ready for command...\033[0m"
EOF

# Autoload banner on startup
echo -e "${GRN}🛠️ Finalizing setup...${NC}"
if ! grep -q "bash \$HOME/.config/emon/banner.sh" $HOME/.bashrc; then
    echo "bash \$HOME/.config/emon/banner.sh" >> $HOME/.bashrc
fi

echo -e "${CYN}✅ Setup complete! Restart Termux to apply changes.${NC}"
