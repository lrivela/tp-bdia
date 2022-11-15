/*
 * SETS
 * This file contains information on LEGO sets, including a unique ID number, the name of the set, the year it was released, its theme and how many parts it includes.
 * 
 * PART CATEGORIES
 * This dataset includes information on the part category (what type of part it is) and a unique ID for that part category.
 * 
 * PARTS
 * This dataset includes information on lego parts, including a unique ID number, the name of the part, and what part category it's from.
 * 
 * 
 * 
 */



--Cuales son los 10 colores mas utilizados en los 90?
SELECT *
FROM lego.inventory_parts ip INNER JOIN lego.inventories i ON ip.inventory_id=i.id INNER JOIN lego."sets" s ON i.set_num = s.set_num 
WHERE s."year">=1990 AND s."year"<2000

-- Cuantos colores tenemos que son unicos?
SELECT count(distinct(c.rgb)) as unicos
FROM lego.colors c

--Como es la tendencia en cantidad de piezas por sets a traves de los anios?


-- Cuales son las tematicas mas populares de los 2000?
SELECT t."name", count(theme_id) as cantidad
FROM lego."sets" s INNER JOIN lego.themes t on s.theme_id = t.id 
WHERE s."year">=2000 AND s."year"<2010
GROUP BY t."name"
ORDER BY cantidad DESC