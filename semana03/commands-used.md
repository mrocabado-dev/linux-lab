# Comandos Utilizados en el Laboratorio

## Generacion de Logs

### Ejecutar script generador

```bash
./generate-sample-log.sh
```

### Ver cantidad de lineas

```bash
wc -l sample.log
```

### Ver primeras lineas

```bash
head sample.log
```

### Ver ultimas lineas

```bash
tail sample.log
```

---

## Analisis de Logs

### Ejecutar analizador

```bash
./log-analyzer.sh
```

### Ver reporte

```bash
cat analysis-report.txt
```

---

## Busqueda con grep

### Buscar errores

```bash
grep "ERROR" sample.log
```

### Buscar warnings

```bash
grep "WARNING" sample.log
```

### Contar errores

```bash
grep -c "ERROR" sample.log
```

---

## Procesamiento con awk

### Mostrar IPs

```bash
awk -F '|' '{print $2}' sample.log
```

### Mostrar severidades

```bash
awk -F '|' '{print $3}' sample.log
```

---

## Ordenamiento

### Ordenar IPs

```bash
sort sample.log
```

### Contar IPs repetidas

```bash
uniq -c
```

---

## Git

### Ver estado

```bash
git status
```

### Agregar cambios

```bash
git add .
```

### Crear commit

```bash
git commit -m "mensaje"
```

### Subir repositorio

```bash
git push
```