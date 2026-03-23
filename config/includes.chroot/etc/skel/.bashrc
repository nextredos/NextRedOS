# NextRedOS - Custom bashrc

# Colori
RED='\[\033[0;31m\]'
BRED='\[\033[1;31m\]'
WHITE='\[\033[1;37m\]'
RESET='\[\033[0m\]'

# Prompt personalizzato
PS1="${BRED}┌──[${WHITE}\u${BRED}@${WHITE}NextRedOS${BRED}]─[${WHITE}\w${BRED}]\n└──╼ ${RED}▶ ${RESET}"

# Alias sistema
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias update='sudo apt update && sudo apt upgrade -y'
alias cls='clear'

# Alias sicurezza
alias firewall='sudo ufw status verbose'
alias portscan='sudo nmap -sS'
alias checkrootkit='sudo rkhunter --check'
alias auditlog='sudo tail -f /var/log/audit/audit.log'
alias apparmor-status='sudo aa-status'
alias lynis-scan='sudo lynis audit system'

# Alias rete
alias myip='curl ifconfig.me'
alias netmon='sudo iftop'
alias connections='sudo netstat -tulpn'

# Alias hardening avanzato
alias torstart='sudo systemctl start tor'
alias torstop='sudo systemctl stop tor'
alias torstatus='sudo systemctl status tor'
alias torscan='proxychains4 nmap'
alias clamcheck='sudo clamscan -r --bell'
alias snortstart='sudo systemctl start snort'
alias firejail-firefox='firejail firefox'
alias glances='glances --theme-white'
alias watchnet='sudo tcpdump -i any'

# Messaggio benvenuto
echo ""
echo -e "\033[1;31m  _   _           _   ____          _  ___  ____  \033[0m"
echo -e "\033[1;31m | \ | | _____  _| |_|  _ \ ___  __| |/ _ \/ ___| \033[0m"
echo -e "\033[1;31m |  \| |/ _ \ \/ / __| |_) / _ \/ _  | | | \___ \ \033[0m"
echo -e "\033[1;31m | |\  |  __/>  <| |_|  _ <  __/ (_| | |_| |___) |\033[0m"
echo -e "\033[1;31m |_| \_|\___/_/\_\\\\__|_| \_\___|\__,_|\___/|____/ \033[0m"
echo ""
echo -e "\033[1;37m NextRedOS 1.04 Ratkit - Hardened Linux Distribution\033[0m"
echo -e "\033[0;31m Based on Debian Trixie\033[0m"
echo ""
