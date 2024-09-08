#!/usr/bin/env bash

notif_name="Color Picker"

die () {
  echo "[ FATAL ]: $1" >&2
  notify-send -u critical "$notif_name" "$1"

  exit 1
}

command -v hyprpicker || die "Hyprpicker not found!"
command -v wl-copy || die "Command 'wl-copy' not found!"

hyprpicker -a || die "Hyprpicker failed!"

echo "Done."
