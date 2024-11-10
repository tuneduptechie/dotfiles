#!/bin/bash

# Define variables
GREEN="$(tput setaf 2)[OK]$(tput sgr0)"
RED="$(tput setaf 1)[ERROR]$(tput sgr0)"
YELLOW="$(tput setaf 3)[NOTE]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
LOG="install.log"
ARCH-PKG="pkg-arch.txt"
FEDORA-PKG="pkg-fedora.txt"
UBUNTU-PKG="pkg-ubuntu.txt"
NIX-PKG="pkg-nix.txt"

# Set the script to exit on error
set -e

printf "$(tput setaf 2) Welcome to the Arch Linux Hyprland installer!\n $(tput sgr0)"

sleep 2
bind = CONTROLALT, DELETE, exec, rofi -show power-menu -modi "power-menu:rofi-power-menu --choices=lockscreen/suspend/logout/reboot/shutdown"
bind = ALT, R, exec, rofi -show drun -show-iconsrder rofi sddm wlogout dunst swww alacritty hyprcursor hyprlang noto-fonts noto-fonts-emoji"
   app_pkgs="nwg-look qt5ct btop jq gvfs ffmpegthumbs mpv playerctl pamixer noise-suppression-for-voice"
   app_pkgs2="mate-polkit ffmpeg neovim viewnior pavucontrol thunar ffmpegthumbnailer tumbler thunar-archive-plugin xdg-user-dirs"
   theme_pkgs="nordic-theme papirus-icon-theme starship"

    # Check for yay or paru
    if command -v yay &> /dev/null; then
        aur_helper="yay"
    elif command -v paru &> /dev/null; then
        aur_helper="paru"
    else
        print_error "Neither yay nor paru found. Please install one of them to continue."
        exit 1
    fi

    if ! $aur_helper -S --noconfirm $git_pkgs $hypr_pkgs $app_pkgs $app_pkgs2 $theme_pkgs 2>&1 | tee -a $LOG; then
        print_error " Failed to install additional packages - please check the install.log \n"
        exit 1
    fi
    xdg-user-dirs-update
    echo
    print_success " All necessary packages installed successfully."

else
    echo
    print_error " Packages not installed - please check the install.log"
    sleep 1
fi

### Copy Config Files ###
read -n1 -rep "${CAT} Would you like to copy config files? (y,n)" CFG
if [[ $CFG =~ ^[Yy]$ ]]; then
    printf " Copying config files...\n"
    cp -r dotconfig/hypr ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/kitty ~/.config/ 2>&1 | tee -a $LOG
    cp -r dotconfig/rofi ~/.config/ 2>&1 | tee -a $LOG
    
    # Set some files as exacutable 
    chmod +x ~/.config/hypr/xdg-portal-hyprland
fi

FONT_DIR="$HOME/.local/share/fonts"
FONT_ZIP="$FONT_DIR/Meslo.zip"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip"

# Check if Meslo Nerd-font is already installed
if fc-list | grep -qi "Meslo"; then
    echo "Meslo Nerd-fonts are already installed."
    exit 0
fi

echo "Installing Meslo Nerd-fonts..."

# Create the fonts directory if it doesn't exist
mkdir -p "$FONT_DIR"

# Download the font zip file if it doesn't already exist
if [ ! -f "$FONT_ZIP" ]; then
    wget -O "$FONT_ZIP" "$FONT_URL" || {
        echo "Failed to download Meslo Nerd-fonts from $FONT_URL"
        exit 1
    }
else
    echo "Meslo.zip already exists in $FONT_DIR, skipping download."
fi

if [ ! -d "$FONT_DIR/Meslo" ]; then
    unzip -o "$FONT_ZIP" -d "$FONT_DIR" || {
        echo "Failed to unzip $FONT_ZIP"
        exit 1
    }
else
    echo "Meslo font files already unzipped in $FONT_DIR, skipping unzip."
fi
rm "$FONT_ZIP"
fc-cache -fv # Rebuild the font cache
echo "Meslo Nerd-fonts installed successfully"

### Enable SDDM Autologin ###
read -n1 -rep 'Would you like to enable SDDM autologin? (y,n)' SDDM
if [[ $SDDM == "Y" || $SDDM == "y" ]]; then
    LOC="/etc/sddm.conf"
    echo -e "The following has been added to $LOC.\n"
    echo -e "[Autologin]\nUser = $(whoami)\nSession=hyprland" | sudo tee -a $LOC
    echo -e "\n"
    echo -e "Enabling SDDM service...\n"
    sudo systemctl enable sddm
    sleep 3
fi

# BLUETOOTH
read -n1 -rep "${CAT} OPTIONAL - Would you like to install Bluetooth packages? (y/n)" BLUETOOTH
if [[ $BLUETOOTH =~ ^[Yy]$ ]]; then
    printf " Installing Bluetooth Packages...\n"
 blue_pkgs="bluez bluez-utils blueman"
    if ! yay -S --noconfirm $blue_pkgs 2>&1 | tee -a $LOG; then
       	print_error "Failed to install bluetooth packages - please check the install.log"    
    printf " Activating Bluetooth Services...\n"
    sudo systemctl enable --now bluetooth.service
    sleep 2
    fi
else
    printf "${YELLOW} No bluetooth packages installed..\n"
	fi
    
### Script is done ###
printf "\n${GREEN} Installation Completed.\n"
echo -e "${GREEN} You can start Hyprland by typing Hyprland (note the capital H).\n"
read -n1 -rep "${CAT} Would you like to start Hyprland now? (y,n)" HYP
if [[ $HYP =~ ^[Yy]$ ]]; then
    if command -v Hyprland >/dev/null; then
        exec Hyprland
    else
         print_error " Hyprland not found. Please make sure Hyprland is installed by checking install.log.\n"
        exit 1
    fi
else
    exit
fi