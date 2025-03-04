#!/bin/bash

echo "🚀 Initializing new Git repository and pushing to GitHub..."

# Check if we're in the test folder
if [[ "$(basename "$(pwd)")" == "testgit2" ]]; then
    echo "Testing in folder 'testgit2'..."
    
    # Source the zsh_github file to get access to the functions
    if [[ -f "$HOME/.zsh_github" ]]; then
        source "$HOME/.zsh_github"
    else
        echo "❌ Error: $HOME/.zsh_github file not found!"
        echo "Please make sure the file exists before running this script."
        exit 1
    fi
    
    # Initialize git repository
    gitinit
    
    # Switch to main branch before any commits
    gitbmain
    
    # Create GitHub repository with current directory name
    githubcreate
    
    # Add all files and commit with timestamp
    # But modify to not push yet
    git add .
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "Update: $timestamp"
    
    # Push to GitHub with upstream tracking
    gitpush
    
    echo "✨ Setup complete! Your repository is now on GitHub."
else
    # Regular execution for non-test folders
    # Source the zsh_github file to get access to the functions
    if [[ -f "$HOME/.zsh_github" ]]; then
        source "$HOME/.zsh_github"
    else
        echo "❌ Error: $HOME/.zsh_github file not found!"
        echo "Please make sure the file exists before running this script."
        exit 1
    fi
    
    # Initialize git repository
    gitinit
    
    # Switch to main branch before any commits
    gitbmain
    
    # Create GitHub repository with current directory name
    githubcreate
    
    # Add all files and commit with timestamp
    # But modify to not push yet
    git add .
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "Update: $timestamp"
    
    # Push to GitHub with upstream tracking
    gitpush
    
    echo "✨ Setup complete! Your repository is now on GitHub."
fi 