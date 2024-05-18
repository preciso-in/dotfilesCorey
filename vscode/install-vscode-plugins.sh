#!/usr/bin/env zsh

echo "\n\nInstalling VS Code extensions"

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

unset extensions
unset installed_extensions
unset extension

# Notes
# wix.vscode-import-cost causes very high CPU utilistaion
