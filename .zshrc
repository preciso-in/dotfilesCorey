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
plugins=(git)
source $ZSH/oh-my-zsh.sh

# atuin & fzf
# OhMyZsh overrides plugins if not placed here
source .plugins
