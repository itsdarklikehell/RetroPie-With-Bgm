#!/bin/bash
set -euo pipefail

# Clone RetroPie-Extras (zerojay) en draai install-extras.sh

INSTALLDIR="$HOME/RetroPie-Extra"

if [ -d "$INSTALLDIR" ]; then
    echo "Directory $INSTALLDIR already exists."
else
    echo "Directory $INSTALLDIR does not exist."
    cd "$HOME"
    git clone https://github.com/zerojay/RetroPie-Extra.git
    cd RetroPie-Extra/
    chmod +x install-extras.sh
    ./install-extras.sh
fi

cd "$HOME/RetroPie-Setup"
