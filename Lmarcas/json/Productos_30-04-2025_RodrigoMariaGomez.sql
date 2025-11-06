-- PRODUCTOS: id, producto, caracteristicas  

CREATE TABLE productos (
	id SERIAL PRIMARY KEY,
	producto VARCHAR(50) NOT NULL,
	características jsonb NULL
);


INSERT INTO productos (producto, características)
VALUES
  ('cascos diadema', '{
    "color":"azul",
    "marca":"Sony",
    "Material": "plastico"
  }'),
  ('calculadora', '{
    "color":"gris",
    "marca":"Casio",
    "Material": "plastico"
  }'),
  ('hard-disk', '{
    "color":"negro",
    "marca":"Seagate",
    "Material": "carbono"
  }');




--SELECT QUE MUESTRA LOS PRODUCTOS CON SU COLOR 
SELECT 
	  producto
	, características ->> 'color' AS color
FROM productos
;




--SELECT + WHERE que muestra los productos de la marca Sony 
SELECT *
FROM productos
WHERE características ->> 'marca' = 'Sony'
;



--Update donde en los registros con material 'plástico' añadir una clave jsonb_set llamada 'sensible' con valor true

UPDATE productos
SET características = jsonb_set(características, '{sensible}', 'true')
WHERE características ->> 'Material' = 'plastico'





