#!/bin/sh

TOP=$(pwd)/gateware/arty.bit

# TIP:
#   lsusb -d 0x0403:0x6010 -v | grep iSerial
#FTDI_SERIAL="ftdi_serial YOUR-ISERIAL"

# based on interface/ftdi/digilent-hs1.cfg
openocd \
	-c "interface ftdi" \
	-c "ftdi_vid_pid 0x0403 0x6010" \
	-c "ftdi_channel 0" \
	-c "ftdi_layout_init 0x0088 0x008b" \
	-c "reset_config none" \
	-c "transport select jtag" \
	-c "adapter_khz 25000" \
	-c "$FTDI_SERIAL" \
	-f cpld/xilinx-xc7.cfg \
	-f cpld/jtagspi.cfg \
	-c init \
	-c "pld load 0 $TOP" \
	-c shutdown
