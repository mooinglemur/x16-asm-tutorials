#!/usr/bin/env bash

SDCARD=sdcard.img

rm -f "$SDCARD"
truncate -s 100M "$SDCARD"
mpartition -i "${SDCARD}|partition=1" -I ::
mpartition -i "${SDCARD}|partition=1" -c -b 2048 -T 0x0c ::
mformat -i "${SDCARD}|partition=1" -F ::
mcopy -i "${SDCARD}@@1M" -s -v -m root/* ::

