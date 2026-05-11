#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p paper proxy

echo "Buscando build mais recente do PaperMC 1.8.8..."
paper_build=$(python3 - <<'PY'
import json, urllib.request
with urllib.request.urlopen('https://api.papermc.io/v2/projects/paper/versions/1.8.8') as r:
    data=json.load(r)
print(data['builds'][-1])
PY
)

paper_url="https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/${paper_build}/downloads/paper-1.8.8-${paper_build}.jar"
echo "Baixando Paper 1.8.8 build ${paper_build}..."
curl -L -o paper/paper.jar "$paper_url"


echo "Buscando versão mais recente do Waterfall..."
export WATERFALL_VERSION=$(python3 - <<'PY'
import json, urllib.request
with urllib.request.urlopen('https://api.papermc.io/v2/projects/waterfall') as r:
    data=json.load(r)
print(data['versions'][-1])
PY
)

waterfall_build=$(python3 - <<'PY'
import json, urllib.request
import urllib.parse
import os
version = os.environ['WATERFALL_VERSION']
with urllib.request.urlopen(f'https://api.papermc.io/v2/projects/waterfall/versions/{version}') as r:
    data=json.load(r)
print(data['builds'][-1])
PY
)

waterfall_url="https://api.papermc.io/v2/projects/waterfall/versions/${WATERFALL_VERSION}/builds/${waterfall_build}/downloads/waterfall-${WATERFALL_VERSION}-${waterfall_build}.jar"

echo "Baixando Waterfall ${WATERFALL_VERSION} build ${waterfall_build}..."
curl -L -o proxy/waterfall.jar "$waterfall_url"

echo "Download concluído."

echo "Arquivos:
- paper/paper.jar
- proxy/waterfall.jar"
