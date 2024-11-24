#!/bin/bash
# Set up the primary display (eDP-1) to scale to 2560x1440
# xrandr --output eDP-1 --scale 1.3333x1.3333 --mode 1920x1080 --panning 2560x1440
xrandr --output eDP-1 --mode 1920x1080 --panning 1920x1080

# Set up the second display (HDMI-1-2) to 2560x1440 and mirror the primary display
xrandr --output DP-1-8 --mode 2560x1440 --same-as eDP-1

# Force i3 to re-tile windows on all workspaces
for ws in {1..10}; do
    i3 "workspace $ws; layout toggle split; layout toggle split"
done
