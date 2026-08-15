----- BLOQUE 1 - SELECT:

-- Comprobacion de la tabla actor
SELECT *
FROM actor
LIMIT 10;

-- Mostrar nombre y apellido de los actores
SELECT
    first_name, 
    last_name
FROM actor;

-- Mostrar actor_id, nombre y apellido de todos los actores
SELECT
    actor_id, 
    first_name, 
    last_name
FROM actor;

-- Mostrar todas las columnas de la tabla film, solo de las 10 primeras
SELECT *
FROM film
LIMIT 10;


----- BLOQUE 2 - WHERE:

-- Buscar todos los actores cuyo nombre sea Penelope
SELECT
    first_name, 
    last_name
FROM actor
WHERE first_name = 'Penelope';

-- Buscar todos los actores cuyo apellido sea Allen 
SELECT
    first_name, 
    last_name
FROM actor
WHERE last_name = 'Allen';

-- Buscar todas las peliciculas con un periodo de alquiler superior a 5 dias (y la duracion de alquiler de cada una)
SELECT
    title, 
    rental_duration
FROM film
WHERE rental_duration > 5;

-- Buscar todas las películas cuya duración sea superior a 180 (minutos)
SELECT title
FROM film
WHERE length > 180;


----- BLOQUE 3 - ORDER BY:

-- Mostrar todas las películas ordenadas de menor a mayor duración
SELECT title
FROM film
ORDER BY length;

-- Mostrar todas las películas ordenadas de mayor a menor duración
SELECT title
FROM film
ORDER BY length DESC;

-- Mostrar los actores ordenados alfabéticamente por apellido
SELECT
    first_name, 
    last_name
FROM actor
ORDER BY last_name;

-- Mostrar las películas ordenadas alfabéticamente por título
SELECT title
FROM film
ORDER BY title;


----- BLOQUE 4 - LIMIT:

-- Obtener las 10 películas más cortas
SELECT title
FROM film
ORDER BY length
LIMIT 10;

-- Obtener las 10 películas más largas
SELECT title
FROM film
ORDER BY length DESC
LIMIT 10;

-- Obtener los primeros 20 actores ordenados alfabéticamente por apellido
SELECT
    first_name, 
    last_name
FROM actor
ORDER BY last_name
LIMIT 20;


----- BLOQUE 5 - DISTINCT:

-- Obtener todos los valores diferentes de rating que existen en las películas
SELECT DISTINCT rating
FROM film;

-- Obtener todos los valores diferentes de rental_duration
SELECT DISTINCT rental_duration
FROM film;

-- Obtener todos los valores diferentes de replacement_cost
SELECT DISTINCT replacement_cost
FROM film;

-- Obtener las 5 películas más largas que tienen un rating PG-13
SELECT title
FROM film
WHERE rating = 'PG-13'
ORDER BY length DESC
LIMIT 5;


----- BLOQUE 6 - FUNCIONES DE AGREGACIÓN Y GROUP BY:

--- A. Funciones de agregación básicas
-- Averiguar cuántas películas hay en total en la tabla film
SELECT COUNT(*)
FROM film;

-- Averiguar cuál es la duración mínima de una película
SELECT MIN(length)
FROM film;

-- Averiguar cuál es la duración máxima de una película
SELECT MAX(length)
FROM film;

-- Calcular la duración media de todas las películas
SELECT AVG(length)
FROM film;

-- Averiguar cuál es el coste de sustitución (replacement_cost) más bajo
SELECT MIN(replacement_cost)
FROM film;

-- Averiguar cuál es el coste de sustitución más alto
SELECT MAX(replacement_cost)
FROM film;

-- Calcular el coste de sustitución medio de todas las películas
SELECT AVG(replacement_cost)
FROM film;


--- B. GROUP BY
-- Averiguar cuántas películas hay de cada rating
SELECT
    rating, 
    COUNT(*) AS total_films
FROM film
GROUP BY rating;

