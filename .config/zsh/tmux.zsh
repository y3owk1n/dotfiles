# Always work in a tmux session if tmux is installed
# https://github.com/chrishunt/dot-files/blob/master/.zshrc
if which tmux 2>&1 >/dev/null; then
    if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
        # Get the list of tmux sessions
        sessions=$(tmux list-sessions 2> /dev/null)
        if [ -n "$sessions" ]; then
            # If sessions exist, attach to the first one
            first_session=$(echo "$sessions" | awk -F: '{print $1}' | head -n 1)
            tmux attach-session -t "$first_session"
        else
            # If no sessions exist, create and attach to "Hack"
            tmux new-session -s Hack
        fi
    fi
fi
