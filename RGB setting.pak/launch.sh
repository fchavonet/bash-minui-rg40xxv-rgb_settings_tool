#!/bin/sh

PAK_DIR="$(dirname "$0")"
MENU_FILE="/tmp/rgb-settings-menu.json"
OUTPUT_FILE="/tmp/rgb-settings-choice.txt"
MINUI_LIST="$PAK_DIR/bin/minui-list.bin"
TARGET="/mnt/sdcard/.system/rg35xxplus/paks/MinUI.pak/launch.sh"

SELECTED_INDEX=0

# Ensure required executable permissions are set.
chmod +x "$MINUI_LIST"
chmod +x "$PAK_DIR/scripts/"*.sh

# Keep the menu open until the user explicitly exits.
while true; do
    # Update the startup menu label depending on the current startup state.
    if grep -q "Enable on startup" "$TARGET"; then
        STARTUP_LABEL="Disable on startup"
    else
        STARTUP_LABEL="Enable on startup"
    fi

    # Generate a temporary menu file because the startup label is dynamic.
    cat > "$MENU_FILE" << EOF
[
  "RGB On",
  "RGB Off",
  "$STARTUP_LABEL",
  "Exit"
]
EOF

    # Display the menu and keep the last selected option highlighted.
    "$MINUI_LIST" \
      --file "$MENU_FILE" \
      --selected "$SELECTED_INDEX" \
      --write-location "$OUTPUT_FILE"

    STATUS=$?

    # Exit cleanly if the user cancels the menu.
    if [ "$STATUS" -ne 0 ]; then
        exit 0
    fi

    CHOICE="$(cat "$OUTPUT_FILE")"

    # Run the selected action.
    case "$CHOICE" in
        "RGB On")
            SELECTED_INDEX=0
            "$PAK_DIR/scripts/rgb-on.sh"
            ;;

        "RGB Off")
            SELECTED_INDEX=1
            "$PAK_DIR/scripts/rgb-off.sh"
            ;;

        "Enable on startup"|"Disable on startup")
            SELECTED_INDEX=2
            "$PAK_DIR/scripts/rgb-startup-toggle.sh"
            ;;

        "Exit")
            exit 0
            ;;

        *)
            exit 1
            ;;
    esac
done