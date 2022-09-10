local char='>'
if [[ "$container" != "" ]]
then
	getlogo () # You need nerd-fonts to be able to see this
	{
		source /etc/os-release
		case $ID in
			arch) logo=;;
			fedora) logo=;;
			centos) logo=;;
			alpine) logo=;;
			debian) logo=;;
			opensuse*) logo=;;
			ubuntu) logo=;;
		esac
		printf $logo
	}
	logo=$(getlogo)
	local char2="%K{magenta}%F{black} $logo  %k%f"
fi
if [[ "$TMUX" == "" ]]
then
	local pth='%K{white}%F{black} %~ %k%f'
fi

ZLE_RPROMPT_INDENT=0
PROMPT="%(?.%F{green}$char.%F{red}$char)%f "
RPROMPT="$pth$char2"
