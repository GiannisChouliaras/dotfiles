#!/bin/bash

# Define the colors for Catppuccin Mocha theme
bg="#1e1e2e"        # Background color
fg="#d9e0ee"        # Foreground color
highlight="#c9a0f4" # Highlight color

# Launch dmenu with these custom settings
dmenu_run -nb $bg -nf $fg -sb $highlight -sf $fg -fn 'pango:CaskaydiaCove NF 13'
