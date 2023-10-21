# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "esc/conda-zsh-completion"
plug "jeffreytse/zsh-vi-mode"
plug "olets/zsh-window-title"

# Load and initialise completion system
autoload -Uz compinit
compinit

# alias

# general
alias c="clear"
alias x="exit"
alias zc="nvim $HOME/.zshrc"
alias zr="source $HOME/.zshrc"
alias nvimc="cd $HOME/.config/nvim && nvim ."
alias ..="cd .."
alias ...="cd ../.."

# obsidian folder
alias obs-kyle="cd $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Kyle/ && nvim ."
alias obs-traworld="nvim $HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Kyle Traworld/"

# brew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# ls alias to exa
alias ls="lsd -a"
alias lsa="lsd -la"

# cat to bat
alias cat="bat -pp"

# ollama
alias chat="ollama run mistral"

export EDITOR='nvim'

# ls after cd
if ! (( $chpwd_functions[(I)chpwd_cdls] )); then
    chpwd_functions+=(chpwd_cdls)
fi
function chpwd_cdls() {
    if [[ -o interactive ]]; then
        emulate -L zsh
        ls
    fi
}

# lazy git
alias gg="lazygit"

# Paths
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export PATH=$(pyenv root)/shims:$PATH

# pnpm
export PNPM_HOME="/Users/kylewong/Library/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
