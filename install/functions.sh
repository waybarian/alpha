# colors
F='\033[0m'
G='\033[0;32m'
R='\033[0;31m'
Y='\033[0;33m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'

# animation
animate_colors() {
    text="$1"
    colors=("41" "46" "43" "44" "45" "42")
    color_count=${#colors[@]}

    i=0
    while [ $i -lt $color_count ]; do
        current_color=${colors[i]}
        echo -ne "\e[1;${current_color}m$text\e[0m\r"
        sleep 0.5
        i=$((i + 1))
    done
}
animate_typing() {
    text="$1"
    color="$2"
    i=0
    while [ $i -lt ${#text} ]; do
        echo -en "\e[${color}m${text:$i:1}\e[0m"
        sleep 0.01
        i=$((i + 1))
    done
    echo
}
