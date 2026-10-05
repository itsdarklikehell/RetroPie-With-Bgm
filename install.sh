#!/bin/bash
set -euo pipefail

# RetroPie-With-Bgm — hoofd-installer
# Voert alle subskripts achtereenvolgens uit.

INSTALLDIR="$HOME/RetroPie-With-Bgm"

if [ -d "$INSTALLDIR" ]; then
    echo "Directory $INSTALLDIR already exists. PLEASE REMOVE IT FIRST!"
    exit 1
fi

echo "Directory $INSTALLDIR does not exist."
cd "$HOME"
git clone https://github.com/itsdarklikehell/RetroPie-With-Bgm.git
cd "$INSTALLDIR"
chmod +x ./*.sh

./install_RETROPIE.sh
./install_YOUTUBEDL.sh
./install_BGM.sh
./install_RETROPIEEXTRAS.sh

echo ""
echo "=== RetroPie-With-Bgm installatie voltooid ==="
echo "Start het whiptail menu met: ~/RetroPie-With-Bgm/menu.sh"
