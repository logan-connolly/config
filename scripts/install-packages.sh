#!/bin/bash

MKDIR="mkdir -p"
PKGINSTALL="yay --noconfirm -S --needed"

install_pacman_packages() {
  $PKGINSTALL base-devel
  $PKGINSTALL - < pacman/pkglist.txt
  $PKGINSTALL - < pacman/aur.txt
}

install_npm_packages() {
  $MKDIR $HOME/.npm-global
  npm config set prefix '~/.npm-global'
  export PATH=$HOME/.npm-global/bin:$PATH
  pkgs="eslint live-server neovim prettier typescript-language-server vls"
  npm install -g $pkgs
}
