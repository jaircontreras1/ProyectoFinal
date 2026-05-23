<%@page import="codestartia.dao.ContenidoDAO"%>
<%@page import="codestartia.model.Normatividad"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
List<Normatividad> normas = new ContenidoDAO().listarNormatividades();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Normas de uso responsable - CodeStart IA</title>
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>
<body>
<%@include file="header.jspf"%>

<main class="container">
    <h1>Normas para usar IA generativa al aprender programación</h1>

    <p>
        Esta sección presenta recomendaciones y normas de uso responsable para emplear
        IA generativa durante el aprendizaje de programación. El objetivo es promover
        la comprensión, la honestidad académica y el desarrollo de habilidades reales.
    </p>

    <p>
        Usar IA generativa no significa copiar respuestas. Significa apoyarse en una
        herramienta para entender mejor los conceptos, detectar errores y mejorar la
        forma de resolver problemas de programación.
    </p>

    <div class="grid">
    <% for (Normatividad n : normas) { %>
        <div class="card">
            <span class="badge"><%= n.getTipo() %></span>
            <h3><%= n.getTitulo() %></h3>
            <p><%= n.getDescripcion() %></p>
            <p><strong>Institución:</strong> <%= n.getInstitucion() %></p>
            <% if (n.getEnlace() != null && !n.getEnlace().trim().isEmpty()) { %>
                <a class="btn" target="_blank" href="<%= n.getEnlace() %>">Abrir recurso</a>
            <% } %>
        </div>
    <% } %>
    </div>
</main>

<%@include file="footer.jspf"%>
</body>
</html>