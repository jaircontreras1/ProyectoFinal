package codestartia.dao;

import codestartia.config.Conexion;
import codestartia.model.Usuario;
import codestartia.util.HashUtil;
import java.sql.*;

public class UsuarioDAO {
    public Usuario login(String correo, String password) throws SQLException {
        String sql = "SELECT id_usuario, nombre, correo, tipo_usuario FROM usuarios WHERE correo=? AND password_hash=?";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, correo);
            ps.setString(2, HashUtil.sha256(password));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Usuario u = new Usuario();
                    u.setIdUsuario(rs.getInt("id_usuario"));
                    u.setNombre(rs.getString("nombre"));
                    u.setCorreo(rs.getString("correo"));
                    u.setTipoUsuario(rs.getString("tipo_usuario"));
                    return u;
                }
            }
        }
        return null;
    }

    public boolean registrar(String nombre, String correo, String password) throws SQLException {
        String sql = "INSERT INTO usuarios(nombre, correo, password_hash, tipo_usuario) VALUES (?, ?, ?, 'usuario')";
        try (Connection cn = Conexion.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setString(3, HashUtil.sha256(password));
            return ps.executeUpdate() > 0;
        }
    }
}
