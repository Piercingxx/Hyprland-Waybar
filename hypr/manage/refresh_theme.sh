#!/usr/bin/env bash

mkdir ~/.cache/hyprland_rice > /dev/null 2>&1
mkdir ~/.cache/hyprland_rice/translated > /dev/null 2>&1

template_files=(
  "colors.conf : $HOME/.config/hypr/colors.conf : hyprland-conf"
  "hyprlock.conf : $HOME/.config/hypr/hyprlock.conf : hyprland-conf"
  "eww.scss : $HOME/.config/hypr/eww/eww.scss : scss"
  "waybar.css : $HOME/.config/hypr/waybar/style.css : css"
  "swaync.css : $HOME/.config/hypr/swaync/style.css : css"
  "alacritty.toml : $HOME/.config/hypr/symlinks/alacritty/alacritty.toml : toml"
  "rofi.rasi : $HOME/.config/hypr/symlinks/rofi/themes/generated.rasi : rasi"
  "rofi_config.rasi : $HOME/.config/hypr/symlinks/rofi/config.rasi : rasi"
  "kitty.conf : $HOME/.config/hypr/symlinks/kitty/kitty.conf : generic"
)

theme_path () {
  [[ -d ~/.cache/hyprland_rice/theme ]] || cp -r ~/.config/hypr/themes/gruvbox_dark ~/.cache/hyprland_rice/theme

  echo "$HOME/.cache/hyprland_rice/theme"
}

get_color () {
  theme_data="$(cat $(theme_path)/theme.txt)"

  ignore_char=""

  if [[ "$2" == "hyprland-conf" ]]; then
    ignore_char='#'
  fi

  final_color=$(echo $theme_data | sed 's/;/\n/g' | grep "\$$1 ->" | sed 's/ -> /:/g' | cut -f2 -d ":")

  if [[ "$ignore_char" == "" ]]; then
    echo $final_color
  else
    echo $final_color | sed "s/${ignore_char}//g"
  fi
}

translate_file () {
  echo "Template: '$1'"

  cat $1 > ~/.cache/hyprland_rice/translate_file_tmp

  color_keys=$(cat $(theme_path)/theme.txt | sed 's/;/\n/g' | sed 's/\$//g' | sed 's/ -> /:/g' | cut -f1 -d ":")

  s_left=""
  s_right=""

  if [[ "$3" == "scss" ]]; then
    s_left='$'
  elif [[ "$3" == "css" ]]; then
    s_left='@'
  elif [[ "$3" == "yml" ]]; then
    s_left='${'
    s_right='}'
  elif [[ "$3" == "toml" ]]; then
    s_left='${'
    s_right='}'
  elif [[ "$3" == "rasi" ]]; then
    s_left='${'
    s_right='}'
  elif [[ "$3" == "hyprland-conf" ]]; then
    s_left='%{'
    s_right='}'
  elif [[ "$3" == "generic" ]]; then
    s_left='${'
    s_right='}'
  fi

  for i in ${color_keys[@]}; do
    rm ~/.cache/hyprland_rice/temp_store > /dev/null 2>&1

    cat ~/.cache/hyprland_rice/translate_file_tmp | sed "s/${s_left}--${i}--${s_right}/$(get_color $i $3)/g" > ~/.cache/hyprland_rice/temp_store
    rm ~/.cache/hyprland_rice/translate_file_tmp
    cat ~/.cache/hyprland_rice/temp_store > ~/.cache/hyprland_rice/translate_file_tmp

    rm ~/.cache/hyprland_rice/temp_store > /dev/null 2>&1
  done

  mv ~/.cache/hyprland_rice/translate_file_tmp ~/.cache/hyprland_rice/translated/$(basename $1)
}

translate_file_fast () {
  echo "Template: '$1' (FAST)"

  oglo-hyprland-rice-theme-translate-rs --template $1 --generated $2 --language $3 --theme-txt $(theme_path)/theme.txt
}

tf_call () {
  template_file="$HOME/.config/hypr/templates/$1"

  if [[ -f "$(theme_path)/overwrite/$1" ]]; then
    template_file="$(theme_path)/overwrite/$1"
  fi

  if command -v oglo-hyprland-rice-theme-translate-rs > /dev/null 2>&1; then
    translate_file_fast $template_file $2 $3
  else
    translate_file $template_file $2 $3
  fi
}

for i in "${template_files[@]}"; do
  template_file=$(echo \"$i\" | sed 's/ : /:/g' | cut -f1 -d ':' | sed 's/"//g')
  generated_file=$(echo \"$i\" | sed 's/ : /:/g' | cut -f2 -d ':' | sed 's/"//g')
  translate_to=$(echo \"$i\" | sed 's/ : /:/g' | cut -f3 -d ':' | sed 's/"//g')

  tf_call $template_file $generated_file $translate_to
done

second_iteration="yes"

if command -v oglo-hyprland-rice-theme-translate-rs > /dev/null 2>&1; then
  second_iteration="no"

  echo "Skipping second iteration..."
fi

if [[ "$second_iteration" == "yes" ]]; then
  for i in "${template_files[@]}"; do
    template_file=$(echo \"$i\" | sed 's/ : /:/g' | cut -f1 -d ':' | sed 's/"//g')
    generated_file=$(echo \"$i\" | sed 's/ : /:/g' | cut -f2 -d ':' | sed 's/"//g')
    translate_to=$(echo \"$i\" | sed 's/ : /:/g' | cut -f3 -d ':' | sed 's/"//g')
  
    mv ~/.cache/hyprland_rice/translated/$template_file $generated_file
  done
fi

touch ~/.cache/hyprland_rice/theme_refreshed
