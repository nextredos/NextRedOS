================================================================================
  _   _           _   ____          _  ___  ____  
 | \ | | _____  _| |_|  _ \ ___  __| |/ _ \/ ___| 
 |  \| |/ _ \ \/ / __| |_) / _ \/ _  | | | \___ \ 
 | |\  |  __/>  <| |_|  _ <  __/ (_| | |_| |___) |
 |_| \_|\___/_/\_\__|_| \_\___|\__,_|\___/|____/ 

 NextRedOS 1.04 "Ratkit"
 Hardened Linux Distribution — Based on Debian Trixie
 Made in Europe — Open Source First
 https://www.nextred.it/web/
================================================================================

ABOUT
-----
NextRedOS is a hardened Linux distribution based on Debian Trixie (13),
designed for security professionals, sysadmins, ethical hackers, and
privacy-conscious users.

Codename "Ratkit" — zoological term for a newborn rat. Every release
follows the NextRedOS rat family theme.

LIVE CREDENTIALS
----------------
Username : admin
Password : live
Hostname : nextredos
Arch     : amd64 (x86_64)

MINIMUM REQUIREMENTS
--------------------
RAM      : 2 GB (4 GB recommended)
Storage  : 20 GB for installation
CPU      : x86_64 (64-bit)

================================================================================
WHAT'S NEW IN 1.04 "RATKIT"
================================================================================

SECURITY & HARDENING
- USBGuard        : USB device control (installed, manual activation)
- PAM Hardening   : Password policy, session timeout 15min, faillock
- Kernel Blacklist: Disabled unused kernel modules (USB storage, Firewire, etc.)
- ClamAV          : On-access scanning (installed, configurable)
- Full firmware   : Realtek, Intel, AMD, Atheros, Ralink and more

EUROPEAN OPEN SOURCE STACK
- LibreWolf       : European hardened Firefox fork
- Proton VPN      : Swiss no-log VPN client
- Netbird         : German open source mesh VPN
- Element         : UK Matrix client
- KeePassXC       : German offline password manager
- Goldwarden      : Open source Bitwarden/Vaultwarden client
- Claws Mail      : French open source email client
- LibreOffice     : German open source office suite
- Nextcloud       : German open source cloud client
- Inkscape        : European open source vector editor
- Kdenlive        : European open source video editor
- VLC             : French open source media player
- GIMP            : European open source image editor
- Tuba            : European Mastodon client
- FreeTube        : Open source privacy YouTube player
- CoMaps          : Open source OpenStreetMap navigation

DESKTOP & UX
- HighContrast    : Switched to HighContrast icon theme
- Wallpapers      : New wallpaper collection preinstalled
- Flameshot       : Advanced screenshot tool
- Timeshift       : System snapshot for safe rollback
- Podman          : Replaces Docker (rootless, daemonless)

BUILD
- English only ISO
- Codename Ratkit officially declared

================================================================================
PREINSTALLED SECURITY TOOLS
================================================================================

NETWORK ANALYSIS
  nmap, wireshark, tcpdump, netcat-openbsd, traceroute, whois, iftop

PRIVACY & CRYPTO
  tor, proxychains4, gnupg, openvpn, proton-vpn, netbird
  keepassxc, goldwarden, firejail

HARDENING
  apparmor, ufw, fail2ban, rkhunter, chkrootkit, aide
  lynis, auditd, suricata, clamav, usbguard

MONITORING
  htop, glances, logwatch, net-tools

================================================================================
HOME ASSISTANT
================================================================================

Home Assistant Container is preinstalled via Podman.

Quick start:
  cd ~/homeassistant
  podman-compose up -d

Access: http://localhost:8123

Useful aliases (available in terminal):
  hastart    Start Home Assistant
  hastop     Stop Home Assistant
  halogs     View logs
  hastatus   Container status
  haupdate   Update to latest version

================================================================================
VERIFY ISO INTEGRITY
================================================================================

1. Import NextRedOS public GPG key:
   gpg --import NextRedOS-public-key.asc

2. Verify GPG signature:
   gpg --verify NextRedOS-amd64.hybrid.iso.asc NextRedOS-amd64.hybrid.iso

3. Verify SHA256 checksum:
   sha256sum -c NextRedOS-amd64.hybrid.iso.sha256

================================================================================
UPGRADING FROM 1.0
================================================================================

Users running NextRedOS 1.0 can upgrade using the official update script:
  nextredos-update.sh (available on GitHub)

The script will:
  1. Backup your home directory automatically
  2. Update all base packages
  3. Install new 1.04 software
  4. Apply new hardening configurations

NOTE: The update script is intended for experienced users.

================================================================================
DOWNLOAD & LINKS
================================================================================

Website    : https://www.nextred.it/web/nextredos
GitHub     : https://github.com/nextredos/NextRedOS
Codeberg   : https://codeberg.org/nextredos/NextRedOS
Email      : info@nextred.it

ISO        : https://www.nextred.it/web/NROS/NextRedOS-amd64.hybrid.iso
GPG Sig    : https://www.nextred.it/web/NROS/NextRedOS-amd64.hybrid.iso.asc
SHA256     : https://www.nextred.it/web/NROS/NextRedOS-amd64.hybrid.iso.sha256
Public Key : https://www.nextred.it/web/NROS/NextRedOS-public-key.asc

================================================================================
DISCLAIMER
================================================================================

NextRedOS includes professional security tools. Their use is permitted ONLY
on systems and networks you own or have explicit written authorization to test.

Unauthorized use of security tools may constitute a criminal offense under
applicable laws. The authors of NextRedOS decline all responsibility for
improper or illegal use of the included software.

================================================================================
 NextRedOS 1.04 "Ratkit" — Simple by design. Secure by default.
 Made in Europe — Open Source First
 © 2026 NextRedOS — info@nextred.it
================================================================================
