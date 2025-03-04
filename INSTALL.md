# Installation Instructions

## Prerequisites

### Required Dependencies
- zsh shell
- git
- GitHub CLI (gh)
- find utility
- xargs utility

### Optional Dependencies
- Zinit plugin manager (will be installed automatically)
- Powerlevel10k theme (will be installed automatically)

## Quick Install (Automated)

1. Clone the repository:
    
    git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
    cd ~/dotfiles

2. Run the setup script:
    
    chmod +x setup.sh
    ./setup.sh

The setup script will:
- Install required packages (zsh)
- Install Zinit if not present
- Create all necessary symlinks
- Source the new configuration

## Manual Installation

1. Install dependencies:

### On Ubuntu/Debian:
    
    # Update package list
    sudo apt-get update
    
    # Install core dependencies
    sudo apt-get install -y zsh git findutils curl
    
    # Install GitHub CLI
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh
    
    # Install Zinit dependencies
    sudo apt-get install -y curl wget git

2. Install Zinit:
    
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

3. Clone the repository:
    
    git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

4. Create symlinks:
    
    ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
    ln -sf ~/dotfiles/zsh/.zsh_github ~/.zsh_github
    ln -sf ~/dotfiles/zsh/.zsh_files ~/.zsh_files

5. Set zsh as default shell:
    
    chsh -s $(which zsh)

## Verification

1. Open a new terminal or reload your shell:
    
    exec zsh

2. Test git functions:
    
    gitinit --help

3. Test file management functions:
    
    mkfolders --help

## Troubleshooting

### Command not found
If you see "command not found" errors:
1. Verify symlinks are correct:
    
    ls -la ~/.zsh*

2. Make sure files are sourced in .zshrc:
    
    grep "source.*zsh_" ~/.zshrc

### Permission Issues
If you get permission errors:
1. Check file permissions:
    
    ls -l ~/dotfiles/zsh/

2. Fix if needed:
    
    chmod 644 ~/dotfiles/zsh/.zsh*

### GitHub CLI Issues
If GitHub functions fail:
1. Verify gh is installed:
    
    gh --version

2. Authenticate with GitHub:
    
    gh auth login

### Zinit Issues
If Zinit plugins aren't loading:
1. Verify Zinit is installed:
    
    ls -la ~/.local/share/zinit

2. Reinstall if needed:
    
    rm -rf ~/.local/share/zinit
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

## Post-Installation

1. Customize your .zshrc:
    - Modify Powerlevel10k configuration
    - Add additional Zinit plugins
    - Set custom aliases

2. Update your git configuration:
    
    git config --global user.name "Your Name"
    git config --global user.email "your@email.com"

## Updating

To update your installation:

    cd ~/dotfiles
    git pull
    ./setup.sh

## Uninstallation

To remove:

1. Restore original zsh configuration:
    
    mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

2. Remove symlinks:
    
    rm ~/.zsh_github ~/.zsh_files

3. Remove dotfiles:
    
    rm -rf ~/dotfiles

4. Optionally remove Zinit:
    
    rm -rf ~/.local/share/zinit 