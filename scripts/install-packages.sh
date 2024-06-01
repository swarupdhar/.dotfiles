#!/usr/bin/env bash

set -e

# Install packages using packman
pacman -Syu --needed \
    waybar \
    wofi \
    dunst \
    hyprpaper \
    hypridle \
    hyprlock \
    brightnessctl \
    pavucontrol \
    wl-clipboard \
    ripgrep \
    fd \
    grim \
    slurp \
    xdg-user-dirs \
    nemo \
    zathura \
    zathura-djvu \
    zathura-pdf-poppler \
    ttf-jetbrains-mono \
    ttf-noto-nerd \
    noto-fonts-emoji \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-extra \
    qt6-svg \
    qt6-declarative \
    texlive-mathscience \
    texlive-binextra \
    texlive-latexextra \
    texlive-latexrecommended \
    texlive-fontsextra \
    man-pages \
    man-db \
    git \
    firefox \
    neovim \
    base-devel

yay -S sddm-theme-catppuccin catppuccin-gtk-theme-mocha dracula-icons-git

echo "[Theme]
Current=catppuccin-macchiato" | sudo tee /etc/sddm.conf

gsettings set org.gnome.desktop.interface gtk-theme catppuccin-mocha-lavender-standard+default-dark
gsettings set org.gnome.desktop.interface icon-theme Dracula
gsettings set org.gnome.desktop.wm.preferences theme catppuccin-mocha-lavender-standard+default-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

# Remove Dolphin
pacman -Rns dolphin
