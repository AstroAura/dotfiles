#!/bin/bash
# ~/.local/bin/swww-pywal-current.sh

# Get the actual current wallpaper from SWWW cache
CURRENT_WALLPAPER=$(~/.local/bin/get-current-swww-wallpaper.sh)

if [ $? -eq 0 ] && [ -f "$CURRENT_WALLPAPER" ]; then
    echo "Applying Pywal to current wallpaper: $CURRENT_WALLPAPER"
    wal -i "$CURRENT_WALLPAPER" -n
    
    # Update Kitty colors if remote control is enabled
    if command -v kitty >/dev/null 2>&1; then
        if kitty @ set-font-size 11 2>/dev/null; then
            kitty @ set-colors --all ~/.cache/wal/kitty-colors.conf
        else
            echo "Kitty remote control not available, updating config manually"
            # Ensure kitty config includes pywal colors
            if ! grep -q "kitty-colors.conf" ~/.config/kitty/kitty.conf 2>/dev/null; then
                echo "include ~/.cache/wal/kitty-colors.conf" >> ~/.config/kitty/kitty.conf
            fi
        fi
    fi
    
    echo "Pywal colors applied successfully!"
else
    echo "Failed to detect current wallpaper from SWWW cache."
    echo "Using fallback to most recent wallpaper in Tokyo Night directory..."
    
    # Fallback to most recent in your preferred directory
    WALLPAPER_DIR="$HOME/.config/hyde/themes/Tokyo Night/wallpapers"
    if [ -d "$WALLPAPER_DIR" ]; then
        RECENT_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) -printf "%T@ %p\n" | sort -nr | head -n 1 | cut -d' ' -f2-)
        
        if [ -n "$RECENT_WALLPAPER" ] && [ -f "$RECENT_WALLPAPER" ]; then
            echo "Using fallback wallpaper: $RECENT_WALLPAPER"
            wal -i "$RECENT_WALLPAPER" -n
        else
            echo "No wallpapers found in fallback directory. Using default Pywal colors."
            wal -f  # Use default pywal colors
        fi
    else
        echo "Fallback directory not found: $WALLPAPER_DIR"
        wal -f  # Use default pywal colors
    fi
fi
