#!/usr/bin/env bash

echo "Saving brightness..."

percent_brightness=$(brightnessctl info | grep "Current brightness:" | cut -f4 -d " " | sed 's/(//g' | sed 's/)//g')

rm ~/.cache/hyprland_rice/brightness > /dev/null 2>&1
echo "$percent_brightness" > ~/.cache/hyprland_rice/brightness
