#!/bin/bash

set -euo pipefail

REPO="${1:-$HOME/linux-lab}"

if [[ ! -d "$REPO" ]]; then
    echo "Error: directorio '$REPO' no existe."
    exit 1
fi

echo "Analizando repositorio: $REPO"

# --------------------------------------------------
# 1. Cargar archivos con mapfile
# --------------------------------------------------

mapfile -t archivos < <(find "$REPO" -type f | sort)

echo "Total de archivos encontrados: ${#archivos[@]}"

declare -A conteo
declare -A tamano_ext

for f in "${archivos[@]}"
do
    nombre="${f##*/}"

    if [[ "$nombre" == *.* ]]; then
        ext="${nombre##*.}"
    else
        ext="sin_extension"
    fi

    conteo["$ext"]=$(( ${conteo["$ext"]:-0} + 1 ))

    bytes=$(stat -c%s "$f")

    tamano_ext["$ext"]=$(( ${tamano_ext["$ext"]:-0} + bytes ))
done