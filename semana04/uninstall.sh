#!/usr/bin/env bash

# uninstall.sh

set -e

echo "======================================"
echo "Desinstalador de Dotfiles"
echo "======================================"

desinstalar() {

    local destino="$HOME/.$1"

    if [ -L "$destino" ]; then

        rm "$destino"

        echo "Eliminado: $destino"

    elif [ -f "$destino" ]; then

        echo "Ignorado: $destino no es symlink"

    else

        echo "No existe: $destino"
    fi
}

desinstalar bashrc
desinstalar bash_aliases
desinstalar vimrc

echo ""
echo "Desinstalacion completada"