#!/usr/bin/env bash

$HOME/.config/hypr/scripts/refresh_face.sh

pidof hyprlock || hyprlock & disown
