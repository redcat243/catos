#!/bin/zsh

# 1. Prompt for Python 3.14 Verification
echo "============================================="
echo "        WELCOME TO THE CATOS INSTALLER       "
echo "============================================="
echo ""
echo "NOTICE: CatOS requires Python 3.14 to run."
echo "If you haven't installed it yet, please download it from:"
echo "https://python.org"
echo ""
echo -n "Have you installed Python 3.14? (y/n): "
read user_response

if [[ "$user_response" != "y" && "$user_response" != "Y" ]]; then
    echo "Installation aborted. Please install Python 3.14 and run this script again."
    exit 1
fi

echo "\n[1/3] Downloading CatOS bundle..."
# 2. Download the zip archive from GitHub 
# (Replace the placeholder URL below with your actual raw zip source link)
ZIP_URL="https://raw.githubusercontent.com/redcat243/catos/main/catos-terminal.zip"
curl -L "$ZIP_URL" -o ~/Desktop/catos-terminal.zip

echo "[2/3] Extracting assets to Desktop..."
# Extract zip directly onto the Desktop and clean up the archive file
unzip -q ~/Desktop/catos-terminal.zip -d ~/Desktop/
rm ~/Desktop/catos-terminal.zip

echo "[3/3] Configuring shell environment (~/.zshrc)..."
# Create .zshrc profile file if it doesn't already exist
touch ~/.zshrc

# Append the custom CatOS terminal behavior blocks
cat << 'EOF' >> ~/.zshrc

alias change-cat-folder="cd"
alias cat-cat-folder="mkdir"
alias pounce="rm -rf"
alias cat-cat-file="touch"
alias cat-edit="nano"
alias cat-read="less"
alias cat-move="mv"
alias cat-list="ls"
alias catos="python3.14 ~/Desktop/catos-terminal/catoscli.py"
EOF

echo "\n============================================="
echo "        INSTALLATION COMPLETE! 🎉            "
echo "============================================="
echo ""
echo "now rebooting to reboot enter your password"
echo "============================================="
echo ""
echo "after the reboot, type 'catos' in your terminal to boot your system!"
echo "============================================="
echo "10"
sleep 1
echo "9"
sleep 1
echo "8"
sleep 1
echo "7"
sleep 1
echo "6"
sleep 1
echo "5"
sleep 1
echo "4"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
echo "Rebooting now..."
sudo reboot
