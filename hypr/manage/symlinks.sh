#!/usr/bin/env bash

source "$HOME/.config/hypr/lib.sh"

for i in ${symlinks[@]}; do
    l_name="$(echo "$i" | cut -f1 -d ':')"
    real_path="$HOME/.config/hypr/symlinks/${l_name}"
    symlink_path="$(echo "$i" | cut -f2 -d ':')"

    [[ -d "${symlink_path}" ]] && continue
    [[ -f "${symlink_path}" ]] && continue

    echo "Symlinking '${l_name}' to: '${symlink_path}'"

    if ln -s "$real_path" "$symlink_path"; then
        echo "Successfully symlinked: '${l_name}'"
    else
        echo "Failed to symlink: '${l_name}'"

        cd "$HOME"

        exit 1
    fi
done

cd "$HOME"
