#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/proxy"

if [ ! -f waterfall.jar ]; then
  echo "Arquivo waterfall.jar não encontrado. Execute ../download-servers.sh primeiro."
  exit 1
fi

java -Xms512M -Xmx1G -jar waterfall.jar
