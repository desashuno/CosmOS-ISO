#!/bin/bash

echo """########################
#  Updating the repo   #
########################"""
sleep 1
echo

#remove the last local repo and create a new one
echo cleaning the cache
sleep 0.5

#remove all the PKGBUILD and repo content
sudo rm -rv local_repo
sudo rm -rv PKGBUILD

#create the PKGBUILD and repo folder structure
echo creating the file estructure

#PKGBUILD
mkdir -v PKGBUILD
mkdir -v PKGBUILD/AwesomeWM
mkdir -v PKGBUILD/AwesomeWM/Awesome
mkdir -v PKGBUILD/AwesomeWM/Betterlockscreen
mkdir -v PKGBUILD/AwesomeWM/Picom
mkdir -v PKGBUILD/AwesomeWM/Pywal
mkdir -v PKGBUILD/AwesomeWM/Xidlehook
mkdir -v PKGBUILD/CosmOS-Calamares
mkdir -v PKGBUILD/CosmOS-Calamares/calamares
mkdir -v PKGBUILD/CosmOS-Calamares/dependency
mkdir -v PKGBUILD/CosmOS-Calamares/dependency/Ckbcomp
mkdir -v PKGBUILD/CosmOS-Calamares/dependency/Mkinitcpio-openswap
mkdir -v PKGBUILD/CosmOS-Calamares/dependency/Ttf-comfortaa
mkdir -v PKGBUILD/Paru

#repo 
mkdir -v local_repo
#mkdir -v local_repo/cache
mkdir -v local_repo/repo
mkdir -v local_repo/sources


###Download the lastest PKGBUILD file version
#####################################################################################################
(cd PKGBUILD/AwesomeWM/Awesome && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/awesome-git.tar.gz' --output awesome-git.tar.gz && tar -xvf  awesome-git.tar.gz)
(cd PKGBUILD/AwesomeWM/Betterlockscreen && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/betterlockscreen-git.tar.gz' --output betterlockscreen-git.tar.gz && tar -xvf  betterlockscreen-git.tar.gz)
(cd PKGBUILD/AwesomeWM/Picom && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/picom-git.tar.gz' --output picom-git.tar.gz && tar -xvf  picom-git.tar.gz)
(cd PKGBUILD/AwesomeWM/Pywal && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/pywal-git.tar.gz' --output pywal-git.tar.gz && tar -xvf  pywal-git.tar.gz)
(cd PKGBUILD/AwesomeWM/Xidlehook && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/xidlehook.tar.gz' --output xidlehook.tar.gz && tar -xvf  xidlehook.tar.gz)
(cd PKGBUILD/CosmOS-Calamares/calamares && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/calamares.tar.gz' --output calamares.tar.gz && tar -xvf calamares.tar.gz)
(cd PKGBUILD/CosmOS-Calamares/dependency/Ckbcomp && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/aur-63a7687dffd8fe818671d4cafb8fabb79b840943.tar.gz' --output aur-63a7687dffd8fe818671d4cafb8fabb79b840943.tar.gz && tar -xvf  aur-63a7687dffd8fe818671d4cafb8fabb79b840943.tar.gz)
(cd PKGBUILD/CosmOS-Calamares/dependency/Mkinitcpio-openswap && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/mkinitcpio-openswap.tar.gz' --output mkinitcpio-openswap.tar.gz  && tar -xvf mkinitcpio-openswap.tar.gz)
(cd PKGBUILD/CosmOS-Calamares/dependency/Ttf-comfortaa && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-comfortaa.tar.gz' --output ttf-comfortaa.tar.gz  && tar -xvf ttf-comfortaa.tar.gz)
(cd PKGBUILD/Paru && curl 'https://aur.archlinux.org/cgit/aur.git/snapshot/paru-git.tar.gz' --output paru-git.tar.gz  && tar -xvf paru-git.tar.gz)


###Prepare and compile
#####################################################################################################
cp -rv PKGBUILD/Paru local_repo/sources
cp -rv PKGBUILD/CosmOS-Calamares local_repo/sources
cp -rv PKGBUILD/AwesomeWM local_repo/sources

#PARU
########
(cd ./local_repo/sources/Paru/paru-git && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/Paru/paru-git/*.pkg.tar.zst local_repo/repo

#CALAMARES
#############
(cd ./local_repo/sources/CosmOS-Calamares/calamares/calamares && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/CosmOS-Calamares/calamares/calamares/*.pkg.tar.zst local_repo/repo

(cd ./local_repo/sources/CosmOS-Calamares/dependency/Ckbcomp/aur-63a7687dffd8fe818671d4cafb8fabb79b840943 && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/CosmOS-Calamares/dependency/Ckbcomp/aur-63a7687dffd8fe818671d4cafb8fabb79b840943/*.pkg.tar.zst local_repo/repo

(cd ./local_repo/sources/CosmOS-Calamares/dependency/Ttf-comfortaa/ttf-comfortaa && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/CosmOS-Calamares/dependency/Ttf-comfortaa/ttf-comfortaa/*.pkg.tar.zst local_repo/repo

(cd ./local_repo/sources/CosmOS-Calamares/dependency/Mkinitcpio-openswap/mkinitcpio-openswap && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/CosmOS-Calamares/dependency/Mkinitcpio-openswap/mkinitcpio-openswap/*.pkg.tar.zst local_repo/repo

#AWESOME WM
##############
(cd ./local_repo/sources/AwesomeWM/Awesome/awesome-git && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/AwesomeWM/Awesome/awesome-git/*.pkg.tar.zst local_repo/repo

(cd ./local_repo/sources/AwesomeWM/Picom/picom-git && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/AwesomeWM/Picom/picom-git/*.pkg.tar.zst local_repo/repo

(cd ./local_repo/sources/AwesomeWM/Pywal/pywal-git && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/AwesomeWM/Pywal/pywal-git/*.pkg.tar.zst local_repo/repo

(cd ./local_repo/sources/AwesomeWM/Betterlockscreen/betterlockscreen-git && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/AwesomeWM/Betterlockscreen/betterlockscreen-git/*.pkg.tar.zst local_repo/repo

(cd ./local_repo/sources/AwesomeWM/Xidlehook/xidlehook && makepkg -s --noconfirm PKGBUILD)
cp local_repo/sources/AwesomeWM/Xidlehook/xidlehook/*.pkg.tar.zst local_repo/repo

#####################################################################################################

#creates the repo and add all the content
(cd local_repo/repo && repo-add ./local_repo.db.tar.gz ./*)
