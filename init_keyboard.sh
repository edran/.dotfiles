#!/bin/bash

echo "Setting Caps Lock to be both Esc and CTRL"
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'
