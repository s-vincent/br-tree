# buildroot-tree

Buildroot development tree

## Boards

Following custom boards are supported:
- Raspberry Pi 3 64-bit (4.14.x, 4.14.x-RT);
- Raspberry Pi 3 32-bit (4.14.x, 4.14.x-RT and 4.9.x-ipipe kernels);
- BeagleBone Black (4.14.x, 4.14.x-RT and 4.9.x-ipipe kernels);
- Olinuxino Lime2 (4.14.x, 4.14.x-RT).

## How to use

Untar the buildroot package and patch it:

```
tar -xjvf dl/buildroot-2019.02.tar.bz2
cd buildroot-2019.02
patch -p1 < ../patches/buildroot-2018.02.patch
cp ../patches/0002-demos-prevent-unterminated-destination-buffer-with-strncpy.patch ./package/xenomai/
```

### Raspberry Pi 3

Build a 32-bit toolchain:

```
cp ../configs/001_raspberrypi3_toolchain_defconfig ./.config
make toolchain
```

Build a 64-bit toolchain:

```
cp ../configs/001_raspberrypi3_64_toolchain_defconfig ./.config
make toolchain
```

Once done, copy a configuration and build it.

Example for 32-bit:

```
cp ../configs/004_raspberrypi3_wifi_defconfig ./.config
make
```

Example for 64-bit:

```
cp ../configs/004_raspberrypi3_64_wifi_defconfig ./.config
make
```

### BeagleBone Black

Build a toolchain:

```
cp ../configs/001_beaglebone_toolchain_defconfig ./.config
make toolchain
```

Once done, copy a configuration and build it.

```
cp ../configs/003_beaglebone_basic_defconfig ./.config
make
```

### Olinuxino Lime2

Build a toolchain:

```
cp ../configs/001_olinuxino_lime2_toolchain_defconfig ./.config
make toolchain
```

Once done, copy a configuration and build it.

```
cp ../configs/003_olinuxino_lime2_basic_defconfig ./.config
make
```

## SD card setup

Partition your SD card with three partitions (for /boot, / and /home) with
fdisk, parted or gparted. You can use 64 MB for /boot, 2 GB for / and what you
want for /home.

Next format your partitions, use vfat for /boot and /home and ext4 for /.

Assuming your SD card is /dev/mmcblk0 (or else change it!):

`sudo mkfs.vfat -n BOOT /dev/mmcblk0p1`

`sudo mkfs.ext4 -L ROOT /dev/mmcblk0p2`

`sudo mkfs.vfat -n HOME /dev/mmcblk0p3`

## Installation

To install the firmware into the SD card, use the following.

For Raspberry Pi 3:

`sudo ../scripts/install_rpi3_sd.sh`

For BeagleBone Black:

`sudo ../scripts/install_beaglebone_sd.sh`

For Olinuxino Lime2: 

`sudo dd if=./output/images/sdcard.img of=/dev/mmcblk0; sync;`

## Configurations

### Raspberry Pi 3

For 32-bit and 64-bit:
* 002_raspberrypi3*_minimal_defconfig: very minimal system (serial, login, ...);
* 003_raspberrypi3*_basic_defconfig: basic system (ssh, 1 user, special permissions, fstab, load /etc/modules, ...).
* 004_raspberrypi3*_wifi_defconfig: same as basic system with Wi-Fi support;
* 005_raspberrypi3*_rt_defconfig: same as basic/wifi system with PREEMPT-RT kernel as well as rt-tests and ltp packages.

For 32-bit only:
* 006_raspberrypi3_xenomai_defconfig: same as basic/wifi system but with I-Pipe/Xenomai 4.9.x kernel.

### BeagleBone Black

* 002_beaglebone_minimal_defconfig: very minimal system (serial, login, ...);
* 003_beaglebone_basic_defconfig: basic system (ssh, 1 user, special permissions, fstab, load /etc/modules, ...).
* 004_beaglebone_rt_defconfig: same as basic system with PREEMPT-RT kernel as well as rt-tests and ltp packages;
* 005_beaglebone_xenomai_defconfig: same as basic system but with I-Pipe/Xenomai 4.9.x kernel.

### Olinuxino Lime2

* 002_olinuxino_lime2_minimal_defconfig: very minimal system (serial, login, ...);
* 003_olinuxino_lime2_basic_defconfig: basic system (ssh, 1 user, special permissions, fstab, load /etc/modules, ...).
* 004_olinuxino_lime2_rt_defconfig: same as basic system with PREEMPT-RT kernel as well as rt-tests and ltp packages;

## Links

* https://buildroot.org/downloads/manual/manual.html

