########################
# Essential internals #
#######################

# Home for plugins and other stuff, the main directory is used for essential/main parts, these parts will be loaded automatically by loadatstart function if they are named correctly, subdirectories are used for additional plugins, those plugins should be loaded manually by loadplug
	ZHOME=$HOME/.local/share/zsh/

# Functions
	loadatstart () # Load any file with .zsh extension in $ZHOME root folder (files in subfolders are not included), used to load essential parts, to modify order of sourcing you should modify filenames in $ZHOME
	{
		for file in $ZHOME/*.zsh
		do
			source $file
		done
	}

	loadplug () # To load plugins located in $ZHOME manually, used to load additional plugins from $ZHOME subfolders
	{
		local plug=("$@")
		source $ZHOME/$plug
	}

	completions () # Bahaviour of completion system, declared as a function in order to manage order of loading in running part of the script.
	{
		zstyle ':completion:*:matches'         group 'yes'
		zstyle ':completion:*'                 group-name ''
		zstyle ':completion:*' completer _expand _complete _ignored _approximate
		zstyle ':completion:*' list-colors ''
		zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
		zstyle ':completion:*' menu select=1
		zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
		zstyle ':completion:*' rehash true
		zstyle ':completion:*' list-dirs-first true
		zstyle :compinstall filename "$HOME/.zshrc" 
		autoload -Uz compinit
		compinit
		# The following lines were added by compinstall	
	}

#####################################################
# The main, actually running part of this rc-script #
#####################################################
completions
# Autumatically load essentials
loadatstart
# Addictional-completions (from bash)
loadplug zsh-bash-completions-fallback/zsh-bash-completions-fallback.plugin.zsh
# Almostontop
loadplug almostontop/almostontop.plugin.zsh
# Zsh-syntax-highlight
loadplug zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto-notify
loadplug zsh-auto-notify/auto-notify.plugin.zsh
# Fishlike search
loadplug substring-search/zsh-history-substring-search.plugin.zsh
		bindkey '^[[A' history-substring-search-up
		bindkey '^[[B' history-substring-search-down