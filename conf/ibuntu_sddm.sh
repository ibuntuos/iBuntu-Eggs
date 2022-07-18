#!/bin/bash
echo "Replace OS grub with ibuntubuilder's custom grub"
count=0

if [ ! -f /usr/lib/penguins-eggs/boot_count.txt ]; then
    echo $count > /usr/lib/penguins-eggs/boot_count.txt
fi


count="`cat /usr/lib/penguins-eggs/boot_count.txt`"


if [ $count -le 1 ]
then
   apt remove --purge sddm
   apt install sddm
   sddm --example-config > /etc/sddm.conf 
   sed -i '/Current=/c\Current=WhiteSur' /etc/sddm.conf
   systemctl daemon-reload
   systemctl enable sddm.service 

   echo $count > /usr/lib/penguins-eggs/boot_count.txt
#   reboot
fi

if [ $count -gt 1 ]
then
   echo "cleaning up iBuntu Installation"
   systemctl disable ibuntu_sddm.service
   rm /etc/systemd/system/ibuntu_sddm.service
   rm /etc/init.d/ibuntu_sddm.sh
   echo "System is ready to use!"
fi
