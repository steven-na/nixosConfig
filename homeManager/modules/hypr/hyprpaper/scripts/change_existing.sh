#!/bin/bash

# Define source and destination directories
SRC_DIR="$HOME/Downloads"
DEST_DIR="$HOME/.config/wallpaper/converted"
GOWALL_DIR="$HOME/Pictures/gowall"

# Find the most recent .png or .jpg image in ~/Downloads
LATEST_IMAGE=$(ls -t "$SRC_DIR"/*.{png,jpg,jpeg} 2>/dev/null | head -n 1)

# Ensure an image exists before proceeding
if [[ -z "$LATEST_IMAGE" ]]; then
    echo "No image found in $SRC_DIR"
    exit 1
fi

# Convert the image using 'nord' theme
gowall convert -t nord "$LATEST_IMAGE"

# Find the most recent image in the gowall folder (this should be the converted image)
CONVERTED_IMAGE=$(ls -t "$GOWALL_DIR"/*.{png,jpg,jpeg} 2>/dev/null | head -n 1)

# Ensure the converted image exists
if [[ -z "$CONVERTED_IMAGE" ]]; then
    echo "Conversion failed: No converted image found."
    exit 1
fi

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Move the converted image to the destination
mv "$CONVERTED_IMAGE" "$DEST_DIR/wallpaper.png"

echo "Wallpaper converted and saved to $DEST_DIR/wallpaper.png"

