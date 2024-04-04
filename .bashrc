# If not running interactively, exit script
[[ $- != *i* ]] && return

# Load dotfiles:
for file in ~/.{bash_prompt,aliases,private,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;