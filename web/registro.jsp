<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Registro</title><link rel="stylesheet" href="assets/css/estilos.css"></head><body>
<%@include file="header.jspf"%>
<main class="container form-box card">
    <h2>Registro de usuario</h2>
    <% if (request.getParameter("error") != null) { %><div class="alert error">No se pudo registrar. Verifica si el correo ya existe.</div><% } %>
    <form action="registro" method="post">
        <label>Nombre</label><input type="text" name="nombre" required>
        <label>Correo</label><input type="email" name="correo" required>
        <label>Password</label><input type="password" name="password" required>
        <button class="btn" type="submit">Crear cuenta</button>
    </form>
</main>
<%@include file="footer.jspf"%>
</body></html>
