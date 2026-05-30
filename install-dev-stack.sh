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


instalar_paquete() {
    paquete=$1

    if dpkg -l | grep -q "$paquete"; then
        echo "[OK] $paquete ya instalado"
    else
        echo "[INSTALANDO] $paquete"
        sudo apt install -y "$paquete"
    fi
}

paquetes=(
git curl wget vim tree htop jq
python3 python3-pip
build-essential net-tools unzip tmux shellcheck
)

for p in "${paquetes[@]}"; do
    instalar_paquete "$p"
done

LOG_FILE="install.log"

log() {
    echo "$1"
    echo "$(date) - $1" >> "$LOG_FILE"
}