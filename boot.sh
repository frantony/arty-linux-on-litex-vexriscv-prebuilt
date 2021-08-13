#!/bin/sh

# Usage:
#   barebox@LiteX VexRiscV-SoC-Linux:/ dhcp; tftp arty-linux-on-litex-vexriscv-prebuilt/boot.sh; ./boot.sh

PREFIX=arty-linux-on-litex-vexriscv-prebuilt

tftp $PREFIX/opensbi/fw_jump.bin emulator.bin
tftp $PREFIX/buildroot/Image Image
tftp $PREFIX/gateware/arty.dtb dtb
tftp $PREFIX/buildroot/rootfs.cpio rootfs

memcpy -s Image 0 0x40000000
memcpy -s dtb 0 0x40ef0000
memcpy -s rootfs 0 0x41000000
memcpy -s emulator.bin 0 0x40f00000

go 0x40f00000
