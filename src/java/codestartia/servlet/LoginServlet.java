package codestartia.servlet;

import codestartia.dao.UsuarioDAO;
import codestartia.model.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        try {
            Usuario usuario = new UsuarioDAO().login(correo, password);
            if (usuario != null) {
                request.getSession().setAttribute("usuario", usuario);
                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1");
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }
}
