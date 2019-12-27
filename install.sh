#!/bin/bash
cd ~
git clone https://github.com/itsdarklikehell/RetroPie-With-Bgm
cd RetroPie-With-Bgm
chmod +x *.sh
./install_RETROPIE.sh
./install_YOUTUBEDL.sh
./install_BGM.sh

