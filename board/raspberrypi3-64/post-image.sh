#!/bin/sh

# configure config.txt and cmdline.txt
sed -e '/^kernel=/s,=.*,=u-boot.bin,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
grep -q -F 'device_tree_address=' ${BINARIES_DIR}/rpi-firmware/config.txt || echo 'device_tree_address=0x100' >> ${BINARIES_DIR}/rpi-firmware/config.txt
grep -q -F 'device_tree=' ${BINARIES_DIR}/rpi-firmware/config.txt || echo 'device_tree=bcm2837-rpi-3-b.dtb' >> ${BINARIES_DIR}/rpi-firmware/config.txt

sed -i.bak 's/^/dwc_otg.lpm_enable=0 /' ${BINARIES_DIR}/rpi-firmware/cmdline.txt

