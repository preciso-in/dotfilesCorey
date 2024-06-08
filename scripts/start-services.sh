#! /usr/bin/env zsh

# Start yabai and skhd services
yabai --start-service
skhd --start-service

# Start apps in background
# -a is for opening apps stored in the /Applications folder. These apps cannot be opened without -a
open -a synergy

