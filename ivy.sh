#!/bin/bash
packages=(awesome awesome-overlay kitty tmux vim xresources zsh)
stow -t ${HOME} -R ${packages[@]}
