if ! available nvim; then
    sudo apt install neovim
fi

_symlink_file $dotfiles_root/nvim/.vimrc ~/.vimrc

