autoload -Uz colors && colors
setopt PROMPT_SUBST

# Load dotfiles:
for file in ~/.{zprofile,aliases,functions,envt_vars,plugins}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
