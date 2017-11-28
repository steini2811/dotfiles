if ! available tmux; then
    sudo apt install tmux
fi

_symlink_file $dotfiles_root/tmux/.tmux.conf ~/.tmux.conf

