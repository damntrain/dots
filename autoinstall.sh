#!/usr/bin/env bash
echo "Be aware that running this script will destroy your existing setup (your .zshrc, neofetch config, gnome-terminal preferences, and so on) and will install ubuntu fonts, it's not made to be interactive, it's made to recreate my setup as simply as possible"
read -p "Can i put my balls in your jaws? (y/n) " yn
case $yn in
	y )	repodir="$( dirname -- "$0"; )"
		echo "Putting balls in your jaws"
		cp -r $repodir/{Documents,.local,.config,.zshrc} $HOME
		echo "Updating fonts"
		fc-cache -f
		echo "Applying gnome-terminal settings"
		dconf load /org/gnome/terminal/legacy/ < $repodir/gnome-terminal.dconf
		echo "Everything done, enjoy 🥒";;
	n )	echo "Sadje :<";;
	* )	echo "Sadje :<";;
esac