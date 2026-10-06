# RetroPie-With-Bgm

Retropie with BGM, theme notifications, start/stop/volume controls, downloader.

## Installatie

```bash
curl -sSL https://raw.githubusercontent.com/itsdarklikehell/RetroPie-With-Bgm/master/install.sh | bash
```

Of cloneer handmatig en run:

```bash
git clone https://github.com/itsdarklikehell/RetroPie-With-Bgm.git
cd RetroPie-With-Bgm
./install.sh
```

## Installatiescripts

Dit project levert een set installatiescripts voor Raspberry Pi met RetroPie + BGM (Background Music) integratie. Elke script is op zich ingesteld — zij zijn een verzameling, geen monolithische applicatie.

| Script | Doel |
|---|---|
| `install.sh` | Hoofd-installer: clone naar `~/RetroPie-With-Bgm`, voer alle subskripts achtereenvolgens uit |
| `install_RETROPIE.sh` | Installeer RetroPie-Setup (git clone + `retropie_setup.sh`) |
| `install_YOUTUBEDL.sh` | Installeer `youtube-dl`, kopieer `dl-mp3` en `dl-mp4` helpers naar `~/bin`, download splashscreen-video's |
| `install_BGM.sh` | Clone `retropie_music_overlay` van madmodder123, voer `BGM_Install.sh` uit; initialiseer `~/RetroPie/BGM` map; download BGM-playlist via youtube-dl |
| `install_RETROPIEEXTRAS.sh` | Clone RetroPie-Extras (zerojay) en draai `install-extras.sh` |
| `menu.sh` | Simple whiptail menu voor interactieve BGM-configuratie (gebruikt `config.ini`) |
| `dl-mp3` | `youtube-dl --extract-audio --audio-format mp3` wrapper |
| `dl-mp4` | `youtube-dl` wrapper voor beste video+audio combineer |

## Gebruik

Op een Raspberry Pi met Raspbian/RetroPie:

```bash
curl -sSL https://raw.githubusercontent.com/itsdarklikehell/RetroPie-With-Bgm/master/install.sh | bash
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

## Bijdragen

Zie [CONTRIBUTING.md](CONTRIBUTING.md) voor richtlijnen.

## Beveiliging

Zie [SECURITY.md](SECURITY.md) voor het beveiligingsbeleid.

## Licentie

Dit project is gelicenseerd onder de MIT License — zie [LICENSE](LICENSE) voor details.

## Voltooid

- [x] Retropie-Setup installatie
- [x] BGM overlay (madmodder123/retropie_music_overlay)
- [x] youtube-dl + downloader helpers (dl-mp3, dl-mp4)
- [x] BGM playlist download + BGM map initialisatie
- [x] RetroPie-Extras integratie
- [x] whiptail menu voor interactieve configuratie
- [x] Gource CI workflow (nbprojekt/gource-action, 1080p/60fps)
- [x] Gource video in repo (geautomatiseerd per push)
- [x] ShellCheck CI workflow
- [x] Error handling (set -euo pipefail) in alle scripts
- [x] Bugfixes (command -v checks, typos)
- [x] Documentatie (CONTRIBUTING, SECURITY, LICENSE)
