#!/bin/bash
echo "Replace OS grub with ibuntubuilder's custom grub"
count=0

if [ ! -f /usr/lib/penguins-eggs/boot_count.txt ]; then
    echo $count > /usr/lib/penguins-eggs/boot_count.txt
fi


count="`cat /usr/lib/penguins-eggs/boot_count.txt`"


if [ $count -le 1 ]
then
   echo "update-grub"
   cp /etc/default/grub.ibuntu /etc/default/grub
   update-grub
   count=`expr $count + 1`
   echo $count > /usr/lib/penguins-eggs/boot_count.txt
#   reboot
fi

if [ $count -gt 1 ]
then
   echo "cleaning up iBuntu Installation"
   systemctl disable ibuntu_grub.service
   rm /etc/systemd/system/ibuntu_grub.service
   rm /etc/init.d/ibuntu_grub.sh
   rm -rf /home/*/Desktop/HowToInstall.txt
   rm -rf /usr/share/applications/reboot.desktop
   echo "System is ready to use!"
fi
