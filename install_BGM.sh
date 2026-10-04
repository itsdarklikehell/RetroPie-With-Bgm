#!/bin/bash
if [ -f "$HOME/BGM.py" ]; then
echo "File ~/BGM.py allready exists."
fi
if [ ! -f "$HOME/BGM.py" ]; then
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
if [ ! -d "$HOME/RetroPie/BGM" ]; then
mkdir -p "$HOME/RetroPie/BGM"
fi

YTDLOC=$(command -v yt-dlp)
if [ ! -f "$YTDLOC" ]; then
echo "yt-dlp was not found"
echo "run install_YOUTUBEDL.sh first."
./install_YOUTUBEDL.sh
fi
if [ -f "$YTDLOC" ]; then
echo "yt-dlp was found, downloading some BGM."
cd ~/RetroPie/BGM || exit 1
~/bin/dl-mp3 "https://www.youtube.com/watch?v=IbFEEfNE1YQ&list=PL89Sygaj3zlF_aS6Eo7YwfnqGHsVpXxDy"
fi
