#!/usr/bin/env bash

#while IFS= read -r i; do
#  echo "$i"
#done < $HOME/.hyprland_rice/themes.txt

rm ~/.cache/hyprland_rice/theme_list.txt > /dev/null 2>&1

if [[ "$1" == "" ]]; then
  theme_categ=$(echo -e "All\nBuilt-In\nExtra Built-In\nCustom" | rofi -dmenu -p " 󰉼  Categories ")
  
  echo "Chosen Category: $theme_categ"
  
  if [[ $theme_categ == "All" ]]; then
    cat $HOME/.config/hypr/themes/themes.txt $HOME/.config/hypr/extra_themes/themes.txt $HOME/.hyprland_rice/themes.txt > $HOME/.cache/hyprland_rice/theme_list.txt
  elif [[ $theme_categ == "Built-In" ]]; then
    cat $HOME/.config/hypr/themes/themes.txt > $HOME/.cache/hyprland_rice/theme_list.txt
  elif [[ $theme_categ == "Extra Built-In" ]]; then
    cat $HOME/.config/hypr/extra_themes/themes.txt > $HOME/.cache/hyprland_rice/theme_list.txt
  elif [[ $theme_categ == "Custom" ]]; then
    cat $HOME/.hyprland_rice/themes.txt > $HOME/.cache/hyprland_rice/theme_list.txt
  else
    echo "Invalid category."
    exit 1
  fi
fi

key_to_value () {
  cat $HOME/.cache/hyprland_rice/theme_list.txt | grep "\$$1 ->" | sed 's/\$//g' | sed 's/ -> /\$/g' | cut -f2 -d "\$" | sed 's/;//g'
}

theme_path=""

if [[ "$1" == "" ]]; then
  chosen_theme="$(cat $HOME/.cache/hyprland_rice/theme_list.txt | sed 's/\$//g' | sed 's/ -> /\$/g' | cut -f1 -d "\$" | rofi -dmenu -p " 󰉼  Themes ")"
  
  theme_path=$(key_to_value "$chosen_theme")
  theme_path=$(eval "echo $theme_path")
else
  theme_path="$1"
fi

notify-send "Theme Chooser" "Setting theme... please wait..."

rm -rf ~/.cache/hyprland_rice/theme > /dev/null 2>&1

cp -r "$theme_path" "$HOME/.cache/hyprland_rice/theme"

rm ~/.cache/hyprland_rice/theme_path.txt > /dev/null 2>&1
echo "$theme_path" > ~/.cache/hyprland_rice/theme_path.txt

rm ~/.cache/hyprland_rice/theme_refresh_id.txt > /dev/null 2>&1

if [[ -f ~/.config/hypr/templates/refresh_id ]]; then
  cp ~/.config/hypr/templates/refresh_id ~/.cache/hyprland_rice/theme_refresh_id.txt
else
  echo 'null' > ~/.cache/hyprland_rice/theme_refresh_id.txt
fi

~/.config/hypr/manage/refresh_theme.sh
~/.config/hypr/scripts/refresh_after_theme_change.sh

notify-send "Theme Chooser" "Set theme! Enjoy! <3"
