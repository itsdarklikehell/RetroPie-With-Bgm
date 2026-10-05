#!/bin/bash
set -euo pipefail

# Clone retropie_music_overlay van madmodder123, voer BGM_Install.sh uit,
# initialiseer ~/RetroPie/BGM map, en download BGM-playlist.

if [ ! -f "$HOME/BGM.py" ]; then
    echo "File ~/BGM.py does not exist."
    sudo apt-get update
    sudo apt-get install -y mpg123
    cd "$HOME"
    git clone https://github.com/madmodder123/retropie_music_overlay.git
    cd retropie_music_overlay
    chmod +x BGM_Install.sh
    ./BGM_Install.sh
else
    echo "File ~/BGM.py already exists. Skipping BGM overlay install."
fi

# Maak BGM map
mkdir -p "$HOME/RetroPie/BGM"

# Controleer yt-dlp
if ! command -v yt-dlp &>/dev/null; then
    echo "yt-dlp not found."
    echo "Run install_YOUTUBEDL.sh first."
    exit 1
fi

echo "Downloading BGM playlist..."
cd "$HOME/RetroPie/BGM"
yt-dlp --extract-audio --audio-format mp3 \
    "https://www.youtube.com/watch?v=IbFEEfNE1YQ&list=PL89Sygaj3zlF_aS6Eo7YwfnqGHsVpXxDy" \
    || echo "Warning: BGM download failed (non-fatal)"
