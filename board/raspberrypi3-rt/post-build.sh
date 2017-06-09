#!/bin/sh

# compile u-boot configuration 
mkimage -A arm -O linux -T script -C none -n boot.scr -d ${BASE_DIR}/../../board/raspberrypi3-rt/boot.source ${BINARIES_DIR}/boot.scr

# for xenomai rpi kernel
mv ${BINARIES_DIR}/bcm2710-rpi-3-b.dtb ${BINARIES_DIR}/bcm2837-rpi-3-b.dtb

