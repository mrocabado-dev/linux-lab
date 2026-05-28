#!/bin/bash

# monitor.sh - Monitor de recursos del sistema

readonly VERSION="1.0.0"

readonly LOGFILE="monitor.log"

UMBRAL_DISCO=80
UMBRAL_RAM=85
INTERVALO=10
MAX_ITER=0

uso() {

    echo "Uso: $0 [opciones]"
    echo ""
    echo "--intervalo N"
    echo "--max N"
    echo "--umbral-disco N"
    echo "--umbral-ram N"
    echo "--version"
    exit 2
}

uso_disco() {

    df / | awk 'NR==2 {
        gsub(/%/,"",$5);
        print $5
    }'
}

uso_ram() {

    vm_stat | awk '
    /Pages active/ {active=$3}
    /Pages wired down/ {wired=$4}
    /Pages occupied by compressor/ {comp=$5}
    /Pages free/ {free=$3}

    END {

        gsub(/\./,"",active)
        gsub(/\./,"",wired)
        gsub(/\./,"",comp)
        gsub(/\./,"",free)

        usado=active+wired+comp
        total=usado+free

        printf "%.0f", (usado/total)*100
    }'
}

carga_cpu() {

    uptime | awk -F'load averages:' '
    {
        print $2
    }' | awk '
    {
        gsub(/,/,"",$1)
        print $1
    }'
}

registrar() {

    local nivel="$1"

    local mensaje="$2"

    local ts

    ts=$(date '+%Y-%m-%d %H:%M:%S')

    printf "[%s] [%-7s] %s\n" \
    "$ts" "$nivel" "$mensaje" \
    | tee -a "$LOGFILE"
}

resumen_log() {

    echo ""
    echo "================================="
    echo "RESUMEN DE LA SESION"
    echo "================================="

    local total
    local alertas

    total=$(grep -c "\[INFO\]" "$LOGFILE" 2>/dev/null || echo 0)

    alertas=$(grep -c "\[ALERTA\]" "$LOGFILE" 2>/dev/null || echo 0)

    printf "%-25s %d\n" \
    "Comprobaciones:" "$total"

    printf "%-25s %d\n" \
    "Alertas:" "$alertas"

    echo ""
    echo "Ultimas entradas:"

    tail -3 "$LOGFILE" | while IFS= read -r linea
    do
        echo "$linea"
    done

    echo "================================="
}

while [ $# -gt 0 ]
do

    case "$1" in

        --intervalo)

            INTERVALO="$2"
            shift 2
            ;;

        --max)

            MAX_ITER="$2"
            shift 2
            ;;

        --umbral-disco)

            UMBRAL_DISCO="$2"
            shift 2
            ;;

        --umbral-ram)

            UMBRAL_RAM="$2"
            shift 2
            ;;

        --version)

            echo "monitor.sh v$VERSION"
            exit 0
            ;;

        --help|-h)

            uso
            ;;

        *)

            echo "Opcion desconocida: $1"
            uso
            ;;
    esac
done

trap '
echo ""
resumen_log
registrar "INFO" "Monitor detenido."
exit 0
' INT

registrar "INFO" \
"Iniciando monitor intervalo:${INTERVALO}s"

registrar "INFO" \
"Umbrales disco=${UMBRAL_DISCO}% RAM=${UMBRAL_RAM}%"

iteracion=0

while true
do

    iteracion=$((iteracion + 1))

    if [ "$MAX_ITER" -gt 0 ] \
    && [ "$iteracion" -gt "$MAX_ITER" ]
    then

        registrar "INFO" \
        "Limite de $MAX_ITER iteraciones alcanzado."

        break
    fi

    disco=$(uso_disco)

    ram=$(uso_ram)

    cpu=$(carga_cpu)

    registrar "INFO" \
    "Disco:${disco}% RAM:${ram}% CPU-load:${cpu}"

    [ "$disco" -ge "$UMBRAL_DISCO" ] && \
    registrar "ALERTA" \
    "Disco al ${disco}%"

    [ "$ram" -ge "$UMBRAL_RAM" ] && \
    registrar "ALERTA" \
    "RAM al ${ram}%"

    sleep "$INTERVALO"

done

resumen_log

registrar "INFO" \
"Monitor finalizado."