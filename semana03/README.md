# Semana 03: Analisis de Logs con Bash

## Objetivos

- Generar logs automaticamente
- Analizar archivos grandes
- Utilizar grep y awk
- Generar reportes automaticos
- Practicar Bash scripting
- Utilizar Git y GitHub

---

## Estructura del Proyecto

```txt
semana03/
│
├── README.md
├── generate-sample-log.sh
├── log-analyzer.sh
├── commands-used.md
```

---

## Scripts

### generate-sample-log.sh

Genera automaticamente:

- 500 entradas de logs
- IPs aleatorias
- mensajes INFO
- mensajes WARNING
- mensajes ERROR
- mensajes FATAL

---

### log-analyzer.sh

Analiza automaticamente:

- total de lineas
- cantidad de errores
- cantidad de warnings
- IPs mas frecuentes
- errores mas comunes

Genera:

```txt
analysis-report.txt
```

---

## Comandos Utilizados

| Comando | Funcion |
|---|---|
| grep | buscar patrones |
| awk | procesar columnas |
| wc | contar lineas |
| sort | ordenar |
| uniq | eliminar repetidos |
| head | mostrar primeras lineas |
| tail | mostrar ultimas lineas |

---

## Ejecucion

### Dar permisos

```bash
chmod +x generate-sample-log.sh
chmod +x log-analyzer.sh
```

### Generar logs

```bash
./generate-sample-log.sh
```

### Analizar logs

```bash
./log-analyzer.sh
```

---

## Tecnologias Utilizadas

- Bash
- Linux
- grep
- awk
- Git
- GitHub

---

## Autor

Mateo Rocabado Vargas
Universidad Tecnica de Oruro