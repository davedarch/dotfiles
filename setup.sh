#!/bin/bash

# Create symlinks
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.zsh_github" "$HOME/.zsh_github"

# Install required packages
if command -v apt-get >/dev/null; then
    sudo apt-get update
    sudo apt-get install -y zsh zsh-syntax-highlighting
fi

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi 