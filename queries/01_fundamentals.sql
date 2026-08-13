--- BLOQUE 1:

-- Comprobacion de la tabla actor
SELECT *
FROM actor
LIMIT 10;

-- Seleccionar nombre y apellido
SELECT first_name, last_name
FROM actor;

-- Seleccionar actor_id, nombre y apellido de todos los actores
SELECT actor_id, first_name, last_name
FROM actor;

-- Seleccionar todas las columnas de la tabla fila, solo de las 10 primeras
SELECT *
FROM film
LIMIT 10;


--- BLOQUE 2:

-- Seleccionar todos los actores cuyo nombre sea Penelope
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Penelope';

-- Seleccionar todos los actores cuyo apellido sea Allen 
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Allen';

-- Seleccionar todas las peliciculas con un periodo de alquiler superior a 5 dias (y la duracion de cada una)
SELECT title, rental_duration
FROM film
WHERE rental_duration > 5;





-- Seleccionar las peliculas cuyo idioma sea el ingles
SELECT a.title
FROM film a
LEFT JOIN language b
ON a.language_id = b.language_id
WHERE b.name = 'English';