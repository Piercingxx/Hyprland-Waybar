#!/usr/bin/env bash

face_path=""

if [[ -f $HOME/.hyprland_rice/face.png ]]; then
  echo "Using user's face..."

  face_path="$HOME/.hyprland_rice/face.png"
else
  echo "Using default face..."

  face_path="$HOME/.config/hypr/assets/default_face.png"
fi

echo "Refreshing face..."

[[ -f $HOME/.cache/hyprland_rice/face.png ]] && rm $HOME/.cache/hyprland_rice/face.png

to_path="$HOME/.cache/hyprland_rice/face.png"

cp "$face_path" "$to_path"

echo "Done!"
