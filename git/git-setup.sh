#!/bin/bash

# Source the zsh_github file to get access to the functions
source "$HOME/.zsh_github"

echo "🚀 Initializing new Git repository and pushing to GitHub..."

# Initialize git repository
gitinit

# Create GitHub repository with current directory name
githubcreate

# Add all files and commit with timestamp
gitaddall

# Push to GitHub with upstream tracking
gitpush

echo "✨ Setup complete! Your repository is now on GitHub." 