#!/bin/sh

if [ $(id -u) -ne 0 ]                                                           
then                                                                            
  echo "Script has to be run as root or sudo"                                   
  exit 1                                                                        
fi   

user=$SUDO_USER

if [ -z "$user" ]
then
  user=$(whoami)
fi

echo "Copy images, kernel, ..."
tar xf output/images/rootfs.tar -C /media/$user/ROOT/
cp output/images/*.dtb /media/$user/BOOT/
cp output/images/zImage /media/$user/BOOT/
cp output/images/u-boot.img /media/$user/BOOT/
cp output/images/uEnv.txt /media/$user/BOOT/
cp output/images/MLO /media/$user/BOOT/

echo "Syncing!"
sync
umount /media/$user/BOOT
umount /media/$user/ROOT

echo "Done!"

