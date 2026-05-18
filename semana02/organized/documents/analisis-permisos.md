# Analisis de Permisos Linux

## Introduccion

En Linux los permisos permiten controlar quien puede leer, escribir o ejecutar archivos y directorios.

Los permisos se representan con numeros:

- 4 = lectura
- 2 = escritura
- 1 = ejecucion

---

## Permisos Utilizados

| Tipo | Permisos | Explicacion |
|---|---|---|
| Documentos | 644 | El propietario puede leer y escribir |
| Imagenes | 644 | Protegidas contra modificaciones externas |
| Scripts | 755 | Ejecutables por todos los usuarios |
| Configuraciones | 644 | Solo el propietario modifica |
| Logs | 644 | Solo lectura para otros usuarios |
| Directorios | 755 | Permite entrar y listar contenido |

---

## Explicacion de 644

```txt
rw-r--r--