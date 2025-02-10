# Dotfiles

Personal configuration files and setup scripts for development environment.

## Structure

    dotfiles/
    ├── README.md
    ├── setup.sh
    ├── zsh/
    │   ├── .zshrc              # ZSH configuration
    │   └── .zsh_github         # Git/GitHub specific aliases and functions
    └── scripts/
        └── _shell-scripts/     # Custom shell scripts

## Installation

1. Clone the repository:

    git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
    cd ~/dotfiles

2. Run the setup script:

    chmod +x setup.sh
    ./setup.sh

## What the Setup Script Does

- Creates necessary symlinks
- Installs required packages (zsh, syntax highlighting)
- Installs Oh My Zsh if not present

## Symlinks Created

- `~/.zshrc` → `~/dotfiles/zsh/.zshrc`
- `~/.zsh_github` → `~/dotfiles/zsh/.zsh_github`

## Manual Setup Steps

1. Change your default shell to zsh:

    chsh -s $(which zsh)

2. Log out and log back in for the shell change to take effect

## Updating

To update your dotfiles on any machine:

    cd ~/dotfiles
    git pull
    ./setup.sh

## Components

- **ZSH Configuration**: Enhanced shell with Oh My Zsh
- **Git Aliases**: Custom git commands and shortcuts
- **Shell Scripts**: Various utility scripts

## Dependencies

- zsh
- Oh My Zsh
- zsh-syntax-highlighting
- git

## License

MIT License - feel free to use and modify as you like. 