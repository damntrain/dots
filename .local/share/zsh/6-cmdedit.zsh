# Command-line Editor and the keybind to it (press ctrl+x and ctrl+e)
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line