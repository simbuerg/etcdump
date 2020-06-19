#!/bin/bash
packages=(awesome awesome-overlay awesome-layout-machi irssi alacritty tmux tmuxinator vim vscode xresources zsh)
stow -t ${HOME} -R ${packages[@]}
