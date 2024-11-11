delpkg=(
	dolphin
)

pkg-del() {
	clear

	echo "Removing unused packages..."
	for package in "${delpkg[@]}"; do
		if sudo pacman -Q "$package" &>/dev/null; then
			printf "Removing unused packages, ${YELLOW}$package...${RESET}\n"
			sudo pacman -R --noconfirm "$package"
			if [ $ -eq 0 ]; then
				printf "${GREEN}$package removed.${RESET}\n"
			else
				printf "${RED}failed to remove $package.${RESET}\n"
			fi
		else
			printf "${YELLOW}$package is not installed, skipping...${RESET}\n"
		fi
	done
}
