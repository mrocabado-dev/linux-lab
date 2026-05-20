# Semana 05: Bash Scripting

## Objetivo

Desarrollar scripts Bash para automatizar tareas de administracion y monitoreo del sistema Linux.

---

## Estructura

```txt
semana05/
│
├── sysinfo.sh
├── check-user.sh
├── compare-files.sh
├── README.md
│
└── capturas/
```

---

## Scripts

| Script | Funcion |
|---|---|
| sysinfo.sh | informacion del sistema |
| check-user.sh | informacion de usuario |
| compare-files.sh | comparar fechas de archivos |

---

## sysinfo.sh

Muestra informacion del sistema mediante opciones.

### Opciones

```bash
./sysinfo.sh --all
./sysinfo.sh --system
./sysinfo.sh --cpu
./sysinfo.sh --memory
./sysinfo.sh --disk
./sysinfo.sh --users
./sysinfo.sh --net
```

---

## check-user.sh

Muestra:

- procesos
- home
- shell

### Uso

```bash
./check-user.sh usuario
```

Ejemplo:

```bash
./check-user.sh mateo
```

---

## compare-files.sh

Compara fechas de modificacion de archivos importantes.

### Uso

```bash
./compare-files.sh
```

---

## Conceptos Aplicados

- variables
- funciones
- condicionales
- argumentos
- command substitution
- case
- scripts ejecutables

---

## Permisos

```bash
chmod +x *.sh
```

---

## Autor

Mateo Rocabado Vargas
Universidad Tecnica de Oruro