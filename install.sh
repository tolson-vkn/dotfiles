#!/bin/bash

# Neat 
DOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
OS=`uname`

# Not sure if sym links are the best thing to do here...

ln -s $DOT_DIR/zshrc $HOME/.zshrc
ln -s $DOT_DIR/zshenv $HOME/.zshenv
ln -s $DOT_DIR/vimrc $HOME/.vimrc
ln -s $DOT_DIR/psqlrc $HOME/.psqlrc
ln -s $DOT_DIR/tmux.conf $HOME/.tmux.conf
ln -s $DOT_DIR/starship.toml $HOME/.config/starship.toml


if ! which yay > /dev/null 2>&1; then
  echo "Go install yay: https://github.com/Jguer/yay"
  exit 1
fi

# Packages
packages=(
    'vim-youcompleteme-git'
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

# Setup plug

VIM_AUTOLOAD=$HOME/.vim/autoload

mkdir -p $VIM_AUTOLOAD
cp $DOT_DIR/utils/plug.vim $VIM_AUTOLOAD

# Fonts
FONT_LOC=$DOT_DIR/fonts
mkdir -p $HOME/.local/share/fonts

for font in $(ls $FONT_LOC); do
    cp $FONT_LOC/$font $HOME/.local/share/fonts
done

# Term
mkdir -p $HOME/.config/alacritty/
ln -s $DOT_DIR/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# Ipython
IPYCONFIG=$DOT_DIR/ipython/.ipython/profile_default/ipython_config.py
if [[ -e $IPYCONFIG ]]; then
    ipython profile create
fi 
ln -s $IPYCONFIG $HOME/.ipython/profile_default/ipython_config.py

# Bins
mkdir -p $HOME/tin
cp -r $DOT_DIR/bin/* $HOME/tin
