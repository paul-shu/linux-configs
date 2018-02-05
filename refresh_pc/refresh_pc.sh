#!/bin/bash
#==================================================
# Copyright 2017 @ Keysight Technologies
#
# This script is used to some basic software tools on a brand-new Linux 
# machine. These software packages might be used in UEE development.
# Support Ubuntu Server/Desktop 16.04.2.
# NOTE: Please make sure you run the script with non-root permission. 
# Because it will prompt you for password when sudo permission is required.
#   ./install_basic_tools.sh | tee install.log
#==================================================
CWD=`pwd`

# Shutter screenshot
sudo add-apt-repository -y ppa:shutter/ppa
# Papirus theme icon
sudo add-apt-repository -y ppa:papirus/papirus
# Wallpaper changer: variety
sudo add-apt-repository -y ppa:peterlevi/ppa
# Adapta theme
sudo add-apt-repository -y ppa:tista/adapta

sudo apt update 

sudo apt-get install -y shutter
sudo apt install -y papirus-icon-theme
sudo apt install -y unity-tweak-tool
sudo apt install -y variety
sudo apt install -y adapta-gtk-theme

# Install Mac Monaco font
./install_monaco_font.sh

# CMake
sudo apt install -y cmake

# Git
sudo apt install -y git
ln -s ${CWD}/../gitconfig ~/.gitconfig # Git configuration 

# Fish shell
sudo apt install -y fish
chsh -s /usr/bin/fish # make fish as the default shell
# Nim style fish prompt
ln -s ${CWD}/../fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

# Tmux
sudo apt install -y tmux
ln -s ${CWD}/../tmux.conf ~/.tmux.conf # Tmux configuration

# Ruby
sudo apt install -y ruby ruby-dev

# Curl
sudo apt install -y curl

# Neovim
if [ -x /usr/bin/nvim ]
then
  echo "neovim has been installed"
else
  sudo add-apt-repository -y ppa:neovim-ppa/stable
  sudo apt update
  sudo apt install -y neovim
  sudo apt install -y python-dev python-pip python3-dev python3-pip
  sudo pip3 install neovim
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  #sudo update-alternatives --config vim
  # Neovim configuration
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ln -s ${CWD}/../nvim/init.vim ~/.config/nvim/init.vim
  vim -c "PlugInstall" -c "q!" # Install plugins via vim-plug manager
fi

# HTop
sudo apt install -y htop

# Clang format for Cpp code format
sudo apt install -y clang-format-3.8
sudo apt install -y libclang-dev

# Clang tidy
sudo apt install -y clang-tidy

# CTag
sudo apt install -y exuberant-ctags 

# OpenSSH server
sudo apt install -y openssh-server

# GDB config
ln -s ../gdbinit ~/.gdbinit


