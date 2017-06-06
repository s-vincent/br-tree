#!/bin/sh
  
sudo tar xf output/images/rootfs.tar -C /media/seb/ROOT/
cp output/images/bcm2837-rpi-3-b.dtb /media/seb/BOOT/
cp output/images/bcm2710-rpi-3-b.dtb /media/seb/BOOT/
cp output/images/Image /media/seb/BOOT/
cp output/images/zImage /media/seb/BOOT/
cp output/images/u-boot.bin /media/seb/BOOT/
cp output/images/boot.scr /media/seb/BOOT/
cp -r output/images/rpi-firmware/* /media/seb/BOOT/

