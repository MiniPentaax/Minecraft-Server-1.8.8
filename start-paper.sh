#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/paper"

if [ ! -f paper.jar ]; then
  echo "Arquivo paper.jar não encontrado. Execute ../download-servers.sh primeiro."
  exit 1
fi

java -Xms1G -Xmx2G -jar paper.jar nogui
