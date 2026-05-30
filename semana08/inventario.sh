#!/bin/bash

set -euo pipefail

REPO="${1:-$HOME/linux-lab}"

if [[ ! -d "$REPO" ]]; then
    echo "Error: el directorio '$REPO' no existe."
    exit 1
fi

echo "Analizando repositorio: $REPO"
