for conf in "$HOME/.config/zsh/"*.zsh; do
    echo "sourcing ${conf}"
    source "${conf}"
done
unset conf
