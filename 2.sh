#!/bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)

# Checks for active network connection
if [[ -n "$(command -v nmcli)" && "$(nmcli -t -f STATE g)" != connected ]]; then
  awk '{print}' <<<"Network connectivity is required to continue."
  exit
fi

# Installs
paru -Syu

flatpak install flathub com.mattjakeman.ExtensionManager -y
paru -S waterfox --noconfirm
paru -S pacseek --noconfirm

# Hyprland Everything
paru -S hyprland-meta-git --noconfirm

#Screenshot
paru -S hyprshot --noconfirm

#Clipboard Manager
paru -S cliphist --noconfirm
paru -S wl-clipboard --noconfirm
#paru -S eww --noconfirm

#Gnome customization tool
paru -S dconf --noconfirm

#Monitor locator
paru -S nwg-displays --noconfirm

# Waybar
paru -S waybar --noconfirm

# Menus
paru -S nwg-drawer --noconfirm
paru -S fuzzel --noconfirm
#paru -S yad --noconfirm
paru -S wlogout --noconfirm
paru -S libdbusmenu-gtk3 --noconfirm

# Notifications
paru -S libnotify --noconfirm
paru -S notification-daemon --noconfirm
paru -S swaync --noconfirm

# File Explorer
#paru -S xplr --noconfirm
paru -S ranger --noconfirm
paru -S nautilus --noconfirm
paru -S nautilus-renamer --noconfirm
paru -S nautilus-open-any-terminal --noconfirm
paru -S code-nautilus-git --noconfirm

#Wallpaper
paru -S swww --noconfirm

# Allows keybindings to dynamically change the color temperature and software brightness
paru -S wl-gammarelay --noconfirm
paru -S brightnessctl --noconfirm
paru -S light --noconfirm

# Audio
paru -S pamixer --noconfirm
paru -S cava --noconfirm
paru -S wireplumber --noconfirm
paru -S playerctl --noconfirm
#paru -S sox --noconfirm
# Pulse Audio Volume Control
paru -S pavucontrol --noconfirm

# Network and Bluetooth
paru -S networkmanager --noconfirm
paru -S network-manager-applet --noconfirm
paru -S bluez --noconfirm
paru -S bluez-uti --noconfirm
paru -S blueman --noconfirm


# Packages replaced by hyprland-meta-git
#paru -S hyprlock --noconfirm
#paru -S hypridle --noconfirm
#paru -S hyprpicker --noconfirm
#paru -S aquamarine-git --noconfirm
#paru -S hyprcursor-git --noconfirm
#paru -S hyprgraphics-git --noconfirm
#paru -S hyprland --noconfirm
#paru -S hyprpaper --noconfirm
#paru -S hyprlang-git --noconfirm
#paru -S hyprlang-protocols-git --noconfirm
#paru -S hyprutils-git --noconfirm
#paru -S hyprland-qtutils-git --noconfirm
#paru -S hyprwayland-scanner-git --noconfirm
#paru -S xdg-desktop-portal --noconfirm
#paru -S xdg-desktop-portal-gtk --noconfirm
#paru -S xdg-desktop-portal-hyprland --noconfirm
#paru -S qt5-wayland --noconfirm

# Not Needed
#paru -S lxsession --noconfirm
#paru -S glaze --noconfirm

# Youtube Music TUI (neat but not practical)
# paru -S youtui --noconfirm

# GUI Interface to Customize Icons and Cursors and Stuff
paru -S nwg-look --noconfirm

# Fonts & Icons & Cursors
mkdir -p $HOME/.fonts
chmod -R u+x $HOME/.fonts
chown -R "$username":"$username" $HOME/.fonts
cd $HOME/.fonts || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip
rm Firacode.zip
rm Meslo.zip
cd "$builddir" || exit
paru -S papirus-icon-theme --noconfirm
paru -S ttf-firacode --noconfirm
paru -S awesome-terminal-fonts --noconfirm
paru -S ttf-ms-fonts --noconfirm
paru -S terminus-font-ttf --noconfirm
paru -S noto-color-emoji-fontconfig --noconfirm
paru -S wtype-git --noconfirm
paru -S xcursor-simp1e-gruvbox-light --noconfirm


# Applications
paru -S mpv --noconfirm
paru -S gimp-devel --noconfirm
paru -S discord --noconfirm
paru -S synochat --noconfirm
paru -S synology-drive --noconfirm
paru -S visual-studio-code-bin --noconfirm
paru -S github-desktop-bin --noconfirm
paru -S mission-center --noconfirm
paru -S obsidian --noconfirm
paru -S libreoffice-fresh --noconfirm
paru -S blender --noconfirm
#flatpak install flathub org.gnome.SimpleScan -y



# Davinci Resolve Dependencies 
pacman -S libpng12 lib32-libpng12 ocl-icd openssl-1.0 opencl-driver qt5-websockets --noconfirm


# Gimp dotfiles
git clone https://github.com/Piercingxx/gimp-dots.git
chmod -R u+x gimp-dots
chown -R "$username":"$username" gimp-dots
rm -rf /home/"$username"/.var/app/org.gimp.GIMP/config/GIMP/*
rm -rf /home/"$username"/.config/GIMP/*
cd gimp-dots/Gimp || exit
cp -R 3.0 /home/"$username"/.var/app/org.gimp.GIMP/config/GIMP/
cp -R 3.0 /home/"$username"/.config/GIMP/
cd "$builddir" || exit


# Dynamic Cursor
hyprpm update
hyprpm reload
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm add https://github.com/virtcode/hypr-dynamic-cursors
hyprpm enable dynamic-cursors
hyprpm enable hyprtrails


# Fuzzmoji
git clone https://codeberg.org/codingotaku/fuzzmoji.git
cd fuzzmoji
sudo mkdir -p /usr/share/fuzzmoji/emoji-list
sudo cp emoji-list /usr/share/fuzzmoji/emoji-list
sudo cp fuzzmoji /usr/bin/fuzzmoji
cd ..
sudo rm -R fuzzmoji



# Used for fstab
mkdir -p /media/Working-Storage
mkdir -p /media/Archived-Storage
chown "$username":"$username" /home/"$username"/media/Archived-Storage
chown "$username":"$username" /home/"$username"/media/Working-Storage


#Docker 
sudo wget https://download.docker.com/linux/static/stable/x86_64/docker-27.2.1.tgz -qO- | tar xvfz - docker/docker --strip-components=1
sudo mv ./docker /usr/local/bin
##Download the latest from https://docs.docker.com/desktop/release-notes/
sudo pacman -U ./docker-desktop-x86_64.pkg.tar.zst
#AI 
curl -fsSL https://ollama.com/install.sh | sh
ollama pull gemma2
ollama pull mistral-nemo
#OpenWebUi
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main



