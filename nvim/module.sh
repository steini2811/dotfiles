if ! available nvim; then
    sudo apt install neovim -y
fi

_symlink_file $dotfiles_root/nvim/.vimrc ~/.vimrc
mkdir --parents ~/.config/nvim
_symlink_file $dotfiles_root/nvim/.vimrc ~/.config/nvim/init.vim

if [ ! -f ~/.config/nvim/autoload/plug.vim ]; then
    curl -Lso ~/.config/nvim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

nvim +PlugUpgrade +PlugInstall +PlugUpdate +qall

