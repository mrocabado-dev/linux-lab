import servicio.GestorTareas;
import java.util.Scanner;

public class Main {

    static GestorTareas gestor = new GestorTareas();
    static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {

        int opcion;

        do {

            mostrarMenu();

            opcion = scanner.nextInt();
            scanner.nextLine();

            switch (opcion) {

                case 1:
                    agregarTarea();
                    break;

                case 2:
                    gestor.listar();
                    break;

                case 3:
                    gestor.listarPendientes();
                    break;

                case 4:
                    gestor.listarCompletadas();
                    break;

                case 5:
                    completarTarea();
                    break;

                case 6:
                    eliminarTarea();
                    break;

                case 7:
                    mostrarEstadisticas();
                    break;

                case 8:
                    System.out.println("Adios");
                    break;

                default:
                    System.out.println("Opcion invalida");
            }

        } while (opcion != 8);
    }

    static void mostrarMenu() {

        System.out.println("\n=== GESTOR DE TAREAS ===");
        System.out.println("1. Agregar tarea");
        System.out.println("2. Listar todas");
        System.out.println("3. Listar pendientes");
        System.out.println("4. Listar completadas");
        System.out.println("5. Completar tarea");
        System.out.println("6. Eliminar tarea");
        System.out.println("7. Estadisticas");
        System.out.println("8. Salir");

        System.out.print("Opcion: ");
    }

    static void agregarTarea() {

        System.out.print("Titulo: ");
        String titulo = scanner.nextLine();

        System.out.print("Descripcion: ");
        String descripcion = scanner.nextLine();

        gestor.agregar(titulo, descripcion);
    }

    static void completarTarea() {

        System.out.print("ID a completar: ");

        int id = scanner.nextInt();

        gestor.completar(id);
    }

    static void eliminarTarea() {

        System.out.print("ID a eliminar: ");

        int id = scanner.nextInt();

        gestor.eliminar(id);
    }

    static void mostrarEstadisticas() {

        int total = gestor.totalTareas();
        int pendientes = gestor.totalPendientes();
        int completadas = gestor.totalCompletadas();

        double porcentaje = 0;

        if (total > 0) {

            porcentaje = (completadas * 100.0) / total;
        }

        System.out.println("\n=== ESTADISTICAS ===");

        System.out.println("Total de tareas: " + total);
        System.out.println("Pendientes: " + pendientes);
        System.out.println("Completadas: " + completadas);

        System.out.println("Porcentaje completado: " + porcentaje + "%");
    }
}