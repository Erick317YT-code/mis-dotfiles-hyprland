#!/bin/bash
# ==============================================================================
# COLOR GENERATION SCRIPT
# Uses 'matugen' to generate Material You colors from the current wallpaper
# (Inspired by Caelestia's dynamic theming)
# ==============================================================================

WALLPAPER=$1

if [ -z "$WALLPAPER" ]; then
    echo "Usage: $0 /path/to/wallpaper.jpg"
    exit 1
fi

# Set wallpaper
swww img "$WALLPAPER" --transition-type grow --transition-pos 0.5,0.9 --transition-step 90

# Generate Colors
echo "Generating Material You colors..."
matugen image "$WALLPAPER"

# Reload Quickshell to apply new colors (assuming it reads from a generated file)
# pkill -USR1 quickshell

echo "Colors updated based on $WALLPAPER"
