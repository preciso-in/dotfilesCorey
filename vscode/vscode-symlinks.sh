#! /usr/bin/env zsh

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)

# Define the target directory for VS Code user settings on macOS
VSCODE_USER_SETTINGS_DIR="${HOME}/Library/Application Support/Code/User"

# Check if VS Code settings directory exists
if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
  # Symlinkn VSCode settings
  ln -sf $DOTFILES_DIR/settings/VSCode-Settings.json $VSCODE_USER_SETTINGS_DIR/settings.json
  ln -sf $DOTFILES_DIR/settings/VSCode-Keybindings.json $VSCODE_USER_SETTINGS_DIR/keybindings.json

  echo "VS Code settings and keybindings have been updated."
else
  echo "VS Code user settings directory does not exist. Please ensure VS Code is installed."
fi

unset DOTFILES_DIR
unset SCRIPT_DIR
unset VSCODE_USER_SETTINGS_DIR
