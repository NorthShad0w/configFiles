#!/bin/bash

echo 'Please set the proxychains proxy before use!'

#set ssh client
sudo echo 'ServerAliveInterval 50' >> /etc/ssh/ssh_config

#set zshrc file
cp my_zshrc ~/.zshrc

#install i3
sudo apt install i3-wm i3status suckless-tools
cp i3_congfig ~/.config/i3/config

#install requirements
sudo apt install feh cargo

#set wallpaper
cp dark.jpg ~/.config/dark.jpg
cp .fehbg ~/.fehbg


#install alacritty
proxychains git clone https://github.com/alacritty/alacritty.git
cd alacritty
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
proxychains cargo build --release && sudo cp target/release/alacritty /usr/local/bin

#wget https://raw.githubusercontent.com/NorthShad0w/configFiles/main/qterminal.ini -O ~/.config/qterminal.org/qterminal.ini
#exo-open --launch TerminalEmulator
#exit
echo 'remove open-vmware-tools and install vmware-tools'
echo 'reboot please'
