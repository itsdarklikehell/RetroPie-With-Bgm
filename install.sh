#!/bin/bash
INSTALLDIR=~/RetroPie-With-Bgm
if [ -d "$INSTALLDIR" ]; then
echo "Directory $INSTALLDIR allready exists. PLEASE REMOVE IT FIRST!"
fi
if [ ! -d "$INSTALLDIR" ]; then
echo "Directory $INSTALLDIR DOES NOT exists."
cd ~
git clone https://github.com/itsdarklikehell/RetroPie-With-Bgm
cd RetroPie-With-Bgm
chmod +x *.sh
fi
./install_RETROPIE.sh
./install_YOUTUBEDL.sh
./install_BGM.sh
./install_RETROPIEEXTRAS.sh
