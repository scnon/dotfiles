#!/bin/bash

# setup tmux config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ${PWD}/tmux.conf ~/.tmux.conf

# check if .config exists
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# zsh plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# setup alacritty config
# ln -s ${PWD}/alacritty ~/.config/alacritty

# setup wezterm config 
ln -s ${PWD}/wezterm ~/.config/wezterm

# setup nvim config
git clone https://github.com/AstroNvim/Template.git ~/.config/nvim
ln -s ${PWD}/nvim ~/.config/nvim/lua/user

# setup zshrc
echo "source ${PWD}/zshrc">>~/.zshrc

# install deps for nvim plugins
function install_deps ()
{
    npm i -g ls_emmet
}
