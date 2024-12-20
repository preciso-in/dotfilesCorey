#! /usr/bin/env zsh
echo -e "\n"

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)

# list of files/folders to symlink in ${homedir}
files=(
  aliases
  envt_vars
  fdignore
  functions
  plugins
  prompt
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
