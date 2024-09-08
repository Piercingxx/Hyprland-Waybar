#!/usr/bin/env bash

source ~/.config/hypr/lib.sh

swaync-client -rs > /dev/null 2>&1

~/.config/hypr/waybar/start > /dev/null 2>&1
~/.config/hypr/eww/start > /dev/null 2>&1

set_wallpaper ~/.cache/hyprland_rice/theme/wallpaper.png

hyprctl reload
