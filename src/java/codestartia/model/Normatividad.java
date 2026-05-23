package codestartia.model;

public class Normatividad {
    private int idNormatividad;
    private String titulo;
    private String descripcion;
    private String institucion;
    private String enlace;
    private String tipo;

    public int getIdNormatividad() { return idNormatividad; }
    public void setIdNormatividad(int idNormatividad) { this.idNormatividad = idNormatividad; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public String getInstitucion() { return institucion; }
    public void setInstitucion(String institucion) { this.institucion = institucion; }
    public String getEnlace() { return enlace; }
    public void setEnlace(String enlace) { this.enlace = enlace; }
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
}
