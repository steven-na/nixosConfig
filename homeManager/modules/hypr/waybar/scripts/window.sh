#!/bin/bash
hyprctl activewindow -j | jq -r '.title' | awk '{print substr($0, 1, 50) (length($0) > 50 ? "…" : "")}'
