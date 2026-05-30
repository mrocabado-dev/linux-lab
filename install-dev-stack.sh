#!/bin/bash
set -euo pipefail

LOG_FILE="install.log"
PAQUETES_INSTALADOS=()

source /etc/os-release

if [[ "$ID" == "ubuntu" || "$ID" == "debian" ]]; then
    PKG_UPDATE="sudo apt update -y"
    PKG_INSTALL="sudo apt install -y"
else
    echo "SO no soportado"
    exit 1
fi

log() {
    echo "[INFO] $1"
    echo "$(date) - $1" >> "$LOG_FILE"
}

instalar() {
    pkg=$1

    if dpkg -l | grep -q "$pkg"; then
        log "$pkg ya está instalado"
    else
        log "Instalando $pkg"
        $PKG_INSTALL "$pkg"
        PAQUETES_INSTALADOS+=("$pkg")
    fi
}

log "INICIO INSTALACIÓN DEV STACK"

$PKG_UPDATE

for p in git curl wget vim tree htop jq python3 python3-pip build-essential net-tools unzip tmux shellcheck; do
    instalar "$p"
done

log "INSTALACIÓN COMPLETADA"
