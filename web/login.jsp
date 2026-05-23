<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Login</title><link rel="stylesheet" href="assets/css/estilos.css"></head><body>
<%@include file="header.jspf"%>
<main class="container form-box card">
    <h2>Iniciar sesion</h2>
    <% if (request.getParameter("registro") != null) { %><div class="alert ok">Registro correcto. Ahora inicia sesion.</div><% } %>
    <% if (request.getParameter("error") != null) { %><div class="alert error">Correo o password incorrectos.</div><% } %>
    <form action="login" method="post">
        <label>Correo</label><input type="email" name="correo" required>
        <label>Password</label><input type="password" name="password" required>
        <button class="btn" type="submit">Entrar</button>
    </form>
</main>
<%@include file="footer.jspf"%>
</body></html>
