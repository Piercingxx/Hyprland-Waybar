#!/usr/bin/env bash

# Your dad left with the milk, btw.

source "$HOME/.config/hypr/lib.sh"

for i in ${symlinks[@]}; do
    l_name="$(echo "$i" | cut -f1 -d ':')"
    link_path="$(echo "$i" | cut -f2 -d ':')"

    if unlink "${link_path}"; then
        echo "Unlinked: '${l_name}'"
    else
        echo "Failed to unlink: '${l_name}'"

        exit 1
    fi
done

if rm -rf "$HOME/.config/hypr"; then
    echo "Successfully removed rice!"
else
    echo "Failed to remove rice!"

    exit 1
fi
