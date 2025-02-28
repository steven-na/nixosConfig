#!/bin/bash

# Run gowall and auto-confirm download
echo "y" | gowall -w

# Find the latest downloaded image
LATEST_IMAGE=$(ls -t ~/Pictures/gowall/wall-*.png | head -n 1)

# Convert the image using 'nord' theme
gowall convert -t nord "$LATEST_IMAGE"

# Find the processed image
CONVERTED_IMAGE="$HOME/Pictures/gowall/wallpaper.png"

# Move the converted image to the desired location
DEST_DIR="$HOME/.config/wallpaper/daily"
mkdir -p "$DEST_DIR"
mv "$CONVERTED_IMAGE" "$DEST_DIR/wallpaper.png"

echo "Wallpaper converted and updated successfully!"

