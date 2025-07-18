Encuentra el cliente que ha realizado la mayor cantidad de alquileres en los últimos 6 meses.

SELECT cl.id_cliente AS CLIENTES, cl.nombre AS NOMBRE_CLIENTE, al.id_alquiler AS alquileres, cl.fecha_alquiler AS fecha
FROM cliente cl
JOIN alquiler al ON cl.id_cliente = al.id_cliente
WHERE al.fecha_alquiler > DATETIME(6 MOUTH)
GROUP BY cl.id_cliente, cl.fecha_alquiler
LIMIT 30 DESC


Lista las cinco películas más alquiladas durante el último año.

SELECT pe.nombre, pe.id_pelicula, inv.id_inventario, al.fecha_alquiler
FROM pelicula pe
JOIN inventario inv ON pe.id_pelicula = inv.id_pelicula
JOIN alquiler al ON inv.id_inventario = al.id_inventario
WHERE al.fecha_alquiler >< DATETIME(1 YEAR)
GROUP BY pe.nombre, al.fecha_alquiler 
LIMIT 10 DESC 
