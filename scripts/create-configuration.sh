#! /usr/bin/env zsh

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)

# Add the Homebrew zsh to allowed shells
echo "\nChanging default shell to Homebrew zsh"
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew zsh as default shell
chsh -s "$(brew --prefix)/bin/zsh"

# Change Scroll, Dock and Spotlight behaviour
./macOS.sh

# Add VSCode configuration
pushd ../vscode
./vscode-symlinks.sh
popd

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

# Add user and email details to global config
./git-setup.sh

# Add atuin config
mkdir -p $HOME/.config/atuin
ln -sf $DOTFILES_DIR/settings/atuin/config.toml $HOME/.config/atuin/config.toml

unset DOTFILES_DIR
unset SCRIPT_DIR
