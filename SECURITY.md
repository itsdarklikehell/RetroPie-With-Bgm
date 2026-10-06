# Security Policy

## Ondersteunde versies

| Versie | Ondersteund |
|--------|-------------|
| latest | ✅ |

## Een beveiligingsprobleem rapporteren

Rapporteren je een beveiligingsprobleem? Maak dan een GitHub Issue aan met het label `security`.

**Niet** publiekelijk delen totdat het probleem is opgelost.

Wat te verwachten:
- Binnen 48 uur ontvang je een bevestiging
- We werken samen aan een fix en publiceren deze zo snel mogelijk
- Je wordt vermeld in de release notes (als je dat wilt)

## Bekende beveiligingsoverwegingen

- Dit project gebruikt `curl | bash` voor installatie. Dit is een bekend risicopatroon. Overweeg om de scripts lokaal te downloaden en te reviewen voordat je ze uitvoert.
- `youtube-dl` wordt gedownload zonder checksum-verificatie. Overweeg om de handmatige installatie-instructies te gebruiken.
