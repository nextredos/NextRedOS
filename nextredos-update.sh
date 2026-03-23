#!/bin/bash
# ==============================================================================
#  _   _           _   ____          _  ___  ____  
# | \ | | _____  _| |_|  _ \ ___  __| |/ _ \/ ___| 
# |  \| |/ _ \ \/ / __| |_) / _ \/ _  | | | \___ \ 
# | |\  |  __/>  <| |_|  _ <  __/ (_| | |_| |___) |
# |_| \_|\___/_/\_\__|_| \_\___|\__,_|\___/|____/ 
#
#  NextRedOS Update Script — 1.0 → 1.04 "Ratkit"
#  Made in Europe — Open Source First
#  https://www.nextred.it/web/
#  info@nextred.it
# ==============================================================================
# WARNING: This script is intended for EXPERIENCED USERS only.
#          Run as root or with sudo privileges.
#          A backup of your home directory will be created automatically.
# ==============================================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

LOGFILE="/var/log/nextredos-update.log"
BACKUP_DIR="$HOME/nextredos-backup-$(date +%Y%m%d-%H%M%S)"

# ==============================================================================
# FUNCTIONS
# ==============================================================================

log() { echo -e "${WHITE}[INFO]${NC} $1" | tee -a "$LOGFILE"; }
ok()  { echo -e "${GREEN}[OK]${NC}   $1" | tee -a "$LOGFILE"; }
warn(){ echo -e "${YELLOW}[WARN]${NC} $1" | tee -a "$LOGFILE"; }
err() { echo -e "${RED}[ERR]${NC}  $1" | tee -a "$LOGFILE"; }

check_root() {
    if [ "$EUID" -ne 0 ]; then
        err "This script must be run as root or with sudo."
        exit 1
    fi
}

print_banner() {
    clear
    echo -e "${RED}"
    echo "  _   _           _   ____          _  ___  ____  "
    echo " | \ | | _____  _| |_|  _ \ ___  __| |/ _ \/ ___| "
    echo " |  \| |/ _ \ \/ / __| |_) / _ \/ _  | | | \___ \ "
    echo " | |\  |  __/>  <| |_|  _ <  __/ (_| | |_| |___) |"
    echo " |_| \_|\___/_/\_\__|_| \_\___|\__,_|\___/|____/  "
    echo -e "${NC}"
    echo -e "${WHITE} NextRedOS Update Script — 1.0 → 1.04 \"Ratkit\"${NC}"
    echo -e "${RED} Made in Europe 🇪🇺 — Open Source First${NC}"
    echo " =================================================="
    echo ""
}

confirm() {
    echo -e "${YELLOW}⚠ $1${NC}"
    read -p "Continuare? (s/N): " choice
    case "$choice" in
        s|S|y|Y) return 0 ;;
        *) log "Operazione annullata."; exit 0 ;;
    esac
}

# ==============================================================================
# FASE 1 — BACKUP
# ==============================================================================

phase1_backup() {
    echo ""
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo -e "${WHITE} FASE 1 — Backup automatico${NC}"
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo ""

    log "Creazione backup in: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"

    log "Backup cartelle utente..."
    tar -czf "$BACKUP_DIR/home-backup.tar.gz" \
        --exclude="$BACKUP_DIR" \
        ~/Documents ~/Desktop ~/Downloads \
        ~/.config ~/.ssh ~/.gnupg \
        ~/homeassistant 2>/dev/null || true

    ok "Backup completato → $BACKUP_DIR/home-backup.tar.gz"
}

# ==============================================================================
# FASE 2 — AGGIORNAMENTO PACCHETTI BASE
# ==============================================================================

phase2_update() {
    echo ""
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo -e "${WHITE} FASE 2 — Aggiornamento pacchetti base${NC}"
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo ""

    log "Aggiornamento lista pacchetti..."
    apt-get update -q | tee -a "$LOGFILE"

    log "Aggiornamento sistema..."
    apt-get upgrade -y | tee -a "$LOGFILE"

    ok "Pacchetti base aggiornati"
}

# ==============================================================================
# FASE 3 — NUOVI PACCHETTI
# ==============================================================================

