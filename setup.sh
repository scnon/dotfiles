#!/bin/bash


# setup tmux config
ln -s ${PWD}/tmux.conf ~/.tmux.conf
# check if .config exists
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# setup alacritty config
ln -s ${PWD}/alacritty ~/.config/alacritty

# setup nvim config
git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
ln -s ${PWD}/nvim ~/.config/nvim/lua/user
