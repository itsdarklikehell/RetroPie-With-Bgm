#!/bin/bash
INSTALLDIR=/usr/local/bin/youtube-dl
if [ -d "$INSTALLDIR" ]; then
echo "$INSTALLDIR allready installed."
fi
if [ ! -d "$INSTALLDIR" ]; then
echo "$INSTALLDIR DOES NOT exist."
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
fi
if [ ! -d "~/bin" ]; then
mkdir ~/bin
fi
cp ~/RetroPie-With-BGM/dl-mp3 ~/bin/dl-mp3
chmod a+rx ~/bin/dl-mp3
cd ~/RetroPie/BGM
dl-mp3 --output startup.mp3 https://youtu.be/OMm1RLF32ig 
