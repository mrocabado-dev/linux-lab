#!/bin/bash

set -euo pipefail

REPO="${1:-$HOME/linux-lab}"

if [[ ! -d "$REPO" ]]; then
    echo "Error: el directorio '$REPO' no existe."
    exit 1
fi

echo "Analizando repositorio: $REPO"

# Cargar lista de archivos
archivos=()

while IFS= read -r linea; do
    archivos+=("$linea")
done < <(find "$REPO" -type f | sort)

echo "Total de archivos encontrados: ${#archivos[@]}"


# --- Conteo por extension ---
declare -A conteo
declare -A tamano_ext

for f in "${archivos[@]}"; do
    nombre="${f##*/}"

    if [[ "$nombre" == *.* ]]; then
        ext="${nombre##*.}"
    else
        ext="sin_extension"
    fi

    conteo["$ext"]=$(( ${conteo["$ext"]:-0} + 1 ))

    bytes=$(stat -c%s "$f" 2>/dev/null || echo 0)

    tamano_ext["$ext"]=$(( ${tamano_ext["$ext"]:-0} + bytes ))
done


# --- Estado de README por semana ---
declare -A tiene_readme

for semana in "$REPO"/semana*/; do
    nombre=$(basename "$semana")

    if [[ -f "$semana/README.md" ]]; then
        tiene_readme["$nombre"]="SI"
    else
        tiene_readme["$nombre"]="NO"
    fi
done