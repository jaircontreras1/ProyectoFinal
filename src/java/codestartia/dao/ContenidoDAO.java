package codestartia.dao;

import codestartia.config.Conexion;
import codestartia.model.*;
import java.sql.*;
import java.util.*;

public class ContenidoDAO {
    public List<Leccion> listarLecciones() throws SQLException {
        List<Leccion> lista = new ArrayList<>();
        String sql = "SELECT * FROM lecciones WHERE activo=1 ORDER BY id_leccion";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) lista.add(mapLeccion(rs));
        }
        return lista;
    }

    public Leccion obtenerLeccion(int id) throws SQLException {
        String sql = "SELECT * FROM lecciones WHERE id_leccion=?";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapLeccion(rs);
            }
        }
        return null;
    }

    public List<Tip> listarTips() throws SQLException {
        List<Tip> lista = new ArrayList<>();
        String sql = "SELECT * FROM tips WHERE activo=1 ORDER BY FIELD(prioridad,'Alta','Media','Baja'), id_tip";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Tip t = new Tip();
                t.setIdTip(rs.getInt("id_tip"));
                t.setTitulo(rs.getString("titulo"));
                t.setConsejo(rs.getString("consejo"));
                t.setTipo(rs.getString("tipo"));
                t.setPrioridad(rs.getString("prioridad"));
                lista.add(t);
            }
        }
        return lista;
    }

    public List<Normatividad> listarNormatividades() throws SQLException {
        List<Normatividad> lista = new ArrayList<>();
        String sql = "SELECT * FROM normatividades WHERE activo=1 ORDER BY id_normatividad";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Normatividad n = new Normatividad();
                n.setIdNormatividad(rs.getInt("id_normatividad"));
                n.setTitulo(rs.getString("titulo"));
                n.setDescripcion(rs.getString("descripcion"));
                n.setInstitucion(rs.getString("institucion"));
                n.setEnlace(rs.getString("enlace"));
                n.setTipo(rs.getString("tipo"));
                lista.add(n);
            }
        }
        return lista;
    }

    public int contar(String tabla) throws SQLException {
        String sql = "SELECT COUNT(*) total FROM " + tabla + " WHERE activo=1";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            return rs.next() ? rs.getInt("total") : 0;
        }
    }

    public void guardarLeccion(Leccion l) throws SQLException {
        if (l.getIdLeccion() > 0) {
            String sql = "UPDATE lecciones SET titulo=?, descripcion=?, contenido=?, categoria=?, nivel=? WHERE id_leccion=?";
            try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
                ps.setString(1, l.getTitulo()); ps.setString(2, l.getDescripcion()); ps.setString(3, l.getContenido());
                ps.setString(4, l.getCategoria()); ps.setString(5, l.getNivel()); ps.setInt(6, l.getIdLeccion()); ps.executeUpdate();
            }
        } else {
            String sql = "INSERT INTO lecciones(titulo, descripcion, contenido, categoria, nivel) VALUES (?, ?, ?, ?, ?)";
            try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
                ps.setString(1, l.getTitulo()); ps.setString(2, l.getDescripcion()); ps.setString(3, l.getContenido());
                ps.setString(4, l.getCategoria()); ps.setString(5, l.getNivel()); ps.executeUpdate();
            }
        }
    }

    public void eliminarLeccion(int id) throws SQLException {
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement("UPDATE lecciones SET activo=0 WHERE id_leccion=?")) {
            ps.setInt(1, id); ps.executeUpdate();
        }
    }

    private Leccion mapLeccion(ResultSet rs) throws SQLException {
        Leccion l = new Leccion();
        l.setIdLeccion(rs.getInt("id_leccion"));
        l.setTitulo(rs.getString("titulo"));
        l.setDescripcion(rs.getString("descripcion"));
        l.setContenido(rs.getString("contenido"));
        l.setCategoria(rs.getString("categoria"));
        l.setNivel(rs.getString("nivel"));
        return l;
    }
}
