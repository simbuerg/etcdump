#!/bin/bash
packages=(awesome awesome-overlay awesome-layout-machi awesome-smart-borders awesome-icon-customizer irssi alacritty tmux tmuxinator vim vscode xresources zsh)
stow -t ${HOME} -R ${packages[@]}
