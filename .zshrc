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
alias brewrestartall="brew services restart --all"

# general
alias c="clear"
alias x="exit"
alias zc="lvim $HOME/.zshrc"
alias zr="source $HOME/.zshrc"
alias nvimc="nvim $HOME/.config/nvim"
alias lvimc="lvim $HOME/.config/lvim"
alias ..="cd .."

# speedtest alias
alias st="speedtest"

# ls alias to exa
alias ls="exa --icons"
alias lsa="exa -all --icons"

# cat to bat
alias cat="bat -pp"

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
alias dau="yadm add -u"
alias dc="yadm commit -m"
alias dp="yadm push"

# use lunarvim as editor for terminal
export EDITOR='lvim'

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

# Sketchybar interactivity overloads
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

# Fancy sketchybar commands
function margin () {
  if [ $1 = "on" ]; then
    yabai -m config top_padding 20
    sketchybar --animate sin 30 --bar margin=10 y_offset=10 corner_radius=9
  else
    yabai -m config top_padding 10
    sketchybar --animate sin 30 --bar margin=0 y_offset=0 corner_radius=0
  fi
}

function zen () {
  ~/.config/sketchybar/plugins/zen.sh $1
}
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
