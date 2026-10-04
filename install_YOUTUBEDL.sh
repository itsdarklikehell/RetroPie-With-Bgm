#!/bin/bash
YTDLOC=$(command -v yt-dlp)
RETROPIEDIR=~/RetroPie
if [ ! -d "$RETROPIEDIR" ]; then
echo "$RETROPIEDIR NOT FOUND. STOPPING"
echo "run install_RETROPIE.sh first."
./install_RETROPIE.sh
fi
if [ -f "$YTDLOC" ]; then
echo "yt-dlp allready installed."
fi
if [ ! -f "$YTDLOC" ]; then
echo "yt-dlp not installed."
echo "installing it now."
sudo apt-get install -y yt-dlp
sudo curl -sSL https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod +x /usr/local/bin/yt-dlp
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

cd ~/RetroPie/splashscreens || exit 1
~/bin/dl-mp4 "https://www.youtube.com/watch?v=2ujP3NFQbGM&list=PLTpZXoSGu0v7vSpeSYmT77rQEnAX-14kG"
