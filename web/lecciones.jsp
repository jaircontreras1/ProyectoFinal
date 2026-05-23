<%@page import="codestartia.dao.ContenidoDAO"%>
<%@page import="codestartia.model.Leccion"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
List<Leccion> lecciones = new ContenidoDAO().listarLecciones();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecciones de programación - CodeStart IA</title>
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>
<body>
<%@include file="header.jspf"%>

<main class="container">
    <h1>Lecciones de programación con apoyo de IA generativa</h1>

    <p>
        Consulta lecciones básicas de programación diseñadas para aprender conceptos
        fundamentales como lógica, variables, condicionales, ciclos y funciones.
        La IA generativa se utiliza como apoyo para comprender ejemplos, resolver dudas
        y reforzar el aprendizaje sin sustituir tu razonamiento.
    </p>

    <div class="grid">
    <% for (Leccion l : lecciones) { %>
        <div class="card">
            <span class="badge"><%= l.getCategoria() %></span>
            <span class="badge"><%= l.getNivel() %></span>
            <h3><%= l.getTitulo() %></h3>
            <p><%= l.getDescripcion() %></p>
            <a class="btn" href="leccion.jsp?id=<%= l.getIdLeccion() %>">Ver lección</a>
        </div>
    <% } %>
    </div>
</main>

<%@include file="footer.jspf"%>
</body>
</html>