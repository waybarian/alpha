#
# ~/.bashrc
#
fastfetch --logo none
export "MICRO_TRUECOLOR=1"
eval "$(starship init bash)"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ff='fastfetch --logo none'
alias m='micro'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
gbr=$(git branch --show-current 2>/dev/null)
alias gbr='git branch --show-current 2>/dev/null'
PS1='\n\w\[\e[38;5;39;1m\]$gbr\n\[\e[0;92;5m\]>\[\e[0m\] '

