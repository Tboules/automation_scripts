#!/bin/bash

i3-msg "workspace 1; exec --no-startup-id firefox; exec --no-startup-id alacritty"
sleep 0.1
i3-msg "workspace 2; exec --no-startup-id firefox"
sleep 0.1
i3-msg "workspace 7; exec --no-startup-id flatpak run md.obsidian.Obsidian"
