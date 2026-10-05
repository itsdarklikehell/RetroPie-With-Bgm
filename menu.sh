#!/bin/bash
set -euo pipefail

# RetroPie-With-Bgm — interactief whiptail menu voor BGM-configuratie

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/config.ini"

# Laad configuratie
# shellcheck source=/dev/null
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "config.ini not found. Using defaults."
    BGM_PLAYLIST_URL="https://www.youtube.com/watch?v=IbFEEfNE1YQ&list=PL89Sygaj3zlF_aS6Eo7YwfnqGHsVpXxDy"
    SPLASHSCREEN_URL="https://www.youtube.com/watch?v=2ujP3NFQbGM&list=PLTpZXoSGu0v7vSpeSYmT77rQEnAX-14kG"
    BGM_DIR="$HOME/RetroPie/BGM"
    SPLASH_DIR="$HOME/RetroPie/splashscreens"
fi

# Functie: BGM downloaden
download_bgm() {
    echo "Downloading BGM playlist..."
    mkdir -p "$BGM_DIR"
    cd "$BGM_DIR"
    yt-dlp --extract-audio --audio-format mp3 "$BGM_PLAYLIST_URL"
    whiptail --title "Done" --msgbox "BGM playlist gedownload naar $BGM_DIR" 10 60
}

# Functie: Splashscreen downloaden
download_splash() {
    echo "Downloading splashscreen videos..."
    mkdir -p "$SPLASH_DIR"
    cd "$SPLASH_DIR"
    yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "$SPLASHSCREEN_URL"
    whiptail --title "Done" --msgbox "Splashscreen videos gedownload naar $SPLASH_DIR" 10 60
}

# Functie: BGM map tonen
show_bgm_files() {
    if [ -d "$BGM_DIR" ]; then
        local count
        count=$(find "$BGM_DIR" -name "*.mp3" | wc -l)
        local files
        files=$(find "$BGM_DIR" -name "*.mp3" -printf "%f\n" | head -20)
        whiptail --title "BGM Files (${count} total)" --msgbox "$files" 20 70
    else
        whiptail --title "Error" --msgbox "BGM directory not found: $BGM_DIR" 10 60
    fi
}

# Functie: Configuratie tonen
show_config() {
    local config_text
    config_text=$(cat "$CONFIG_FILE" 2>/dev/null || echo "config.ini not found")
    whiptail --title "Configuratie" --msgbox "$config_text" 20 70
}

# Functie: BGM afspelen (met mpg123)
play_bgm() {
    if [ ! -d "$BGM_DIR" ]; then
        whiptail --title "Error" --msgbox "BGM directory not found: $BGM_DIR" 10 60
        return
    fi
    local mp3_files
    mp3_files=$(find "$BGM_DIR" -name "*.mp3" | head -5)
    if [ -z "$mp3_files" ]; then
        whiptail --title "Error" --msgbox "No MP3 files found in $BGM_DIR" 10 60
        return
    fi
    whiptail --title "Play BGM" --msgbox "Playing first 5 tracks from $BGM_DIR\n\nPress OK to start (Ctrl+C to stop)." 10 60
    for f in $mp3_files; do
        mpg123 "$f" 2>/dev/null || true
    done
}

# Functie: Installatie-status tonen
show_status() {
    local status="=== RetroPie-With-Bgm Status ===\n\n"
    status+="yt-dlp: $(command -v yt-dlp || echo 'NOT INSTALLED')\n"
    status+="youtube-dl: $(command -v youtube-dl || echo 'NOT INSTALLED')\n"
    status+="mpg123: $(command -v mpg123 || echo 'NOT INSTALLED')\n"
    status+="BGM.py: $([ -f "$HOME/BGM.py" ] && echo 'INSTALLED' || echo 'NOT INSTALLED')\n"
    status+="BGM dir: $([ -d "$BGM_DIR" ] && echo 'EXISTS' || echo 'NOT FOUND')\n"
    status+="Splash dir: $([ -d "$SPLASH_DIR" ] && echo 'EXISTS' || echo 'NOT FOUND')\n"
    status+="RetroPie-Setup: $([ -d "$HOME/RetroPie-Setup" ] && echo 'EXISTS' || echo 'NOT FOUND')\n"
    status+="RetroPie-Extra: $([ -d "$HOME/RetroPie-Extra" ] && echo 'EXISTS' || echo 'NOT FOUND')\n"
    whiptail --title "Status" --msgbox "$status" 20 70
}

# Hoofdmenu
while true; do
    CHOICE=$(whiptail --title "RetroPie-With-Bgm Menu" --menu "Kies een optie:" 20 70 12 \
        "1" "Download BGM playlist" \
        "2" "Download splashscreen videos" \
        "3" "Toon BGM bestanden" \
        "4" "Speel BGM af (mpg123)" \
        "5" "Toon configuratie" \
        "6" "Toon installatie-status" \
        "7" "Toon README" \
        "8" "Exit" \
        3>&1 1>&2 2>&3)

    # Exit als annuleren (whiptail geeft non-zero terug bij ESC/Cancel)
    if [ -z "$CHOICE" ]; then
        echo "Menu gesloten."
        exit 0
    fi

    case "$CHOICE" in
        1) download_bgm ;;
        2) download_splash ;;
        3) show_bgm_files ;;
        4) play_bgm ;;
        5) show_config ;;
        6) show_status ;;
        7) whiptail --title "README" --msgbox "$(cat "${SCRIPT_DIR}/README.md" 2>/dev/null || echo 'README.md not found')" 25 80 ;;
        8) echo "Tot ziens!"; exit 0 ;;
        *) whiptail --title "Error" --msgbox "Ongeldige keuze." 10 60 ;;
    esac
done
