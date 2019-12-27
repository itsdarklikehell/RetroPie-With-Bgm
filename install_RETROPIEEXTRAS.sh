#!/bin/bash
INSTALLDIR=~/RetroPie-Extra
if [ -d "$INSTALLDIR" ]; then
echo "Directory $INSTALLDIR allready exists."
fi
if [ ! -d "$INSTALLDIR" ]; then
echo "Directory $INSTALLDIR DOES NOT exist."
cd ~
git clone https://github.com/zerojay/RetroPie-Extra.git
cd RetroPie-Extra/
./install-extras.sh
cd ~/RetroPie-Setup
fi
