#!/bin/bash

# color
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'

# List of packages
packages=(
	fish
	hyprland
	ly
	swaybg
	swww
    hypridle
    hyprlock
    wlroots
    polkit-kde-agent
    swaync
    grim
    slurp
    wl-clipboard
    brightnessctl
    playerctl
    mpv
    imv
    ffmpeg
    pipewire
    pipewire-pulse
    pipewire-alsa
    xdg-user-dirs
    rofi-wayland
    pavucontrol
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
    pcmanfm
    kitty
    ark
    qqc2-desktop-style
    kimageformats
    qt6-imageformats
    ffmpegthumbs
    kdegraphics-thumbnailers
    kio
    kinit
    kio-extras
    kio-admin
    qt5-imageformats
    firefox
    archlinux-xdg-menu
    python-pydbus
    python-psutil
    networkmanager
    ttf-font-awesome
    noto-fonts
    noto-fonts-extra
    noto-fonts-emoji
    noto-fonts-cjk
    ttf-fira-sans
    ttf-fira-code
    ttf-fira-mono
    otf-firamono-nerd
    ttf-firacode-nerd
    ttf-jetbrains-mono
    ttf-jetbrains-mono-nerd
    stow
    gvfs
    udisks2
)

yaypkg=(
	cava
	waybar-cava
	hyprshot
)

# Loop through each package
for package in "${packages[@]}"; do
    if sudo pacman -Q "$package" &>/dev/null; then
        printf "${YELLOW}$package is already installed, skipping...${RESET}\n"
    else
        printf "$package is not installed. Installing...\n"
        sudo pacman -S --noconfirm "$package" &>/dev/null
        if [ $? -eq 0 ]; then
        	printf "${GREEN}$package installed.${RESET}\n"
        else
        	printf "${RED}failed to install $package.${RESET}\n"
        fi
    fi
done

for package in "${yaypkg[@]}"; do
    if sudo pacman -Q "$package" &>/dev/null; then
        printf "${YELLOW}$package is already installed, skipping...${RESET}\n"
    else
        printf "$package is not installed. Installing...\n"
        yay -S --noconfirm "$package" &>/dev/null
        if [ $? -eq 0 ]; then
        	printf "${GREEN}$package installed.${RESET}\n"
        else
        	printf "${RED}failed to install $package.${RESET}\n"
        fi
    fi
done

sleep 1

# CONFIGURATION
files=(
	~/.config/fastfetch
	~/.config/hypr
	~/.config/waybar
	~/.config/kitty
	~/.config/micro
	~/.bashrc
)

printf "$Applying ${GREEN}Configuration..${RESET}"
for file in "${files[@]}"; do
	mkdir ~/.backup &>/dev/null
	mv -f "$file" ~/.backup
done

stow .
if [ $? -eq 0 ]; then
	printf "${GREEN}$config applied.${RESET}\n"
else
	printf "${RED}failed to apply $file.${RESET}\n"
fi

sudo systemctl enable ly.service
sudo systemctl start ly.service
