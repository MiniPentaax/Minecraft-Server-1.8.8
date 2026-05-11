#!/usr/bin/env bash
echo "Iniciando a Rede (Proxy + Lobby)..."
chmod +x start-proxy.sh start-paper.sh
./start-proxy.sh &
sleep 5
./start-paper.sh
