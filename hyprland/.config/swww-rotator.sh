#!/usr/bin/env bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/.config/hyde/themes/Tokyo Night/wallpapers/"

# Time between changes (e.g., 300 seconds = 5 minutes)
INTERVAL=600

# Initialize the swww-daemon if it's not already running
swww query || swww-daemon &

# Wait briefly for the daemon to start
sleep 1

while true; do
    # Pick a random wallpaper from the directory
    SELECTED_WALL=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    
    # Change the wallpaper with a smooth transition
    # Options: random, grow, wipe, wave, center, etc.
    swww img "$SELECTED_WALL" --transition-type fade --transition-duration 3
    
    sleep "$INTERVAL"
done

