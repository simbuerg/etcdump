#!/bin/bash
packages=(awesome awesome-overlay irssi kitty tmux tmuxinator vim vscode xresources zsh)
stow -t ${HOME} -R ${packages[@]}
