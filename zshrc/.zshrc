# Shell formatting
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Oh My Zsh plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Environment settings
export LANG=en_US.UTF-8
export EDITOR=/opt/homebrew/bin/nvim
export VIMRUNTIME="/opt/homebrew/share/nvim/runtime"
export XDG_CONFIG_HOME="/Users/veronelazio/.config"
export NIX_CONF_DIR="/Users/veronelazio/.config/nix"

# Nushell configuration
export NUSHELL_CONFIG_DIR="$XDG_CONFIG_HOME/nushell"
mkdir -p ~/.cache/starship
mkdir -p ~/.cache/carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'

# History configuration
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Key bindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# Directory aliases
alias dev="cd ~/Developer"
alias exp="cd ~/Developer/Experiments"
alias pub="cd ~/Developer/Public"
alias pri="cd ~/Developer/Private"
alias learn="cd ~/Developer/Learning"

alias extdev="cd /Volumes/X10\ Pro/Developer"
alias extexp="cd /Volumes/X10\ Pro/Developer/Experiments"
alias extpub="cd /Volumes/X10\ Pro/Developer/Public"
alias extpri="cd /Volumes/X10\ Pro/Developer/Private"
alias extlearn="cd /Volumes/X10\ Pro/Developer/Learning"

# Git aliases
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker aliases
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Modern CLI tools
alias ls="eza --icons=always"
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"
alias cat=bat
alias cl='clear'

# Navigation helpers
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

# FZF configuration
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path configurations
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/Applications/SnowSQL.app/Contents/MacOS:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Perl configuration
PATH="/Users/veronelazio/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/veronelazio/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/veronelazio/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/veronelazio/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/veronelazio/perl5"; export PERL_MM_OPT;

# Source additional configurations
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
eval "$(starship init zsh)"
export STARSHIP_CONFIG="/Users/veronelazio/.config/starship/starship.toml"

# Zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"

# Additional shell enhancements
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"

# Nushell aliases and functions
alias nushell='nu'
function nu-config() {
    mkdir -p "$NUSHELL_CONFIG_DIR"
    cp nushell/config.nu "$NUSHELL_CONFIG_DIR/config.nu"
    cp nushell/env.nu "$NUSHELL_CONFIG_DIR/env.nu"
    echo "Nushell configuration files copied to $NUSHELL_CONFIG_DIR"
}

# Custom application aliases
alias brave-optimized='/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser --process-per-site --disk-cache-size=104857600'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
