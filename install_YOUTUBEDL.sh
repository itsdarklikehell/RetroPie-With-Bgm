#!/bin/bash
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
mkdir ~/bin
cp dl-mp3 ~/bin/dl-mp3
chmod a+rx ~/bin/dl-mp3
