#!/bin/sh

WALLDIR="$HOME/Wallpapers/wallpapers"

# Create a preview list with image paths
selected=$(ls "$WALLDIR" | \
while read -r file; do
    echo -en "$file\x00icon\x1f$WALLDIR/$file\n"
done | \
rofi -dmenu -p "" -i -show-icons \
-theme-str '
window {
    width: 95%;
    height: 85%;
}

listview {
    columns: 4;
    lines: 2;
    dynamic: false;
    scrollbar: true;
}

element {
    orientation: vertical;
    padding: 10px;
}

element-icon {
    size: 180px;
}

element-text {
    enabled: false;
}
entry{
  placeholder: "Search Wallpapers";
}
')
if [ -n "$selected" ]; then
    swww img "$WALLDIR/$selected"
fi
