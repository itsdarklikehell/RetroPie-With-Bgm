#!/bin/bash
set -euo pipefail

whiptail --title "Intro Dialog" --msgbox "Rizzos BGM Menu. You must hit OK to continue." 8 78

# shellcheck source=/dev/null
source config.ini
