NextRedOS - Home Assistant Container
=====================================

AVVIO:
  cd ~/homeassistant
  docker compose up -d

STOP:
  docker compose down

AGGIORNAMENTO:
  docker compose pull
  docker compose up -d

INTERFACCIA WEB:
  http://localhost:8123

LOG:
  docker compose logs -f

PRIMA CONFIGURAZIONE:
  1. Avvia Home Assistant con il comando sopra
  2. Apri il browser e vai su http://localhost:8123
  3. Segui la procedura guidata di configurazione
  4. Crea il tuo account amministratore

NOTE:
  - La cartella config/ contiene tutta la configurazione
  - Fai backup regolari della cartella config/
  - Home Assistant si avvia automaticamente dopo il riavvio
    se Docker è in esecuzione
