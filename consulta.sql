PRAGMA foreign_keys = ON;

CREATE TABLE estudiante (
    id_estudiante INTEGER PRIMARY KEY,
    matricula TEXT NOT NULL UNIQUE,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL
);


CREATE TABLE asignatura (
    id_asignatura INTEGER PRIMARY KEY,
    codigo TEXT NOT NULL UNIQUE,
    nombre TEXT NOT NULL,
    creditos INTEGER NOT NULL
);


CREATE TABLE inscripcion (
    id_estudiante INTEGER NOT NULL,
    id_asignatura INTEGER NOT NULL,
    periodo TEXT NOT NULL,
    PRIMARY KEY (id_estudiante, id_asignatura, periodo),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante (id_estudiante),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura (id_asignatura)
);


INSERT INTO estudiante (id_estudiante, matricula, nombre, apellido) VALUES
    (1, 'EST-001', 'Ana', 'Reyes'),
    (2, 'EST-002', 'Luis', 'Méndez'),
    (3, 'EST-003', 'Carla', 'Vargas'),
    (4, 'EST-004', 'José', 'Pérez'),
    (5, 'EST-005', 'Laura', 'Núñez');

INSERT INTO asignatura (id_asignatura, codigo, nombre, creditos) VALUES
    (1, 'LP2', 'Lenguaje de Programación II', 4),
    (2, 'MAT', 'Matemática Superior', 3),
    (3, 'BD1', 'Fundamentos de Base de Datos', 3),
    (4, 'RED', 'Redes de Computadoras', 3),
    (5, 'INV', 'Metodología de la Investigación', 3);

INSERT INTO inscripcion (id_estudiante, id_asignatura, periodo) VALUES
    (1, 1, '2026-3'),
    (1, 2, '2026-3'),
    (2, 1, '2026-3'),
    (3, 3, '2026-3'),
    (4, 4, '2026-3'),
    (5, 5, '2026-3');


SELECT
    e.nombre || ' ' || e.apellido AS estudiante,
    a.nombre AS asignatura,
    i.periodo
FROM inscripcion AS i
INNER JOIN estudiante AS e
    ON i.id_estudiante = e.id_estudiante
INNER JOIN asignatura AS a
    ON i.id_asignatura = a.id_asignatura
ORDER BY e.id_estudiante, a.id_asignatura;