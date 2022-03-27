#!/bin/bash

#set ssh client
echo 'ServerAliveInterval 50'| sudo tee -a /etc/ssh/ssh_config

#set zshrc file
# offical may better
# do not forget to change max history size
cp zshrc ~/.zshrc
cp zshenv ~/.zshenv

#set tmux conf
sudo apt install -y tmux
cp tmux.conf ~/.tmux.conf

#install requirements
sudo apt install -y build-essential arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter compton papirus-icon-theme imagemagick libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev libiconv-hook-dev gettext libtool libtool-bin cmake doxygen

# install ghidra
sudo apt install -y ghidra
# install golang
sudo apt install -y golang
# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install i3-gaps
cd ../
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..

# config dir
cd configFiles
cp -r config/* ~/.config

#set wallpaper
cp fehbg ~/.fehbg

# fonts FiraCode NF
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
sudo cp FiraCode.zip /usr/share/fonts
cd /usr/share/fonts
sudo unzip /usr/share/fonts/FiraCode.zip
fc-cache -r

# cd back
cd -

#install alacritty
cd ../
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
cd ../

#install neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make
sudo make install

#gitconfig
cd configFiles
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install -y gh
cp gitconfig ~/.gitconfig

# nodejs
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs

echo 'reboot please'
