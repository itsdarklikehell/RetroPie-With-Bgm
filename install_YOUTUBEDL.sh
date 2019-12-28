#!/bin/bash
YTDLOC=$(command -v youtube-dl)
RETROPIEDIR=~/RetroPie
if [ ! -d "$RETROPIEDIR" ]; then
echo "$RETROPIEDIR NOT FOUND. STOPPING"
echo "run install_RETROPIE.sh first."
exit 0
fi
if [ -f "$YTDLOC" ]; then
echo "youtube-dl allready installed."
fi
if [ ! -f "$YTDLOC" ]; then
echo "youtube-dl not installed."
echo "installing it now."
sudo apt-get install -y youtube-dl
sudo curl -sSL https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod +x /usr/local/bin/youtube-dl
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

cd ~/RetroPie/splashscreens
dl-mp4 https://www.youtube.com/watch?v=2ujP3NFQbGM&list=PLTpZXoSGu0v7vSpeSYmT77rQEnAX-14kG
