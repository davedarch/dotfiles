# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load zinit
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Basic settings
setopt AUTO_CD              # Auto changes to a directory without typing cd
setopt CORRECT             # Command auto-correction
setopt INTERACTIVE_COMMENTS # Allow comments in interactive mode

# Load powerlevel10k theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Load essential plugins
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# Load additional useful plugins
zinit wait lucid for \
  hlissner/zsh-autopair \
  MichaelAquilina/zsh-you-should-use \
  djui/alias-tips

# Key bindings
bindkey '^[[A' up-line-or-search                # Up arrow
bindkey '^[[B' down-line-or-search              # Down arrow
bindkey '^[[H' beginning-of-line                # Home
bindkey '^[[F' end-of-line                      # End
bindkey '^[[3~' delete-char                     # Delete
bindkey '^[[1;5C' forward-word                  # Ctrl + right
bindkey '^[[1;5D' backward-word                 # Ctrl + left

# Useful aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias scz='source ~/.zshrc'  # Quick reload of zsh configuration

# Load custom functions and additional configurations
[[ -f ~/.zsh_files ]] && source ~/.zsh_files

# Load powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load GitHub shortcuts
[[ -f ~/.zsh_github ]] && source ~/.zsh_github

# Load pyenv  
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
