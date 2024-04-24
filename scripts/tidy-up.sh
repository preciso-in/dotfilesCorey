# Install volta
curl https://get.volta.sh | bash

vault -autocomplete-install 2>/dev/null

# Copy Yabai and skhd configs to .config
if ! [ -d $HOME/.config ]; then
  mkdir $HOME/.config
fi
SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_FOLDER=$(dirname $SCRIPT_DIR)
ln -sf $DOTFILES_FOLDER/settings/yabai $HOME/.config/yabai
ln -sf $DOTFILES_FOLDER/settings/skhd $HOME/.config/skhd

# Start yabai and skhd services
yabai --start-service
skhd --start-service
