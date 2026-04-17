# RG40XXV RGB Settings Tool

## Description

This project is a lightweight Bash-based tool designed to control the RGB LED behavior of the analog stick on the [Anbernic RG40XXV](https://anbernic.com/fr-fr/products/rg-40xxv) handheld console running [MinUI](https://github.com/shauninman/MinUI).

It provides simple and reliable actions to:

- Enable RGB lighting (white).
- Disable RGB lighting.
- Toggle automatic RGB activation at boot.

The tool follows the minimalist philosophy of [MinUI](https://github.com/shauninman/MinUI): one action per `.pak`, no unnecessary UI, fast execution.

> Compatibility
> - Device: RG40XXV.
> - Platform: Anbernic H700.
> - OS: MinUI.
>
> This tool is not guaranteed to work on other devices.

## Objectives

- Provide a simple and reliable RGB control for MinUI users.
- Respect the MinUI UX philosophy (minimal, fast, no clutter).
- Avoid complex dependencies (pure Bash + system interfaces).
- Ensure safe system modification (autoboot with backup & rollback).
- Deliver a modular and maintainable solution.

## Tech Stack

![Bash badge](https://img.shields.io/badge/BASH-4eaa25?logo=gnubash&logoColor=white&style=for-the-badge)

## File Description

| **FILE**       | **DESCRIPTION**                                     |
| :------------: | --------------------------------------------------- |
| `assets`       | Contains the resources required for the repository. |
| `RGB Settings` |  MinUI `.pak` actions (RGB ON, OFF, Autoboot).      |
| `README.md`    | The README file you are currently reading 😉.       |

## Installation & Usage

### Installation

1. Clone this repository:
    - Open your preferred Terminal.
    - Navigate to the directory where you want to clone the repository.
    - Run the following command:

```
git clone https://github.com/fchavonet/bash-minui-rg40xxv-rgb_settings_tool.git
```

2. Copy the `RGB Settings` folder into `Tools/rg35xxplus/` at the root of your SD card.

3. The folder structure should look like this on the card:

```
    Tools/
    ├── rg35xxplus/
    │   ├── RGB Settings/
    │   │   ├── 01) RGB On.pak/
    │   │   ├── 02) RGB Off.pak/
    │   │   ├── 03) Enable on startup.pak - Disable on startup.pak
```

### Usage

1. Power on the RG40XXV running MinUI.

2. Navigate to the `Tools` section.

3. Launch one of the following:
    - RGB On → Turn RGB ON (white).
    - RGB Off → Turn RGB OFF.
    - Enable on startup → Enable RGB at startup.
    - Disable on startup → Disable RGB at startup.

You can also download the latest release by clicking [here](https://github.com/fchavonet/bash-minui-rg40xxv-rgb_settings_tool/releases).

![Screenshot](./assets/images/rg40xxv.webp)

## What's Next?

- Add support for additional RGB colors.
- Improve the user interface.
- Explore compatibility with other Anbernic devices.

## Thanks

- A big thank you to my friend Alexis, always available to test and provide feedback on this project.

## Author(s)

**Fabien CHAVONET**
- GitHub: [@fchavonet](https://github.com/fchavonet)
