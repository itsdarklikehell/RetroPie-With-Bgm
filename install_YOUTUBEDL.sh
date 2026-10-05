#!/bin/bash
set -euo pipefail

# Installeer yt-dlp (youtube-dl is deprecated), kopieer dl-mp3/dl-mp4 helpers,
# en download splashscreen-video's.

RETROPIEDIR="$HOME/RetroPie"

if [ ! -d "$RETROPIEDIR" ]; then
    echo "$RETROPIEDIR NOT FOUND. STOPPING."
    echo "Run install_RETROPIE.sh first."
    exit 1
fi

# Installeer yt-dlp
if command -v yt-dlp &>/dev/null; then
    echo "yt-dlp already installed: $(yt-dlp --version)"
else
    echo "Installing yt-dlp..."
    sudo apt-get update
    sudo apt-get install -y python3-pip ffmpeg
    sudo pip3 install -U yt-dlp
fi

# Installeer youtube-dl als fallback (sommige scripts gebruiken het nog)
if ! command -v youtube-dl &>/dev/null; then
    echo "Installing youtube-dl as fallback..."
    sudo curl -sSL https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod +x /usr/local/bin/youtube-dl
fi

# Kopieer helpers
mkdir -p "$HOME/bin"
cp "$(dirname "$0")/dl-mp3" "$HOME/bin/dl-mp3"
cp "$(dirname "$0")/dl-mp4" "$HOME/bin/dl-mp4"
chmod +x "$HOME/bin/dl-mp3" "$HOME/bin/dl-mp4"

# Maak BGM map
mkdir -p "$HOME/RetroPie/BGM"

# Download splashscreen video's
cd "$HOME/RetroPie/splashscreens"
echo "Downloading splashscreen videos..."
~/bin/dl-mp4 "https://www.youtube.com/watch?v=2ujP3NFQbGM&list=PLTpZXoSGu0v7vSpeSYmT77rQEnAX-14kG" || echo "Warning: splashscreen download failed (non-fatal)"
