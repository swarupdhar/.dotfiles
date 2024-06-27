#!/usr/bin/env bash

yay -S sddm-theme-catppuccin catppuccin-gtk-theme-mocha dracula-icons-git

echo "[Theme]
Current=catppuccin-macchiato" | sudo tee /etc/sddm.conf

gsettings set org.gnome.desktop.interface gtk-theme catppuccin-mocha-lavender-standard+default
gsettings set org.gnome.desktop.interface icon-theme Dracula
gsettings set org.gnome.desktop.wm.preferences theme catppuccin-mocha-lavender-standard+default
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