-- Averiguar cuántas películas hay para cada duración de alquiler
SELECT
    rental_duration, 
    COUNT(*) AS total_films
FROM film
GROUP BY rental_duration;

-- Calcular la duración media de las películas para cada rating
SELECT
    rating, 
    AVG(length) AS average_length
FROM film
GROUP BY rating;

-- Calcular el coste medio de sustitución para cada rating
SELECT
    rating, 
    AVG(replacement_cost) AS avg_replacement_cost
FROM film
GROUP BY rating;

-- Averiguar la duración mínima y máxima de las películas para cada rating
SELECT
    rating, 
    MAX(length) AS max_length, 
    MIN(length) AS min_length
FROM film
GROUP BY rating;

-- Averiguar cuántas películas hay para cada coste de sustitución, ordenados de menor a mayor coste
SELECT
    replacement_cost, 
    COUNT(*) AS total_films
FROM film
GROUP BY replacement_cost
ORDER BY replacement_cost;


--- C. ORDER BY + agregaciones
-- Mostrar los rating ordenados de mayor a menor número de películas
SELECT
    rating, 
    COUNT(*) AS total_films
FROM film
GROUP BY rating
ORDER BY total_films DESC;

-- Mostrar los rating ordenados de mayor a menor duración media
SELECT
    rating, 
    AVG(length) AS average_length
FROM film
GROUP BY rating
ORDER BY average_length DESC;

-- Mostrar los rating ordenados de menor a mayor coste medio de sustitución
SELECT
    rating, 
    AVG(replacement_cost) AS avg_replacement_cost
FROM film
GROUP BY rating
ORDER BY avg_replacement_cost;

-- Identificar los 3 rating que tienen más películas
SELECT
    rating, 
    COUNT(*) AS total_films
FROM film
GROUP BY rating
ORDER BY total_films DESC
LIMIT 3;


--- D. HAVING
-- Mostrar únicamente los rating que tengan más de 200 películas
SELECT
    rating, 
    COUNT(*) AS total_films
FROM film
GROUP BY rating
HAVING COUNT(*) > 200;

-- Mostrar únicamente los rating cuya duración media sea superior a 115 minutos
SELECT
    rating, 
    AVG(length) AS average_length
FROM film
GROUP BY rating
HAVING AVG(length) > 115;


-- Mostrar únicamente los rating cuyo coste medio de sustitución sea superior a 20
SELECT
    rating, 
    AVG(replacement_cost) AS avg_replacement_cost
FROM film
GROUP BY rating
HAVING AVG(replacement_cost) > 20;

-- Mostrar los rental_duration que tengan más de 200 películas, ordenados de mayor a menor número de películas
SELECT
    rental_duration, 
    COUNT(*) AS total_films
FROM film
GROUP BY rental_duration
HAVING COUNT(*) > 200
ORDER BY total_films DESC;


--- 🧠 Retos finales
-- ¿Qué rating tiene más películas?
SELECT
    rating, 
    COUNT(*) AS total_films
FROM film
GROUP BY rating
ORDER BY total_films DESC
LIMIT 1;

-- ¿Qué rating tiene la mayor duración media?
SELECT
    rating, 
    AVG(length) AS average_length
FROM film
GROUP BY rating
ORDER BY average_length DESC
LIMIT 1;

-- ¿Qué rating tiene el mayor coste medio de sustitución?
SELECT
    rating, 
    AVG(replacement_cost) AS avg_replacement_cost
FROM film
GROUP BY rating
ORDER BY avg_replacement_cost DESC
LIMIT 1;

-- Identificar los 3 rating que tengan el mayor número de películas y mostrar también cuántas películas tiene cada uno
SELECT
    rating, 
    COUNT(*) AS total_films
FROM film
GROUP BY rating
ORDER BY total_films DESC
LIMIT 3;





-- Seleccionar las peliculas cuyo idioma sea el ingles
SELECT f.title
FROM film f
LEFT JOIN language l
ON f.language_id = l.language_id
WHERE l.name = 'English';