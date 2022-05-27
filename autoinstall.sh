#!/usr/bin/env bash
# Colors
RED='\033[1;31m'
NC='\033[0m' 
GRN='\033[0;32m'
YLW='\033[0;33m'

echo -e "${RED}Be aware${NC}
Running this script will cause irreversible changes by replacing your existing configuration files, it's not made for everyone, it's made to recreate my setup as simply as possible.\n"
read -p "Can i put my balls in your jaws? (y/n) " yn
case $yn in
	[yY] )	repodir="$( dirname -- "$0"; )"
		echo -e "\n${YLW}Putting balls in your jaws..."
		cp -r $repodir/{Documents,.local,.config,.zshrc} $HOME
		echo -e "${YLW}Updating fonts..."
		fc-cache -f
		echo -e "${YLW}Applying gnome-terminal settings..."
		dconf load /org/gnome/terminal/legacy/ < $repodir/gnome-terminal.dconf
		echo -e "${GRN}Everything done, enjoy 🥒";;
	* )	echo -e "${RED}Sadje :<";;
esac
