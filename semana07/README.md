# Semana 07 - Monitor de Recursos del Sistema

## Descripcion

Script Bash para monitorear recursos del sistema.

El script comprueba:

- uso de disco
- uso de RAM
- carga de CPU

Tambien genera logs y alertas cuando se superan los umbrales configurados.

---

## Uso

### Monitoreo continuo

```bash
./monitor.sh
```

### Ejecutar 5 iteraciones

```bash
./monitor.sh --max 5
```

### Cambiar intervalo

```bash
./monitor.sh --intervalo 2
```

### Cambiar umbral de disco

```bash
./monitor.sh --umbral-disco 70
```

### Mostrar version

```bash
./monitor.sh --version
```

---

## Archivos

- monitor.sh
- monitor.log
- README.md
- commands-used.md

---

## Caracteristicas

- while true
- break
- trap INT
- tee -a
- sleep
- awk
- tail
- while read

---

## Autor

Mateo Rocabado Vargas
Universidad Tecnica de Oruro