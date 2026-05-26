#!/usr/bin/env bash

# =========================================
# Backup Check
# =========================================

VERSION="1.0"

DIR_BACKUP="$HOME/backups"

DIR_LOGS="./logs"

LOG_FILE="$DIR_LOGS/backup-check.log"

MAX_HORAS_SIN_BACKUP=48

MIN_TAMANIO_MB=1

MAX_TAMANIO_MB=5000

estado_global="OK"

# =========================================
# Uso
# =========================================

uso() {

    echo "Uso:"
    echo "./backup-check.sh"
    echo "./backup-check.sh --help"
    echo "./backup-check.sh --version"

    exit 2
}

# =========================================
# Logging
# =========================================

log() {

    local nivel="$1"

    local mensaje="$2"

    local timestamp

    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    echo "[$timestamp] [$nivel] $mensaje" \
        | tee -a "$LOG_FILE"

    if [ "$nivel" = "WARNING" ] \
        && [ "$estado_global" = "OK" ]; then

        estado_global="WARNING"
    fi

    if [ "$nivel" = "ERROR" ]; then

        estado_global="ERROR"
    fi
}

# =========================================
# Verificacion directorio
# =========================================

verificar_directorio() {

    log "INFO" \
        "Verificando directorio: $DIR_BACKUP"

    if [ ! -e "$DIR_BACKUP" ]; then

        log "ERROR" \
            "El directorio no existe"

        return 1
    fi

    if [ ! -d "$DIR_BACKUP" ]; then

        log "ERROR" \
            "Existe pero no es directorio"

        return 1
    fi

    if [ ! -r "$DIR_BACKUP" ]; then

        log "ERROR" \
            "Sin permisos de lectura"

        return 1
    fi

    log "OK" \
        "Directorio accesible"

    return 0
}

# =========================================
# Verificacion archivos
# =========================================

verificar_archivos() {

    log "INFO" \
        "Buscando backups"

    local total

    total=$(
        find "$DIR_BACKUP" \
        -maxdepth 1 \
        -type f \
        -name "*.tar.gz" \
        | wc -l
    )

    if [ "$total" -eq 0 ]; then

        log "ERROR" \
            "No existen backups"

        return 1
    fi

    log "OK" \
        "Backups encontrados: $total"

    local ultimo

    ultimo=$(
        find "$DIR_BACKUP" \
        -maxdepth 1 \
        -type f \
        -name "*.tar.gz" \
        | sort \
        | tail -1
    )

    if [ ! -s "$ultimo" ]; then

        log "WARNING" \
            "Ultimo backup vacio"

        return 0
    fi

    log "OK" \
        "Ultimo backup valido"

    return 0
}

# =========================================
# Verificacion antiguedad
# =========================================

verificar_antiguedad() {

    log "INFO" \
        "Verificando antiguedad"

    local dias

    dias=$(
        (
            MAX_HORAS_SIN_BACKUP + 23
        ) / 24
    )

    local recientes

    recientes=$(
        find "$DIR_BACKUP" \
        -maxdepth 1 \
        -type f \
        -name "*.tar.gz" \
        -mtime -"${dias}" \
        | wc -l
    )

    if [ "$recientes" -eq 0 ]; then

        log "WARNING" \
            "No hay backups recientes"

        return 0
    fi

    log "OK" \
        "Backups recientes: $recientes"

    return 0
}

# =========================================
# Verificacion tamanio
# =========================================

verificar_tamanio() {

    log "INFO" \
        "Verificando tamanio"

    local tamanio_mb

    tamanio_mb=$(
        du -sm "$DIR_BACKUP" \
        | awk '{print $1}'
    )

    log "INFO" \
        "Tamanio: ${tamanio_mb} MB"

    if [ "$tamanio_mb" -lt "$MIN_TAMANIO_MB" ]; then

        log "WARNING" \
            "Directorio muy pequeno"

        return 0
    fi

    if [ "$tamanio_mb" -gt "$MAX_TAMANIO_MB" ]; then

        log "WARNING" \
            "Directorio muy grande"

        return 0
    fi

    log "OK" \
        "Tamanio correcto"

    return 0
}

# =========================================
# Argumentos
# =========================================

case "$1" in

    --version)

        echo "backup-check.sh v$VERSION"

        exit 0
        ;;

    --help|-h)

        uso
        ;;
esac

# =========================================
# Inicio
# =========================================

mkdir -p "$DIR_LOGS"

log "INFO" \
    "=== Inicio backup-check ==="

log "INFO" \
    "Directorio: $DIR_BACKUP"

# =========================================
# Ejecutar checks
# =========================================

if ! verificar_directorio; then

    log "ERROR" \
        "Verificacion abortada"

    exit 1
fi

verificar_archivos

verificar_antiguedad

verificar_tamanio

# =========================================
# Resultado final
# =========================================

case "$estado_global" in

    OK)

        log "OK" \
            "Todos los checks correctos"

        exit 0
        ;;

    WARNING)

        log "WARNING" \
            "Checks completados con advertencias"

        exit 0
        ;;

    ERROR)

        log "ERROR" \
            "Checks con errores"

        exit 1
        ;;
esac