# Semana 06 - Backup Check

## Objetivo

Crear un script Bash para verificar backups automaticamente.

El sistema valida:

- existencia de directorio
- permisos
- backups existentes
- antiguedad
- tamanio
- logs

---

## Estructura

```txt
semana06/
│
├── backup-check.sh
├── README.md
├── commands-used.md
├── logs/
└── capturas/
```

---

## Uso

### Ayuda

```bash
./backup-check.sh --help
```

### Version

```bash
./backup-check.sh --version
```

### Ejecutar

```bash
./backup-check.sh
```

---

## Verificaciones

| Verificacion | Descripcion |
|---|---|
| Directorio | existencia y permisos |
| Archivos | backups .tar.gz |
| Antiguedad | backups recientes |
| Tamanio | uso del directorio |

---

## Logging

El sistema usa:

```bash
tee -a
```

para guardar logs en:

```txt
logs/backup-check.log
```

---

## Conceptos Aplicados

- if
- case
- funciones
- return
- logs
- find
- du
- awk
- tee
- variables locales

---

## Autor

Mateo Rocabado Vargas
Universidad Tecnica de Oruro