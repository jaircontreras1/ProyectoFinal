CREATE DATABASE IF NOT EXISTS plataforma_ia_generativa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE plataforma_ia_generativa;

DROP TABLE IF EXISTS progreso;
DROP TABLE IF EXISTS normatividades;
DROP TABLE IF EXISTS tips;
DROP TABLE IF EXISTS lecciones;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(64) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL DEFAULT 'usuario',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE lecciones (
    id_leccion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(160) NOT NULL,
    descripcion TEXT NOT NULL,
    contenido LONGTEXT NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    nivel VARCHAR(50) NOT NULL,
    activo TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tips (
    id_tip INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(160) NOT NULL,
    consejo TEXT NOT NULL,
    tipo VARCHAR(80) NOT NULL,
    prioridad VARCHAR(30) NOT NULL DEFAULT 'Media',
    activo TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE normatividades (
    id_normatividad INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(180) NOT NULL,
    descripcion TEXT NOT NULL,
    institucion VARCHAR(120) NOT NULL,
    enlace VARCHAR(255),
    tipo VARCHAR(80) NOT NULL,
    activo TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE progreso (
    id_progreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_leccion INT NOT NULL,
    estado VARCHAR(30) NOT NULL DEFAULT 'Completada',
    fecha DATE NOT NULL,
    UNIQUE KEY uq_usuario_leccion (id_usuario, id_leccion),
    CONSTRAINT fk_progreso_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_progreso_leccion FOREIGN KEY (id_leccion) REFERENCES lecciones(id_leccion) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Password para ambos usuarios: 1234
INSERT INTO usuarios (nombre, correo, password_hash, tipo_usuario) VALUES
('Administrador IA', 'admin@ia.edu', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'admin'),
('Alumno Demo', 'alumno@ia.edu', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'usuario');

INSERT INTO lecciones (titulo, descripcion, contenido, categoria, nivel) VALUES
('Introduccion a la Inteligencia Artificial Generativa', 'Conceptos basicos sobre IA generativa, modelos y ejemplos de uso.', 'La Inteligencia Artificial Generativa permite crear texto, imagenes, audio, codigo y otros contenidos a partir de instrucciones o datos de entrada. Se utiliza en educacion, documentacion, programacion, investigacion y atencion a usuarios. Su uso requiere pensamiento critico, revision humana y criterios de seguridad.', 'Fundamentos', 'Basico'),
('Prompts efectivos', 'Buenas practicas para redactar instrucciones claras.', 'Un prompt efectivo indica contexto, objetivo, formato de salida, restricciones y ejemplos. Mientras mas clara sea la instruccion, mas util sera la respuesta. Se recomienda pedir respuestas verificables, especificar audiencia y revisar los resultados antes de usarlos.', 'Prompts', 'Basico'),
('Riesgos y limitaciones de la IA Generativa', 'Revision de sesgos, alucinaciones, privacidad y dependencia tecnologica.', 'Los sistemas de IA generativa pueden producir informacion incorrecta, incompleta o sesgada. No deben usarse como unica fuente en tareas criticas. Se debe proteger informacion personal, institucional y confidencial, ademas de validar datos con fuentes confiables.', 'Uso responsable', 'Intermedio'),
('IA Generativa en educacion', 'Aplicaciones educativas, apoyo al aprendizaje y criterios de uso.', 'La IA generativa puede apoyar la explicacion de temas, generacion de ejemplos, retroalimentacion inicial y organizacion de ideas. En educacion debe usarse como apoyo, no como sustituto del aprendizaje, la autoria ni el criterio docente.', 'Educacion', 'Basico');

INSERT INTO tips (titulo, consejo, tipo, prioridad) VALUES
('No compartas datos sensibles', 'Evita introducir contrasenas, datos personales, expedientes, claves internas o informacion confidencial en herramientas de IA.', 'Seguridad', 'Alta'),
('Verifica las respuestas', 'Contrasta la informacion generada con fuentes oficiales, articulos, manuales o documentos institucionales.', 'Calidad', 'Alta'),
('Declara el uso de IA cuando aplique', 'En trabajos academicos o institucionales, informa si utilizaste IA generativa cuando las reglas lo soliciten.', 'Etica', 'Media'),
('Usa prompts con contexto', 'Indica rol, objetivo, publico, tono, formato esperado y restricciones para obtener mejores resultados.', 'Productividad', 'Media'),
('Mantener supervision humana', 'La decision final debe ser revisada por una persona, especialmente en temas legales, academicos, medicos o administrativos.', 'Responsabilidad', 'Alta');

INSERT INTO normatividades (titulo, descripcion, institucion, enlace, tipo) VALUES
('Principios de uso responsable de IA', 'Criterios generales para usar IA con transparencia, supervision humana, privacidad, seguridad y responsabilidad.', 'Proyecto academico', 'https://www.unesco.org/', 'Etica'),
('Proteccion de datos personales', 'El usuario debe evitar compartir informacion personal, sensible o confidencial al utilizar plataformas de IA.', 'Proyecto academico', 'https://www.inai.org.mx/', 'Privacidad'),
('Integridad academica', 'La IA puede apoyar el aprendizaje, pero no debe sustituir la autoria, el analisis ni la entrega de trabajos propios.', 'Proyecto academico', '', 'Academico'),
('Derechos de autor y contenidos generados', 'Los contenidos generados por IA deben revisarse para evitar plagio, uso indebido de obras o atribuciones incorrectas.', 'Proyecto academico', '', 'Legal');
