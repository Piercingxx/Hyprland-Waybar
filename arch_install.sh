#!/bin/bash


# Enable Bluetooth
sudo systemctl start bluetooth
systemctl enable bluetooth

# Enable Printer 
sudo pacman -S cups gutenprint cups-pdf gtk3-print-backends nmap net-tools -y
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

# Install necessary packages using Paru
paru -Syu 
paru -S cliphist --noconfirm
paru -S hyprland --noconfirm
paru -S hyprpaper --noconfirm
paru -S hyprshot --noconfirm
paru -S hyprlock --noconfirm
paru -S hypridle --noconfirm
paru -S hyprpicke --noconfirm
paru -S waybar --noconfirm
paru -S wl-gammarelay --noconfirm
paru -S rofi-wayl --noconfirm
paru -S swww --noconfirm
paru -S libnotify --noconfirm
paru -S notificat --noconfirm
paru -S swaync --noconfirm
paru -S networkma --noconfirm
paru -S network-m --noconfirm
paru -S bluez --noconfirm
paru -S bluez-uti --noconfirm
paru -S blueman --noconfirm
paru -S papirus-i --noconfirm
paru -S noto-font --noconfirm
paru -S fonts-fir --noconfirm
paru -S fonts-fon --noconfirm
paru -S fonts-not --noconfirm
paru -S fonts-not --noconfirm
paru -S fonts-not --noconfirm
paru -S lxsession --noconfirm
paru -S brightnessctl --noconfirm
paru -S light --noconfirm
paru -S nwg-look --noconfirm
paru -S yad --noconfirm
paru -S sox --noconfirm
paru -S mint-themes --noconfirm
paru -S xcursor-simp1e-gruvbox-light --noconfirm
paru -S qt5-wayland --noconfirm
paru -S eww --noconfirm
paru -S xdg-desktop-portal --noconfirm
paru -S xdg-desktop-portal-gtk --noconfirm
paru -S xdg-desktop-portal-hyprland --noconfirm


mkdir -p $HOME/.fonts
cd $HOME/.fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v${nerd_font_version}/${nerd_font}.zip"
unzip "${nerd_font}.zip"
rm OFL.txt
rm readme.md
rm "${nerd_font}.zip"
