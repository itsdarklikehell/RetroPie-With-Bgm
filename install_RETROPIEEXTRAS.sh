#!/bin/bash
set -euo pipefail

INSTALLDIR=~/RetroPie-Extra

if [ -d "$INSTALLDIR" ]; then
    echo "Directory $INSTALLDIR already exists."
else
    echo "Directory $INSTALLDIR does not exist."
    cd ~
    git clone https://github.com/zerojay/RetroPie-Extra.git
    cd RetroPie-Extra/
    ./install-extras.sh
    cd ~/RetroPie-Setup
fi
