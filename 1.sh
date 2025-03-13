#!/bin/bash

#!/bin/bash

# Check if running as root. If root, script will exit
if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting......."
    exit 1
fi

sudo pacman -Syu
sudo pacman -S zip unzip gzip tar make --noconfirm

# Clone and install Paru
git clone https://aur.archlinux.org/paru-bin.git && cd paru-bin && makepkg -si --noconfirm && cd ..

#Add Flatpak
sudo pacman -S flatpak --noconfirm
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable Bluetooth
sudo systemctl start bluetooth
systemctl enable bluetooth

# Enable Printer 
sudo pacman -S cups gutenprint cups-pdf gtk3-print-backends nmap net-tools cmake meson cpio --noconfirm
systemctl enable cups.service
systemctl start cups

#Synology Drive doesnt support wayland so run this..
QT_QPA_PLATFORM=xcb
#Steam audio issues so run this..
ALSOFT_DRIVERS=pulse

sudo reboot
