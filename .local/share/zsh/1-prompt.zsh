if [[ "$HOSTNAME" == "toolbox" ]]
then 
PROMPT='%(?.%F{blue}•.%F{red}•)%f '
else
PROMPT='%(?.%F{green}>.%F{red}>)%f '
fi