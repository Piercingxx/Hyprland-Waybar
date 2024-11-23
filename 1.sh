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


pacman -S android-tools --noconfirm




#Synology Drive doesnt support wayland so run this..
QT_QPA_PLATFORM=xcb
#Steam audio issues so run this..
ALSOFT_DRIVERS=pulse

