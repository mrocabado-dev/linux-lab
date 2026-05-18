package modelo;

public class Tarea {

    private int id;
    private String titulo;
    private String descripcion;
    private String estado;

    public Tarea(int id, String titulo, String descripcion) {

        this.id = id;

        setTitulo(titulo);
        setDescripcion(descripcion);

        estado = "PENDIENTE";
    }

    public int getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setTitulo(String titulo) {

        if (titulo != null && !titulo.trim().isEmpty()) {
            this.titulo = titulo;
        }
    }

    public void setDescripcion(String descripcion) {

        if (descripcion != null && !descripcion.trim().isEmpty()) {
            this.descripcion = descripcion;
        }
    }

    public void completar() {

        estado = "COMPLETADA";
    }

    public boolean estaCompletada() {

        return estado.equals("COMPLETADA");
    }

    public void mostrarInfo() {

        System.out.println("\nID: " + id + " | " + estado);
        System.out.println("Titulo: " + titulo);
        System.out.println("Descripcion: " + descripcion);
    }
}