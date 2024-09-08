#!/usr/bin/env bash

symlinks=(
    "alacritty:$HOME/.config/alacritty"
    "kitty:$HOME/.config/kitty"
    "rofi:$HOME/.config/rofi"
)

set_wallpaper () {
	swww img "$1" -t grow --transition-pos center
}

run_hook () {
    chmod +x "$HOME/.hyprland_rice/autostart_$1"
	$HOME/.hyprland_rice/autostart_$1
}

eww-rice () {
	eww --config ~/.config/hypr/eww/ $*
}
