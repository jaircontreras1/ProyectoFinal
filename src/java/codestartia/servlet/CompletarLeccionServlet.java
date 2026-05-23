
package codestartia.servlet;

import codestartia.dao.ProgresoDAO;
import codestartia.model.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class CompletarLeccionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (usuario == null) { response.sendRedirect("login.jsp"); return; }
        try {
            int idLeccion = Integer.parseInt(request.getParameter("idLeccion"));
            new ProgresoDAO().completar(usuario.getIdUsuario(), idLeccion);
            response.sendRedirect("leccion.jsp?id=" + idLeccion + "&ok=1");
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
}
