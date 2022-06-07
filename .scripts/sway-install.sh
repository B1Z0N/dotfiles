#!/usr/bin/env bash

sudo apt install build-essential
sudo apt install git
sudo apt install python3-pip

pip3 install --user meson==0.55.3
# export PATH=$HOME/.local/bin:$PATH
# source ~/.bashrc

sudo apt install wayland-protocols \
libwayland-dev \
libegl1-mesa-dev \
libgles2-mesa-dev \
libdrm-dev \
libgbm-dev \
libinput-dev \
libxkbcommon-dev \
libgudev-1.0-dev \
libpixman-1-dev \
libsystemd-dev \
cmake \
libpng-dev \
libavutil-dev \
libavcodec-dev \
libavformat-dev \
ninja-build \
meson

sudo apt install libxcb-composite0-dev \
        libxcb-icccm4-dev \
        libxcb-image0-dev \
        libxcb-render0-dev \
        libxcb-xfixes0-dev \
        libxkbcommon-dev \
        libxcb-xinput-dev \
        libx11-xcb-dev

mkdir ~/sway-build
cd ~/sway-build
git clone https://github.com/swaywm/wlroots.git
cd wlroots
git checkout 0.12.0

meson build -Dxwayland=enable
ninja -C build
sudo ninja -C build install

sudo apt install libjson-c-dev \
libpango1.0-dev \
libcairo2-dev \
libgdk-pixbuf2.0-dev \
scdoc

cd ~/sway-build
git clone https://github.com/swaywm/sway.git
cd sway
git checkout 1.5.1

meson build -Dxwayland=enable
ninja -C build
sudo ninja -C build install



### installing extras

# locker
sudo apt install swaylock 

# dmenu for wayland
cd ~/sway-build
git clone https://github.com/nyyManni/dmenu-wayland
cd dmenu-wayland
mkdir build
meson build
ninja -C build
sudo ninja -C build install

# alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install alacritty

# screenshots(see grimshot already in .local/bin)
sudo apt install wl-clipboard
sudo apt install grim
sudo apt install slurp
sudo apt install jq

# notifications
# usage: notify-send hello
sudo apt install mako-notifier

# blurred lock screen
sudo apt install ffmpeg

# install redshift(night color)
cd ~/sway-build
sudo apt install autopoint autoconf intltool libtool  
git clone -b wayland https://github.com/minus7/redshift.git  
cd redshift  
./bootstrap
./configure
make  
sudo make install  

# install wl-clipboard
sudo apt install wl-clipboard

# install dolphin file browser(wayland native and nautilus is lagging)
sudo apt install dolphin
# hack to get it working
sudo mv /usr/bin/nautilus /usr/bin/nautilus_actual
sudo ln -s /usr/bin/dolphin /usr/bin/nautilus

# TODO
sleep on lid close
volume
brightness
multiscreen
bluetooth
wifi
redshift

