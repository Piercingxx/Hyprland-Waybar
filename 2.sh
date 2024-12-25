#!/bin/bash


# Installs


flatpak install flathub com.mattjakeman.ExtensionManager -y
paru -S waterfox --noconfirm

yay -Syu
yay -S hyprshot --noconfirm
yay -S eww --noconfirm
yay -S rofi --noconfirm
yay -S dconf --noconfirm
yay -S nwg-displays --noconfirm
yay -S wlogout --noconfirm
yay -S wtype-git --noconfirm

paru -Syu 
paru -S swaync --noconfirm
paru -S xplr --noconfirm
paru -S cliphist --noconfirm
paru -S hyprland --noconfirm
paru -S hyprpaper --noconfirm
paru -S hyprlock --noconfirm
paru -S hypridle --noconfirm
paru -S hyprpicker --noconfirm
paru -S waybar --noconfirm
paru -S wl-gammarelay --noconfirm
paru -S swww --noconfirm
paru -S pamixer --noconfirm
paru -S cava --noconfirm
paru -S fuzzel --noconfirm
paru -S wl-clipboard --noconfirm
paru -S pavucontrol --noconfirm
paru -S wireplumber --noconfirm
paru -S libdbusmenu-gtk3 --noconfirm
paru -S playerctl --noconfirm
paru -S libnotify --noconfirm
paru -S notification-daemon --noconfirm
paru -S swaync --noconfirm
paru -S networkmanager --noconfirm
paru -S network-manager-applet --noconfirm
paru -S bluez --noconfirm
paru -S bluez-uti --noconfirm
paru -S blueman --noconfirm
paru -S lxsession --noconfirm
paru -S brightnessctl --noconfirm
paru -S light --noconfirm
paru -S nwg-look --noconfirm
paru -S yad --noconfirm
paru -S sox --noconfirm
paru -S xcursor-simp1e-gruvbox-light --noconfirm
paru -S qt5-wayland --noconfirm
paru -S xdg-desktop-portal --noconfirm
paru -S xdg-desktop-portal-gtk --noconfirm
paru -S xdg-desktop-portal-hyprland --noconfirm
paru -S nautilus-renamer --noconfirm
paru -S nautilus-open-any-terminal --noconfirm
paru -S code-nautilus-git --noconfirm

# Youtube Music TUI
paru -S youtui --noconfirm

# Fonts
paru -S papirus-icon-theme --noconfirm
paru -S ttf-firacode --noconfirm
paru -S awesome-terminal-fonts --noconfirm
paru -S ttf-ms-fonts --noconfirm
paru -S terminus-font-ttf --noconfirm
paru -S noto-color-emoji-fontconfig-no-binding --noconfirm


# Davinci Resolve Dependencies 
pacman -S libpng12 lib32-libpng12 ocl-icd openssl-1.0 opencl-driver qt5-websockets --noconfirm

# Applications
paru -S gimp-devel --noconfirm
paru -S vesktop --noconfirm
paru -S synochat --noconfirm
paru -S synology-drive --noconfirm
paru -S visual-studio-code-bin --noconfirm
paru -S github-desktop-bin --noconfirm
paru -S mission-center --noconfirm
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub org.gnome.SimpleScan -y
flatpak install flathub org.blender.Blender -y
flatpak install flathub io.missioncenter.MissionCenter -y


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
hyprpm update --no-shallow
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



mkdir -p $HOME/.fonts
cd $HOME/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip
rm Firacode.zip
rm Meslo.zip


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



