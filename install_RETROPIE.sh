#!/bin/bash
set -euo pipefail

sudo apt-get install -y git lsb-release byobu

if [ -d "$HOME/RetroPie-Setup" ]; then
    echo "Directory ~/RetroPie-Setup already exists. Skipping Download."
else
    echo "Directory ~/RetroPie-Setup does not exist."
    sudo apt-get update && sudo apt-get upgrade -y
    sudo update-locale LC_ALL="en_US.UTF-8"
    cd ~
    git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
fi

echo "Running retropie_setup.sh"
cd ~/RetroPie-Setup
chmod +x retropie_setup.sh
sudo ./retropie_setup.sh
