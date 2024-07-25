autoload -Uz colors && colors
setopt PROMPT_SUBST

export PATH="/opt/homebrew/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# OhMyZsh Plugins
plugins=(
    aliases
    git
    command-not-found
    docker-compose
    gcloud
    gh
    systemd
    terraform
    thefuck
    volta
    kubectl
)

# Load dotfiles:
for file in ~/.{aliases,envt_vars,functions,plugins,prompt_timer}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

source $ZSH/oh-my-zsh.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault
