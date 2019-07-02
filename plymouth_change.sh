#!/bin/bash
echo -n 'Plymouthのpathを入力'

read path

sudo cp -r $path /usr/share/plymouth/themes/$path

sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/$path 100

sudo update-alternatives --config default.plymouth

sudo update-initramfs -u
 
