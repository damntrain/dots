ZHOME=$HOME/.local/share/zsh/
# Zsh theme (prompt)
PROMPT='%(?.%F{green}>.%F{red}>)%f '
# Path & fpath
export PATH=$PATH:$HOME/.local/bin
# The following lines were added by compinstall
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' rehash true
#zstyle ':completion:*' completer _complete _ignored _files
zstyle ':completion:*' list-dirs-first true
zstyle :compinstall filename "$HOME/.zshrc"
# Use zsh buitin completer
autoload -Uz compinit
compinit
# Waiting dots, for "..." when slowly completing
# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
# History proporties
HISTFILE=~/.bash_history
# Note, saving zsh history in .bash_history may cause corrupted look when scrolling history insde bash
HISTSIZE=1000
SAVEHIST=1000
# IDRK what lines below stands for
setopt notify
setopt complete_aliases
setopt HIST_IGNORE_DUPS
setopt share_history
# Zle arrow-movement/etc
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
# Export something-else/etc
export EDITOR=micro
# command-line Editor and the keybind to it (press ctrl+x and ctrl+e)
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Plugins
# Addictional-completions (from bash)
. $ZHOME/zsh-bash-completions-fallback/zsh-bash-completions-fallback.plugin.zsh
# Almostontop
. $ZHOME/almostontop/almostontop.plugin.zsh
# Zsh-syntax-highlight
. $ZHOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto-notify
. $ZHOME/zsh-auto-notify/auto-notify.plugin.zsh
# Fishlike search
. $ZHOME/substring-search/zsh-history-substring-search.plugin.zsh
		bindkey '^[[A' history-substring-search-up
		bindkey '^[[B' history-substring-search-down