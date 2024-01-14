#!/usr/bin/env bash

set -e

pacman -S --needed \
    git \
	firefox \
	neovim \
	nemo \
	hyprpaper \
    brightnessctl \
    ripgrep \
	zathura \
	zathura-pdf-poppler \
	waybar \
    swayidle \
    swaylock \
	wofi \
	dunst \
	wl-clipboard \
	ttf-iosevkaterm-nerd \
	ttf-noto-nerd \
    noto-fonts-emoji \
	pavucontrol \
    qt5-graphicaleffects \
    qt5-quickcontrols2 \
    qt5-svg \

# download rose pine theme
wget https://github.com/rose-pine/gtk/releases/download/v2.1.0/gtk3.tar.gz -P /tmp
#wget https://github.com/rose-pine/gtk/releases/download/v2.1.0/gtk4.tar.gz -P /tmp
wget https://github.com/rose-pine/gtk/releases/download/v2.1.0/rose-pine-icons.tar.gz -P /tmp

# unzip into themes and icon folders
mkdir -p $HOME/.themes
mkdir -p $HOME/.icons
tar -xf /tmp/gtk3.tar.gz -C /tmp
#tar -xf /tmp/gtk4.tar.gz -C /tmp
tar -xf /tmp/rose-pine-icons.tar.gz -C /tmp
cp -r /tmp/gtk3/rose-pine-gtk $HOME/.themes/rose-pine-gtk
cp -r /tmp/icons/rose-pine-icons $HOME/.icons/rose-pine-icons

# set gsettings
gsettings set org.gnome.desktop.interface gtk-theme rose-pine-gtk
gsettings set org.gnome.desktop.interface icon-theme rose-pine-gtk
gsettings set org.gnome.desktop.wm.preferences theme rose-pine-gtk
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# set sddm theme
git clone https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf
