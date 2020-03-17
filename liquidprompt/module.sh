git submodule update --init --recursive

_symlink_file $dotfiles_root/liquidprompt/liquidprompt ~/liquidprompt
mkdir ~/.config
_symlink_file $dotfiles_root/liquidprompt/liquidpromptrc ~/.config/liquidpromptrc

