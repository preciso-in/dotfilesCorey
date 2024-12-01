autoload -Uz colors && colors
setopt PROMPT_SUBST

# Define colors
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
RESET='\033[0m'

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
    zsh-syntax-highlighting
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# Load dotfiles:
for file in ~/.{aliases,envt_vars,functions,plugins,prompt}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault

# fzf configuration
# Ignores files in ~/.fdignore
# Starts search from HOME directory
export FZF_DEFAULT_COMMAND="fd --type f . $HOME"

# Print all functions in current session
echo -e "\n"
listFunctions