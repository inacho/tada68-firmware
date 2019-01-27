#!/usr/bin/env bash

set -e

APP_PATH="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$APP_PATH"

if [[ ! -f "$APP_PATH/tada68_nacho.bin" ]]; then
    echo "File tada68_nacho.bin not exists"
    echo "Compile the firmware first"
    exit
fi

# Countdown to have enough time to put the keyboard in flash mode

echo -n "Flashing the firmware in "
for i in {8..1};do echo -n "$i." && sleep 1; done
echo ""

# /Volumes/TADA68\ \ /tada68_nacho.bin

if [[ ! -d /Volumes/TADA68\ \ / ]]; then
    echo "Tada68 is not in flash mode";
    exit
fi

rm -rf /Volumes/TADA68\ \ /*
cp "$APP_PATH/tada68_nacho.bin" /Volumes/TADA68\ \ /FLASH.BIN

echo "Bin file copied to Tada68. Press ESC to exit flash mode"
