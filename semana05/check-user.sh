#!/usr/bin/env bash

# =========================================
# Verificar Usuario
# =========================================

if [ -z "$1" ]; then

    echo "Uso: ./check-user.sh usuario"

    exit 1
fi

USUARIO="$1"

echo "===== USUARIO ====="

echo "Nombre:"
echo "$USUARIO"

echo ""

echo "HOME:"
eval echo "~$USUARIO"

echo ""

echo "SHELL:"

grep "^$USUARIO:" /etc/passwd | cut -d: -f7

echo ""

echo "PROCESOS:"

ps -u "$USUARIO"
