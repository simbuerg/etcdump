#!/bin/bash
packages=(awesome awesome-overlay kitty tmux tmuxinator vim vscode xresources zsh)
stow -t ${HOME} -R ${packages[@]}
