autoload -Uz colors && colors
setopt PROMPT_SUBST

# Load dotfiles:
for file in ~/.{aliases,functions,envt_vars}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

source $HOME/.oh-my-zsh/oh-my-zsh.sh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# OhMyZsh Plugins
plugins=(aliases git command-not-found docker-compose gcloud gh systemd terraform thefuck volta)
source $ZSH/oh-my-zsh.sh

# atuin & fzf
# OhMyZsh overrides plugins if not placed here
source .plugins

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault
