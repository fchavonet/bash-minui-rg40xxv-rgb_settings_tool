#!/bin/sh

SERIAL_PORT="/dev/ttyS5"

# Configure serial port parameters (baud rate and raw mode).
stty -F $SERIAL_PORT 115200 -opost -isig -icanon -echo

# Send the binary file directly to the serial port.
cat "$(dirname "$0")/off.bin" > $SERIAL_PORT

# Single short vibration to confirm RGB has been disbled.
echo 1 > /sys/class/power_supply/axp2202-battery/moto
sleep 0.1
echo 0 > /sys/class/power_supply/axp2202-battery/moto

sleep 0.15

echo 1 > /sys/class/power_supply/axp2202-battery/moto
sleep 0.1
echo 0 > /sys/class/power_supply/axp2202-battery/moto
