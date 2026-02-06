#!/bin/sh

# --- Wayland environment ---
export XDG_CURRENT_DESKTOP=river
export XDG_SESSION_TYPE=wayland
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland

# Ensure DBus + portals see the compositor
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# --- Delay helpers ---
sleep 1

# --- Notifications ---
mako &

# --- Clipboard ---
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

# --- Tray apps ---
nm-applet --indicator &
blueman-applet &
udiskie --smart-tray &

# --- Wallpaper (IMPORTANT ORDER) ---
swww init &
sleep 0.5
~/.config/hypr/scripts/swwwallpaper.sh &

# --- Bar ---
sleep 1
waybar &
