#!/usr/bin/env bash

############################ IMPORTANT ############################
# Common mistake: do not source any files! (They do not exist...) #
###################################################################

abort_on_existing () {
    fail_msg="Found existing file/directory, aborting... ($1)"

    if [[ -d "$1" ]]; then
        echo "$fail_msg"

        exit 1
    fi

    if [[ -f "$1" ]]; then
        echo "$fail_msg"

        exit 1
    fi
}

verify_dir () {
    [[ -d "$1" ]] || mkdir -p "$1"
}

# Verify availability for configuration.
abort_on_existing "$HOME/.config/hypr"

verify_dir "$HOME/.config"
cd "$HOME/.config"
if git clone https://gitlab.com/Oglo12/hyprland-rice.git hypr; then
    echo "Downloaded Hyprland configuration!"
else
    echo "Failed to download Hyprland configuration!"

    exit 1
fi

cd "$HOME"

echo "Installing Nerd Fonts..."

nerd_font="JetBrainsMono"
nerd_font_version="3.0.1"

mkdir -p $HOME/.fonts
cd $HOME/.fonts

wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v${nerd_font_version}/${nerd_font}.zip"

unzip "${nerd_font}.zip"

rm OFL.txt
rm readme.md
rm "${nerd_font}.zip"

fc-cache

echo " "

cd "$HOME"

echo "Done!"
