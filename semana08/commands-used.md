# Semana 08 - Comandos y Tecnicas Utilizadas

## mapfile

```bash
mapfile -t archivos < <(find "$REPO" -type f | sort)
```

Sirve para cargar líneas de texto dentro de un array.

## Arrays Asociativos

```bash
declare -A conteo
conteo["$ext"]=$(( ${conteo["$ext"]:-0} + 1 ))
```

Permiten almacenar pares clave-valor y realizar conteos por extensión.

## Matriz Simulada

```bash
matriz[$((fila * COLS + columna))]
```

Permite representar una matriz bidimensional usando un array unidimensional.

## column

```bash
column -t
```

Alinea automáticamente columnas de texto.

## printf

```bash
printf "%-12s %-4s %-4s\n"
```

Permite formatear la salida en columnas con ancho fijo.

## find

```bash
find "$REPO" -type f
```

Busca archivos dentro de un directorio.

## Arrays Indexados

```bash
arr+=("valor")
```

Permiten almacenar múltiples elementos en una misma variable.
