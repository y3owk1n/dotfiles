# ZSH Files

## Source everything in this file

```bash
for conf in "$HOME/.config/zsh/"*.zsh; do
    echo "sourcing ${conf}"
    source "${conf}"
done
unset conf
```

## Some alias not working

Make sure to organize the file sequence during sourcing with numbering, e.g. supercharge plugin will overwrite ls command.

- [supercharge issue](https://github.com/zap-zsh/exa/issues/3)