phase3_packages() {
    echo ""
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo -e "${WHITE} FASE 3 — Installazione nuovi pacchetti${NC}"
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo ""

    # Rimuovi vecchi pacchetti
    log "Rimozione pacchetti sostituiti..."
    apt-get remove -y firefox-esr telegram-desktop docker.io docker-compose 2>/dev/null || true
    apt-get autoremove -y | tee -a "$LOGFILE"

    # Installa nuovi pacchetti base
    log "Installazione nuovi pacchetti..."
    apt-get install -y \
        podman podman-compose \
        flameshot timeshift \
        claws-mail librewolf \
        inkscape kdenlive \
        libreoffice \
        nextcloud-desktop \
        tuba flatpak \
        usbguard \
        libpam-pwquality \
        gnome-icon-theme \
        firmware-realtek firmware-iwlwifi \
        firmware-atheros firmware-ralink \
        firmware-misc-nonfree firmware-linux-nonfree \
        intel-microcode amd64-microcode | tee -a "$LOGFILE"

    ok "Pacchetti base installati"

    # LibreWolf via extrepo
    log "Installazione LibreWolf..."
    apt-get install -y extrepo 2>/dev/null || true
    extrepo enable librewolf 2>/dev/null || true
    apt-get update -q && apt-get install -y librewolf 2>/dev/null || warn "LibreWolf non installato — installa manualmente"

    # Proton VPN
    log "Installazione Proton VPN..."
    curl -fsSL https://repo.protonvpn.com/debian/public_key.asc | gpg --dearmor -o /usr/share/keyrings/protonvpn-keyring.gpg 2>/dev/null || true
    echo "deb [signed-by=/usr/share/keyrings/protonvpn-keyring.gpg] https://repo.protonvpn.com/debian stable main" > /etc/apt/sources.list.d/protonvpn.list
    apt-get update -q && apt-get install -y proton-vpn-gnome-desktop 2>/dev/null || warn "Proton VPN non installato — installa manualmente"

    # Netbird
    log "Installazione Netbird..."
    curl -fsSL https://pkgs.netbird.io/debian/public.key | gpg --dearmor -o /usr/share/keyrings/netbird-keyring.gpg 2>/dev/null || true
    echo "deb [signed-by=/usr/share/keyrings/netbird-keyring.gpg] https://pkgs.netbird.io/debian stable main" > /etc/apt/sources.list.d/netbird.list
    apt-get update -q && apt-get install -y netbird 2>/dev/null || warn "Netbird non installato — installa manualmente"

    # Element
    log "Installazione Element..."
    curl -fsSL https://packages.element.io/debian/element-io-archive-keyring.gpg -o /usr/share/keyrings/element-io-archive-keyring.gpg 2>/dev/null || true
    echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" > /etc/apt/sources.list.d/element-io.list
    apt-get update -q && apt-get install -y element-desktop 2>/dev/null || warn "Element non installato — installa manualmente"

    # Goldwarden
    log "Installazione Goldwarden..."
    curl -fsSL "https://github.com/quexten/goldwarden/releases/download/v0.3.6/goldwarden_0.3.6_amd64.deb" -o /tmp/goldwarden.deb 2>/dev/null || true
    dpkg -i /tmp/goldwarden.deb 2>/dev/null || apt-get install -f -y
    rm -f /tmp/goldwarden.deb

    # FreeTube
    log "Installazione FreeTube..."
    curl -fsSL "https://github.com/FreeTubeApp/FreeTube/releases/download/v0.23.13-beta/freetube_0.23.13_beta_amd64.deb" -o /tmp/freetube.deb 2>/dev/null || true
    dpkg -i /tmp/freetube.deb 2>/dev/null || apt-get install -f -y
    rm -f /tmp/freetube.deb

    # CoMaps via Flatpak
    log "Installazione CoMaps..."
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
    flatpak install -y flathub app.comaps.CoMaps 2>/dev/null || warn "CoMaps non installato — installa manualmente via Flatpak"

    ok "Nuovi pacchetti installati"
}

# ==============================================================================
# FASE 4 — CONFIGURAZIONE
# ==============================================================================

