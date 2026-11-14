USE uasd_carreras;

-- 1. Limpiamos las tablas
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE carreras;
TRUNCATE TABLE escuelas;
TRUNCATE TABLE facultades;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. Insertamos TODAS las Facultades
INSERT INTO facultades (id, nombre) VALUES 
(1, 'Facultad de Ciencias de la Salud'),
(2, 'Facultad de Humanidades'),
(3, 'Facultad de Ciencias'),
(4, 'Facultad de Ciencias Económicas y Sociales'),
(5, 'Facultad de Artes'),
(6, 'Facultad de Ingeniería y Arquitectura'),
(7, 'Facultad de Ciencias de la Educación'),
(8, 'Facultad de Ciencias Agronómicas y Veterinarias'),
(9, 'Facultad de Ciencias Jurídicas y Políticas');

-- 3. Insertamos TODAS las Escuelas
INSERT INTO escuelas (id, nombre, facultad_id) VALUES 
-- Salud (1)
(1, 'Escuela de Medicina', 1), (2, 'Escuela de Bioanálisis', 1), (3, 'Escuela de Enfermería', 1), 
(4, 'Escuela de Farmacia', 1), (5, 'Escuela de Odontología', 1), (6, 'Escuela de Salud Pública', 1),

-- Humanidades (2)
(7, 'Escuela de Comunicación Social', 2), (8, 'Escuela de Filosofía', 2), (9, 'Escuela de Historia y Antropología', 2), 
(10, 'Escuela de Idiomas', 2), (11, 'Escuela de Letras', 2), (12, 'Escuela de Psicología', 2),

-- Ciencias (3)
(13, 'Escuela de Biología', 3), (14, 'Escuela de Ciencias Geográficas', 3), (15, 'Escuela de Física', 3), 
(16, 'Escuela de Informática', 3), (17, 'Escuela de Matemáticas', 3), (18, 'Escuela de Microbiología y Parasitología', 3), 
(19, 'Escuela de Química', 3),

-- Económicas (4)
(20, 'Escuela de Administración', 4), (21, 'Escuela de Contabilidad', 4), (22, 'Escuela de Economía', 4), 
(23, 'Escuela de Estadística', 4), (24, 'Escuela de Mercadotecnia', 4), (25, 'Escuela de Sociología', 4), 
(26, 'Escuela de Turismo y Hotelería', 4),

-- Artes (5)
(27, 'Escuela de Artes Plásticas', 5), (28, 'Escuela de Cine, Televisión y Fotografía', 5), (29, 'Escuela de Crítica e Historia del Arte', 5), 
(30, 'Escuela de Diseño Industrial y de Moda', 5), (31, 'Escuela de Música', 5), (32, 'Escuela de Publicidad', 5), 
(33, 'Escuela de Teatro y Danza', 5),

-- Ingeniería (6)
(34, 'Escuela de Agrimensura', 6), (35, 'Escuela de Arquitectura', 6), (36, 'Escuela de Ingeniería Civil', 6), 
(37, 'Escuela de Ingeniería Electromecánica', 6), (38, 'Escuela de Ingeniería Industrial', 6), (39, 'Escuela de Ingeniería Química', 6),

-- Educación (7)
(40, 'Escuela de Bibliotecología, Tecnología e Innovaciones Educativas', 7), (41, 'Escuela de Educación Física y Ciencias del Deporte', 7), 
(42, 'Escuela de Educación Infantil y Básica', 7), (43, 'Escuela de Educación Media', 7), 
(44, 'Escuela de Orientación Educativa y Psicopedagogía', 7), (45, 'Escuela de Teoría y Gestión Educativa', 7),

-- Agronomía (8)
(46, 'Escuela de Agronomía', 8), (47, 'Escuela de Veterinaria', 8), (48, 'Escuela de Zootecnia', 8),

-- Jurídicas (9)
(49, 'Escuela de Derecho', 9), (50, 'Escuela de Ciencias Políticas', 9);

-- 4. Insertamos TODAS las Carreras
INSERT INTO carreras (nombre, escuela_id) VALUES 
-- 1. Salud
('Doctor en Medicina', 1), ('Licenciatura en Terapia Ocupacional', 1), ('Licenciatura en Logopedia', 1),
('Licenciatura en Bioanálisis', 2), ('Licenciatura en Imágenes Médicas Diagnósticas', 2), ('Técnico Superior en Radioterapia y Dosimetría', 2),
('Licenciatura en Enfermería', 3),
('Licenciatura en Farmacia', 4), ('Licenciatura en Nutrición y Dietética', 4), ('Técnico Superior en Farmacia', 4),
('Doctor en Odontología', 5), ('Técnico Superior en Higiene Dental', 5), ('Técnico Superior en Laboratorio Dental', 5),
('Licenciatura en Salud Pública', 6), ('Técnico Superior en Atención Prehospitalaria', 6), ('Técnico Superior en Documentación Sanitaria', 6),

-- 2. Humanidades
('Licenciatura en Comunicación Social (Periodismo)', 7), ('Licenciatura en Comunicación Social (Relaciones Públicas)', 7), ('Licenciatura en Comunicación Social (Comunicación Gráfica)', 7),
('Licenciatura en Filosofía', 8),
('Licenciatura en Historia', 9), ('Licenciatura en Antropología', 9),
('Licenciatura en Lenguas Modernas (Mención Inglés)', 10), ('Licenciatura en Lenguas Modernas (Mención Francés)', 10), ('Técnico en Lenguas Modernas', 10),
('Licenciatura en Letras', 11),
('Licenciatura en Psicología (Clínica)', 12), ('Licenciatura en Psicología (Desarrollo Humano)', 12), ('Licenciatura en Psicología (Escolar)', 12), ('Licenciatura en Psicología (Industrial)', 12), ('Licenciatura en Psicología (Social)', 12),

