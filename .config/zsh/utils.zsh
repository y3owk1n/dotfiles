# Load and initialise completion system
autoload -Uz compinit
compinit

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

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
