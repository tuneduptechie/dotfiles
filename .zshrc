fastfetch
export ZSH="/home/thecoon/dotfiles/oh-my-zsh"

alias update='sudo pacman -Sy && paru -Syyuu --noconfirm'
alias install='paru --needed --noconfirm -S'
alias clean='paru -R $(paru -Qtdq) --noconfirm'
alias list='pacman -Q'
alias find='pacman -Q | grep'
alias proton='protonup-rs'

alias tkg='cd ~/Git/linux-tkg && makepkg -si && sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias backup='~/.scripts/game-backup.sh'

alias ll='ls -l'
alias ls='ls -a'
alias ff='fastfetch'

ZSH_THEME="fox"

plugins=(git)

source $ZSH/oh-my-zsh.sh
