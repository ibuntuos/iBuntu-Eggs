#!/bin/bash
#Copy Skel-Stuff to /etc/skel
echo "###############Clean whole System#############"
echo "Username?"
read LIVEUSER
sudo apt -f install &&
sudo apt -y autoremove &&
sudo apt -y autoclean &&
sudo apt -y clean &&
sudo aptitude purge
echo ""
echo "########Clean Temp-Files of local user########"
echo "sudo rm -rf /tmp/*"
sudo rm -rf /tmp/*
echo "sudo rm -rf /var/logs/*"
sudo rm -rf /var/logs/*
echo "sudo rm -rf /var/tmp/*"
sudo rm -rf /var/tmp/*
echo "rm -rf ~/.thumbs/*"
rm -rf ~/.thumbs/*
echo "sudo rm -rf ~/.cache/*"
sudo rm -rf ~/.cache/*
# rm -rf ~/.xbmc/addons/packages
echo "rm -rf ~/.local/share/Trash/files/*"
rm -rf ~/.local/share/Trash/files/*
echo "rm -rf .gvfs"
rm -rf .gvfs
echo "rm -rf .local/share/gvfs-metadata"
rm -rf .local/share/gvfs-metadata
echo "rm -rf .locl/share/Trash"
rm -rf .local/share/Trash/
echo "echo '' > ~/.bash_history"
echo "" > ~/.bash_history
echo "history -c"
history -c
echo ""
echo "###############Clean /etc/skel################"
echo "sudo rm -rf /etc/skel/.??*"
sudo rm -rf /etc/skel/.??*
echo "sudo rm -rf /etc/skel/*"
sudo rm -rf /etc/skel/*
echo ""
echo "########Copy relevant data to /etc/skel#######"
echo "sudo cp -r /home/$LIVEUSER/.config /etc/skel"
sudo cp -r /home/$LIVEUSER/.config /etc/skel
echo "sudo cp -r /home/$LIVEUSER/.local /etc/skel"
sudo cp -r /home/$LIVEUSER/.local /etc/skel
echo "sudo cp -r /home/$LIVEUSER/.kde /etc/skel"
sudo cp -r /home/$LIVEUSER/.kde /etc/skel
#sudo cp -r /home/$LIVEUSER/.gconf /etc/skel
#sudo cp -r /home/$LIVEUSER/.gnome2 /etc/skel
#sudo cp -r /home/$LIVEUSER/.mplayer /etc/skel
echo "sudo cp /home/$LIVEUSER/.bashrc /etc/skel"
sudo cp /home/$LIVEUSER/.bashrc /etc/skel
echo "sudo cp /home/$LIVEUSER/.profile /etc/skel"
sudo cp /home/$LIVEUSER/.profile /etc/skel
#sudo cp /home/$LIVEUSER/.face /etc/skel
#sudo cp -r /home/$LIVEUSER/.dockbarx /etc/skel
sudo cp -r /home/$LIVEUSER/.easystroke /etc/skel
sudo cp -r /home/$LIVEUSER/.xscreensaver /etc/skel
sudo cp -r /home/$LIVEUSER/.sudo_as_admin_successful /etc/skel
sudo cp -r /home/$LIVEUSER/.Xauthority /etc/skel
#sudo cp -r /home/$LIVEUSER/.mozilla /etc/skel
#echo "sudo cp -r /home/$LIVEUSER/.themes /etc/skel"
#sudo cp -r /home/$LIVEUSER/.themes /etc/skel
#echo "sudo cp -r /home/$LIVEUSER/.icons /etc/skel"
#sudo cp -r /home/$LIVEUSER/.icons /etc/skel
#sudo cp -r /home/$LIVEUSER/Escritorio /etc/skel
#sudo cp -r /home/$LIVEUSER/Desktop /etc/skel
echo "sudo cp -r /home/$LIVEUSER/snap /etc/skel"
sudo cp -r /home/$LIVEUSER/snap /etc/skel
echo "sudo rm /etc/skel/.config/user-dirs.*"
sudo rm /etc/skel/.config/user-dirs.*
echo "sudo rm /etc/skel/.config/monitors.*"
sudo rm /etc/skel/.config/monitors.*
sudo rm /etc/skel/.config/google.*
echo "### Make Desktop-File for Installer ###"
sudo cp -r /home/$LIVEUSER/Desktop /etc/skel
sudo chmod -R 777 /etc/skel
