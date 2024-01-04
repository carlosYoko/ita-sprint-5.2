USE tienda;
-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre
FROM producto;
-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre,
    precio
FROM producto;
-- 3. Lista todas las columnas de la tabla producto.
SELECT *
FROM producto;
-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre,
    precio * 0.85,
    precio
FROM producto;
-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
--    Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS nombre_producto,
    precio * 0.85 AS euros,
    precio AS dólares
FROM producto;
-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) AS nombre,
    precio
FROM producto;
-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) AS nombre,
    precio
FROM producto;
-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtén en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre,
    UPPER(SUBSTRING(nombre, 1, 2)) AS dos_primeros_caracteres
FROM fabricante;
-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre,
    ROUND(precio) AS precio
FROM producto;
-- 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre,
    CAST(precio AS SIGNED) AS precio
FROM producto;
-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT DISTINCT fabricante.codigo AS fabricantes_con_productos
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT fabricante.codigo AS fabricantes_con_productos
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.codigo;
-- 13. Lista los nombres de los fabricantes ordenados de manera ascendente.
SELECT nombre
FROM fabricante
ORDER BY nombre ASC;
-- 14. Lista los nombres de los fabricantes ordenados de manera descendente.
SELECT nombre
FROM fabricante
ORDER BY nombre DESC;
-- 15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de manera ascendente y, en segundo lugar, por el precio de manera descendente.
SELECT nombre,
    precio
FROM producto
ORDER BY nombre ASC,
    precio DESC;
-- 16. Retorna una lista con las 5 primeras filas de la tabla fabricante.
SELECT *
FROM fabricante
LIMIT 5;
-- 17. Retorna una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT *
FROM fabricante
LIMIT 3, 2;
-- 18. Lista el nombre y el precio del producto más barato. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(preu), necesitaría GROUP BY.
SELECT nombre,
    precio
FROM producto
ORDER BY precio
LIMIT 1;
-- 19. Lista el nombre y el precio del producto más caro. (Utiliza solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MAX(preu), necesitaría GROUP BY.
SELECT nombre,
    precio
FROM producto
ORDER BY precio DESC
LIMIT 1;
-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT producto.nombre
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 2;
-- 21. Devuelve una lista con el nombre del producto, precio y nombre del fabricante de todos los productos de la base de datos.
SELECT producto.nombre,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- 22. Devuelve una lista con el nombre del producto, precio y nombre del fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, en orden alfabético.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY nombre_fabricante ASC;
-- 23. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo AS codigo_producto,
    producto.nombre AS nombre_producto,
    fabricante.codigo AS codigo_fabricante,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
-- 24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio
LIMIT 1;
-- 25. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;
-- 26. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 2;
-- 27. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200 €.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 6
    AND producto.precio > 200;
-- 28. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 1
    OR fabricante.codigo = 3
    OR fabricante.codigo = 5;
-- 29. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Utilizando el operador IN.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo IN (1, 3, 5);
-- 30. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyos nombres terminen por la vocal e.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE RIGHT(fabricante.nombre, 1) = 'e';
-- 31. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%w%';
-- 32. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT producto.nombre AS nombre_producto,
    producto.precio,
    fabricante.nombre AS nombre_fabricante
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180
ORDER BY producto.precio DESC,
    producto.nombre ASC;
-- 33. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT fabricante.codigo AS codigo_fabricante,
    fabricante.nombre AS nombre_fabricante
FROM fabricante
    JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo;
-- 34. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT fabricante.codigo,
    fabricante.nombre,
    producto.nombre AS nom_producte,
    producto.precio
FROM fabricante
    LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
-- 35. Devuelve un listado donde solo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT fabricante.codigo,
    fabricante.nombre
FROM fabricante
    LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.codigo_fabricante IS NULL;
-- 36. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT producto.nombre,
    producto.precio
FROM producto,
    fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
    AND fabricante.codigo = 2;
-- 37. Devuelve todos las datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT producto.*
FROM producto,
    fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
    AND producto.precio = (
        SELECT MAX(precio)
        FROM producto
        WHERE codigo_fabricante = (
                SELECT codigo
                FROM fabricante
                WHERE codigo = 2
            )
    );
-- 38. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT producto.nombre
FROM producto,
    fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
    AND fabricante.codigo = 2
ORDER BY producto.precio DESC
LIMIT 1;
-- 39. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT producto.nombre
FROM producto
    JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.codigo = 3
ORDER BY producto.precio ASC
LIMIT 1;
-- 40. Devuelve todos los productos con precio mayor o igual al más caro del fabricante Lenovo.
SELECT nombre AS nombre_producto,
    precio
FROM producto
WHERE precio >= (
        SELECT MAX(precio)
        FROM producto
        WHERE codigo_fabricante = 2
    );
-- 41. Lista productos del fabricante Asus con precio superior al promedio de sus productos.
SELECT nombre,
    precio
FROM producto
WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE codigo = 1
    )
    AND precio > (
        SELECT AVG(precio)
        FROM producto
        WHERE codigo_fabricante = 1
    );