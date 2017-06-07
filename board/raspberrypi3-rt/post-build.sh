#!/bin/sh

# compile u-boot configuration 
mkimage -A arm -O linux -T script -C none -n boot.scr -d ${BASE_DIR}/../../board/raspberrypi3-rt/boot.source ${BINARIES_DIR}/boot.scr

