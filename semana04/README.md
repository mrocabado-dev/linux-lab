# Semana 04: Editores y Dotfiles

## Objetivo

Crear un entorno Linux personalizado utilizando dotfiles versionados con Git.

El proyecto automatiza la instalacion de configuraciones mediante symlinks.

---

## Estructura

```txt
semana04/
│
├── install.sh
├── uninstall.sh
├── README.md
│
└── dotfiles/
    ├── bashrc
    ├── bash_aliases
    └── vimrc
```

---

## Archivos

| Archivo | Funcion |
|---|---|
| install.sh | instala dotfiles |
| uninstall.sh | elimina symlinks |
| bashrc | configuracion de bash |
| bash_aliases | aliases y funciones |
| vimrc | configuracion de vim |

---

## Instalacion

```bash
chmod +x install.sh
./install.sh
source ~/.bashrc
```

---

## Desinstalacion

```bash
./uninstall.sh
```

---

## Aliases Incluidos

| Alias | Comando |
|---|---|
| ll | ls -lhF |
| la | ls -lhaF |
| .. | cd .. |
| c | clear |
| gs | git status |
| ga | git add |
| gc | git commit |
| gp | git push |
| gl | git log --oneline --graph --all |

---

## Funciones Incluidas

| Funcion | Uso |
|---|---|
| mkcd | crear y entrar directorio |
| buscar | buscar texto recursivamente |
| duh | mostrar archivos grandes |
| bak | crear backup |

---

## Comandos Aprendidos

- vim
- alias
- source
- ln -s
- chmod +x
- export
- symlinks

---

## Verificacion

Los symlinks deben verse asi:

```bash
ls -la ~/.bashrc
```

Salida esperada:

```txt
.bashrc -> /Users/mateo/linux-lab/semana04/dotfiles/bashrc
```

---

## Autor

Mateo Rocabado Vargas
Universidad Tecnica de Oruro