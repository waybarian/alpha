packages=(
	hyprland
	waybar
	ly
	swww
    hypridle
    hyprlock
    wlroots
    polkit-kde-agent
    dunst
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
    nemo
    kitty
    starship
    engrampa
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
    ttf-firacode-nerd
    stow
    gvfs
    udisks2
    fastfetch
    kalk
    nwg-look
    papirus-icon-theme
    pamixer
    acpi
    fzf
)

pkg-pacman() {
	clear

	echo "Installing pkg using pacman.."
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
}
