# ![NextRedOS](https://www.nextred.it/web/wp-content/uploads/2025/07/logo.png)

# NextRedOS 1.0

> **Hardened Linux Distribution — Security by Default**  
> Based on Debian Trixie (13) — amd64

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-red.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Based on Debian](https://img.shields.io/badge/Based%20on-Debian%20Trixie-red.svg)](https://www.debian.org)
[![Architecture](https://img.shields.io/badge/Architecture-amd64-black.svg)]()
[![GPG Signed](https://img.shields.io/badge/GPG-Signed%204096bit-red.svg)]()

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

- 🛡️ **Security by Default** — hardening attivo fin dal primo avvio
- 🔒 **Privacy First** — MAC randomization, Tor, proxychains preconfigurati
- 🖥️ **MATE Desktop** — leggero, personalizzato, tema BlackMATE dark/red
- 🏠 **Home Assistant Ready** — Docker preinstallato e configurato
- ✍️ **GPG Signed** — ogni release firmata con chiave RSA 4096-bit

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

### Controllo Accessi
- **AppArmor** attivo in modalità enforce
- Profili AppArmor preinstallati e attivi
- **Firejail** per sandboxing applicazioni utente

### Firewall e Rete
- **UFW** con policy deny in/out per default
- Porte aperte: 80/tcp, 443/tcp, 53/udp (solo outgoing)
- **MAC Address randomization** automatica (Wi-Fi ed Ethernet)
- NetworkManager configurato per privacy massima

### Monitoraggio e Audit
- `auditd` — logging avanzato eventi di sistema
- `fail2ban` — blocco automatico brute force
- `rkhunter` + `chkrootkit` — rilevamento rootkit
- `AIDE` — rilevamento modifiche filesystem
- `lynis` — audit completo del sistema
- `suricata` — intrusion detection system

---

## 📦 Software Preinstallato

| Categoria | Software |
|-----------|----------|
| **Analisi Rete** | nmap, wireshark, tcpdump, netcat, traceroute, whois, iftop |
| **Privacy & Crypto** | tor, proxychains4, gnupg, openvpn, keepassxc, firejail |
| **Hardening** | apparmor, ufw, fail2ban, rkhunter, chkrootkit, aide, lynis, auditd, suricata, clamav |
| **Monitoraggio** | htop, glances, logwatch, net-tools |
| **Desktop** | MATE, Firefox ESR, Thunderbird, VLC, GIMP, Evince, KeePassXC |
| **Automazione** | Docker, Docker Compose, Home Assistant |

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

Scarica l'ultima versione dalla pagina ufficiale:

**[→ Download NextRedOS 1.0](https://www.nextred.it/web/nextredos)**

| File | Descrizione |
|------|-------------|
| `NextRedOS-amd64.hybrid.iso` | Immagine ISO avviabile |
| `NextRedOS-amd64.hybrid.iso.asc` | Firma GPG |
| `NextRedOS-amd64.hybrid.iso.sha256` | Checksum SHA256 |
| `NextRedOS-public-key.asc` | Chiave pubblica GPG |

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

---

## 🏠 Home Assistant

Home Assistant Container è preinstallato e pronto all'uso:

```bash
cd ~/homeassistant
docker compose up -d
# Interfaccia web: http://localhost:8123
```

**Alias disponibili:**
```bash
hastart    # avvia Home Assistant
hastop     # ferma Home Assistant
halogs     # visualizza log
hastatus   # stato container
haupdate   # aggiorna all'ultima versione
```

---

## 🔨 Build da Sorgente

Per ricostruire NextRedOS dal codice sorgente:

```bash
# Requisiti
sudo apt install -y live-build

# Clona il repository
git clone https://github.com/nextredos/NextRedOS.git
cd NextRedOS

# Copia i tuoi file personalizzati
cp /path/to/wallpaper.png config/includes.chroot/usr/share/backgrounds/NextRedOS/wallpaper.png
cp /path/to/logo.png config/includes.chroot/usr/share/pixmaps/nextredos-logo.png
cp /path/to/wallpaper.png config/includes.chroot/usr/share/plymouth/themes/NextRedOS/wallpaper.png
cp /path/to/logo.png config/includes.chroot/usr/share/plymouth/themes/NextRedOS/logo.png

# Build
./auto/config
sudo lb build 2>&1 | tee build.log
```

### Build annuale
```bash
cd ~/NextRedOS
sudo lb clean
./auto/config
sudo lb build 2>&1 | tee build.log
```

### Migrazione a Debian 14 (Forky)
Modifica una sola riga in `auto/config`:
```bash
--distribution forky \
```

---

## ⚠️ Disclaimer

NextRedOS include strumenti professionali per la sicurezza informatica. L'utilizzo è consentito **SOLO** su sistemi e reti di propria proprietà o per cui si dispone di esplicita autorizzazione scritta.

L'uso non autorizzato di strumenti di sicurezza può costituire reato ai sensi delle leggi vigenti in materia informatica. Gli autori di NextRedOS declinano ogni responsabilità per usi impropri o illegali del software incluso.

---

## 📬 Contatti

- 🌐 **Sito web:** [www.nextred.it](https://www.nextred.it/web/)
- 📧 **Email:** info@nextred.it
- 🐙 **GitHub:** [github.com/nextredos](https://github.com/nextredos)

---

*NextRedOS è software libero distribuito sotto licenza GNU GPL v3.0*
