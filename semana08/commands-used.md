# Semana 08: Comandos y Técnicas Utilizadas

## mapfile

mapfile -t archivos < <(find "$REPO" -type f | sort)

Sirve para cargar cada línea de salida en un elemento del array.

---

## Arrays Asociativos

declare -A conteo

Permiten usar texto como índice.

Ejemplo:

conteo["sh"]=5

---

## Matriz Simulada

matriz[$((fila * columnas + columna))]

Permite representar una tabla bidimensional usando un array lineal.

---

## column

column -t

Alinea automáticamente columnas.

---

## paste

paste -sd',' archivo.txt

Convierte una columna en una fila separada por comas.
