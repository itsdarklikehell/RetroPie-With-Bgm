# RetroPie-With-Bgm

Retropie with BGM (Background Music), theme notifications, start/stop/volume controls, and downloader.

## Installatie

Op een Raspberry Pi met Raspbian/RetroPie:

```bash
curl -sSL https://raw.githubusercontent.com/itsdarklikehell/RetroPie-With-Bgm/master/install.sh | bash
```

Of cloneer handmatig:

```bash
git clone https://github.com/itsdarklikehell/RetroPie-With-Bgm.git
cd RetroPie-With-Bgm
chmod +x *.sh
./install.sh
```

## Installatiescripts

Dit project levert een set installatiescripts voor Raspberry Pi met RetroPie + BGM integratie. Elke script is op zich ingesteld — zij zijn een verzameling, geen monolithische applicatie.

| Script | Doel |
|---|---|
| `install.sh` | Hoofd-installer: clone naar `~/RetroPie-With-Bgm`, voer alle subskripts achtereenvolgens uit |
| `install_RETROPIE.sh` | Installeer RetroPie-Setup (git clone + `retropie_setup.sh`) |
| `install_YOUTUBEDL.sh` | Installeer `yt-dlp` + `youtube-dl`, kopieer `dl-mp3` en `dl-mp4` helpers naar `~/bin`, download splashscreen-video's |
| `install_BGM.sh` | Clone `retropie_music_overlay` van madmodder123, voer `BGM_Install.sh` uit; initialiseer `~/RetroPie/BGM` map; download BGM-playlist via yt-dlp |
| `install_RETROPIEEXTRAS.sh` | Clone RetroPie-Extras (zerojay) en draai `install-extras.sh` |
| `menu.sh` | Interactief whiptail menu voor BGM-configuratie (download, playback, status) |
| `dl-mp3` | `yt-dlp --extract-audio --audio-format mp3` wrapper |
| `dl-mp4` | `yt-dlp` wrapper voor beste video+audio combineer |
| `config.ini` | Configuratie voor `menu.sh` (playlist URLs, paden, download tool) |

## Gebruik

### Installatie

```bash
curl -sSL https://raw.githubusercontent.com/itsdarklikehell/RetroPie-With-Bgm/master/install.sh | bash
```

### BGM Menu

Na installatie, start het interactieve menu:

```bash
~/RetroPie-With-Bgm/menu.sh
```

Het menu biedt:
- Download BGM playlist
- Download splashscreen videos
- Toon BGM bestanden
- Speel BGM af (mpg123)
- Toon configuratie
- Toon installatie-status

### Handmatig downloaden

```bash
# BGM (mp3)
~/bin/dl-mp3 "https://www.youtube.com/watch?v=VIDEO_ID&list=PLAYLIST_ID"

# Splashscreen (mp4)
~/bin/dl-mp4 "https://www.youtube.com/watch?v=VIDEO_ID&list=PLAYLIST_ID"
```

## Vereisten

- Raspberry Pi met Raspbian/RetroPie
- `sudo` rechten
- Internetverbinding
- `whiptail` (voor menu.sh)
- `mpg123` (voor BGM playback)
- `yt-dlp` (voor downloads, geïnstalleerd door install_YOUTUBEDL.sh)

## Configuratie

Bewerk `config.ini` om playlist URLs en paden aan te passen:

```ini
BGM_PLAYLIST_URL="https://www.youtube.com/watch?v=VIDEO_ID&list=PLAYLIST_ID"
SPLASHSCREEN_URL="https://www.youtube.com/watch?v=VIDEO_ID&list=PLAYLIST_ID"
BGM_DIR="$HOME/RetroPie/BGM"
SPLASH_DIR="$HOME/RetroPie/splashscreens"
DOWNLOAD_TOOL="yt-dlp"
```

## Troubleshooting

### BGM.py niet gevonden
Voer `install_BGM.sh` uit om de BGM overlay te installeren.

### yt-dlp niet gevonden
Voer `install_YOUTUBEDL.sh` uit om yt-dlp te installeren.

### Downloads mislukt
Controleer je internetverbinding en of de YouTube-links nog geldig zijn. yt-dlp kan geupdate worden met:
```bash
sudo pip3 install -U yt-dlp
```

## 🎥 Gource Visualisatie

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

## Voltooid

- [x] Retropie-Setup installatie
- [x] BGM overlay (madmodder123/retropie_music_overlay)
- [x] yt-dlp + youtube-dl + downloader helpers (dl-mp3, dl-mp4)
- [x] BGM playlist download + BGM map initialisatie
- [x] RetroPie-Extras integratie
- [x] Interactief whiptail menu voor BGM-configuratie
- [x] Gource CI workflow (nbprojekt/gource-action, 1080p/60fps)
- [x] Gource video in repo (geautomatiseerd per push)
- [x] Error handling (set -euo pipefail) in alle scripts
- [x] Configuratiebestand (config.ini) toegevoegd
- [x] .gitignore toegevoegd
- [x] LICENSE (MIT) toegevoegd
- [x] README bijgewerkt met volledige documentatie
