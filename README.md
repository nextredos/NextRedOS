# ![NextRedOS](https://www.nextred.it/web/wp-content/uploads/2025/07/logo.png)

# NextRedOS 1.04 "Ratkit"

> **Hardened Linux Distribution — Security by Default**  
> Based on Debian Trixie (13) — amd64 — Made in Europe 🇪🇺

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-red.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Based on Debian](https://img.shields.io/badge/Based%20on-Debian%20Trixie-red.svg)](https://www.debian.org)
[![Architecture](https://img.shields.io/badge/Architecture-amd64-black.svg)]()
[![GPG Signed](https://img.shields.io/badge/GPG-Signed%204096bit-red.svg)]()
[![Made in Europe](https://img.shields.io/badge/Made%20in-Europe%20🇪🇺-blue.svg)]()
[![Open Source First](https://img.shields.io/badge/Open%20Source-First-green.svg)]()

---

```
  _   _           _   ____          _  ___  ____  
 | \ | | _____  _| |_|  _ \ ___  __| |/ _ \/ ___| 
 |  \| |/ _ \ \/ / __| |_) / _ \/ _  | | | \___ \ 
 | |\  |  __/>  <| |_|  _ <  __/ (_| | |_| |___) |
 |_| \_|\___/_/\_\__|_| \_\___|\__,_|\___/|____/  
```

---

## 📖 Descrizione

**NextRedOS** è una distribuzione Linux basata su **Debian Trixie**, progettata con un focus primario sulla sicurezza informatica e l'hardening del sistema. Minimale, sicura e personalizzata, con un'estetica dark/red che riflette la sua natura orientata alla sicurezza.

Il codename **"Ratkit"** è un termine zoologico per cucciolo di ratto — simbolo della mascotte cyber rat di NextRedOS.

- 🛡️ **Security by Default** — hardening attivo fin dal primo avvio
- 🔒 **Privacy First** — MAC randomization, Tor, proxychains preconfigurati
- 🇪🇺 **European Open Source First** — priorità a software europeo e open source
- 🖥️ **MATE Desktop** — leggero, personalizzato, tema BlackMATE dark/red
- 🏠 **Home Assistant Ready** — Podman preinstallato e configurato
- ✍️ **GPG Signed** — ogni release firmata con chiave RSA 4096-bit

---

## 🆕 Novità in 1.04 "Ratkit"

### 🔒 Hardening avanzato
- **USBGuard** — blocco dispositivi USB non autorizzati
- **PAM Hardening** — password policy, timeout sessione 15min, faillock
- **Kernel Blacklist** — moduli kernel non necessari disabilitati
- **ClamAV on-access** — scansione automatica configurabile
- **Firmware completo** — Realtek, Intel, AMD, Atheros, Ralink e altri

### 🇪🇺 Stack europeo
- **LibreWolf** 🇪🇺 — browser hardened europeo
- **Proton VPN** 🇨🇭 — VPN svizzera no-log
- **Netbird** 🇩🇪 — VPN mesh tedesca open source
- **Element** 🇬🇧 — client Matrix britannico
- **Claws Mail** 🇫🇷 — client email francese
- **LibreOffice** 🇩🇪 — suite office tedesca
- **Nextcloud** 🇩🇪 — client cloud tedesco
- **KeePassXC** 🇩🇪 — password manager tedesco
- **Goldwarden** — client Bitwarden/Vaultwarden open source
- **Inkscape** 🇪🇺 — editor vettoriale europeo
- **Kdenlive** 🇪🇺 — editor video europeo
- **VLC** 🇫🇷 — media player francese
- **Tuba** 🇪🇺 — client Mastodon europeo
- **FreeTube** — YouTube player open source privacy-focused
- **CoMaps** — navigazione OpenStreetMap open source

### 🖥️ Desktop & UX
- Icone **HighContrast** — maggiore leggibilità
- **Wallpaper** — nuova collezione preinstallata
- **Flameshot** — screenshot avanzato
- **Timeshift** — snapshot sistema
- **Podman** — sostituisce Docker (rootless, daemonless)

---

## 🔐 Caratteristiche di Sicurezza

### Kernel Hardening
- Parametri sysctl ottimizzati per la sicurezza
- PTI (Page Table Isolation) attivo
- ASLR massimizzato (`kernel.randomize_va_space = 2`)
- Restrizioni ptrace (`kernel.yama.ptrace_scope = 2`)
- BPF non privilegiato disabilitato
- kptr_restrict e dmesg_restrict attivi
- Parametri GRUB: `vsyscall=none`, `debugfs=off`, `lockdown=confidentiality`
- Moduli kernel non necessari in blacklist

### Controllo Accessi
- **AppArmor** attivo in modalità enforce
- **Firejail** per sandboxing applicazioni
- **USBGuard** per controllo dispositivi USB
- **PAM Hardening** — password policy restrittiva

### Firewall e Rete
- **UFW** con policy deny in/out per default
- **MAC Address randomization** automatica
- **Tor** + **Proxychains** preconfigurati
- **Proton VPN** + **Netbird** preinstallati

### Monitoraggio e Audit
- `auditd` — logging avanzato
- `fail2ban` — blocco brute force
- `rkhunter` + `chkrootkit` — rilevamento rootkit
- `AIDE` — rilevamento modifiche filesystem
- `lynis` — audit completo
- `suricata` — intrusion detection
- `clamav` — antivirus

---

## 📦 Software Preinstallato

| Categoria | Software |
|-----------|----------|
| **Browser** | LibreWolf 🇪🇺 |
| **Email** | Claws Mail 🇫🇷 |
| **Office** | LibreOffice 🇩🇪 |
| **Cloud** | Nextcloud 🇩🇪 |
| **VPN** | Proton VPN 🇨🇭, Netbird 🇩🇪, OpenVPN |
| **Password** | KeePassXC 🇩🇪, Goldwarden |
| **Chat** | Element/Matrix 🇬🇧 |
| **Social** | Tuba (Mastodon) 🇪🇺 |
| **Media** | VLC 🇫🇷, FreeTube, Kdenlive 🇪🇺 |
| **Grafica** | GIMP 🇪🇺, Inkscape 🇪🇺 |
| **Mappe** | CoMaps |
| **Screenshot** | Flameshot |
| **Backup** | Timeshift |
| **Container** | Podman, Podman Compose |
| **Home Assistant** | Preconfigurato via Podman |
| **Analisi Rete** | nmap, wireshark, tcpdump, netcat, iftop |
| **Hardening** | apparmor, ufw, fail2ban, rkhunter, aide, lynis, suricata |

---

## 💻 Requisiti di Sistema

| Componente | Requisito |
|------------|-----------|
| Architettura | x86_64 (amd64) |
| RAM | 2 GB minimo (4 GB consigliati) |
| Spazio disco | 20 GB per installazione |
| CPU | 1 GHz o superiore |

---

## ⬇️ Download

**[→ Download NextRedOS 1.04 "Ratkit"](https://www.nextred.it/web/nextredos)**

| File | Link |
|------|------|
| ISO | [Download diretto](https://www.nextred.it/web/NROS/NextRedOS-amd64.hybrid.iso) |
| Firma GPG | [.asc](https://www.nextred.it/web/NROS/NextRedOS-amd64.hybrid.iso.asc) |
| SHA256 | [.sha256](https://www.nextred.it/web/NROS/NextRedOS-amd64.hybrid.iso.sha256) |
| Chiave pubblica | [.asc](https://www.nextred.it/web/NROS/NextRedOS-public-key.asc) |

---

## ✅ Verifica Integrità

```bash
# 1. Importa la chiave pubblica
gpg --import NextRedOS-public-key.asc

# 2. Verifica la firma GPG
gpg --verify NextRedOS-amd64.hybrid.iso.asc NextRedOS-amd64.hybrid.iso

# 3. Verifica il checksum SHA256
sha256sum -c NextRedOS-amd64.hybrid.iso.sha256
```

---

## 👤 Credenziali Live

| Campo | Valore |
|-------|--------|
| Username | `admin` |
| Password | `live` |
| Hostname | `nextredos` |
| Codename | `Ratkit` |

---

## 🏠 Home Assistant

```bash
cd ~/homeassistant
podman-compose up -d
# Interfaccia web: http://localhost:8123
```

**Alias disponibili:**
```bash
hastart    # avvia Home Assistant
hastop     # ferma Home Assistant
halogs     # visualizza log
hastatus   # stato container
haupdate   # aggiorna
```

---

## 🔄 Aggiornamento da 1.0

Per aggiornare da NextRedOS 1.0 usa lo script ufficiale disponibile nella root del repository:

```bash
chmod +x nextredos-update.sh
sudo ./nextredos-update.sh
```

Lo script esegue automaticamente backup, aggiornamento pacchetti e nuove configurazioni. **Consigliato solo per utenti esperti.**

---

## 🔨 Build da Sorgente

```bash
# Requisiti
sudo apt install -y live-build

# Clona il repository
git clone https://github.com/nextredos/NextRedOS.git
cd NextRedOS

# Build
./auto/config
sudo lb build 2>&1 | tee build.log
```

---

## 🇪🇺 Filosofia European Open Source First

NextRedOS privilegia software europeo e open source in ogni scelta. Non dichiariamo percentuali — dichiariamo un impegno: ogni volta che esiste un'alternativa europea e open source, la scegliamo. Ogni release migliora.

**No Google. No Meta. No Amazon. No US Big Tech.**

---

## ⚠️ Disclaimer

NextRedOS include strumenti professionali per la sicurezza informatica. L'utilizzo è consentito **SOLO** su sistemi e reti di propria proprietà o per cui si dispone di esplicita autorizzazione scritta.

---

## 📬 Contatti

- 🌐 **Sito web:** [www.nextred.it](https://www.nextred.it/web/)
- 📧 **Email:** info@nextred.it
- 🐙 **GitHub:** [github.com/nextredos](https://github.com/nextredos)
- 🇩🇪 **Codeberg:** [codeberg.org/nextredos](https://codeberg.org/nextredos)

---

*NextRedOS — Simple by design. Secure by default. Made in Europe 🇪🇺*
