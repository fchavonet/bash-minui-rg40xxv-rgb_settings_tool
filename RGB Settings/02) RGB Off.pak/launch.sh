#!/bin/sh

SERIAL_PORT="/dev/ttyS5"

# Configure serial port parameters (baud rate and raw mode).
stty -F $SERIAL_PORT 115200 -opost -isig -icanon -echo

# Send the binary file directly to the serial port.
cat "$(dirname "$0")/off.bin" > $SERIAL_PORT