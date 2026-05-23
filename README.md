# CodeStart IA Generativa - Java Web Application NetBeans 14

## Topico
Desarrollar un software web: plataforma de enseñanza, tips, consejos y normatividades para la Inteligencia Artificial Generativa.

## Tipo de proyecto
Java Web Application para NetBeans 14, desarrollado con JSP, Servlets, JDBC, HTML, CSS responsivo y MySQL/MariaDB de XAMPP.

## Modulos principales
1. Lecciones de IA Generativa
2. Tips y consejos de uso responsable
3. Normatividades, politicas y buenas practicas

Funciones de apoyo:
- Registro de usuarios
- Inicio y cierre de sesion
- Progreso de lecciones
- Panel administrador basico

## Requisitos
- NetBeans 14
- JDK 8 o superior
- Apache Tomcat 9 recomendado para proyectos Java Web clasicos con javax.servlet
- XAMPP con MySQL/MariaDB activo
- phpMyAdmin para importar la base de datos
- mysql-connector-java-5.1.23-bin.jar

## Importante sobre Apache y XAMPP
El Apache de XAMPP es Apache HTTP Server y sirve paginas PHP/HTML. No ejecuta JSP ni Servlets directamente.
Para este proyecto Java Web debes usar Apache Tomcat desde NetBeans. XAMPP se usa para MySQL/MariaDB y phpMyAdmin.

## Como ejecutar
1. Descomprime el proyecto.
2. Copia el archivo `mysql-connector-java-5.1.23-bin.jar` dentro de la carpeta `lib/`.
3. Abre XAMPP e inicia MySQL.
4. Entra a phpMyAdmin.
5. Importa el archivo `database/plataforma_ia_generativa.sql`.
6. Abre NetBeans 14.
7. Ve a File > Open Project.
8. Selecciona la carpeta `CodeStartIAWebNetBeans14`.
9. Configura Tomcat 9 en Services > Servers.
10. Ejecuta el proyecto.

## Conexion
Archivo:
`src/java/codestartia/config/Conexion.java`

Configuracion por defecto:
- Host: localhost
- Puerto: 3306
- Base: plataforma_ia_generativa
- Usuario: root
- Password: vacio

## Usuarios de prueba
Administrador:
- correo: admin@ia.edu
- password: 1234

Alumno:
- correo: alumno@ia.edu
- password: 1234

## GitHub
Comandos sugeridos:
```bash
git init
git add .
git commit -m "Proyecto plataforma IA Generativa Java Web"
git branch -M main
git remote add origin https://github.com/usuario/plataforma-ia-generativa.git
git push -u origin main
```

## Documentacion academica
La carpeta `docs/` contiene:
- planeacion_analisis_diseno_desarrollo.md
- ganttproject_actividades.csv
- proyecto_gantt.gan
- uml_clases.puml
- uml_casos_uso.puml
- wireframes.md
- foda.md
- github.md

