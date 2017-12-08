if ! available zsh; then
    sudo apt install zsh -y
    echo "please enter your password to set zsh as default shell:"
    chsh -s /usr/bin/zsh
fi

_symlink_file $dotfiles_root/zsh/.zshrc ~/.zshrc

