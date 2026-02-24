#!/bin/bash
# ~/.local/bin/swww-pywal-enhanced.sh

# Try multiple methods to detect current wallpaper

# Method 1: Use swww query if available
if command -v swww query >/dev/null 2>&1; then
    CURRENT_WALLPAPER=$(swww query | grep -oP 'image: "\K[^"]+' | head -n 1)
fi

# Method 2: Check recent swww logs
if [ -z "$CURRENT_WALLPAPER" ]; then
    if [ -f ~/.local/state/swww/log ]; then
        CURRENT_WALLPAPER=$(tail -n 10 ~/.local/state/swww/log | grep -oE '/[^ ]+\.(jpg|png|jpeg|webp)' | tail -n 1)
    fi
fi

# Method 3: Check running swww process
if [ -z "$CURRENT_WALLPAPER" ]; then
    CURRENT_WALLPAPER=$(ps aux | grep 'swww' | grep -v grep | grep -oE '/[^ ]+\.(jpg|png|jpeg|webp)' | head -n 1)
fi

# Method 4: Check common wallpaper directories
if [ -z "$CURRENT_WALLPAPER" ]; then
    # Your Tokyo Night directory
    WALLPAPER_DIR="$HOME/.config/hyde/themes/Tokyo Night/wallpapers"
    if [ -d "$WALLPAPER_DIR" ]; then
        CURRENT_WALLPAPER=$(ls -t "$WALLPAPER_DIR"/*.jpg "$WALLPAPER_DIR"/*.png "$WALLPAPER_DIR"/*.jpeg 2>/dev/null | head -n 1)
    fi
fi
# Apply Pywal if we found a wallpaper
if [ -n "$CURRENT_WALLPAPER" ] && [ -f "$CURRENT_WALLPAPER" ]; then
    echo "Applying Pywal to: $CURRENT_WALLPAPER"
    wal -i "$CURRENT_WALLPAPER" -n
    
else
    echo "Could not detect current wallpaper. Using default Pywal."
    wal -f
fi

