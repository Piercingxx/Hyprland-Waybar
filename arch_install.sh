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


# First round of installs
yay -S hyprshot
yay -S eww
yay -S rofi


# Install necessary packages using Paru
paru -Syu 
paru -S cliphist --noconfirm
paru -S hyprland --noconfirm
paru -S hyprpaper --noconfirm
paru -S hyprlock --noconfirm
paru -S hypridle --noconfirm
paru -S hyprpicker --noconfirm
paru -S waybar --noconfirm
paru -S wl-gammarelay --noconfirm
paru -S swww --noconfirm
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


mkdir -p $HOME/.fonts
cd $HOME/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip
rm Firacode.zip
rm Meslo.zip
