if ! available nvim; then
    sudo add-apt-repository ppa:neovim-ppa/stable -y
    sudo apt update
    sudo apt-get install python-dev python-pip python3-dev python3-pip
    sudo apt install neovim -y
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
fi

_symlink_file $dotfiles_root/nvim/.vimrc ~/.vimrc
mkdir --parents ~/.config/nvim
_symlink_file $dotfiles_root/nvim/.vimrc ~/.config/nvim/init.vim

curl -Lso ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugUpgrade +PlugInstall +PlugUpdate +qall

