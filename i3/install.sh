#!/bin/bash

packages=(
    'i3-gaps'
    'i3status-rust'
    'i3lock'
    'scrot'
    'dmenu'
    # 'wired' # ope city
    'playerctl'
    'ttf-font-awesome'
    'xorg-xrandr'
)

not_installed=()

for package in "${packages[@]}"; do
    yay -Qe | grep $package > /dev/null 2>&1
    if [[ "$?" != "0" ]]; then
        echo $package not installed.
        not_installed+=($package)
    fi
done

if [[ ${#not_installed[@]} -gt 0 ]]; then
    yay -S ${not_installed[@]}
fi

CONFIG_DIR=$HOME/.config

mkdir -p $CONFIG_DIR/{i3,i3status-rust}

cp -r i3/ $CONFIG_DIR
cp -r i3status-rust/ $CONFIG_DIR

cp lock.sh $HOME/tin
cp Xresources $HOME/.Xresources
