#!/bin/bash
# Replace OS grub with ibuntubuilder's custom grub
cp /etc/default/grub.ibuntu /etc/default/grub
update-grub
systemctl disable ibuntu_grub.service
rm /usr/share/applications/reboot.desktop
rm /etc/systemd/system/ibuntu_grub.service
#rm /etc/init.d/ibuntu_grub.sh
