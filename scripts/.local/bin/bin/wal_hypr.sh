#!/usr/bin/env bash

# Path to wallpaper folder
WALLPAPER_DIR="$HOME/.config/hyde/themes/Tokyo Night/wallpapers/"

# Get the current Hyprland wallpaper
# hyprctl monitors -j outputs JSON; we extract the 'wallpaper' field
WALLPAPER_PATH=$(hyprctl monitors -j | jq -r '.[].wallpaper')


# Try to get the current wallpaper from Hyprland
if command -v hyprctl >/dev/null 2>&1 && command -v jq >/dev/null 2>&1; then
    WALLPAPER_PATH=$(hyprctl monitors -j | jq -r '.[].wallpaper' | head -n1)
fi

# Fallback if hyprctl/jq failed or no wallpaper found
if [[ -z "$WALLPAPER_PATH" || ! -f "$WALLPAPER_PATH" ]]; then
    WALLPAPER_DIR="$HOME/.config/hyde/themes/Tokyo Night/wallpapers/"
    WALLPAPER_FILE=$(ls "$WALLPAPER_DIR" | head -n1)
    WALLPAPER_PATH="$WALLPAPER_DIR/$WALLPAPER_FILE"
fi

# Run pywal
wal -i "$WALLPAPER_PATH" -q -n 32

# Source the colors into the shell
source "$HOME/.cache/wal/colors.sh"

# Convert color1 to RGB
HEX="${color1:-$color0}"
R=$((16#${HEX:1:2}))
G=$((16#${HEX:3:2}))
B=$((16#${HEX:5:2}))


