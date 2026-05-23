package codestartia.model;

public class Leccion {
    private int idLeccion;
    private String titulo;
    private String descripcion;
    private String contenido;
    private String categoria;
    private String nivel;

    public int getIdLeccion() { return idLeccion; }
    public void setIdLeccion(int idLeccion) { this.idLeccion = idLeccion; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public String getContenido() { return contenido; }
    public void setContenido(String contenido) { this.contenido = contenido; }
    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }
    public String getNivel() { return nivel; }
    public void setNivel(String nivel) { this.nivel = nivel; }
}
