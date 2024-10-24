#!/bin/bash

sudo pacman -Syu
sudo pacman -S zip unzip gzip tar make --noconfirm 


# Enable Bluetooth
sudo systemctl start bluetooth
systemctl enable bluetooth

# Enable Printer 
sudo pacman -S cups gutenprint cups-pdf gtk3-print-backends nmap net-tools cmake meson cpio -y
systemctl enable cups.service
systemctl start cups


# Update system and install Git
sudo pacman -Syu git --noconfirm

# Clone and install Paru
git clone https://aur.archlinux.org/paru-bin.git && cd paru-bin && makepkg -si --noconfirm && cd ..

# Install YaY
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm && cd ..


# Installs
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
paru -S fuzzel --noconfirm
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
paru -S mint-themes --noconfirm
paru -S xcursor-simp1e-gruvbox-light --noconfirm
paru -S qt5-wayland --noconfirm
paru -S xdg-desktop-portal --noconfirm
paru -S xdg-desktop-portal-gtk --noconfirm
paru -S xdg-desktop-portal-hyprland --noconfirm
paru -S papirus-icon-theme --noconfirm
paru -S ttf-firacode --noconfirm
paru -S awesome-terminal-fonts --noconfirm
paru -S ttf-ms-fonts --noconfirm
paru -S terminus-font-ttf --noconfirm
paru -S noto-color-emoji-fontconfig-no-binding --noconfirm
paru -S nautilus-renamer --noconfirm
paru -S nautilus-open-any-terminal --noconfirm
paru -S code-nautilus-git --noconfirm
paru -S libnotify --noconfirm
paru -S wl-clipboard --noconfirm
paru -S gimp-devel --noconfirm
paru -S vesktop --noconfirm
paru -S synochat --noconfirm
paru -S synology-drive --noconfirm
paru -S visual-studio-code-bin --noconfirm
paru -S github-desktop-bin --noconfirm
paru -S mission-center --noconfirm
flatpak install flathub com.google.Chrome -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.dropbox.Client -y
flatpak install flathub org.libreoffice.LibreOffice -y
flatpak install flathub org.gnome.SimpleScan -y
flatpak install flathub org.blender.Blender -y
flatpak install flathub io.missioncenter.MissionCenter -y
flatpak install flathub com.valvesoftware.Steam -y


# Dynamic Cursor
hyprpm update --no-shallow
hyprpm reload
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm add https://github.com/virtcode/hypr-dynamic-cursors
hyprpm enable dynamic-cursors
hyprpm enable hyprtrails
hyprpm enable hyprexpo


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


#Synology Drive doesnt support wayland so run this..
QT_QPA_PLATFORM=xcb


