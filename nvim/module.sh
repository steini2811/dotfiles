if ! available nvim; then
    sudo apt install neovim
fi

_symlink_file $dotfiles_root/nvim/.vimrc ~/.vimrc
_symlink_file $dotfiles_root/nvim/.vimrc ~/.config/nvim/init.vim

curl -Lso '~/.config/nvim/autoload/plug.vim' --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugUpgrade +PlugInstall +PlugUpdate +qall

