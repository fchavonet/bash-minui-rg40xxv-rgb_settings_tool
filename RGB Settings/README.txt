MinUI RG40XXV RGB  Settings Tool
================================

This folder contains scripts to control the RGB lighting on your RG40XXV device using MinUI.

Installation
------------

1. Copy this folder into "Tools/rg35xxplus/" at the root of your SD card.
2. The folder structure should look like this on the card:

    Tools/
    ├── rg35xxplus/
    │   ├── RGB Settings/
    │   │   ├── 01) RGB On.pak/
    │   │   ├── 02) RGB Off.pak/
    │   │   ├── 03) Enable on startup.pak - Disable on startup.pak

Usage
-----

- RGB On.pak
  Turns the RGB lights on immediately.

- RGB Off.pak
  Turns the RGB lights off immediately.

- Enable on startup.pak
  Enables RGB lighting automatically when MinUI starts.
  After running this script, it will be renamed to "Disable on startup.pak".

- Disable on startup.pak
  Disables automatic RGB lighting at MinUI startup.
  After running this script, it will be renamed to "Enable on startup.pak".

Notes
-----

- Each script provides a short vibration to confirm the action.
- Make sure the SD card is properly inserted before running the scripts.
- Do not modify the scripts unless you understand how they interact with the MinUI system.
