#!/bin/bash
if [ -f "~/BGM.py" ]; then
echo "File ~/BGM.py allready exists."
fi
if [ ! -f "~/BGM.py" ]; then
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

YTDLOC=$(command -v youtube-dl)
if [ ! -f "$YTDLOC" ]; then
echo "youtube-dl was not found"
echo "run install_YOUTUBEDL.sh first."
fi
if [ -f "$YTDLOC" ]; then
echo "youtube-dl was found, downloading some BGM."
cd ~/RetroPie/BGM
~/bin/dl-mp3 https://www.youtube.com/watch?v=IbFEEfNE1YQ&list=PL89Sygaj3zlF_aS6Eo7YwfnqGHsVpXxDy
fi
