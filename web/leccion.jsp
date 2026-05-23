<%@page import="codestartia.dao.ContenidoDAO"%>
<%@page import="codestartia.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
Leccion l = new ContenidoDAO().obtenerLeccion(id);
if (l == null) { response.sendRedirect("lecciones.jsp"); return; }
Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= l.getTitulo() %> - CodeStart IA</title>
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>
<body>
<%@include file="header.jspf"%>

<main class="container">
    <% if (request.getParameter("ok") != null) { %>
        <div class="alert ok">Lección marcada como completada.</div>
    <% } %>

    <article class="card">
        <span class="badge"><%= l.getCategoria() %></span>
        <span class="badge"><%= l.getNivel() %></span>

        <h1><%= l.getTitulo() %></h1>

        <p>
            <strong>Descripción:</strong> <%= l.getDescripcion() %>
        </p>

        <p>
            Revisa el contenido de la lección, analiza los ejemplos y utiliza la IA
            generativa únicamente como apoyo para aclarar dudas, explicar errores o
            practicar más ejercicios. Recuerda que el objetivo principal es comprender
            la lógica del código.
        </p>

        <pre><%= l.getContenido() %></pre>

        <% if (usuario != null) { %>
        <form action="completar-leccion" method="post">
            <input type="hidden" name="idLeccion" value="<%= l.getIdLeccion() %>">
            <button class="btn" type="submit">Marcar lección como completada</button>
        </form>
        <% } else { %>
            <p><a href="login.jsp">Inicia sesión</a> para guardar tu progreso.</p>
        <% } %>
    </article>
</main>

<%@include file="footer.jspf"%>
</body>
</html>