#!/bin/sh
                                                                                
sudo tar xf output/images/rootfs.tar -C /media/seb/ROOT/
cp output/images/bcm2710-rpi-3-b.dtb /media/seb/BOOT/
cp output/images/zImage /media/seb/BOOT/
cp output/images/u-boot.bin /media/seb/BOOT/
cp -r output/images/rpi-firmware/* /media/seb/BOOT/
cp ../board/raspberrypi3-rt/boot.scr /media/seb/BOOT/
                                                                                
#echo "kernel=zImage" > /media/seb/BOOT/config.txt
echo "kernel=u-boot.bin" > /media/seb/BOOT/config.txt
echo "# fixes rpi3 ttyAMA0 serial console" >> /media/seb/BOOT/config.txt
echo "#dtoverlay=pi3-miniuart-bt" >> /media/seb/BOOT/config.txt
echo "enable_uart=1" >> /media/seb/BOOT/config.txt
echo "device_tree_address=0x100" >> /media/seb/BOOT/config.txt
echo "device_tree=bcm2710-rpi-3-b.dtb" >> /media/seb/BOOT/config.txt
sed -i.bak 's/^/dwc_otg.lpm_enable=0 /' /media/seb/BOOT/cmdline.txt

