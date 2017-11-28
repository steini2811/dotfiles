if ! available zsh; then
    sudo apt install zsh
    chsh -s /usr/bin/zsh
fi

_symlink_file $dotfiles_root/zsh/.zshrc ~/.zshrc

