#!/bin/bash
cd ~
git clone https://github.com/zerojay/RetroPie-Extra.git
cd RetroPie-Extra/
./install-extras.sh
cd ~/RetroPie-Setup
sudo ./retropie_setup.sh