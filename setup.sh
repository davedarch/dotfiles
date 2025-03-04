#!/bin/bash

# Create symlinks
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.zsh_github" "$HOME/.zsh_github"
ln -sf "$HOME/dotfiles/zsh/.zsh_files" "$HOME/.zsh_files"

# Install required packages
if command -v apt-get >/dev/null; then
    sudo apt-get update
    sudo apt-get install -y zsh git curl
fi

# Install Zinit if not present
if [ ! -d "${HOME}/.local/share/zinit" ]; then
    echo "Installing Zinit..."
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

# Install pyenv if not present
if [ ! -d "${HOME}/.pyenv" ]; then
    echo "Installing pyenv..."
    curl https://pyenv.run | bash
fi

# Set zsh as default shell if it's not already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as default shell..."
    chsh -s "$(which zsh)"
    echo "Please log out and log back in for the shell change to take effect."
fi

echo "Setup complete! Start a new terminal session or run 'exec zsh' to apply changes." 