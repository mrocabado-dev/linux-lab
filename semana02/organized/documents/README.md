# Semana 02: Manipulacion de Archivos Linux

## Objetivos

- Crear archivos automaticamente
- Organizar archivos por categorias
- Aplicar permisos Linux
- Practicar scripts Bash
- Utilizar Git y GitHub

---

## Archivos del Proyecto

```txt
semana02/
│
├── README.md
├── generate-messy-files.sh
├── organize-files.sh
├── analisis-permisos.md
├── estado-inicial.txt
├── estructura-final.txt
└── permisos-aplicados.txt
```

---

## Scripts

### generate-messy-files.sh

Genera automaticamente:

- documentos
- imagenes
- scripts
- configuraciones
- logs

Total: 50 archivos.

---

### organize-files.sh

Organiza archivos dentro de:

```txt
organized/
```

Categorias:

- documents
- images
- scripts
- config
- logs
- temp

---

## Permisos Aplicados

| Tipo | Permisos |
|---|---|
| Documentos | 644 |
| Imagenes | 644 |
| Scripts | 755 |
| Configuraciones | 644 |
| Logs | 644 |
| Directorios | 755 |

---

## Comandos Utilizados

### Manipulacion

```bash
touch
mkdir
mv
cp
rm
```

### Permisos

```bash
chmod
ls -l
```

### Busqueda

```bash
find
tree
```

---

## Ejecucion

### Dar permisos

```bash
chmod +x generate-messy-files.sh
chmod +x organize-files.sh
```

### Ejecutar scripts

```bash
./generate-messy-files.sh
./organize-files.sh
```

---

## Autor

Mateo Rocabado Vargas
Universidad Tecnica de Oruro