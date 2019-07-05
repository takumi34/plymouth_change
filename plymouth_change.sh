#!/bin/bash
echo -n 'Plymouthのディレクトリ名を入力'
read path1
echo -n 'plymouthのファイル名を入力'
read path2

sudo cp -rf $path1 /usr/share/plymouth/themes/$path1

sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/$path1/$path2 100

sudo update-alternatives --config default.plymouth

sudo update-initramfs -u
 
sudo plymouthd ; sudo plymouth --show-splash ; for ((I=0; I<10; I++)); do sleep 1 ; sudo plymouth --update=test$I ; done ; sudo plymouth --quit
