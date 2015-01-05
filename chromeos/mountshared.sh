#!/bin/sh

#dd if=/dev/zero of=loop bs=1KB count=1024; mkfs.ext4 /usr/local/loop #run first time
losetup /dev/loop7 /usr/local/loop
dbus-send --print-reply --system --dest=org.chromium.CrosDisks /org/chromium/CrosDisks org.chromium.CrosDisks.Mount string:"/dev/loop7" string:"" array:string:"rw"
mount --bind /usr/local/shared /media/removable/External\ Drive/shared