phase4_config() {
    echo ""
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo -e "${WHITE} FASE 4 — Configurazione sistema${NC}"
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo ""

    # Icone HighContrast
    log "Aggiornamento tema icone → HighContrast..."
    if command -v gsettings &>/dev/null; then
        sudo -u "$SUDO_USER" gsettings set org.mate.interface icon-theme 'HighContrast' 2>/dev/null || true
        ok "Icone HighContrast impostate"
    fi

    # Umask 027
    log "Applicazione umask 027..."
    grep -q "umask 027" /etc/profile || echo "umask 027" >> /etc/profile
    grep -q "umask 027" /etc/bash.bashrc || echo "umask 027" >> /etc/bash.bashrc
    ok "Umask 027 applicato"

    # Timeout sessione
    log "Configurazione timeout sessione (15 min)..."
    grep -q "TMOUT=900" /etc/profile || {
        echo "TMOUT=900" >> /etc/profile
        echo "readonly TMOUT" >> /etc/profile
    }
    ok "Timeout sessione configurato"

    # PAM password policy
    log "Configurazione PAM password policy..."
    if [ -f /etc/security/pwquality.conf ]; then
        cat > /etc/security/pwquality.conf << 'EOF'
minlen = 12
minclass = 3
maxrepeat = 2
lcredit = -1
ucredit = -1
dcredit = -1
ocredit = -1
difok = 5
EOF
        ok "PAM password policy configurata"
    fi

    # Podman socket
    log "Abilitazione Podman socket..."
    systemctl enable podman.socket 2>/dev/null || true
    ok "Podman socket abilitato"

    # Netbird
    log "Abilitazione Netbird..."
    systemctl enable netbird 2>/dev/null || true

    # Aggiornamento alias .bashrc
    log "Aggiornamento alias terminale..."
    BASHRC="/home/$SUDO_USER/.bashrc"
    if [ -f "$BASHRC" ]; then
        # Rimuovi vecchi alias docker
        sed -i '/alias.*docker/d' "$BASHRC"
        sed -i '/alias ha/d' "$BASHRC"

        cat >> "$BASHRC" << 'BASHEOF'

# Podman / Home Assistant - NextRedOS 1.04
alias hastart='cd ~/homeassistant && podman-compose up -d'
alias hastop='cd ~/homeassistant && podman-compose down'
alias halogs='podman logs homeassistant'
alias hastatus='podman ps | grep homeassistant'
alias haupdate='cd ~/homeassistant && podman-compose pull && podman-compose up -d'

# Netbird
alias nbup='sudo netbird up'
alias nbdown='sudo netbird down'
alias nbstatus='netbird status'

# Goldwarden
alias gw='goldwarden'
BASHEOF
        ok "Alias aggiornati"
    fi
}

# ==============================================================================
# FASE 5 — VERIFICA FINALE
# ==============================================================================

phase5_verify() {
    echo ""
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo -e "${WHITE} FASE 5 — Verifica finale${NC}"
    echo -e "${RED}═══════════════════════════════════════${NC}"
    echo ""

    log "Verifica servizi attivi..."
    services=("ufw" "apparmor" "clamav-freshclam" "tor" "netbird")
    for svc in "${services[@]}"; do
        if systemctl is-active --quiet "$svc" 2>/dev/null; then
            ok "$svc → attivo"
        else
            warn "$svc → non attivo (verifica manualmente)"
        fi
    done

    log "Verifica UFW..."
    ufw status | head -3 | tee -a "$LOGFILE"

    log "Verifica AppArmor..."
    aa-status --summary 2>/dev/null | head -3 | tee -a "$LOGFILE" || true

    echo ""
    echo -e "${RED}═══════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}  ✓ NextRedOS aggiornato a 1.04 \"Ratkit\" con successo!${NC}"
    echo -e "${RED}═══════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${WHITE}  Backup salvato in: ${YELLOW}$BACKUP_DIR${NC}"
    echo -e "${WHITE}  Log completo in:   ${YELLOW}$LOGFILE${NC}"
    echo ""
    echo -e "${RED}  Simple by design. Secure by default. 🇪🇺${NC}"
    echo ""
}

# ==============================================================================
# MAIN
# ==============================================================================

print_banner
check_root

confirm "Questo script aggiornerà NextRedOS dalla 1.0 alla 1.04 Ratkit. Un backup automatico verrà creato prima di qualsiasi modifica."

echo "" | tee "$LOGFILE"
echo "NextRedOS Update — $(date)" | tee -a "$LOGFILE"
echo "" | tee -a "$LOGFILE"

phase1_backup
phase2_update
phase3_packages
phase4_config
phase5_verify

exit 0
