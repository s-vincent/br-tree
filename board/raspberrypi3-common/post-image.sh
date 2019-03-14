#!/bin/sh

# configure config.txt and cmdline.txt
sed -e '/^kernel=/s,=.*,=u-boot.bin,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
grep -q -F 'device_tree_address=' ${BINARIES_DIR}/rpi-firmware/config.txt || echo 'device_tree_address=0x100' >> ${BINARIES_DIR}/rpi-firmware/config.txt
grep -q -F 'device_tree=' ${BINARIES_DIR}/rpi-firmware/config.txt || echo 'device_tree=bcm2837-rpi-3-b.dtb' >> ${BINARIES_DIR}/rpi-firmware/config.txt
grep -q -F 'enable_uart=' ${BINARIES_DIR}/rpi-firmware/config.txt || echo 'enable_uart=1' >> ${BINARIES_DIR}/rpi-firmware/config.txt

grep -q -F 'dwc_otg.lpm_enable=0' ${BINARIES_DIR}/rpi-firmware/cmdline.txt || sed -i.bak 's/^/dwc_otg.lpm_enable=0 /' ${BINARIES_DIR}/rpi-firmware/cmdline.txt

# from Linux 4.14, raspberry pi 3 uses ttyS1 as serial console
grep -q -F 'console=ttyS1,115200' ${BINARIES_DIR}/rpi-firmware/cmdline.txt || sed -i.bak 's/console=ttyAMA0,115200/earlyprintk console=ttyS1,115200/' ${BINARIES_DIR}/rpi-firmware/cmdline.txt

for arg in "$@"
do
	case "${arg}" in
		--xenomai)
    # Add additionnal flags to make Xenomai kernel boots
    grep -q -F 'dwc_otg.fiq_enable=0' ${BINARIES_DIR}/rpi-firmware/cmdline.txt || sed -i.bak 's/^/dwc_otg.fiq_enable=0 dwc_otg.fiq_fsm_enable=0 dwc_otg.nak_holdoff=0 /' ${BINARIES_DIR}/rpi-firmware/cmdline.txt
		;;
  esac
done

