#!/bin/sh

SERIAL_PORT="/dev/ttyS5"

# Enable MCU power via the AXP2202 power controller.
echo 1 > /sys/class/power_supply/axp2202-battery/mcu_pwr

# Configure serial port parameters (baud rate and raw mode).
stty -F $SERIAL_PORT 115200 -opost -isig -icanon -echo

# Send the binary file directly to the serial port.
cat "$(dirname "$0")/white_color.bin" > $SERIAL_PORT
