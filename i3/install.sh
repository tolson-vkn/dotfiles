#!/bin/bash

sudo pacman -S i3-gaps i3status-rust i3lock scrot

CONFIG_DIR=$HOME/.config

mkdir -p $CONFIG_DIR/{i3,i3status-rust}

cp -r i3/ $CONFIG_DIR
cp -r i3status-rust/ $CONFIG_DIR

cp lock.sh $HOME/tin
cp .Xresources $HOME/
