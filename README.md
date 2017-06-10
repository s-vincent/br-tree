# br-tree
Buildroot development tree

## Boards

Following custom boards are supported:
- Raspberry Pi 3 64-bit (4.11.x and 4.9.x-RT kernels);
- Raspberry Pi 3 32-bit (4.11.x, 4.9.x-RT and rpi-4.1.y-ipipe kernels).

## How to use

Untar the buildroot package:
* tar -xjvf dl/buildroot-2017.05.tar.bz2
* cd buildroot-2017.05

Build a toolchain:
* For 32-bit: cp ../board/raspberrypi3-rt/001-buildroot-toolchain.cfg ./.config && make
* For 64-bit: cp ../board/raspberrypi3-64/001-buildroot-toolchain.cfg ./.config && make

Note to build a Xenomai system (only for 32-bit), you need a toolchain with 4.1 kernel headers:
* cp ../board/raspberrypi3-rt/006-buildroot-toolchain-4.1.cfg ./.config && make

Once done, copy a configuration to build a system:
* Example for 32-bit: cp ../board/raspberrypi3-rt/002-buildroot-minimal.cfg ./.config && make
* Example for 64-bit: cp ../board/raspberrypi3-64/002-buildroot-minimal.cfg ./.config && make

## Configurations

For 32-bit and 64-bit:
* 002-minimal.cfg: very minimal system (serial, login, ...);
* 003-buildroot-ovl-users-devices-ssh.cfg: basic system (ssh, 1 user, special permissions, fstab, load /etc/modules, ...).
* 004-buildroot-rt.cfg: same as 003-buildroot-ovl-users-devices-ssh.cfg but with a 4.9.x kernel with PREEMPT-RT patch as well as rt-tests and ltp packages;

For 32-bit only:
* 005-buildroot-xenomai.cfg: same as 003-buildroot-ovl-users-devices-ssh.cfg but with rpi-4.1.y-ipipe kernel with Xenomai.

