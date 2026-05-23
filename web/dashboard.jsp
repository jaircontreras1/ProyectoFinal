<%@page import="codestartia.dao.*"%>
<%@page import="codestartia.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null) { response.sendRedirect("login.jsp"); return; }
ContenidoDAO dao = new ContenidoDAO();
ProgresoDAO progresoDAO = new ProgresoDAO();
List<Leccion> lecciones = dao.listarLecciones();
Set<Integer> completadas = progresoDAO.leccionesCompletadas(usuario.getIdUsuario());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi panel - CodeStart IA</title>
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>
<body>
<%@include file="header.jspf"%>

<main class="container">
    <h1>Panel de aprendizaje</h1>

    <div class="card">
        <h3>Bienvenido, <%= usuario.getNombre() %></h3>
        <p>
            Desde este panel puedes revisar tu avance en las lecciones de programación
            y continuar aprendiendo con apoyo de IA generativa de forma responsable.
        </p>
        <p>
            Lecciones completadas:
            <strong><%= completadas.size() %></strong>
            de
            <strong><%= lecciones.size() %></strong>
        </p>
    </div>

    <h2>Mi progreso de programación</h2>

    <table class="table">
        <tr>
            <th>Lección</th>
            <th>Categoría</th>
            <th>Nivel</th>
            <th>Estado</th>
            <th>Acción</th>
        </tr>
        <% for (Leccion l : lecciones) { %>
        <tr>
            <td><%= l.getTitulo() %></td>
            <td><%= l.getCategoria() %></td>
            <td><%= l.getNivel() %></td>
            <td><%= completadas.contains(l.getIdLeccion()) ? "Completada" : "Pendiente" %></td>
            <td><a class="btn" href="leccion.jsp?id=<%= l.getIdLeccion() %>">Abrir lección</a></td>
        </tr>
        <% } %>
    </table>
</main>

<%@include file="footer.jspf"%>
</body>
</html>