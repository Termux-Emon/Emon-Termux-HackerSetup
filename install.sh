#!/data/data/com.termux/files/usr/bin/bash

# ===[ Color Codes ]===
RED="\033[1;31m"
GRN="\033[1;32m"
CYN="\033[1;36m"
YLW="\033[1;33m"
NC="\033[0m"

clear
echo -e "${RED}
███████╗███╗   ███╗ ██████╗ ███╗   ██╗
██╔════╝████╗ ████║██╔═══██╗████╗  ██║
█████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
${GRN}[Welcome to Emon-Termux-HackerSetup]${NC}"

# ===[ Step 1: Update & Upgrade ]===
echo -e "${CYN}🔁 Updating your Termux...${NC}"
pkg update -y && pkg upgrade -y

# ===[ Step 2: Required Packages ]===
echo -e "${CYN}📦 Installing essential packages...${NC}"
pkg install -y git curl wget neofetch figlet toilet ncurses-utils termux-api lolcat

# ===[ Step 3: Setup Storage ]===
termux-setup-storage

# ===[ Step 4: Download Sound ]===
echo -e "${CYN}🔊 Downloading hacker welcome voice...${NC}"
mkdir -p $HOME/Emon-Termux-HackerSetup
curl -L -o $HOME/Emon-Termux-HackerSetup/sound.mp3 https://github.com/Termux-Emon/Emon-Termux-HackerSetup/raw/main/sound.mp3

# ===[ Step 5: Create Hacker Banner ]===
echo -e "${CYN}🧾 Creating animated hacker banner...${NC}"
cat > $HOME/.banner << 'EOF'
clear
echo -e "\033[1;31m"
figlet -f slant "Emon" | lolcat
echo -e "\033[1;36mWelcome back, Commander...\033[0m"
neofetch
echo -e "\033[1;33mSystem is now ready. Execute your mission.\033[0m"
termux-media-player play $HOME/Emon-Termux-HackerSetup/sound.mp3
EOF

# ===[ Step 6: Add .banner to .bashrc ]===
echo -e "${CYN}⚙️ Enabling banner + sound auto-load...${NC}"
if ! grep -q ".banner" $HOME/.bashrc; then
  echo "bash \$HOME/.banner" >> $HOME/.bashrc
fi

# ===[ Step 7: Completion ]===
echo -e "${GRN}✅ Setup complete!"
echo -e "${YLW}🔁 Restart Termux to see changes in action.${NC}"
