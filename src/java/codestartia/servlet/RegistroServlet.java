package codestartia.servlet;

import codestartia.dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class RegistroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            new UsuarioDAO().registrar(request.getParameter("nombre"), request.getParameter("correo"), request.getParameter("password"));
            response.sendRedirect("login.jsp?registro=ok");
        } catch (Exception ex) {
            response.sendRedirect("registro.jsp?error=1");
        }
    }
}
