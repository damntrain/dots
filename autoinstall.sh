#!/usr/bin/env sh
repodir="$( dirname -- "$0"; )"
cp -r $repodir/{Documents,.local,.config,.zshrc} $HOME
fc-cache -f
dconf load /org/gnome/terminal/legacy/ < $repodir/gnome-terminal.dconf