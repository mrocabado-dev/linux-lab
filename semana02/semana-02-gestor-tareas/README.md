# Gestor de Tareas POO

Proyecto realizado en Java utilizando Programacion Orientada a Objetos.

## Funcionalidades

- Agregar tareas
- Listar todas las tareas
- Filtrar tareas pendientes
- Filtrar tareas completadas
- Completar tareas
- Eliminar tareas
- Mostrar estadisticas
- IDs automaticos
- Validaciones basicas

---

## Estructura del Proyecto

```txt
semana-02-gestor-tareas/
│
├── Main.java
├── README.md
│
├── modelo/
│   └── Tarea.java
│
├── servicio/
│   └── GestorTareas.java
│
└── capturas/
```

---

## Diagrama de Clases

```txt
Tarea
---------------
- id
- titulo
- descripcion
- estado

+ completar()
+ mostrarInfo()
+ estaCompletada()

GestorTareas
----------------
- ArrayList<Tarea>
- proximoId

+ agregar()
+ listar()
+ completar()
+ eliminar()
+ estadisticas()
```

---

## Tecnologias Utilizadas

- Java
- ArrayList
- Programacion Orientada a Objetos
- Git
- GitHub
- Visual Studio Code

---

## Compilacion

```bash
javac Main.java modelo/*.java servicio/*.java
```

---

## Ejecucion

```bash
java Main
```

---

## Funcionalidades Implementadas

| Requisito | Estado |
|---|---|
| CRUD de tareas | Completo |
| Encapsulamiento | Completo |
| Packages | Completo |
| ArrayList | Completo |
| Estadisticas | Completo |
| Menu interactivo | Completo |

---

## Autor

Mateo Rocabado Vargas
Universidad Tecnica de Oruro