# Proyecto: Plataforma web de enseñanza sobre Inteligencia Artificial Generativa

## Fase I. Planeacion de software

### 1.1 Problematica - introduccion
Actualmente la Inteligencia Artificial Generativa se utiliza para generar texto, imagenes, codigo, resumenes, ideas, materiales educativos y apoyo en tareas administrativas. Sin embargo, muchas personas la usan sin conocer sus riesgos, limitaciones, criterios eticos, problemas de privacidad, sesgos, derechos de autor o posibles errores de informacion.

Esta problematica hace necesario contar con una plataforma web educativa sencilla que concentre lecciones, tips, consejos y normatividades para orientar a estudiantes y usuarios principiantes en el uso responsable de la IA Generativa.

### 1.2 Objetivo general
Desarrollar un software web responsivo que permita consultar contenidos de aprendizaje, tips, consejos y normatividades sobre Inteligencia Artificial Generativa, utilizando Java Web con JSP/Servlets, JDBC y una base de datos MySQL administrada desde XAMPP/phpMyAdmin.

### 1.3 Alcance: modulos 3, incluye y excluye

| Modulo | Incluye | Excluye |
|---|---|---|
| Modulo 1. Lecciones de IA Generativa | Conceptos basicos, prompts, riesgos, aplicaciones educativas y uso responsable. | Cursos avanzados, certificaciones, clases en vivo o evaluacion automatica compleja. |
| Modulo 2. Tips y consejos | Consejos de seguridad, privacidad, calidad, etica, verificacion y productividad. | Chat en tiempo real, tutores personalizados, foros sociales o seguimiento docente. |
| Modulo 3. Normatividades | Politicas, buenas practicas, privacidad, integridad academica, derechos de autor y enlaces de referencia. | Asesoria legal oficial, dictamen juridico o actualizacion automatica de normas. |

Funciones de apoyo: registro, inicio de sesion, progreso del alumno y panel administrador basico.

### 1.4 Programa de tiempo GanttProject

| Actividad | Semana 1 | Semana 2 | Semana 3 | Semana 4 | Semana 5 | Semana 6 |
|---|---|---|---|---|---|---|
| Definir problematica y tema | X | | | | | |
| Objetivo, alcance y modulos | X | | | | | |
| Requerimientos funcionales y no funcionales | | X | | | | |
| Diagramas UML | | X | | | | |
| Wireframes | | | X | | | |
| Diseno de base de datos | | | X | | | |
| Conexion JDBC a MySQL | | | | X | | |
| Programacion modulo lecciones | | | | X | | |
| Programacion tips y consejos | | | | | X | |
| Programacion normatividades | | | | | X | |
| Pruebas, correcciones y GitHub | | | | | | X |

## Fase II. Analisis de software

### 2.1 Requerimientos

#### Requerimientos funcionales
| ID | Requerimiento | Prioridad |
|---|---|---|
| RF-01 | El sistema debe mostrar una pagina principal con descripcion de la plataforma. | Alta |
| RF-02 | El sistema debe permitir registrar usuarios. | Media |
| RF-03 | El sistema debe permitir iniciar y cerrar sesion. | Media |
| RF-04 | El sistema debe listar lecciones de IA Generativa. | Alta |
| RF-05 | El sistema debe mostrar el detalle de una leccion. | Alta |
| RF-06 | El sistema debe listar tips y consejos. | Alta |
| RF-07 | El sistema debe listar normatividades y buenas practicas. | Alta |
| RF-08 | El usuario registrado debe poder marcar lecciones como completadas. | Media |
| RF-09 | El administrador debe poder agregar y eliminar lecciones. | Media |

#### Requerimientos no funcionales
| ID | Requerimiento |
|---|---|
| RNF-01 | La plataforma debe ser responsiva para computadora, tablet y celular. |
| RNF-02 | El sistema debe usar Java Web con JSP, Servlets y JDBC. |
| RNF-03 | La base de datos debe ser MySQL/MariaDB y administrarse desde phpMyAdmin. |
| RNF-04 | El proyecto debe abrirse en NetBeans 14. |
| RNF-05 | Las contrasenas deben almacenarse con hash SHA-256. |
| RNF-06 | El proyecto debe poder publicarse en GitHub. |

### 2.2 Diagrama UML de clases
Ver archivo `uml_clases.puml`.

Clases principales: Usuario, Leccion, Tip, Normatividad, Progreso, UsuarioDAO, ContenidoDAO, ProgresoDAO y Conexion.

### 2.3 Diagrama UML de casos de uso
Ver archivo `uml_casos_uso.puml`.

Actores: visitante, usuario registrado y administrador.

## Fase III. Diseno de software

### 3.1 Wireframes
Ver archivo `wireframes.md`.

Interfaces tempranas:
1. Pagina principal
2. Login
3. Registro
4. Listado de lecciones
5. Detalle de leccion
6. Tips y consejos
7. Normatividades
8. Panel administrador

### 3.2 Diseno de base de datos
Tablas principales:
- usuarios
- lecciones
- tips
- normatividades
- progreso

El script completo esta en `database/plataforma_ia_generativa.sql`.

## Fase IV. Desarrollo de software

### 4.1 Conexion a base de datos
La conexion esta en:
`src/java/codestartia/config/Conexion.java`

Usa:
- Driver: `com.mysql.jdbc.Driver`
- URL: `jdbc:mysql://localhost:3306/plataforma_ia_generativa`
- Usuario: `root`
- Password: vacio

### 4.2 Programacion de modulos web responsivos
El desarrollo se implementa con JSP, Servlets, DAO, modelos Java y CSS responsivo.

Estructura principal:
- `web/index.jsp`
- `web/lecciones.jsp`
- `web/leccion.jsp`
- `web/tips.jsp`
- `web/normatividades.jsp`
- `web/admin.jsp`
- `src/java/codestartia/servlet`
- `src/java/codestartia/dao`
- `src/java/codestartia/model`

### 4.3 Cierre, conclusion y FODA
El proyecto cumple con las fases de planeacion, analisis, diseno y desarrollo. Permite aplicar conceptos de ingenieria de software, programacion web Java, bases de datos, diseno responsivo y publicacion en GitHub.

Ver FODA en `foda.md`.
