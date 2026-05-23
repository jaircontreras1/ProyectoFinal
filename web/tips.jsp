<%@page import="codestartia.dao.ContenidoDAO"%>
<%@page import="codestartia.model.Tip"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
List<Tip> tips = new ContenidoDAO().listarTips();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tips para aprender programación - CodeStart IA</title>
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>
<body>
<%@include file="header.jspf"%>

<main class="container">
    <h1>Tips y consejos para aprender programación con IA generativa</h1>

    <p>
        Estos consejos ayudan a utilizar la IA generativa como una herramienta de apoyo
        para aprender programación, sin depender completamente de ella ni sustituir el
        razonamiento propio.
    </p>

    <p>
        La IA generativa puede ayudarte a explicar errores, generar ejemplos, comparar
        soluciones y practicar conceptos, pero el aprendizaje real depende de analizar,
        probar y comprender el código.
    </p>

    <div class="grid">
    <% for (Tip t : tips) { %>
        <div class="card">
            <span class="badge"><%= t.getTipo() %></span>
            <span class="badge">Prioridad: <%= t.getPrioridad() %></span>
            <h3><%= t.getTitulo() %></h3>
            <p><%= t.getConsejo() %></p>
        </div>
    <% } %>
    </div>
</main>

<%@include file="footer.jspf"%>
</body>
</html>