#!/usr/bin/env bash

echo Please provide a new for for I3wm
read NEW_FONT

if [ -z "$NEW_FONT" ]; then
	echo "Error: please provide a font"
	exit 1
fi

CONFIG_FILE_PATH=$HOME/Documents/dotfiles/i3/.config/i3/config

CURRENT_FONT=$(grep "font pango:" $CONFIG_FILE_PATH | grep -v "#" | awk -F: '{print $2}' | cut -d' ' -f1-3)

sed -i "s/$CURRENT_FONT/$NEW_FONT/" $CONFIG_FILE_PATH

echo "Great Success!!"
