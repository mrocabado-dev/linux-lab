# Semana 09 - Gestión de Procesos

## Descripción

Script para monitorear procesos en Linux.

Permite:

- Mostrar procesos con mayor consumo de CPU.
- Mostrar procesos con mayor consumo de memoria.
- Detectar procesos zombie.
- Verificar procesos específicos.
- Mostrar árbol de procesos de un usuario.
- Generar reportes.
- Enviar SIGTERM a procesos que superen un umbral.

## Estructura

```text
semana09/
├── monitor-procesos.sh
├── README.md
├── .gitignore
├── lib/
│   ├── alertas.sh
│   └── procesos.sh
└── reportes/
    └── .gitkeep

## Uso

```bash
./monitor-procesos.sh
```

```bash
./monitor-procesos.sh bash
```

```bash
./monitor-procesos.sh -u root
```

```bash
./monitor-procesos.sh -t 20
```

```bash
./monitor-procesos.sh -r reporte.txt
```

## Comandos utilizados

- ps
- pgrep
- kill
- pstree
- awk
- tee
- getopts
- trap
- source

## Autor

Mateo Rocabado Vargas
