#!/bin/bash

echo "Caps Adjust"

/usr/bin/setxkbmap -option 'caps:ctrl_modifier'
/usr/bin/xcape -e 'Caps_Lock=Escape'
