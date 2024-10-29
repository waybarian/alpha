#!/bin/bash

# color
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'

# List of packages
packages=(
	hyprland
	ly
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
    qt5-imageformats
    qt6-imageformats
    ffmpegthumbs
    kdegraphics-thumbnailers
    kio
    kinit
    kio-extras
    kio-admin
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
    fastfetch
)

yaypkg=(
	cava
	waybar-cava
	hyprshot
	waypaper
)

files=(
	~/.config/fastfetch
	~/.config/hypr
	~/.config/waybar
	~/.config/kitty
	~/.config/micro
	~/.bashrc
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

printf "$Applying ${GREEN}Configuration..${RESET}"
for file in "${files[@]}"; do
	mkdir ~/.backup &>/dev/null
	mv -f "$file" ~/.backup &>/dev/null
	rm -rf "$file" &>/dev/null
done
sleep 1

stow .
if [ $? -eq 0 ]; then
	printf "${GREEN}$Configuration applied.${RESET}\n"
else
	printf "${RED}failed to apply $file.${RESET}\n"
fi

if sudo pacman -Q yay; then
	printf "${YELLOW}yay installed, skipping...${RESET}\n"
else
	git clone https://aur.archlinux.org/yay.git &>/dev/null
	cd yay
	makepkg -si &>/dev/null
	cd ..
	rm -rf yay
fi

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

sudo chmod +x ~/.xinitrc &>/dev/null
sudo systemctl enable ly.service
sudo systemctl start ly.service
