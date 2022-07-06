#!/bin/bash
# Replace OS grub with ibuntubuilder's custom grub

count=1

if [ ! -f /usr/lib/penguins-eggs/boot_count.txt ]; then
    echo $count > /usr/lib/penguins-eggs/boot_count.txt
fi


count="`cat /usr/lib/penguins-eggs/boot_count.txt`"


if [ $count -le 3 ]
then
   cp /etc/default/grub.ibuntu /etc/default/grub
   update-grub
   count=$count+1
   echo $count > /usr/lib/penguins-eggs/boot_count.txt
fi

if [ $count -gt 3 ]
then
   systemctl disable ibuntu_grub.service
   rm /etc/systemd/system/ibuntu_grub.service
   rm /etc/init.d/ibuntu_grub.sh
fi
