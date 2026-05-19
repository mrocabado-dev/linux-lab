#!/bin/bash

LOGFILE="sample.log"
REPORT="analysis-report.txt"

if [ ! -f "$LOGFILE" ]; then
    echo "No existe $LOGFILE"
    exit 1
fi

echo "Analizando logs..."

TOTAL=$(wc -l < "$LOGFILE")

ERRORS=$(grep -c "ERROR" "$LOGFILE")
FATALS=$(grep -c "FATAL" "$LOGFILE")
WARNINGS=$(grep -c "WARNING" "$LOGFILE")
INFOS=$(grep -c "INFO" "$LOGFILE")

TOP_IPS=$(awk -F '|' '{print $2}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5)

TOP_ERRORS=$(grep "ERROR\|FATAL" "$LOGFILE" | awk -F '|' '{print $4}' | sort | uniq -c | sort -nr | head -5)

{
echo "====================================="
echo "REPORTE DE ANALISIS DE LOGS"
echo "====================================="
echo ""

echo "Fecha de analisis:"
date
echo ""

echo "Total de lineas: $TOTAL"
echo ""

echo "Conteo por severidad"
echo "INFO: $INFOS"
echo "WARNING: $WARNINGS"
echo "ERROR: $ERRORS"
echo "FATAL: $FATALS"
echo ""

echo "Top 5 IPs mas frecuentes"
echo "$TOP_IPS"
echo ""

echo "Top 5 errores mas comunes"
echo "$TOP_ERRORS"
echo ""

echo "====================================="
echo "Fin del reporte"
echo "====================================="

} > "$REPORT"

echo "Reporte generado en $REPORT"