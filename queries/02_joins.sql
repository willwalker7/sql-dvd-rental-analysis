----- BLOQUE 1 — INNER JOIN básico

-- Mostrar el título de cada película junto con el nombre de su idioma
SELECT
    f.title,
    l.name
FROM film f
INNER JOIN language l
    ON f.language_id = l.language_id;

-- Mostrar el nombre y apellido de cada actor junto con las películas en las que participa
SELECT
    a.first_name, 
    a.last_name, 
    f.title
FROM actor a
INNER JOIN film_actor fa
    ON a.actor_id = fa.actor_id
INNER JOIN film f
    ON fa.film_id = f.film_id;

-- Mostrar el título de cada película junto con su categoría
SELECT
    f.title, 
    c.name
FROM film f
INNER JOIN film_category fc
    ON f.film_id = fc.film_id
INNER JOIN category c
    ON fc.category_id = c.category_id;

-- Mostrar el nombre de cada cliente junto con la ciudad en la que vive
SELECT
    c.first_name, 
    c.last_name, 
    ct.city
FROM customer c
INNER JOIN address a
    ON c.address_id = a.address_id
INNER JOIN city ct
    ON a.city_id = ct.city_id;

-- Mostrar el nombre y apellido de cada cliente junto con el país en el que vive
SELECT
    c.first_name, 
    c.last_name, 
    co.country
FROM customer c
INNER JOIN address a
    ON c.address_id = a.address_id
INNER JOIN city ct
    ON a.city_id = ct.city_id
INNER JOIN country co
    ON ct.country_id = co.country_id;


----- BLOQUE 2 — JOIN + WHERE

-- Mostrar las películas cuyo idioma sea English
SELECT f.title
FROM film f
INNER JOIN language l
	ON f.language_id = l.language_id
WHERE l.name = 'English';

-- Mostrar únicamente las películas pertenecientes a la categoría Action
SELECT f.title
FROM film f
INNER JOIN film_category fc
	ON f.film_id = fc.film_id
INNER JOIN category c
	ON fc.category_id = c.category_id
WHERE c.name = 'Action';

-- Mostrar los actores que participan en la película Academy Dinosaur
SELECT
	a.first_name, 
	a.last_name
FROM actor a
INNER JOIN film_actor fa
	ON a.actor_id = fa.actor_id
INNER JOIN film f
	ON fa.film_id = f.film_id
WHERE f.title = 'Academy Dinosaur';

-- Mostrar los clientes que viven en Spain
SELECT
	c.first_name,
	c.last_name
FROM customer c
INNER JOIN address a
	ON c.address_id = a.address_id
INNER JOIN city ct
	ON a.city_id = ct.city_id
INNER JOIN country co
	ON ct.country_id = co.country_id
WHERE co.country = 'Spain';

-- Mostrar las películas de la categoría Comedy que duren más de 120 minutos
SELECT f.title
FROM film f
INNER JOIN film_category fc
	ON f.film_id = fc.film_id
INNER JOIN category c
	ON fc.category_id = c.category_id
WHERE c.name = 'Comedy'
	AND f.length > 120;


----- BLOQUE 3 — Múltiples JOINs

-- Mostrar el nombre y apellido de cada actor y el título de todas las películas en las que participa
SELECT
	a.first_name, 
	a.last_name,
	f.title
FROM actor a
INNER JOIN film_actor fa
	ON a.actor_id = fa.actor_id
INNER JOIN film f
	ON fa.film_id = f.film_id;

-- Mostrar el nombre del cliente, la ciudad y el país donde vive
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	ct.city,
	co.country
FROM customer c
INNER JOIN address a
	ON c.address_id = a.address_id
INNER JOIN city ct
	ON a.city_id = ct.city_id
INNER JOIN country co
	ON ct.country_id = co.country_id;

-- Mostrar el título de cada película, su categoría y su idioma
SELECT
	f.title,
	c.name AS category,
	l.name AS language
FROM film f
INNER JOIN film_category fc
	ON f.film_id = fc.film_id
INNER JOIN category c
	ON fc.category_id = c.category_id
INNER JOIN language l
	ON f.language_id = l.language_id;

-- Mostrar el nombre del cliente, el título de la película que alquiló y la fecha del alquiler
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	f.title,
	r.rental_date
FROM customer c
INNER JOIN rental r
	ON c.customer_id = r.customer_id
INNER JOIN inventory i
	ON r.inventory_id = i.inventory_id
INNER JOIN film f
	ON i.film_id = f.film_id;

-- Mostrar el nombre del cliente, el título de la película alquilada y cuánto pagó por ella
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	f.title,
	p.amount
FROM customer c
INNER JOIN rental r
	ON c.customer_id = r.customer_id
INNER JOIN payment p
	ON r.rental_id = p.rental_id
INNER JOIN inventory i
	ON r.inventory_id = i.inventory_id
INNER JOIN film f
	ON i.film_id = f.film_id;


----- BLOQUE 4 — JOIN + ORDER BY + LIMIT

Ahora vamos a empezar a hacer consultas más parecidas a análisis.

-- Mostrar las 10 películas más largas junto con su categoría
-- Mostrar las 10 películas más caras de reemplazar junto con su categoría
-- Mostrar los 10 clientes que realizaron un alquiler más recientemente
-- Mostrar las 10 películas alquiladas más recientemente, indicando el cliente que las alquiló


----- BLOQUE 5 — JOIN + agregaciones

Aquí empieza una parte MUY importante para Data Analyst.

-- Averiguar cuántas películas hay en cada categoría
-- Averiguar cuántos actores participan en cada película
-- Averiguar cuántas películas ha alquilado cada cliente
-- Averiguar cuánto dinero ha pagado cada cliente en total
-- Averiguar cuánto dinero se ha generado por cada categoría de película
-- Averiguar cuántos alquileres se han realizado para cada categoría


----- BLOQUE 6 — ORDER BY + agregaciones + JOIN

Ahora quiero que conviertas esas métricas en rankings.

-- Mostrar las 10 categorías con mayor número de alquileres
-- Mostrar los 10 clientes que más dinero han gastado
-- Mostrar las 10 películas que más veces han sido alquiladas
-- Mostrar las 5 categorías que han generado más ingresos
-- Mostrar los 10 actores que participan en más películas


----- 🧠 RETOS FINALES

Estos ya no te voy a decir qué tablas necesitas. Tendrás que investigar la estructura y decidir cómo relacionarlas.

-- ¿Cuál es la película más alquilada de toda la base de datos?

Devuelve:

título
número de alquileres
-- ¿Qué cliente ha gastado más dinero?

Devuelve:

nombre
apellido
total gastado
-- ¿Qué categoría genera más ingresos?

Devuelve:

categoría
ingresos totales
-- ¿Qué actor aparece en más películas?

Devuelve:

nombre
apellido
número de películas
-- ¿Cuál es el país con más clientes?

Devuelve:

país
número de clientes
-- ¿Cuál es la categoría con mayor duración media de películas?

Devuelve:

categoría
duración media