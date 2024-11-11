#!/bin/bash

clear

. ~/arch-hyprland/install/waybarian.sh
. ~/arch-hyprland/install/functions.sh

echo -ne "Enter your Name: "
read username
sleep 0.3
clear

text="Please welcome, $username!"
delay=0.1
length=$(echo "$text" | wc -c)
i=1
while [ $i -lt $length ]; do
    char=$(echo "$text" | cut -c $i)
    echo -en "${G}${char}${F}"
    sleep $delay
    i=$((i + 1))
done
echo ""
echo ""
echo ""
animate_typing "    ██╗    ██╗ █████╗ ██╗  ██╗██╗
    ██║    ██║██╔══██╗██║  ██║██║
    ██║ █╗ ██║███████║███████║██║
    ██║███╗██║██╔══██║██╔══██║██║
    ╚███╔███╔╝██║  ██║██║  ██║██║
     ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝

 Waybarian's Arch Hyprland Installer"
echo ""
echo ""
echo ""
animate_typing "Here are menu for the Installer" "32"
echo ""
animate_typing "[ 1 ] Continue to the Installation" "33"
animate_typing "[ 2 ] Backup (Only if you've already Installed)" "33"
animate_typing "[ x ] Exit" "33"
echo ""
echo ""
	
while true; do
	echo -ne "${G}What'd you choose? ${F}: "
	read choice
	case $choice in
		1)
			install
			;;
		2)
			backup
			;;
		x)
			clear
			echo ""
			echo -e "${R}Goodbye :D${F}"
			break
			;;
		*)
			echo -e "${R}Wrong input${F}"
			;;
	esac
done
