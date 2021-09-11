#!/bin/bash

echo 'Please set the proxychains proxy before use!'

#set ssh client
sudo echo 'ServerAliveInterval 50' >> /etc/ssh/ssh_config

#set zshrc file
cp my_zshrc ~/.zshrc

#install requirements
sudo apt install arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev

# install i3-gaps
proxychains git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..

mkdir -p ~/.config/i3

mkdir -p ~/.config/compton

mkdir -p ~/.config/rofi


#config files

cp i3blocks.conf ~/.config/i3/i3blocks.conf
cp compton.conf ~/.config/compton/compton.conf
cp rofi_config ~/.config/rofi/config
cp clipboard_fix.sh ~/.config/i3/clipboard_fix.sh

#install i3
cp i3_congfig ~/.config/i3/config

#set wallpaper
cp dark.jpg ~/.config/dark.jpg
cp .fehbg ~/.fehbg


#install alacritty
proxychains git clone https://github.com/alacritty/alacritty.git
cd alacritty
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
proxychains cargo build --release && sudo cp target/release/alacritty /usr/local/bin

#set alacritty color
mkdir ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty/alacritty.yml

# install pywal

proxychains python3 -m pip install pywal

echo 'remove open-vmware-tools and install vmware-tools'
echo 'reboot please'
