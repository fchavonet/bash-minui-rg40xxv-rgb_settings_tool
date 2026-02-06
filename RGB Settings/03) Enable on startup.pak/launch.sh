#!/bin/sh

# Current .pak folder name.
CURRENT_NAME=$(basename "$(dirname "$0")")
# Path to MinUI main launch script.
TARGET="/mnt/sdcard/.system/rg35xxplus/paks/MinUI.pak/launch.sh"
# Path to RGB Settings folder.
TOOLS_DIRECTORY="/mnt/sdcard/Tools/rg35xxplus/RGB Settings"

# Command to launch RGB On at boot.
RGB_CMD="\"$TOOLS_DIRECTORY/01) RGB On.pak/launch.sh\" &"

# Check if the current action is "Enable on startup".
if echo "$CURRENT_NAME" | grep -q "Enable"; then
    # Cleanup any existing RGB startup entries.
    sed -i '/Enable on startup/d' "$TARGET"
    sed -i '/Disable on startup/d' "$TARGET"
    sed -i '/RGB On.pak/d' "$TARGET"

    # Insert startup marker and RGB command.
    sed -i "2i # Enable on startup" "$TARGET"
    sed -i "3i $RGB_CMD" "$TARGET"

    # Rename to next available action.
    mv "$(dirname "$0")" "$TOOLS_DIRECTORY/03) Disable on startup.pak"

    # Single short vibration to confirm RGB will be enabled on startup.
    echo 1 > /sys/class/power_supply/axp2202-battery/moto
    sleep 0.1
    echo 0 > /sys/class/power_supply/axp2202-battery/moto
else
    # Cleanup any existing RGB startup entries.
    sed -i '/Enable on startup/d' "$TARGET"
    sed -i '/Disable on startup/d' "$TARGET"
    sed -i '/RGB On.pak/d' "$TARGET"

    # Rename to next available action.
    mv "$(dirname "$0")" "$TOOLS_DIRECTORY/03) Enable on startup.pak"

    # Two short vibrations to confirm RGB will be disabled on startup.
    echo 1 > /sys/class/power_supply/axp2202-battery/moto
    sleep 0.1
    echo 0 > /sys/class/power_supply/axp2202-battery/moto

    sleep 0.15

    echo 1 > /sys/class/power_supply/axp2202-battery/moto
    sleep 0.1
    echo 0 > /sys/class/power_supply/axp2202-battery/moto
fi
