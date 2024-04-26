#! /usr/bin/env zsh
SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)

# Symlink Yabai and skhd configs to .config
if ! [ -d $HOME/.config ]; then
  mkdir -p $HOME/.config/{skhd,yabai}
fi

if [ -L $HOME/.config/yabai ]; then
  unlink $HOME/.config/yabai
fi

ln -sf $DOTFILES_DIR/settings/yabai $HOME/.config/yabai

if [ -L $HOME/.config/skhd ]; then
  unlink $HOME/.config/skhd
fi
ln -sf $DOTFILES_DIR/settings/skhd $HOME/.config/skhd

# Start yabai and skhd services
yabai --start-service
skhd --start-service

unset DOTFILES_DIR
unset SCRIPT_DIR
