USE universidad;
-- 1. Listado de alumnos ordenados alfabeticamente por apellidos y nombre
SELECT apellido1,
    apellido2,
    nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1,
    apellido2,
    nombre;
-- 2. Alumnos sin número de teléfono registrado
SELECT nombre,
    apellido1,
    apellido2,
    telefono
FROM persona
WHERE telefono IS NULL
    AND tipo = 'alumno';
-- 3. Listado de alumnos nacidos en 1999
SELECT nombre,
    apellido1,
    apellido2
FROM persona
WHERE YEAR(fecha_nacimiento) = 1999;
-- 4. Profesores sin número de télefobno y NIF que temrinen en K
SELECT apellido1,
    apellido2,
    nombre,
    nif,
    telefono
FROM persona
WHERE telefono IS NULL
    AND tipo = 'profesor'
    AND SUBSTRING(nif, 9, 1) = 'K';
-- 5. Asignaturas en el Primer Cuatrimestre del Tercer Curso del Grado con ID 7
SELECT nombre
FROM asignatura
WHERE cuatrimestre = 1
    AND curso = 3
    AND id_grado = 7;
-- 6. Listado de profesores con nombre del departamento ordenado alfabéticamente
SELECT persona.apellido1,
    persona.apellido2,
    persona.nombre,
    persona.nombre as nombre_departamento
FROM persona
    JOIN profesor ON persona.id = profesor.id_profesor
    JOIN departamento ON profesor.id_departamento = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY persona.apellido1,
    persona.apellido2,
    persona.nombre;
-- 7. Información de las asignaturas del alumno con NIF 26902806M
SELECT asignatura.nombre AS nombre_asignatura,
    curso_escolar.anyo_inicio,
    curso_escolar.anyo_fin
FROM alumno_se_matricula_asignatura me
    JOIN asignatura ON me.id_asignatura = asignatura.id
    JOIN curso_escolar ON me.id_curso_escolar = curso_escolar.id
WHERE me.id_alumno = (
        SELECT id
        FROM persona
        WHERE nif = '26902806M'
            AND tipo = 'alumno'
    );
-- 8. Departamentos con profesores que imparten en el grado en ingeniería informática
SELECT DISTINCT departamento.nombre
FROM departamento
    JOIN profesor ON departamento.id = profesor.id_departamento
    JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
    JOIN grado ON asignatura.id_grado = grado.id
WHERE grado.id = 4;
-- 9. Alumnos matriculados en asignaturas durante el curso escolar 2018/2019
SELECT DISTINCT p.nombre,
    p.apellido1,
    p.apellido2
FROM persona p
    JOIN alumno_se_matricula_asignatura ce ON p.id = ce.id_alumno
    JOIN curso_escolar c ON ce.id_curso_escolar = c.id
WHERE c.anyo_inicio = 2018
    AND c.anyo_fin = 2019;