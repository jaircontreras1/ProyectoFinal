package codestartia.dao;

import codestartia.config.Conexion;
import java.sql.*;
import java.util.*;

public class ProgresoDAO {
    public void completar(int idUsuario, int idLeccion) throws SQLException {
        String sql = "INSERT INTO progreso(id_usuario, id_leccion, estado, fecha) VALUES (?, ?, 'Completada', CURDATE()) " +
                     "ON DUPLICATE KEY UPDATE estado='Completada', fecha=CURDATE()";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idUsuario); ps.setInt(2, idLeccion); ps.executeUpdate();
        }
    }

    public Set<Integer> leccionesCompletadas(int idUsuario) throws SQLException {
        Set<Integer> ids = new HashSet<>();
        String sql = "SELECT id_leccion FROM progreso WHERE id_usuario=? AND estado='Completada'";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) ids.add(rs.getInt("id_leccion"));
            }
        }
        return ids;
    }
}
