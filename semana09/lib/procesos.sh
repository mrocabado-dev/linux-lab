#!/bin/bash

# lib/procesos.sh
# Funciones de inspección de procesos

listar_top_cpu() {
    local n="${1:-5}"

    echo "--- Top ${n} procesos por CPU ---"

    ps aux --sort=-%cpu | awk -v n="$n" '
    NR>1 && NR<=n+1 {
        printf "%-10s PID:%-8s CPU:%5s%% MEM:%5s%% CMD:%s\n",
        $1, $2, $3, $4, $11
    }'
}

listar_top_mem() {
    local n="${1:-5}"

    echo "--- Top ${n} procesos por MEMORIA ---"

    ps aux --sort=-%mem | awk -v n="$n" '
    NR>1 && NR<=n+1 {
        printf "%-10s PID:%-8s CPU:%5s%% MEM:%5s%% CMD:%s\n",
        $1, $2, $3, $4, $11
    }'
}

detectar_zombies() {

    echo "--- Procesos Zombie ---"

    local zombies

    zombies=$(ps -eo pid,ppid,stat,comm | awk '$3 ~ /Z/ {print}')

    if [[ -z "$zombies" ]]; then
        echo "No se detectaron procesos zombie"
    else
        echo "$zombies" | while read -r pid ppid stat comm
        do
            printf "PID:%-8s PPID:%-8s CMD:%s\n" "$pid" "$ppid" "$comm"
        done
    fi
}

verificar_proceso() {

    local nombre="$1"

    if pgrep -x "$nombre" > /dev/null 2>&1; then

        local pid
        pid=$(pgrep -x "$nombre" | head -1)

        log "OK" "Proceso '$nombre' activo (PID: $pid)"
        return 0

    else

        log "WARNING" "Proceso '$nombre' no encontrado"
        return 1

    fi
}

arbol_usuario() {

    local usuario="${1:-$USER}"

    echo "--- Árbol de procesos de $usuario ---"

    pstree -p "$usuario" 2>/dev/null || \
    ps -u "$usuario" --forest -o pid,stat,comm 2>/dev/null
}