#!/bin/sh

if [ $(id -u) -ne 0 ]                                                           
then                                                                            
  echo "Script has to be run as root or sudo"                                   
  exit 1                                                                        
fi   

user=$SUDO_USER

tar xf output/images/rootfs.tar -C /media/$user/ROOT/
cp output/images/bcm2837-rpi-3-b.dtb /media/$user/BOOT/
cp output/images/Image /media/$user/BOOT/
cp output/images/zImage /media/$user/BOOT/
cp output/images/u-boot.bin /media/$user/BOOT/
cp output/images/boot.scr /media/$user/BOOT/
cp -r output/images/rpi-firmware/* /media/$user/BOOT/

sync
umount /media/$user/BOOT
umount /media/$user/ROOT

