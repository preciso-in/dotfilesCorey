#!/usr/bin/env zsh

echo "\n\nInstalling VS Code extensions"

# Install VS Code Extensions
extensions=(
    GitHub.copilot
    aaron-bond.better-comments
    craigb85.custom-window-zoom
    eamodio.gitlens
    esbenp.prettier-vscode
    formulahendry.auto-rename-tag
    foxundermoon.shell-format
    gruntfuggly.todo-tree
    hashicorp.terraform
    humao.rest-client
    jeremyljackson.vs-docblock
    lucax88x.codeacejumper
    moshfeu.compare-folders
    ms-azuretools.vscode-docker
    ms-vscode.makefile-tools
    naumovs.color-highlight
    orta.vscode-jest
    ritwickdey.liveserver
    shd101wyy.markdown-preview-enhanced
    skellock.just
    steoates.autoimport
    supermaven.supermaven
    vscodevim.vim
    yoavbls.pretty-ts-errors
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
# wix.vscode-import-cost causes very high CPU utilisation
