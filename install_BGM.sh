#!/bin/bash
set -euo pipefail

if [ -f "$HOME/BGM.py" ]; then
    echo "File ~/BGM.py already exists."
else
    sudo apt-get install -y mpg123
    cd ~
    git clone https://github.com/madmodder123/retropie_music_overlay
    cd retropie_music_overlay
    chmod +x BGM_Install.sh
    ./BGM_Install.sh
fi

if [ ! -d "$HOME/RetroPie/BGM" ]; then
    mkdir -p "$HOME/RetroPie/BGM"
fi

YTDLOC=$(command -v youtube-dl || true)
if [ -z "$YTDLOC" ]; then
    echo "youtube-dl was not found"
    echo "Run install_YOUTUBEDL.sh first."
    ./install_YOUTUBEDL.sh
fi

YTDLOC=$(command -v youtube-dl || true)
if [ -n "$YTDLOC" ]; then
    echo "youtube-dl was found, downloading some BGM."
    cd ~/RetroPie/BGM
    ~/bin/dl-mp3 "https://www.youtube.com/watch?v=IbFEEfNE1YQ&list=PL89Sygaj3zlF_aS6Eo7YwfnqGHsVpXxDy"
fi
