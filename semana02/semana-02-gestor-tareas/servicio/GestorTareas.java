package servicio;

import modelo.Tarea;
import java.util.ArrayList;

public class GestorTareas {

    private ArrayList<Tarea> tareas;
    private int proximoId;

    public GestorTareas() {

        tareas = new ArrayList<>();
        proximoId = 1;
    }

    public void agregar(String titulo, String descripcion) {

        Tarea nueva = new Tarea(proximoId, titulo, descripcion);

        tareas.add(nueva);

        System.out.println("Tarea agregada con ID: " + proximoId);

        proximoId++;
    }

    public void listar() {

        if (tareas.isEmpty()) {

            System.out.println("No hay tareas");
            return;
        }

        for (Tarea t : tareas) {

            t.mostrarInfo();
        }
    }

    public void listarPendientes() {

        boolean encontrado = false;

        for (Tarea t : tareas) {

            if (!t.estaCompletada()) {

                t.mostrarInfo();
                encontrado = true;
            }
        }

        if (!encontrado) {

            System.out.println("No hay tareas pendientes");
        }
    }

    public void listarCompletadas() {

        boolean encontrado = false;

        for (Tarea t : tareas) {

            if (t.estaCompletada()) {

                t.mostrarInfo();
                encontrado = true;
            }
        }

        if (!encontrado) {

            System.out.println("No hay tareas completadas");
        }
    }

    public Tarea buscar(int id) {

        for (Tarea t : tareas) {

            if (t.getId() == id) {

                return t;
            }
        }

        return null;
    }

    public void completar(int id) {

        Tarea t = buscar(id);

        if (t != null) {

            if (!t.estaCompletada()) {

                t.completar();

                System.out.println("Tarea completada");
            } else {

                System.out.println("La tarea ya estaba completada");
            }

        } else {

            System.out.println("ID no encontrado");
        }
    }

    public void eliminar(int id) {

        Tarea t = buscar(id);

        if (t != null) {

            tareas.remove(t);

            System.out.println("Tarea eliminada");

        } else {

            System.out.println("ID no encontrado");
        }
    }

    public int totalTareas() {

        return tareas.size();
    }

    public int totalPendientes() {

        int contador = 0;

        for (Tarea t : tareas) {

            if (!t.estaCompletada()) {

                contador++;
            }
        }

        return contador;
    }

    public int totalCompletadas() {

        int contador = 0;

        for (Tarea t : tareas) {

            if (t.estaCompletada()) {

                contador++;
            }
        }

        return contador;
    }
}
