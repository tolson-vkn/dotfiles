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

# Basic templating. I kind of hate this, is there a jinja/askama cli?...

###
# Xresources
### 
HARDWARE=$(cat $CONFIG_DIR/tolson-hardware)
if [[ "$HARDWARE" -eq "desktop" ]]; then
    sed '1s/^/Xft.dpi: 98\n/' Xresources >> Xresources-tmpled
elif [[ "$HARDWARE" -eq "x1yoga" ]]; then
    sed '1s/^/Xft.dpi: 98\n/' Xresources >> Xresources-tmpled
elif [[ "$HARDWARE" -eq "p5540" ]]; then
    sed '1s/^/Xft.dpi: ???\n/' Xresources >> Xresources-tmpled
fi 

###
# i3status-rust
### 
cp i3status-rust/config.toml i3status-rust/config.toml-tmpled
if [[ "$HARDWARE" -eq "desktop" ]]; then
    cat >> i3status-rust/config.toml-tmpled <<EOF
[[block]]
block = "time"
interval = 5
format = "%a %d/%m %R"
EOF
else
    cat >> i3status-rust/config.toml-tmpled <<EOF
[[block]]
block = "battery"
interval = 10
format = " {percentage}"

[[block]]
block = "time"
interval = 5
format = "%a %d/%m %R"
EOF
fi

mkdir -p $CONFIG_DIR/{i3,i3status-rust}
cp i3/config $CONFIG_DIR/i3/config
cp i3status-rust/config.toml-tmpled $CONFIG_DIR/i3status-rust/config.toml

cp lock.sh $HOME/tin
cp Xresources-tmpled $HOME/.Xresources

xrdb ~/.Xresources 
i3-msg reload
i3-msg restart

