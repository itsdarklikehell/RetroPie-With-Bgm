#!/bin/bash
set -euo pipefail

YTDLOC=$(command -v youtube-dl || true)
RETROPIEDIR=~/RetroPie

if [ ! -d "$RETROPIEDIR" ]; then
    echo "$RETROPIEDIR NOT FOUND. STOPPING"
    echo "Run install_RETROPIE.sh first."
    ./install_RETROPIE.sh
fi

if [ -n "$YTDLOC" ]; then
    echo "youtube-dl already installed."
else
    echo "youtube-dl not installed."
    echo "Installing it now."
    sudo apt-get install -y youtube-dl
    sudo curl -sSL https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod +x /usr/local/bin/youtube-dl
fi

if [ ! -d "$HOME/bin" ]; then
    mkdir -p "$HOME/bin"
fi

cp dl-mp3 ~/bin/dl-mp3
cp dl-mp4 ~/bin/dl-mp4
chmod +x ~/bin/dl-mp3
chmod +x ~/bin/dl-mp4

if [ ! -d "$HOME/RetroPie/BGM" ]; then
    mkdir -p "$HOME/RetroPie/BGM"
fi

cd ~/RetroPie/splashscreens
~/bin/dl-mp4 "https://www.youtube.com/watch?v=2ujP3NFQbGM&list=PLTpZXoSGu0v7vSpeSYmT77rQEnAX-14kG"
