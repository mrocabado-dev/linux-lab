#!/usr/bin/env bash

# install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/dotfiles" && pwd)"

BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d)"

echo "======================================"
echo "Instalador de Dotfiles"
echo "======================================"

instalar() {

    local fuente="$DOTFILES_DIR/$1"

    local destino="$HOME/.$1"

    if [ ! -f "$fuente" ]; then

        echo "No existe: $fuente"
        return 1
    fi

    if [ -f "$destino" ] && [ ! -L "$destino" ]; then

        mkdir -p "$BACKUP_DIR"

        cp "$destino" "$BACKUP_DIR/"

        echo "Backup creado para $destino"
    fi

    rm -f "$destino"

    ln -s "$fuente" "$destino"

    echo "Instalado: $destino"
}

instalar bashrc
instalar bash_aliases
instalar vimrc

echo ""
echo "Instalacion completada"
echo "Ejecuta:"
echo "source ~/.bashrc"