#!/bin/bash

echo "VERIFICACION DEL SISTEMA"

for cmd in git curl wget vim tree htop jq python3 pip3; do
    if command -v $cmd &>/dev/null; then
        echo "[OK] $cmd instalado"
    else
        echo "[FALTA] $cmd no encontrado"
    fi
done