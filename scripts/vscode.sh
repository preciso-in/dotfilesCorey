#!/usr/bin/env zsh
SCRIPT_DIR=$(dirname $(readlink -f "$0"))
DOTFILES_DIR=$(dirname $SCRIPT_DIR)

echo "\n\nInstalling VS Code extensions"

# Check if Homebrew's bin exists and if it's not already in the PATH
if [ -x "/opt/homebrew/bin/brew" ] && [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Install VS Code Extensions
extensions=(
    GitHub.copilot
    esbenp.prettier-vscode
    aaron-bond.better-comments
    formulahendry.auto-rename-tag
    naumovs.color-highlight
    craigb85.custom-window-zoom
    eamodio.gitlens
    hashicorp.terraform
    wix.vscode-import-cost
    orta.vscode-jest
    ritwickdey.liveserver
    ms-vscode.makefile-tools
    shd101wyy.markdown-preview-enhanced
    yoavbls.pretty-ts-errors
    humao.rest-client
    foxundermoon.shell-format
    gruntfuggly.todo-tree
    vscodevim.vim
    jeremyljackson.vs-docblock
    lucax88x.codeacejumper
)

# Get a list of all currently installed extensions.
installed_extensions=$(code --list-extensions)

for extension in "${extensions[@]}"; do
    if echo "$installed_extensions" | grep -qi "^$extension$"; then
        echo "$extension is already installed. Skipping..."
    else
        echo "Installing $extension..."
        code --install-extension "$extension"
    fi
done

echo "VS Code extensions have been installed."

# Define the target directory for VS Code user settings on macOS
VSCODE_USER_SETTINGS_DIR="${HOME}/Library/Application Support/Code/User/"

# Check if VS Code settings directory exists
if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then
    # Backup existing settings.json and keybindings.json, if they exist
    cp "${VSCODE_USER_SETTINGS_DIR}/settings.json" "${VSCODE_USER_SETTINGS_DIR}/settings.json.backup"
    cp "${VSCODE_USER_SETTINGS_DIR}/keybindings.json" "${VSCODE_USER_SETTINGS_DIR}/keybindings.json.backup"

    # Symlinkn VSCode settings
    ln -sf $DOTFILES_DIR/settings/VSCode-Settings.json $VSCODE_USER_SETTINGS_DIR/settings.json
    ln -sf $DOTFILES_DIR/settings/VSCode-Keybindings.json $VSCODE_USER_SETTINGS_DIR/keybindings.json

    echo "VS Code settings and keybindings have been updated."
else
    echo "VS Code user settings directory does not exist. Please ensure VS Code is installed."
fi

# Open VS Code to sign-in to extensions
code .
echo "Login to extensions (Copilot, Grammarly, etc) within VS Code."
echo "Press enter to continue..."
read

unset DOTFILES_DIR
unset SCRIPT_DIR
unset VSCODE_USER_SETTINGS_DIR
