--Cuales son los 10 colores mas utilizados en los 90?
SELECT c."name" AS color, sum(ip.quantity) AS cantidad
FROM lego."sets" s INNER JOIN lego.inventories i ON s.set_num = i.set_num INNER JOIN lego.inventory_parts ip ON i.id = ip.inventory_id INNER JOIN lego.colors c ON ip.color_id = c.id
WHERE s."year" >=1990 AND s."year"<2000
GROUP BY c."name" 
ORDER BY cantidad DESC 
LIMIT 10


-- Cuantos colores tenemos que son unicos?
SELECT count(distinct(c.rgb)) as unicos
FROM lego.colors c


--Como es la tendencia en cantidad de piezas por sets a traves de los anios?
SELECT s."year", avg(num_parts) AS piezas_promedio
FROM lego."sets" s
GROUP BY s."year" 
ORDER BY s."year" ASC  


-- Cuales son las tematicas mas populares de los 2000?
SELECT t."name", count(theme_id) as cantidad
FROM lego."sets" s INNER JOIN lego.themes t on s.theme_id = t.id 
WHERE s."year">=2000 AND s."year"<2010
GROUP BY t."name"
ORDER BY cantidad DESC