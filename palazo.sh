#!/bin/bash
packages=(awesome awesome-overlay awesome-layout-machi awesome-smart-borders awesome-icon-customizer awesome-vim-tmux-navigator awesome-bling irssi alacritty tmux tmuxinator vim vscode xresources zsh)
stow -t ${HOME} -R ${packages[@]}
