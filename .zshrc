fastfetch
export ZSH="$HOME/dotfiles/oh-my-zsh"

alias update='sudo pacman -Sy && paru -Syyuu --noconfirm'
alias install='paru --needed --noconfirm -S'
alias clean='paru -R $(paru -Qtdq) --noconfirm'
alias list='pacman -Q'
alias find='pacman -Q | grep'
alias proton='protonup-rs'
alias cvpn='sudo protonvpn connect us-fl-01'
alias dvpn='sudo protonvpn disconnect'
alias svpn='protonvpn status'
alias tkg='cd ~/.cache && git clone https://github.com/Frogging-Family/linux-tkg && makepkg -si && rm -rf ~/.cache'
alias dots='cd ~/dotfiles'
alias dev='cd ~/Projects'
alias ls='ls -l'
alias ff='fastfetch'
alias fstab='sudo nano /etc/fstab'

ZSH_THEME="fox"

plugins=(git)

source $ZSH/oh-my-zsh.sh
