#!/bin/sh
qemu-system-x86-64  -m 1500 -enable-kvm -hda Win7.img -nic none -cpu host   -device VGA,vgamem_mb=512 -smp 2
