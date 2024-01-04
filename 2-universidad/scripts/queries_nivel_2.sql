USE universidad;
-- 1. Devuelve un listado con los nombres de todos los profesores/as y los departamentos a los que están vinculados. El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado. Debe devolver cuatro columnas: nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT departamento.nombre AS nombre_departamento,
    persona.apellido1,
    persona.apellido2,
    persona.nombre
FROM persona
    LEFT JOIN profesor ON persona.id = profesor.id_profesor
    LEFT JOIN departamento ON profesor.id_departamento = departamento.id
ORDER BY departamento.nombre ASC,
    persona.apellido1 ASC,
    persona.apellido2 ASC,
    persona.nombre ASC;
-- 2. Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT departamento.nombre AS nombre_departamento,
    persona.apellido1,
    persona.apellido2,
    persona.nombre
FROM persona
    LEFT JOIN profesor ON persona.id = profesor.id_profesor
    LEFT JOIN departamento ON profesor.id_departamento = departamento.id
WHERE profesor.id_profesor IS NULL;
-- 3. Devuelve un listado con los departamentos que no tienen profesores/as asociados.
SELECT departamento.nombre
FROM departamento
    LEFT JOIN profesor ON departamento.id = profesor.id_departamento
WHERE profesor.id_departamento IS NULL;
-- 4. Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT persona.apellido1,
    persona.apellido2,
    persona.nombre,
    asignatura.nombre AS nombre_asignatura
FROM persona
    LEFT JOIN profesor ON persona.id = profesor.id_profesor
    LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL;
-- 5. Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT asignatura.nombre,
    persona.nombre AS nombre_profesor
FROM asignatura
    LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor
    LEFT JOIN persona ON profesor.id_profesor = persona.id
WHERE profesor.id_profesor IS NULL;
-- 6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT DISTINCT departamento.id,
    departamento.nombre
FROM departamento
    LEFT JOIN profesor ON departamento.id = profesor.id_departamento
    LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
    LEFT JOIN curso_escolar ce ON asignatura.id = ce.id
WHERE asignatura.id IS NULL;