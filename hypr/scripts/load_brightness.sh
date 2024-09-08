#!/usr/bin/env bash

echo "Exiting with status code 1 if brightness was never saved..."

[[ -f ~/.cache/hyprland_rice/brightness ]] || exit 1

echo "Setting brightness..."

percent_brightness=$(cat ~/.cache/hyprland_rice/brightness)

brightnessctl set "$percent_brightness" > /dev/null
