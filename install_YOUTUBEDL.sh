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
cp ~/RetroPie-With-BGM/dl-mp3 ~/bin/dl-mp4
chmod +x ~/bin/dl-mp3
chmod +x ~/bin/dl-mp5
if [ ! -d "~/RetroPie/BGM" ]; then
mkdir ~/RetroPie/BGM
fi
cd ~/RetroPie/BGM
dl-mp3 https://www.youtube.com/watch?v=IbFEEfNE1YQ&list=PL89Sygaj3zlF_aS6Eo7YwfnqGHsVpXxDy

cd ~/RetroPie/splashscreens
dl-mp4 https://www.youtube.com/watch?v=2ujP3NFQbGM&list=PLTpZXoSGu0v7vSpeSYmT77rQEnAX-14kG
