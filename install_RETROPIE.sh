#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo update-locale LC_ALL="en_US.UTF-8"
sudo apt-get install -y git lsb-release
cd
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
cd RetroPie-Setup
chmod +x retropie_setup.sh
sudo ./retropie_setup.sh
