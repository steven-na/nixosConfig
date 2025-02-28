#!/bin/bash

WATCH_DIR="$HOME/.config/wallpaper/converted"  # Set your wallpaper directory here
HYPRPAPER_CMD="hyprpaper"

# Watch the directory for changes
inotifywait -m -e modify,move,create,delete "$WATCH_DIR" | while read -r path action file; do
  # Check if a new file is added or modified and is an image file
  if [[ "$file" =~ \.(jpg|jpeg|png|bmp|gif)$ ]]; then
    # Kill the current hyprpaper process
    pkill -f "$HYPRPAPER_CMD"

    # Restart hyprpaper to reload the wallpaper
    $HYPRPAPER_CMD &
  fi
done

