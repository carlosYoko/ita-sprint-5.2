USE universidad;
-- 1. Devuelve el número total de alumnos.
SELECT COUNT(*) AS total_alumnos
FROM persona
WHERE tipo = 'alumno';
-- 2. Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(*) AS alumnos_1999
FROM persona
WHERE tipo = 'alumno'
    AND YEAR(fecha_nacimiento) = 1999;
-- 3. Calcula cuántos profesores hay en cada departamento. 
--    El resultado debe mostrar dos columnas: el nombre del departamento y el número de profesores en ese departamento. 
--    Solo incluirá los departamentos con profesores y estará ordenado de mayor a menor por el número de profesores.
SELECT departamento.nombre AS nombre_departamento,
    COUNT(profesor.id_profesor) AS cantidad_profesores
FROM departamento
    LEFT JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre
HAVING COUNT(profesor.id_profesor) > 0
ORDER BY cantidad_profesores DESC;
-- 4. Devuelve un listado con todos los departamentos y el número de profesores en cada uno de ellos. 
--    Ten en cuenta que puede haber departamentos sin profesores asociados. 
--    Estos departamentos también deben aparecer en el listado.
SELECT d.nombre AS nombre_departamento,
    COUNT(p.id_profesor) AS cantidad_profesores
FROM departamento d
    LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY cantidad_profesores DESC;
-- 5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
--    Ten en cuenta que puede haber grados sin asignaturas asociadas. 
--    Estos grados también deben aparecer en el listado.
SELECT grado.nombre AS nombre_grado,
    COUNT(asignatura.id) AS cantidad_asignaturas
FROM grado
    LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
ORDER BY cantidad_asignaturas DESC;
-- 6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, 
--    solo de los grados que tienen más de 40 asignaturas asociadas.
SELECT grado.nombre AS nombre_grado,
    COUNT(asignatura.id) AS cantidad_asignaturas
FROM grado
    LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
HAVING COUNT(asignatura.id) > 40
ORDER BY cantidad_asignaturas DESC;
-- 7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos para cada tipo de asignatura. 
--    El resultado tendrá tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas de ese tipo.
SELECT grado.nombre AS nombre_grado,
    asignatura.tipo,
    SUM(asignatura.creditos) AS suma_creditos
FROM grado
    LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre,
    asignatura.tipo;
-- 8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
--    El resultado mostrará dos columnas: una con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT ce.anyo_inicio,
    COUNT(DISTINCT mat.id_alumno) AS alumnos_matriculados
FROM curso_escolar ce
    LEFT JOIN alumno_se_matricula_asignatura mat ON ce.id = mat.id_curso_escolar
GROUP BY ce.anyo_inicio;
-- 9. Devuelve un listado con el número de asignaturas que imparte cada profesor/a. 
--    El listado tendrá en cuenta aquellos profesores/as que no imparten ninguna asignatura. 
--    El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. 
--    El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT persona.id AS id,
    persona.nombre AS nombre,
    persona.apellido1 AS primer_apellido,
    persona.apellido2 AS segundo_apellido,
    COUNT(asignatura.id) AS numero_asignaturas
FROM persona
    LEFT JOIN profesor ON persona.id = profesor.id_profesor
    LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
GROUP BY persona.id,
    persona.nombre,
    persona.apellido1,
    persona.apellido2
ORDER BY numero_asignaturas DESC;
-- 10. Devuelve todos los datos del alumno/a más joven.
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;
-- 11. Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT persona.id,
    persona.nombre AS nombre,
    persona.apellido1 AS primer_apellido,
    persona.apellido2 AS segundo_apellido,
    asignatura.nombre AS nombre_asignatura
FROM persona
    JOIN profesor ON persona.id = profesor.id_profesor
    LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
WHERE profesor.id_departamento IS NOT NULL
    AND asignatura.id_profesor IS NULL;