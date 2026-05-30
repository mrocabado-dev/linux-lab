#!/bin/bash

# monitor-procesos.sh
# Monitor de procesos

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "${SCRIPT_DIR}/lib/alertas.sh"
source "${SCRIPT_DIR}/lib/procesos.sh"

USUARIO="$USER"
UMBRAL_CPU=50
MATAR=false

REPORTE="reportes/reporte-$(date '+%Y%m%d-%H%M%S').txt"

PROCESOS_VIGILAR=()

uso() {
    echo "Uso: $0 [opciones] [proceso1 proceso2 ...]"
    echo
    echo "Opciones:"
    echo "  -u USUARIO    Usuario a inspeccionar"
    echo "  -t UMBRAL     Umbral de CPU"
    echo "  -k            Enviar SIGTERM"
    echo "  -r ARCHIVO    Guardar reporte"
    echo "  -h            Mostrar ayuda"
}

while getopts "u:t:r:kh" opt
do
    case "$opt" in
        u) USUARIO="$OPTARG" ;;
        t) UMBRAL_CPU="$OPTARG" ;;
        r) REPORTE="$OPTARG" ;;
        k) MATAR=true ;;
        h)
            uso
            exit 0
            ;;
        *)
            uso
            exit 1
            ;;
    esac
done

shift $((OPTIND - 1))

PROCESOS_VIGILAR=("$@")

trap 'echo "[$(date "+%H:%M:%S")] Monitor finalizado" >> "$LOG_FILE"' EXIT

SEPARADOR="========================================"

{
    echo "$SEPARADOR"
    echo "REPORTE DE PROCESOS"
    echo "Fecha: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Usuario: $USUARIO"
    echo "$SEPARADOR"
    echo

    listar_top_cpu 5

    echo
    listar_top_mem 5

    echo
    detectar_zombies

    echo

    if [[ ${#PROCESOS_VIGILAR[@]} -gt 0 ]]; then

        echo "--- Verificando procesos ---"

        for proc in "${PROCESOS_VIGILAR[@]}"
        do
            verificar_proceso "$proc"
        done

        echo
    fi

    arbol_usuario "$USUARIO"

    echo
    echo "--- Procesos con CPU mayor a ${UMBRAL_CPU}% ---"

    ALTOS=$(ps aux --sort=-%cpu | awk -v u="$UMBRAL_CPU" '
    NR>1 && $3+0 > u {
        print $2, $3, $11
    }')

    if [[ -z "$ALTOS" ]]; then

        echo "Ninguno encontrado"

    else

        echo "$ALTOS" | while read -r pid cpu cmd
        do
            printf "PID:%-8s CPU:%5s%% CMD:%s\n" "$pid" "$cpu" "$cmd"

            if [[ "$MATAR" == true ]]; then
                log "WARNING" "Enviando SIGTERM a PID $pid ($cmd)"
                kill -15 "$pid" 2>/dev/null || true
            fi
        done

    fi

    echo
    echo "$SEPARADOR"
    echo "Reporte guardado en: $REPORTE"

} | tee "$REPORTE"

log "INFO" "Reporte generado: $REPORTE"