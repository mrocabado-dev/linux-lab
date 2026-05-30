#!/bin/bash

paquetes=(git curl wget vim tree htop jq python3 python3-pip build-essential net-tools unzip tmux shellcheck)

echo "Iniciando rollback..."

sudo apt purge -y "${paquetes[@]}"
sudo apt autoremove -y
sudo apt clean

echo "Rollback completado"s