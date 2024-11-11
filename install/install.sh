install() {
	clear
	
	echo "Installing dependencies..."
	if sudo pacman -Q yay; then
	 	printf "${Y}yay installed, skipping...${F}\n"
	 else
	 	git clone https://aur.archlinux.org/yay.git
	 	cd yay
	 	makepkg -si
	 	if [ $? -eq 0 ]; then
	 		echo "${G}yay installed successfully${F}"
	 	else
	 		echo "${R}failed to install yay${F}"
	 	fi
	 	
	 	cd ..
	 	rm -rf yay
	 fi 

	#installing from aur
	 pkg-pacman
	 sleep 2
	 
	 pkg-yay
	 sleep 2
	 
	 pkg-del
	 sleep 2

	#Creating backup and stowing
	 files
	 sleep 2
}
