local char='>'
if [[ "$HOSTNAME" == "toolbox" ]]
then 
	local char2="%K{magenta}%F{black} ⬣  %k%f"
fi

if [[ "$TMUX" == "" ]]
then
	local pth='%K{white}%F{black} %~ %k%f'
fi

PROMPT="%(?.%F{green}$char.%F{red}$char)%f "
RPROMPT="$pth$char2"