#! /usr/bin/env zsh

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)
echo "DOTFILES_DIR: $DOTFILES_DIR"

# list of files/folders to symlink in ${homedir}
files=(
  aliases
  envt_vars
  functions
  plugins
  prompt_timer
  zshrc
)

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
  unlink $HOME/.$file
  echo "Creating symlink to $file in home directory."
  ln -sf "${SCRIPT_DIR}/.${file}" "${HOME}/.${file}"
done

# create symlinks for scripts folder
unlink $HOME/scripts
ln -sf $DOTFILES_DIR/scripts $HOME/scripts

unset SCRIPT_DIR
unset DOTFILES_DIR
