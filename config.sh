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
sudo apt install -y arandr arc-theme autoconf build-essential cmake compton doxygen feh flameshot gettext i3 i3-wm i3blocks i3status imagemagick libev-dev libiconv-hook-dev libpango1.0-dev libstartup-notification0-dev libtool libtool-bin libxcb-cursor-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-shape0-dev libxcb-util0-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-xrm0 libxcb1-dev libxkbcommon-dev libxkbcommon-x11-dev libyajl-dev lxappearance meson papirus-icon-theme python3-pip rofi xcb xclip

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
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
sudo cp FiraCode.zip /usr/share/fonts
cd /usr/share/fonts
sudo unzip /usr/share/fonts/FiraCode.zip
fc-cache -r
sudo rm -rf /usr/share/fonts/FiraCode.zip
cd -
sudo rm -rf ./FiraCode.zip

# cd back
# cd -

#install alacritty
cd ../
git clone https://github.com/alacritty/alacritty.git
cd alacritty
source ~/.zshenv
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
cd ../

#install neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ../

#gitconfig
sudo apt install gh
cp gitconfig ~/.gitconfig

# nodejs
sudo apt install -y nodejs npm
sudo npm install -g yarn 

# chrome
cd ~/Downloads/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

# vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code

echo 'reboot please'
