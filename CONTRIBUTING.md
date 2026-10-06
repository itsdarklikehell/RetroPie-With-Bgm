# Contributing

Bedankt voor je interesse om bij te dragen aan RetroPie-With-Bgm!

## Hoe bij te dragen

1. Fork de repo
2. Maak een feature branch (`git checkout -b feature/amazing-feature`)
3. Commit je changes (`git commit -m 'Add amazing feature'`)
4. Push naar de branch (`git push origin feature/amazing-feature`)
5. Open een Pull Request

## Code standaarden

- Gebruik `set -euo pipefail` in alle bash-scripts
- Voeg comments toe waar de logica niet duidelijk is
- Test je scripts lokaal voordat je pusht
- Houd scripts compatibel met Raspberry Pi (ARM-architectuur)

## Commit berichten

Gebruik conventie: `type: korte beschrijving`

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

## Rapporteren van bugs

Gebruik GitHub Issues om bugs te rapporteren. Voeg toe:
- Wat je verwachtte
- Wat er gebeurde
- Omgeving (Raspberry Pi model, OS-versie)
