#!/bin/bash

echo "Organizando archivos..."

# Crear directorios
mkdir -p organized/documents
mkdir -p organized/images
mkdir -p organized/scripts
mkdir -p organized/config
mkdir -p organized/logs
mkdir -p organized/temp

# Mover documentos
mv *.txt organized/documents/ 2>/dev/null || true
mv *.md organized/documents/ 2>/dev/null || true
mv *.doc organized/documents/ 2>/dev/null || true

# Mover imagenes
mv *.jpg organized/images/ 2>/dev/null || true
mv *.png organized/images/ 2>/dev/null || true

# Mover scripts
mv *.sh organized/scripts/ 2>/dev/null || true
mv *.py organized/scripts/ 2>/dev/null || true

# Mover configuraciones
mv *.conf organized/config/ 2>/dev/null || true
mv *.json organized/config/ 2>/dev/null || true

# Mover logs
mv *.log organized/logs/ 2>/dev/null || true

# Permisos documentos
chmod 644 organized/documents/* 2>/dev/null || true

# Permisos imagenes
chmod 644 organized/images/* 2>/dev/null || true

# Permisos configuraciones
chmod 644 organized/config/* 2>/dev/null || true

# Permisos logs
chmod 644 organized/logs/* 2>/dev/null || true

# Permisos scripts
chmod 755 organized/scripts/* 2>/dev/null || true

# Permisos directorios
chmod 755 organized/*
chmod 755 organized

echo "Archivos organizados correctamente"