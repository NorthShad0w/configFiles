#!/bin/bash

#set ssh client
sudo echo 'ServerAliveInterval 50' >> /etc/ssh/ssh_config

#set zshrc file
# offical may better
cp zshrc ~/.zshrc
cp zshenv ~/.zshenv

#set tmux conf
sudo apt install tmux
cp tmux.conf ~/.tmux.conf

#install requirements
sudo apt install arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter compton papirus-icon-theme imagemagick libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev

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
rm -r ~/.config
cp -r config ~/.config

#set wallpaper
cp fehbg ~/.fehbg

# fonts FiraCode NF
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
sudo cp FiraCode.zip /usr/share/fonts
cd /usr/share/fonts
sudo unzip /usr/share/fonts/FiraCode.zip
fc-cache -r

#install alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
cd ../

#gitconfig
cp gitconfig ~/.gitconfig
echo 'reboot please'
