#!/usr/bin/env bash

# =========================================
# Comparar fechas de archivos
# =========================================

PASSWD=$(stat -f "%Sm" /etc/passwd)

FSTAB=$(stat -f "%Sm" /etc/fstab 2>/dev/null)

echo "===== FECHAS ====="

echo ""

echo "/etc/passwd:"
echo "$PASSWD"

echo ""

echo "/etc/fstab:"
echo "$FSTAB"