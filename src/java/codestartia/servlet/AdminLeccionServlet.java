package codestartia.servlet;

import codestartia.dao.ContenidoDAO;
import codestartia.model.Leccion;
import codestartia.model.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AdminLeccionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario == null || !usuario.isAdmin()) { response.sendRedirect("login.jsp"); return; }
        try {
            Leccion l = new Leccion();
            String id = request.getParameter("idLeccion");
            if (id != null && !id.isEmpty()) l.setIdLeccion(Integer.parseInt(id));
            l.setTitulo(request.getParameter("titulo"));
            l.setDescripcion(request.getParameter("descripcion"));
            l.setContenido(request.getParameter("contenido"));
            l.setCategoria(request.getParameter("categoria"));
            l.setNivel(request.getParameter("nivel"));
            new ContenidoDAO().guardarLeccion(l);
            response.sendRedirect("admin.jsp?ok=1");
        } catch (Exception ex) { throw new ServletException(ex); }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario == null || !usuario.isAdmin()) { response.sendRedirect("login.jsp"); return; }
        try {
            String accion = request.getParameter("accion");
            if ("eliminar".equals(accion)) {
                new ContenidoDAO().eliminarLeccion(Integer.parseInt(request.getParameter("id")));
            }
            response.sendRedirect("admin.jsp");
        } catch (Exception ex) { throw new ServletException(ex); }
    }
}
