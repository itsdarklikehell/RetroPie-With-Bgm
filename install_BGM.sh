#!/bin/bash
INSTALLDIR=~/BGM.py
if [ -f "$INSTALLDIR" ]; then
echo "File $INSTALLDIR allready exists."
fi
if [ ! -f "$INSTALLDIR" ]; then
sudo apt-get install -y mpg123
cd ~
MADMODDER(){
git clone https://github.com/madmodder123/retropie_music_overlay
cd retropie_music_overlay
chmod +x BGM_Install.sh
./BGM_Install.sh
}
MADMODDER
fi
if [ ! -d "~/RetroPie/BGM" ]; then
mkdir ~/RetroPie/BGM
fi
