#!/bin/sh

SERIAL_PORT="/dev/ttyS5"

# Enable MCU power via the AXP2202 power controller.
echo 1 > /sys/class/power_supply/axp2202-battery/mcu_pwr

# Configure serial port parameters.
stty -F "$SERIAL_PORT" 115200 -opost -isig -icanon -echo

# Send the binary file directly to the serial port.
cat "$(dirname "$0")/../bin/off.bin" > "$SERIAL_PORT"

# Double short vibration to confirm RGB has been disabled.
echo 1 > /sys/class/power_supply/axp2202-battery/moto
sleep 0.1
echo 0 > /sys/class/power_supply/axp2202-battery/moto

sleep 0.15

echo 1 > /sys/class/power_supply/axp2202-battery/moto
sleep 0.1
echo 0 > /sys/class/power_supply/axp2202-battery/moto

exit 0