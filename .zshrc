[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "esc/conda-zsh-completion"
plug "jeffreytse/zsh-vi-mode"
plug "zsh-users/zsh-syntax-highlighting"

# Theme
plug "zap-zsh/zap-prompt"

# Aliases

# brew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# general
alias config="lvim $HOME/.zshrc"
alias reload="source $HOME/.zshrc"
alias viconfig="lvim $HOME/.config/nvim"
alias lvimconfig="lvim $HOME/.config/lvim"

# ls alias to exa
alias ls="exa --icons"
alias lsa="exa -all --icons"

# tmux alias
alias tmn="tmux new -s"
alias tma="tmux attach -t"
alias tmd="tmux detach"
alias tmxa="tmux kill-session"
alias tmx="tmux kill-session -t"
alias tmls="tmux ls"

# git alias
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"

# yadm alias for dot files
alias ds="yadm status"
alias da="yadm add"
alias daa="yadm add ."
alias dc="yadm commit -m"
alias dp="yadm push"

# use lunarvim as editor for terminal
export EDITOR='lvim'

# bun completions
[ -s "/Users/kyle/.bun/_bun" ] && source "/Users/kyle/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/kyle/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# auto jump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

