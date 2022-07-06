#!/bin/bash
#(c)20222 for iBuntu OS
#
#
BASEDIR=$(dirname "$0")
echo $BASEDIR
echo "iBuntu-Eggs uses penguines-egg for creation of Masters since July 2022"
echo "Now let's start by updating/installing stuff and run it"
echo "========================================================================"
# Add the PPA for Pengues-Eggs and install it together with calamares
curl -SsL  https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/penguins-eggs-ppa-keyring.gpg
sudo curl -s --compressed -o /etc/apt/sources.list.d/penguins-eggs-ppa.list "https://pieroproietti.github.io/penguins-eggs-ppa/penguins-eggs-ppa.list"
sudo apt update
sudo apt install eggs -y
sudo eggs calamares --install

#Remove Penguines-Eggs Icons and stuff 
sudo rm /usr/share/applications/calamares.desktop
sudo rm /usr/share/applications/penguins-eggs.desktop

#Copy the iBuntu-Theme and Config for Penguines-Eggs to it's working directory
sudo cp -R $BASEDIR/conf/ibuntu /etc/penguins-eggs.d/addons/
sudo cp $BASEDIR/conf/eggs.yaml /etc/penguins-eggs.d/
sudo cp $BASEDIR/conf/isolinux.template /etc/penguins-eggs.d/addons/templates/
sudo cp $BASEDIR/conf/grub.template /etc/penguins-eggs.d/addons/templates/
sudo cp $BASEDIR/conf/HowToInstall.txt /home/ibuntu/Desktop/
sudo cp $BASEDIR/conf/grubcfg.yaml /etc/penguins-eggs.d/distros/bionic/calamares/calamares-modules/grubcfg/grubcfg.yml
sudo chown ibuntu /home/ibuntu/Desktop/HowToInstall.txt
sudo mv /usr/lib/penguins-eggs/assets/penguins-eggs.desktop /usr/lib/penguins-eggs/assets/penguins-eggs_trash.desktop
echo "For calamares config, just say yes once:"
sudo eggs calamares --theme ibuntu
#sudo cp $BASEDIR/conf/branding.desc /etc/calamares/branding/ibuntu/branding_ibuntu.desc

#Mount the "sf_Desktop" for VMWorkstation, Clean the Snaps and create the Skel Folder
sudo sh $BASEDIR/conf/mount.sh
sudo sh $BASEDIR/conf/clean.sh
sudo sh $BASEDIR/conf/skelcreate.sh

#Initialize the new ib-release file
sudo cp $BASEDIR/conf/ib-release.service /etc/systemd/system/
sudo cp $BASEDIR/conf/ib-release.sh /etc/init.d/
sudo systemctl start ib-release
sudo systemctl enable ib-release 

#Replace the Penguines-Eggs branding and the ovary control class with the modified ones
sudo mv /usr/lib/penguins-eggs/lib/classes/incubation/branding.js /usr/lib/penguins-eggs/lib/classes/incubation/branding_eggs.js 
sudo cp $BASEDIR/conf/branding.js /usr/lib/penguins-eggs/lib/classes/incubation/
sudo mv /usr/lib/penguins-eggs/lib/classes/ovary.js /usr/lib/penguins-eggs/lib/classes/ovary_eggs.js 
sudo cp $BASEDIR/conf/ovary.js /usr/lib/penguins-eggs/lib/classes/
#sudo mv /usr/lib/penguins-eggs/conf/exclude.list /usr/lib/penguins-eggs/conf/exclude_eggs.list 
#sudo cp $BASEDIR/conf/exclude.list /usr/lib/penguins-eggs/conf/

#Remove Build-Directory if still existant, install grub-efi if not yet done
sudo rm -R /home/eggs
sudo apt install -y grub-efi-amd64-bin

#Minor fix to Penguines-Eggs running into error when no "custom.conf" exists
sudo touch /etc/gdm3/custom.conf

#Main Procedure: Calling Eggs to remaster the system and create an iso
sudo eggs produce -vm --release --theme ibuntu 

#Copy the finished ISO to the Guest-Desktop
sudo cp /home/eggs/*.iso /media/sf_Desktop/


echo "Remastering successful!"





