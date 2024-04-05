#!/usr/bin/env zsh

brew tap hashicorp/tap

# Define an array of applications to install using Homebrew Cask.
cask_apps=(
    # Browsers
    "google-chrome"
    "firefox"
    "arc"
    "opera"

    # Terminals / SDKs / IDEs
    "warp"
    "google-cloud-sdk"
    "sourcetree"
    "visual-studio-code"
    "iterm2"
    "postman"

    # Media
    "vlc"
    "anki"
    "obsidian"
    "microsoft-onenote"
    "whatsapp"
    "microsoft-remote-desktop"

    # Virtualisation
    "utm"
    "docker"
)
