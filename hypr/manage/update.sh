#!/usr/bin/env bash

source "$HOME/.config/hypr/lib.sh"

notify_flag=$1

notify_core () {
	if [[ $notify_flag == "--notify" ]]; then
		notify-send "Rice Update Manager" "$1" $2
	fi
}

notify () {
	notify_core "$1" ""
}

critical_notify () {
	notify_core "$1" "-u critical"
}

# If the user is still using legacy directories, upgrade them to symlinks! :D
for i in ${symlinks[@]}; do
    l_name="$(echo "$i" | cut -f1 -d ':')"
    real_path="$HOME/.config/hypr/symlinks/${l_name}"
    symlink_path="$(echo "$i" | cut -f2 -d ':')"

    do_symlink="no"

    if [[ -f "${symlink_path}/.hyprland_rice" ]]; then
        echo "Removing legacy directory... (${l_name})"
        notify "Removing legacy directory... (${l_name})"

        rm -rf "${symlink_path}"

        do_symlink="yes"
    else
        [[ -d "${symlink_path}" ]] || do_symlink="yes"
    fi

    if [[ "$do_symlink" == "yes" ]]; then
        echo "Found legacy directory! Upgrading to symlink... (${l_name})"
        notify "Upgrading legacy directory to symlink... (${l_name})"

        if ln -s "$real_path" "$symlink_path"; then
            echo "Successfully symlinked: '${l_name}'"
            notify "Successfully symlinked: ${l_name}"
        else
            echo "Failed to symlink: '${l_name}'"
            critical_notify "Failed to symlink: ${l_name}"

            exit 1
        fi
    fi
done

cd "$HOME/.config/hypr"
if git pull origin main; then
    echo "Successfully updated rice!"
    notify "Successfully updated rice!"
else
    echo "Failed to update rice!"
    critical_notify "Failed to update rice!"

    cd "$HOME"

    exit 1
fi

cd "$HOME"
