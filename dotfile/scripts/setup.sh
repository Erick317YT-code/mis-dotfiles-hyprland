#!/bin/bash
# ==============================================================================
# UNIFIED HYPRLAND SETUP SCRIPT (Arch Linux)
# Inspired by: end-4, Caelestia, Cartoon Shell, and Serpantinum
# ==============================================================================

set -e # Exit on error

echo "========================================="
echo " Starting Unified Dotfiles Installation  "
echo "========================================="

# 1. Install an AUR Helper (paru) if not installed
if ! command -v paru &> /dev/null; then
    echo "Installing paru..."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -si --noconfirm
    cd -
fi

# 2. Define Dependencies
CORE_PKGS=(
    hyprland
    kitty
    swww # Wallpaper daemon
    wl-clipboard
    cliphist # Clipboard manager
    brightnessctl
    playerctl
    grim # Screenshot
    slurp # Screen selection
    polkit-kde-agent # Auth agent
    ttf-jetbrains-mono-nerd # Font
    ttf-font-awesome
)

AUR_PKGS=(
    quickshell-git # The Wayland shell framework
    matugen-bin # Material You color generation (Caelestia style)
)

echo "Installing Core Packages via pacman..."
sudo pacman -S --needed --noconfirm "${CORE_PKGS[@]}"

echo "Installing AUR Packages via paru..."
paru -S --needed --noconfirm "${AUR_PKGS[@]}"

# 3. Copy Configurations
echo "Copying configuration files to ~/.config..."
mkdir -p ~/.config/hypr
mkdir -p ~/.config/quickshell
mkdir -p ~/.config/kitty

# Assuming this script is run from the dotfiles repository root
cp -r hypr/* ~/.config/hypr/
cp -r quickshell/* ~/.config/quickshell/
cp -r kitty/* ~/.config/kitty/

# Make scripts executable
mkdir -p ~/.local/bin
cp scripts/*.sh ~/.local/bin/
chmod +x ~/.local/bin/*.sh

echo "========================================="
echo " Installation Complete! "
echo " Please log out and select Hyprland from your Display Manager."
echo "========================================="
