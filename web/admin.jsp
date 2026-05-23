<%@page import="codestartia.dao.ContenidoDAO"%>
<%@page import="codestartia.model.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Usuario usuario = (Usuario) session.getAttribute("usuario");
if (usuario == null || !usuario.isAdmin()) { response.sendRedirect("login.jsp"); return; }
List<Leccion> lecciones = new ContenidoDAO().listarLecciones();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración - CodeStart IA</title>
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>
<body>
<%@include file="header.jspf"%>

<main class="container">
    <h1>Panel de administración de contenidos</h1>

    <p>
        En esta sección el administrador puede gestionar lecciones relacionadas con
        el aprendizaje de programación con apoyo de IA generativa.
    </p>

    <% if (request.getParameter("ok") != null) { %>
        <div class="alert ok">Registro guardado correctamente.</div>
    <% } %>

    <div class="card">
        <h2>Nueva lección de programación</h2>

        <form action="admin-leccion" method="post">
            <label>Título</label>
            <input type="text" name="titulo" required>

            <label>Descripción</label>
            <textarea name="descripcion" required></textarea>

            <label>Contenido de la lección</label>
            <textarea name="contenido" required></textarea>

            <label>Categoría</label>
            <input type="text" name="categoria" value="Programación con IA generativa" required>

            <label>Nivel</label>
            <select name="nivel">
                <option>Básico</option>
                <option>Intermedio</option>
                <option>Avanzado</option>
            </select>

            <button class="btn" type="submit">Guardar lección</button>
        </form>
    </div>

    <h2>Lecciones registradas</h2>

    <table class="table">
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Categoría</th>
            <th>Nivel</th>
            <th>Acciones</th>
        </tr>
        <% for (Leccion l : lecciones) { %>
        <tr>
            <td><%= l.getIdLeccion() %></td>
            <td><%= l.getTitulo() %></td>
            <td><%= l.getCategoria() %></td>
            <td><%= l.getNivel() %></td>
            <td>
                <a class="btn" href="leccion.jsp?id=<%= l.getIdLeccion() %>">Ver lección</a>
                <a class="btn danger" onclick="return confirmarEliminacion()" href="admin-leccion?accion=eliminar&id=<%= l.getIdLeccion() %>">Eliminar</a>
            </td>
        </tr>
        <% } %>
    </table>
</main>

<%@include file="footer.jspf"%>
</body>
</html>