autoload -Uz colors && colors
setopt PROMPT_SUBST

# Load dotfiles:
for file in ~/.{zprofile,aliases,functions,envt_vars,plugins}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

source .oh-my-zsh/oh-my-zsh.sh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

# OhMyZsh Plugins
plugins=(git)
source $ZSH/oh-my-zsh.sh