# Customizations 
### These will effect your Gnome GUI as well some Hyprland settings
##### Do not run these unless you know what they are for.
gsettings set org.gnome.desktop.interface clock-format 24h && echo "Clock Format: 24h"
gsettings set org.gnome.desktop.interface clock-show-weekday true && echo "Clock Show Weekday: True"
gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true && echo "Numlock State: True"
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:backspace']" && echo "Caps Lock: Backspace"
gsettings set org.gnome.desktop.peripherals.mouse.speed "0.11790393013100431"
gsettings set org.gnome.desktop.peripherals.mouse.accel-profile "'flat'"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark && echo "Color Scheme: Dark"
gsettings set org.gnome.desktop.session idle-delay 0 && echo "Lock Screen Idle: 20"
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing' && echo "Sleep Inactive AC: Nothing"
gsettings set org.gnome.desktop.interface show-battery-percentage true && echo "Show Battery Percentage: True"
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false && echo "Ambient Enabled: False"
gsettings set org.gnome.settings-daemon.plugins.power idle-delay "unit32 900" && echo "Idle Delay: 15 minutes"
gsettings set org.gnome.desktop.interface enable-hot-corners false && echo "Enable Hot Corners: False"
gsettings set org.gnome.desktop.background picture-options 'spanned' && echo "Background Options: Spanned"
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true && echo "Night Light Enabled: True"
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false && echo "Night Light Schedule Automatic: False"
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 20 && echo "Night Light Schedule From: 20"
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 04 && echo "Night Light Schedule To: 04"
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 2500 && echo "Night Light Temperature: 2500"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']" && echo "Custom Keybindings: None"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "kitty" && echo "Kitty: Name"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "kitty" && echo "Kitty: Command"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>W" && echo "Kitty: Binding"
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>Q']" && echo "Super Q to Close"
gsettings set org.gnome.mutter.wayland.keybindings.restore-shortcuts "['']" 
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true && echo "Tap to Click: True"
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true && echo "Natural Scroll: True"
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled true && echo "Edge Scrolling: True"
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled false && echo "Two Finger Scrolling: False"
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'areas' && echo "Click Method: Areas"
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive' && echo "Power Button Action: Interactive"
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark && echo "GTK Theme: Adwaita-dark"
gsettings set org.gnome.desktop.interface cursor-theme 'Nordzy-cursors' && echo "Cursor Theme: Nordzy"
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' && echo "Icon Theme: Papirus-Dark"
gsettings set org.gnome.shell favorite-apps "['com.google.Chrome.desktop', 'org.gnome.Nautilus.desktop', 'org.libreoffice.LibreOffice.writer.desktop', 'org.gnome.Calculator.desktop', 'md.obsidian.Obsidian.desktop', 'com.visualstudio.code.desktop', 'code.desktop', 'synochat.desktop', 'org.gimp.GIMP.desktop', 'org.blender.Blender.desktop']" && echo "Favorite Apps: Chrome, Nautilus, LibreOffice, Calculator, Obsidian, VSCode, Discord, Gimp"
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal kitty
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal flatpak system
gnome-extensions enable ubuntu-appindicators@ubuntu.com && echo "App Indicator: Enabled"
gnome-extensions enable gsconnect@andyholmes.github.io && echo "GSConnect: Enabled"
gnome-extensions enable awesome-tiles@velitasali.com && echo "Awesome Tiles: Enabled"
gnome-extensions enable aztaskbar@aztaskbar.gitlab.com && echo "AzTaskbar: Enabled"
gnome-extensions enable blur-my-shell@aunetx && echo "Blur My Shell: Enabled"
gnome-extensions enable caffeine@patapon.info && echo "Caffeine: Enabled"
gnome-extensions enable openbar@openbar.github.io && echo "OpenBar: Enabled"
gnome-extensions enable just-perfection-desktop@just-perfection && echo "Just Perfection: Enabled"
dconf write /org/gnome/shell/extensions/just-perfection/dash-icon-size "48" && echo "Just Perfection Dash Icon Size: 48"
dconf write /org/gnome/shell/extensions/just-perfection/animation "3" && echo "Just Perfection Animation: 3"
dconf write /org/gnome/shell/extensions/just-perfection/startup-status "0" && echo "Just Perfection Startup Status: 0"
dconf write /org/gnome/shell/extensions/just-perfection/app-menu-icon "false" && echo "Just Perfection App Menu Icon: False"
dconf write /org/gnome/shell/extensions/just-perfection/activities-button "false" && echo "Just Perfection Activities Button: False"
dconf write /org/gnome/shell/extensions/just-perfection/app-menu "false" && echo "Just Perfection App Menu: False"
dconf write /org/gnome/shell/extensions/just-perfection/app-menu-label "false" && echo "Just Perfection App Menu Label: False"
dconf write /org/gnome/shell/extensions/just-perfection/search "false" && echo "Just Perfection Search: False"
dconf write /org/gnome/shell/extensions/just-perfection/theme "true" && echo "Just Perfection Theme: True"
dconf write /org/gnome/shell/extensions/caffeine/duration-timer "4" && echo "Caffeine Duration Timer: 4"
dconf write /org/gnome/shell/extensions/awesome-tiles/gap-size-increments "1" && echo "Awesome Tiles Gap Size Increments: 1"
dconf write /org/gnome/shell/extensions/aztaskbar/favorites "false" && echo "AzTaskbar Favorites: False"
dconf write /org/gnome/shell/extensions/aztaskbar/main-panel-height "33" && echo "AzTaskbar Main Panel Height: 33"
dconf write /org/gnome/shell/extensions/aztaskbar/panel-on-all-monitors "false"
dconf write /org/gnome/shell/extensions/aztaskbar/show-panel-activities-button "false" && echo "AzTaskbar Show Panel Activities Button: False"
dconf write /org/gnome/shell/extensions/aztaskbar/icon-size "23" && echo "AzTaskbar Icon Size: 23"
dconf write /org/gnome/shell/extensions/blur-my-shell/brightness "1.0" && echo "Blur My Shell Brightness: 1.0"
dconf write /org/gnome/shell/extensions/openbar/bg-opacity '0.8'
dconf write /org/gnome/shell/extensions/openbar/prominent1 "['49', '60', '43']"
dconf write /org/gnome/shell/extensions/openbar/prominent2 "['196', '216', '182']"
dconf write /org/gnome/shell/extensions/openbar/prominent3 "['105', '138', '96']"
dconf write /org/gnome/shell/extensions/openbar/prominent4 "['142', '181', '127']"
dconf write /org/gnome/shell/extensions/openbar/prominent5 "['113', '108', '101']"
dconf write /org/gnome/shell/extensions/openbar/prominent6 "['137', '155', '163']"
dconf write /org/gnome/shell/extensions/openbar/palette1 "['105', '138', '96']"
dconf write /org/gnome/shell/extensions/openbar/bg-change "true"
dconf write /org/gnome/shell/extensions/openbar/palette10 "['50', '75', '40']"
dconf write /org/gnome/shell/extensions/openbar/palette11 "['61', '68', '72']"
dconf write /org/gnome/shell/extensions/openbar/palette12 "['164', '140', '123']"
dconf write /org/gnome/shell/extensions/openbar/palette2 "['196', '216', '182']"
dconf write /org/gnome/shell/extensions/openbar/palette3 "['33', '36', '29']"
dconf write /org/gnome/shell/extensions/openbar/palette4 "['142', '181', '127']"
dconf write /org/gnome/shell/extensions/openbar/palette5 "['71', '102', '61']"
dconf write /org/gnome/shell/extensions/openbar/palette6 "['113', '108', '101']"
dconf write /org/gnome/shell/extensions/openbar/palette7 "['137', '155', '163']"
dconf write /org/gnome/shell/extensions/openbar/palette8 "['89', '102', '105']"
dconf write /org/gnome/shell/extensions/openbar/palette9 "['81', '76', '71']"
dconf write /org/gnome/shell/extensions/openbar/default-font "'Sans 12'"
dconf write /org/gnome/shell/extensions/openbar/height "33.0"
dconf write /org/gnome/shell/extensions/openbar/margin "5.0"
dconf write /org/gnome/shell/extensions/openbar/margin-wmax "2.3"
dconf write /org/gnome/shell/extensions/openbar/dark-bgcolor "'0.2392157018184662', '0.21568627655506134', '0.3686274588108063']"
dconf write /org/gnome/shell/extensions/openbar/fgcolor "['0.6352940797805786', '0.46666669845581055', '1']"
dconf write /org/gnome/shell/extensions/openbar/font "'FiraCode Nerd Font Mono 11'"
dconf write /org/gnome/shell/extensions/openbar/isalpha "0.0"
dconf write /org/gnome/shell/extensions/openbar/bgcolor2 "['0.9647058844566345', '0.5803921818733215', '1']"
dconf write /org/gnome/shell/extensions/openbar/candyalpha "0.3"
dconf write /org/gnome/shell/extensions/openbar/shalpha "0.0"
dconf write /org/gnome/shell/extensions/openbar/hcolor "['0.6352940797805786', '0.46666669845581055', '1']"
dconf write /org/gnome/shell/extensions/openbar/halpha "0.0"
dconf write /org/gnome/shell/extensions/openbar/heffect "true"
dconf write /org/gnome/shell/extensions/openbar/reloadstyle "true"
dconf write /org/gnome/shell/extensions/openbar/hpad "0.0"
dconf write /org/gnome/shell/extensions/openbar/vpad "0.0"
dconf write /org/gnome/shell/extensions/openbar/bcolor "['0.3803921937942505', '1', '0.7921568751335144']"
dconf write /org/gnome/shell/extensions/openbar/autofg-menu "true"
dconf write /org/gnome/shell/extensions/openbar/mfgcolor "['0.9647058844566345', '0.5803921818733215', '1']"
dconf write /org/gnome/shell/extensions/openbar/mbgcolor "['0.2392157018184662', '0.21568627655506134', '0.3686274588108063']"
dconf write /org/gnome/shell/extensions/openbar/smbgcolor "['0.6352940797805786', '0.46666669845581055', '1']"
dconf write /org/gnome/shell/extensions/openbar/mbcolor "['0.3803921937942505', '1', '0.7921568751335144']"
dconf write /org/gnome/shell/extensions/openbar/mhcolor "['0.9647058844566345', '0.5803921818733215', '1']"
dconf write /org/gnome/shell/extensions/openbar/mscolor "['0.3803921937942505', '1', '0.7921568751335144']"
dconf write /org/gnome/shell/extensions/openbar/mshcolor "['0.2392157018184662', '0.21568627655506134', '0.3686274588108063']"
dconf write /org/gnome/shell/extensions/openbar/reloadstyle "false"
dconf write /org/gnome/shell/extensions/openbar/extend-menu-shell "true"
dconf write /org/gnome/shell/extensions/openbar/trigger-reload "false"
dconf write /org/gnome/shell/extensions/openbar/reloadstyle "true"
dconf write /gnome/shell/extensions/openbar/dashdock-style "'Bar'"
dconf write /org/gnome/shell/extensions/aztaskbar/indicator-color-focused "'rgb(246,148,255)'"
dconf write /org/gnome/shell/extensions/aztaskbar/indicator-color-running "'rgb(130,226,255)'"
dconf write /org/gnome/desktop/interface/font-name 'MesloLGSDZ Nerd Font 11'
dconf write /org/gnome/desktop/interface/document-font-name 'FiraCode Nerd Font 11'
dconf write /org/gnome/desktop/interface/monospace-font-name 'Terminus (TTF) Medium 12'
dconf write /org/gnome/desktop/wm/preferences/button-layout 'appmenu:minimize,close'
dconf write /org/gnome/desktop/wm/preferences/button-layout 'appmenu:close'


