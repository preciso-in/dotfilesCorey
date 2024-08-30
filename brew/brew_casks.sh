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
    "whatsapp"
    "xnviewmp"

    # Virtualisation
    "utm"
    "docker"

    # Needs Password
    "microsoft-onenote"
    "microsoft-remote-desktop"

    # For Logitech G604
    # Do not use On Board Memory Option for G604. It does not work.
    #"logitech-g-hub"

    # For Karabiner-Elements
    "karabiner-elements"

    # Windows like Alt + Tab
    "alt-tab"

    # R Studio
    "rstudio"

    # VirtualBox
    # "virtualbox"
    # Does not work. Only Dev preview version available that was released in Mar '23

)
