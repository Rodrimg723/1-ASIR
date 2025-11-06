/*********************/
/** Parte 1: Vistas **/
/*********************/

-- Vista 1
-- vista_detalle_cliente_activo
-- Mostrar una lista detallada de todos los clientes activos, incluyendo su nombre completo, correo electrónico, dirección completa (calle, ciudad, país) y fecha de creación.



CREATE OR REPLACE VIEW vista_detalle_cliente_activo AS
	SELECT 
   		c.customer_id,
    	c.first_name || ' ' || c.last_name AS nombre_completo,
    	c.email AS correo_electronico,
    	a.address || ', ' || ci.city || ', ' || co.country AS direccion_completa,
    	c.create_date
	FROM customer AS c
		INNER JOIN address AS a 
			ON c.address_id = a.address_id
		INNER JOIN city AS ci 
			ON a.city_id = ci.city_id
		INNER JOIN country AS co 
			ON ci.country_id = co.country_id
	WHERE c.activebool = TRUE;

-- SELECT * FROM vista_detalle_cliente_activo


		


-- Vista 2
-- vista_peliculas_por_categoria_idioma
-- Mostrar las películas agrupadas por categoría e idioma, contando cuántas películas hay en cada combinación.





CREATE OR REPLACE VIEW vista_peliculas_por_categoria_idioma AS
	SELECT 
    	cat.name AS categoria,
    	l.name AS idioma,
    	COUNT(*) AS cantidad_peliculas
	FROM film f
		INNER JOIN film_category AS fc 
			ON f.film_id = fc.film_id
		INNER JOIN category AS cat 
			ON fc.category_id = cat.category_id
		INNER JOIN language AS l 
			ON f.language_id = l.language_id
	GROUP BY cat.name, l.name;

-- SELECT * FROM vista_peliculas_por_categoria_idioma		

-- SELECT * FROM language

-- SELECT language_id FROM film





/************************/
/** Parte 2: Funciones **/
/************************/

-- Función 1
-- fn_obtener_total_alquileres_cliente
-- Devolver el número total de alquileres realizados por un cliente específico.





CREATE OR REPLACE FUNCTION fn_obtener_total_alquileres_cliente(id_customer INT)
RETURNS INT AS $$
DECLARE
    total_rental INT;
BEGIN
    SELECT COUNT(*) INTO total_rental
    FROM rental
    WHERE customer_id = id_customer;
    RETURN total_rental;
END;
$$ LANGUAGE plpgsql;

-- SELECT * FROM fn_obtener_total_alquileres_cliente(2)





-- Función 2
-- fn_buscar_peliculas_por_actor
-- Devolver una tabla con los títulos de las películas en las que ha participado un actor, dado su nombre y apellido.



CREATE OR REPLACE FUNCTION fn_buscar_peliculas_por_actor(nombre VARCHAR, apellido VARCHAR)
RETURNS TABLE(titulo VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT 
		f.title
    FROM film AS f
    	INNER JOIN film_actor AS fa 
			ON f.film_id = fa.film_id
    	INNER JOIN actor AS a 
			ON fa.actor_id = a.actor_id
    WHERE a.first_name = nombre AND a.last_name = apellido;
END;
$$ LANGUAGE plpgsql;


-- SELECT * FROM fn_buscar_peliculas_por_actor('NICK', 'WAHLBERG')


-- SELECT
-- 	first_name,
-- 	last_name
-- FROM actor





/*****************************/
/** Parte 3: Procedimientos **/
/*****************************/

-- Procedimiento 1
-- p_procesar_devolucion_pelicula
-- Actualizar la fecha de devolución de una película alquilada en la tabla rental.
-- Entrada: id_alquiler, fecha_devolución






CREATE OR REPLACE PROCEDURE p_procesar_devolucion_pelicula(id_rental INT, fecha_devolucion TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE rental
    SET return_date = fecha_devolucion
    WHERE rental_id = id_rental;
END;
$$;


-- CALL p_procesar_devolucion_pelicula (1, 'NOW')

-- SELECT 
-- 	rental_id,
-- 	return_date
-- FROM rental
-- WHERE rental_id = 1
		






-- Procedimiento 2
-- sp_agregar_nuevo_actor
-- Insertar un nuevo actor en la tabla actor.
-- Entrada: Nombre y apellido







CREATE OR REPLACE PROCEDURE p_agregar_nuevo_actor(nombre VARCHAR, apellido VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO actor (first_name, last_name, last_update)
    VALUES (nombre, apellido, CURRENT_TIMESTAMP);
END;
$$;




-- CALL p_agregar_nuevo_actor('JOHNNY', 'DEPP')

-- SELECT *
-- FROM actor
-- WHERE first_name = 'JOHNNY' AND last_name = 'DEPP'








/***************************/
/** Parte 4: Disparadores **/
/***************************/

-- Disparador 1
-- trg_auditar_actualizacion_pelicula
-- Registrar en una tabla de auditoría (log_actualizacion_pelicula) cada vez que se actualice el título o el coste de reemplazo de una película.





DROP TABLE IF EXISTS log_actualizacion_pelicula
CREATE TABLE IF NOT EXISTS log_actualizacion_pelicula (
    film_id INT,
    old_title TEXT,
    new_title TEXT,
    old_replacement_cost NUMERIC,
    new_replacement_cost NUMERIC,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_auditar_actualizacion_pelicula()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.title <> OLD.title OR NEW.replacement_cost <> OLD.replacement_cost THEN
        INSERT INTO log_actualizacion_pelicula (film_id, old_title, new_title, old_replacement_cost, new_replacement_cost)
        VALUES (OLD.film_id, OLD.title, NEW.title, OLD.replacement_cost, NEW.replacement_cost);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_auditar_actualizacion_pelicula ON film;
CREATE TRIGGER trg_auditar_actualizacion_pelicula
BEFORE UPDATE ON film
FOR EACH ROW
EXECUTE FUNCTION fn_auditar_actualizacion_pelicula();



SELECT * FROM log_actualizacion_pelicula


UPDATE film
SET title = 'Peppa Pig'
WHERE film_id = 1;





-- Disparador 2
-- trg_actualizar_ultima_modificacion_cliente
--  Actualizar automáticamente el campo last_update de un cliente a la fecha y hora actual cada vez que se inserte un nuevo alquiler (rental) para ese cliente. Esto sirve como un indicador de la "última actividad" del cliente relacionada con alquileres.





CREATE OR REPLACE FUNCTION fn_actualizar_ultima_modificacion_cliente()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE customer
    SET last_update = CURRENT_TIMESTAMP
    WHERE customer_id = NEW.customer_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS trg_actualizar_ultima_modificacion_cliente ON rental;
CREATE TRIGGER trg_actualizar_ultima_modificacion_cliente
AFTER INSERT ON rental
FOR EACH ROW
EXECUTE FUNCTION fn_actualizar_ultima_modificacion_cliente();


SELECT customer_id, last_update 
FROM customer WHERE customer_id = 2;


INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES (CURRENT_TIMESTAMP, 1, 2, 2);





















