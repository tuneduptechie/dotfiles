fastfetch

export ZSH="$HOME/dotfiles/oh-my-zsh"
ZSH_THEME="kphoen"
source $ZSH/oh-my-zsh.sh

alias update='sudo dnf update -y'
alias install='sudo dnf install'
alias remove='sudo dnf remove'
alias find='dnf list --installed | grep'
alias proton='protonup-rs'
alias tkg='cd ~/Git && git clone --depth=1 https://github.com/Frogging-Family/linux-tkg && cd linux-tkg && makepkg -si && cd && rm -rf ~/Git/linux-tkg'
alias dots='cd ~/dotfiles'
alias dev='cd ~/Projects'
alias ls='ls -l'
alias size='du -sh *'

alias fstab='sudo nvim /etc/fstab'
alias flac='$HOME/.scripts/flac.sh'
alias dl='yt-dlp -x -f best -o "$HOME/Music/Downloads/.%(ext)s" --audio-format flac'
alias winon='sudo virsh start win11'
alias winoff='sudo virsh shutdown win11'
alias winedit='sudo EDITOR=nvim virsh edit win11'
alias winkill='sudo virsh destroy win11'
alias grubdate='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
