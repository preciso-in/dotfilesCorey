autoload -Uz colors && colors
setopt PROMPT_SUBST

# Load dotfiles:
for file in ~/.{zprompt,aliases,functions,envt_vars}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# atuin remapping for "ctrl + r" and "up arrow"
eval "$(atuin init zsh)"

# Add fzf key bindings to shell
# https://github.com/junegunn/fzf?tab=readme-ov-file#key-bindings-for-command-line
eval "$(fzf --zsh)"
