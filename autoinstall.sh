#!/usr/bin/env zsh
print "Be aware that running this script will destroy your existing setup (your .zshrc, neofetch config, gnome-terminal preferences, and so on) and will install ubuntu fonts, it's not made to be interactive, it's made to recreate my setup as simply as possible"
read -p "Can i put my balls in your jaws? (y/n) " yn
case $yn in
	y )	repodir="$( dirname -- "$0"; )"
		print "Putting things where they should be"
		cp -r $repodir/{Documents,.local,.config,.zshrc} $HOME
		print "Updating fonts"
		fc-cache -f
		print "applying gnome-terminal settings, be aware that it will destroy your current gnome-terminal settings"
		dconf load /org/gnome/terminal/legacy/ < $repodir/gnome-terminal.dconf
		print "Everything done, enjoy 🥒"
	n )	print "Sadje :<"
	* )	print "Sadje :<"
esac
