filelist=(
	~/.bash
	~/.config/fastfetch
	~/.config/hypr/hyprland.conf
	~/.config/hypr
	~/.config/waybar
	~/.config/kitty
	~/.config/micro
	~/.config/cava
	~/.config/dconf
	~/.config/dconfgtk-3.0
	~/.config/kdeglobals
	~/.config/libfm
	~/.config/nwg-look
	~/.config/pcmanfm
	~/.config/rofi
	~/.config/starship.toml
	~/.config/systemd/user
	~/.config/waypaper
	~/.config/gtk-3.0
	~/.local/share/nwg-look
	~/.config/xsettingsd
	~/.gtkrc-2.0
	~/.bashrc
	~/.icons
	~/.themes
	~/install.sh
)

files() {
	clear

	printf "Applying ${GREEN}dotfiles..${RESET}\n"
	for file in "${filelist[@]}"; do
		mkdir ~/.backup &>/dev/null
		sudo mv -f "$file" ~/.backup &>/dev/null
		sudo rm -rf "$file" &>/dev/null
	done
	sleep 1
	
	rm -rf ~/.config/hypr | stow .
	if [ $? -eq 0 ]; then
		printf "${GREEN}dotfiles applied.${RESET}\n"
		nwg-look -a &>/dev/null
		echo ""
		echo ""
		echo ""
		echo "Waybarian's Arch Hyprland dotfiles has been successfully applied."
		echo "[ x ] Exit"
		echo ""
		echo ""
		echo ""
	else
		printf "${RED}failed to apply $file.${RESET}\n"
	fi
}
