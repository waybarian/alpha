yaypkg=(
	cava
	hyprshot
	waypaper
)

pkg-yay() {
	clear

	echo "Installing package from AUR..."
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
}
