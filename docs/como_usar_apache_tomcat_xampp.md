# Como usar Apache, Tomcat, XAMPP y phpMyAdmin

## Punto importante
XAMPP incluye Apache HTTP Server para PHP/HTML y MySQL/MariaDB para base de datos. Un proyecto Java Web con JSP y Servlets no se ejecuta en Apache HTTP Server directamente.

Para Java Web necesitas Apache Tomcat. En este proyecto:
- XAMPP se usa para iniciar MySQL/MariaDB y abrir phpMyAdmin.
- Apache Tomcat se usa para ejecutar el WAR desde NetBeans.

## Pasos
1. Abre XAMPP Control Panel.
2. Inicia MySQL.
3. Opcional: inicia Apache solo si quieres abrir phpMyAdmin desde `http://localhost/phpmyadmin`.
4. En phpMyAdmin importa `database/plataforma_ia_generativa.sql`.
5. Abre NetBeans 14.
6. Ve a Services > Servers.
7. Agrega Apache Tomcat 9.
8. Abre el proyecto.
9. Copia `mysql-connector-java-5.1.23-bin.jar` en la carpeta `lib`.
10. Ejecuta el proyecto con Run Project.

## URL esperada
NetBeans abrira una ruta parecida a:
`http://localhost:8080/CodeStartIAWebNetBeans14/`

## Si aparece error del driver
Verifica que exista:
`lib/mysql-connector-java-5.1.23-bin.jar`

## Si aparece error de conexion
Verifica:
- MySQL activo en XAMPP
- Base importada en phpMyAdmin
- Usuario `root`
- Password vacio
- Puerto 3306
