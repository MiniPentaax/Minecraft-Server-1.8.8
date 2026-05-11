# Projeto de Servidor Minecraft 1.8.8

Este projeto contém a configuração básica para um servidor de Minecraft 1.8.8 utilizando PaperMC e um proxy Waterfall.

## Estrutura do Projeto

- `paper/`: Contém os arquivos do servidor Paper 1.8.8.
- `proxy/`: Contém os arquivos do proxy Waterfall.
- `download-servers.sh`: Script para baixar as versões mais recentes dos jars.
- `start-paper.sh`: Script para iniciar o servidor Paper.
- `start-proxy.sh`: Script para iniciar o proxy Waterfall.

## Como Usar

1. Execute `./download-servers.sh` para baixar os arquivos `.jar` necessários.
2. Inicie o servidor com `./start-paper.sh`.
3. Inicie o proxy com `./start-proxy.sh`.

## Requisitos

- Java 8 ou superior (recomendado Java 8 para Minecraft 1.8.8).
- Python 3 (para o script de download).
