CREATE TABLE estudiantes (id INT PRIMARY KEY,nombre VARCHAR(100),edad INT);

CREATE TABLE cursos (id INT PRIMARY KEY,nombre VARCHAR(100),duracion VARCHAR(100));

CREATE TABLE inscripciones (id_estudiante INT,id_curso INT,FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),FOREIGN KEY (id_curso) REFERENCES cursos(id));

INSERT INTO estudiantes VALUES (1, "Ana", 20);
INSERT INTO estudiantes VALUES (2, "Luis", 22);
INSERT INTO estudiantes VALUES (3, "María", 19);
INSERT INTO estudiantes VALUES (4, "Carlos", 21);
INSERT INTO estudiantes VALUES (5, "Sofía", 23);
INSERT INTO estudiantes VALUES (6, "Marta", 26);
INSERT INTO estudiantes VALUES (7, "Camilo", 21);

INSERT INTO cursos VALUES (101, "Matemáticas", "5 años");
INSERT INTO cursos VALUES (102, "Historia", "3 meses");
INSERT INTO cursos VALUES (103, "Programación", "4 años");
INSERT INTO cursos VALUES (104, "Biología", "1 año 5 meses ");
INSERT INTO cursos VALUES (105, "Física", "12 años");

INSERT INTO inscripciones VALUES (1, 101);
INSERT INTO inscripciones VALUES (2, 102);
INSERT INTO inscripciones VALUES (3, 103);
INSERT INTO inscripciones VALUES (4, 101);
INSERT INTO inscripciones VALUES (5, 104);
INSERT INTO inscripciones VALUES (1, 105);
INSERT INTO inscripciones VALUES (2, 104);
INSERT INTO inscripciones VALUES (3, 105);
INSERT INTO inscripciones VALUES (4, 103);

SELECT e.nombre AS estudiante, c.nombre AS curso
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id
JOIN cursos c ON i.id_curso = c.id;

SELECT e.nombre
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id
JOIN cursos c ON i.id_curso = c.id
WHERE c.nombre = "Programación";

SELECT c.id, c.nombre, c.duracion
FROM cursos c
JOIN inscripciones i ON c.id = i.id_curso
JOIN estudiantes e ON i.id_estudiante = e.id
WHERE e.nombre = 'Ana';

SELECT c.nombre AS nombre_curso, COUNT(i.id_estudiante) AS cantidad_estudiantes
FROM cursos c
LEFT JOIN inscripciones i ON c.id = i.id_curso
GROUP BY c.id, c.nombre;

SELECT e.nombre
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.id_estudiante
WHERE i.id_estudiante IS NULL;