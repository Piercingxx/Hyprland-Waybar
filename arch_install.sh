#!/bin/bash


# Enable Bluetooth
sudo systemctl start bluetooth
systemctl enable bluetooth

# Enable Printer 
sudo pacman -S cups -y
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
paru -Syu cliphist hyprland waybar alacritty rofi-wayland swww libnotify notification-daemon swaync networkmanager network-manager-applet bluez bluez-utils blueman papirus-icon-theme noto-fonts-emoji fonts-firacode fonts-font-awesome fonts-noto fonts-noto-cjk fonts-noto-color-emoji lxsession brightnessctl light nwg-look yad sox mint-themes xcursor-simp1e-gruvbox-light hyprlock hypridle hyprpicker qt5-wayland eww xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland --noconfirm

mkdir -p $HOME/.fonts
cd $HOME/.fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v${nerd_font_version}/${nerd_font}.zip"
unzip "${nerd_font}.zip"
rm OFL.txt
rm readme.md
rm "${nerd_font}.zip"
