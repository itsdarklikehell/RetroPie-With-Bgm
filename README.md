# RetroPie-With-Bgm
Retropie with bgm, theme notifications, start/stop/volume controls, downloader.

curl -sSL https://raw.githubusercontent.com/itsdarklikehell/RetroPie-With-Bgm/master/install.sh | bash

or

wget https://raw.githubusercontent.com/itsdarklikehell/RetroPie-With-Bgm/master/install.sh
chmod +x install.sh
./install.sh


---

## 🎥 Gource Visualization

De ontwikkelhistorie van dit project in een film:

<video src="https://raw.githubusercontent.com/itsdarklikehell/RetroPie-With-Bgm/master/gource.mp4" controls width="100%"></video>

*De video wordt automatisch gegenereerd door de [Gource workflow](.github/workflows/gource.yml) bij elke push.*

Lokale video genereren:
```bash
gource --max-files 1000 --key -800x600 \
  --highlight-users --filename-time 3 --output-framerate 25 \
  -s 0.6 --multi-sampling --auto-skip-seconds 0.1 \
  --stop-at-end --hide mouse,progress -o gource.ppm

ffmpeg -y -r 15 -f image2pipe -vcodec ppm -i gource.ppm \
  -vcodec libx264 -preset medium -pix_fmt yuv420p \
  -crf 1 -threads 0 -bf 0 gource.mp4
```