-- 3. Ciencias
('Licenciatura en Biología', 13),
('Licenciatura en Geografía', 14),
('Licenciatura en Física', 15), ('Licenciatura en Ciencias de la Atmósfera', 15), ('Licenciatura en Geofísica', 15),
('Licenciatura en Informática', 16), ('Licenciatura en Sistemas y Ciberseguridad', 16), ('Técnico Superior en Desarrollo de Software', 16), ('Técnico Superior en Desarrollo de Aplicaciones Móviles', 16), ('Técnico Superior en Infraestructura de TIC', 16), ('Técnico Superior en Animación Digital y Videojuegos', 16), ('Técnico Superior en Administración de Redes', 16),
('Licenciatura en Matemáticas', 17),
('Licenciatura en Microbiología', 18),
('Licenciatura en Química', 19), ('Licenciatura en Ciencia y Tecnología de Alimentos', 19), ('Tecnólogo Superior en Alimentos', 19),

-- 4. Económicas
('Licenciatura en Administración de Empresas', 20), ('Licenciatura en Administración Pública', 20),
('Licenciatura en Contabilidad', 21),
('Licenciatura en Economía', 22), ('Licenciatura en Aduana y Comercio Exterior', 22),
('Licenciatura en Estadística (Mención Informática)', 23), ('Licenciatura en Estadística (Mención Socioeconómica)', 23),
('Licenciatura en Mercadotecnia', 24),
('Licenciatura en Sociología', 25), ('Licenciatura en Trabajo Social', 25),
('Licenciatura en Turismo y Hotelería', 26), ('Técnico en Administración de Servicios Turísticos', 26),

-- 5. Artes
('Licenciatura en Artes Plásticas', 27),
('Licenciatura en Cinematografía y Audiovisuales (Mención Cine)', 28), ('Licenciatura en Cinematografía y Audiovisuales (Mención Televisión)', 28), ('Técnico en Fotografía y Medios Audiovisuales', 28),
('Licenciatura en Historia y Crítica del Arte', 29),
('Licenciatura en Artes Industriales (Mención Diseño Artesanal)', 30), ('Licenciatura en Artes Industriales (Mención Diseño Industrial)', 30), ('Licenciatura en Artes Industriales (Mención Diseño de Modas)', 30),
('Licenciatura en Música', 31),
('Licenciatura en Publicidad (Mención Diseño)', 32), ('Licenciatura en Publicidad (Mención Ilustración)', 32), ('Licenciatura en Publicidad (Mención Creatividad y Gerencia)', 32),
('Licenciatura en Teatro', 33),

-- 6. Ingeniería
('Ingeniería Geomática', 34), ('Licenciatura en Agrimensura', 34), ('Técnico Superior en Agrimensura', 34),
('Arquitectura', 35),
('Ingeniería Civil', 36),
('Ingeniería Electromecánica (Mención Eléctrica)', 37), ('Ingeniería Electromecánica (Mención Mecánica)', 37), ('Ingeniería Electromecánica (Mención Electrónica)', 37),
('Ingeniería Industrial', 38),
('Ingeniería Química', 39),

-- 7. Educación
('Licenciatura en Bibliotecología y Ciencias de la Información', 40), ('Licenciatura en Educación (Mención Bibliotecología)', 40), ('Licenciatura en Educación (Mención Informática Educativa)', 40),
('Licenciatura en Educación Física', 41), ('Licenciatura en Actividad Física, Salud y Fitness', 41), ('Licenciatura en Cultura Física y Deportes', 41), ('Técnico Superior en Entrenamiento Deportivo', 41),
('Licenciatura en Educación Inicial / Infantil', 42), ('Licenciatura en Educación Básica', 42), ('Licenciatura en Educación (Mención Primer Ciclo Primaria)', 42), ('Licenciatura en Educación (Mención Segundo Ciclo Primaria)', 42), ('Licenciatura en Educación (Mención Arte Escolar)', 42),
('Licenciatura en Educación Media (Mención Biología y Química)', 43), ('Licenciatura en Educación Media (Mención Ciencias Sociales)', 43), ('Licenciatura en Educación Media (Mención Física y Matemáticas)', 43), ('Licenciatura en Educación Media (Mención Francés)', 43), ('Licenciatura en Educación Media (Mención Inglés)', 43), ('Licenciatura en Educación (Mención Letras)', 43),
('Licenciatura en Educación Especial e Inclusiva', 44), ('Licenciatura en Educación (Mención Orientación Académica)', 44), ('Licenciatura en Educación (Mención Orientación Socio-Comunitaria)', 44), ('Licenciatura en Educación (Mención Orientación para el Desarrollo de Recursos Humanos)', 44), ('Licenciatura en Educación (Mención Orientación Educativa y Psicopedagógica)', 44),
('Licenciatura en Educación (Mención Gestión Educativa)', 45), ('Licenciatura en Educación para Personas Jóvenes y Adultas', 45), ('Licenciatura en Educación (Mención Formación Humana y Ciudadanía)', 45),

-- 8. Agronomía
('Ingeniería Agronómica (Mención Desarrollo Agrícola y Rural)', 46), ('Ingeniería Agronómica (Mención Producción de Cultivos)', 46), ('Ingeniería Agronómica (Mención Suelo y Riego)', 46),
('Doctor en Medicina Veterinaria', 47),
('Ingeniería en Zootecnia', 48), ('Ingeniería Lácteo Alimentaria', 48), ('Tecnología en Procesos Lácteo Alimentarios', 48),

-- 9. Jurídicas
('Licenciatura en Derecho', 49),
('Licenciatura en Ciencias Políticas', 50);