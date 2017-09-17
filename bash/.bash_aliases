alias def_aliases='nano ~/.bash_aliases && source ~/.bash_aliases'
alias uni='cd ~/Dropbox/UNI/6.\ Semester/'
alias git='LANG=en_US git'
alias update='sudo apt update && sudo apt upgrade -y'
alias dotupdate='~/dotfiles/update.sh'
alias dwm='sudo service lightdm restart'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias win10='virtualbox --startvm Win10x86 &'
alias pihdd='cd /run/user/1000/gvfs/smb-share:server=raspi,share=pi-share'

function open() {
    xdg-open "$1" 2>&1 >/dev/null
}

