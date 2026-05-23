<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeStart IA - Aprende programación</title>
    <link rel="stylesheet" href="assets/css/estilos.css">
</head>
<body>
<%@include file="header.jspf"%>

<section class="hero">
    <h1>Aprende programación con apoyo de Inteligencia Artificial Generativa</h1>
    <p>
        CodeStart IA es una plataforma web educativa para estudiantes principiantes
        que desean aprender programación mediante lecciones, ejercicios prácticos,
        tips de estudio y normas para usar la IA generativa de forma responsable.
    </p>
</section>

<main class="container">
    <h2>Módulos principales</h2>

    <div class="grid">
        <div class="card">
            <h3>1. Lecciones de programación</h3>
            <p>
                Aprende conceptos básicos como lógica, variables, condicionales,
                ciclos, funciones y desarrollo web con explicaciones sencillas
                apoyadas por IA generativa.
            </p>
            <a class="btn" href="lecciones.jsp">Ver lecciones</a>
        </div>

        <div class="card">
            <h3>2. Tips y consejos</h3>
            <p>
                Consulta recomendaciones para usar IA generativa como apoyo al
                aprender programación, sin copiar código sin comprenderlo.
            </p>
            <a class="btn" href="tips.jsp">Ver tips</a>
        </div>

        <div class="card">
            <h3>3. Normas de uso responsable</h3>
            <p>
                Revisa criterios de honestidad académica, privacidad, validación
                de código y uso ético de la IA durante el aprendizaje.
            </p>
            <a class="btn" href="normatividades.jsp">Ver normas</a>
        </div>
    </div>
</main>

<%@include file="footer.jspf"%>
</body>
</html>