#!/bin/bash

echo """########################
#     CosmOS Linux     #
########################"""
echo
echo

#read -p "press enter to start the compilation:"

#decide if update all the repo content
read -p "do you want to update the local repo? [y/n]: "$'\n' -s confirm
if [ $confirm == "y" ]
then
#calls a script that updates the repo
sh updateRepo.sh

elif [ $confirm != "n" ]
then
echo  put y or n please
exit
fi


# creates the iso
echo """########################
#   Creating the ISO   #
########################"""

sleep 1

echo cleaning for the last install
sleep 0.5
sudo rm -rv work_dir
mkdir -v work_dir
mkdir -v out_dir

sudo mkarchiso -v -w work_dir -o out_dir archiso
#sudo mkarchiso -v -w work_dir -o out_dir archiso


echo
echo """########################
#       Finished       #
########################"""
