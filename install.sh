#!/bin/bash
set -euo pipefail

INSTALLDIR=~/RetroPie-With-Bgm

if [ -d "$INSTALLDIR" ]; then
    echo "Directory $INSTALLDIR already exists. PLEASE REMOVE IT FIRST!"
    exit 1
fi

echo "Directory $INSTALLDIR does not exist."
cd ~
git clone https://github.com/itsdarklikehell/RetroPie-With-Bgm
cd RetroPie-With-Bgm
chmod +x *.sh

./install_RETROPIE.sh
./install_YOUTUBEDL.sh
./install_BGM.sh
./install_RETROPIEEXTRAS.sh
