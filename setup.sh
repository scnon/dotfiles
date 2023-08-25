#!/bin/bash


# setup tmux config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ${PWD}/tmux.conf ~/.tmux.conf
# check if .config exists
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# setup alacritty config
ln -s ${PWD}/alacritty ~/.config/alacritty

# setup wezterm config 
ln -s ${PWD}/wezterm ~/.config/wezterm

# setup nvim config
git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
ln -s ${PWD}/nvim ~/.config/nvim/lua/user


function install_deps ()
{
    npm i -g ls_emmet
}
