#!/bin/bash
set -euo pipefail

echo "Iniciando instalador del Dev Stack..."

source /etc/os-release

echo "Sistema detectado: $ID"

if [[ "$ID" != "ubuntu" && "$ID" != "debian" ]]; then
    echo "Sistema no soportado"
    exit 1
fi

echo "Actualizando repositorios..."
sudo apt update -y