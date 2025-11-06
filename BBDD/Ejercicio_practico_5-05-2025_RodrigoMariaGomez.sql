-- 1.  Clientes con todos sus pedidos y detalles
-- Muestra todos los clientes, sus pedidos y los detalles de cada pedido.

SELECT 
	c.nombre AS nombre_cliente,
    p.id AS id_pedido,
	p.fecha_pedido,
    dtp.producto_id, 
	dtp.cantidad, 
	dtp.precio_unitario
FROM clientes AS c
LEFT JOIN pedidos AS p 
ON c.id = p.cliente_id
LEFT JOIN detalles_pedido AS dtp 
ON p.id = dtp.pedido_id;


-- 2.  Productos que nunca han sido pedidos
-- Lista los productos que no aparecen en ningún pedido.

SELECT 
	pr.nombre AS nombre_producto,
	ped.id
FROM productos AS pr
LEFT JOIN detalles_pedido AS dtp 
ON pr.id = dtp.producto_id
LEFT JOIN pedidos AS ped
ON dtp.producto_id = ped.id
WHERE dtp.producto_id IS NULL;


-- 3.  Top de clientes que más gastan
-- Muestra el top 5 de clientes que más han gastado.

SELECT 
    c.id,
    c.nombre,
    SUM(dtp.cantidad * dtp.precio_unitario) AS total_gastado
FROM clientes AS c
INNER JOIN pedidos AS p 
	ON c.id = p.cliente_id
INNER JOIN detalles_pedido AS dtp 
	ON p.id = dtp.pedido_id
GROUP BY c.id, c.nombre
ORDER BY total_gastado DESC
LIMIT 5;


-- 4.  Total de ventas por categoría de producto
-- Calcula el total de ventas por cada categoría de producto.

SELECT
    cat.nombre AS categoria,
    SUM(dtp.cantidad * dtp.precio_unitario) AS TotalVentas
FROM categorias AS cat
INNER JOIN productos_categoria AS pc 
	ON cat.id = pc.categoria_id
INNER JOIN productos AS prod 
	ON pc.producto_id = prod.id
INNER JOIN detalles_pedido AS dtp 
	ON prod.id = dtp.producto_id
GROUP BY cat.nombre
ORDER BY TotalVentas DESC;


-- 5.  Clientes que han realizado más de 2 pedidos
-- Lista los clientes que han realizado más de 2 pedidos.

SELECT
    c.nombre AS Nombre,
    c.apellido AS Apellido,
    COUNT(p.id) AS NumeroPedidos
FROM clientes AS c
INNER JOIN pedidos AS p 
	ON c.id = p.cliente_id
GROUP BY c.nombre, c.apellido
HAVING COUNT(p.id) > 2;


-- 6.  Clientes que gastaron más de X€ en un solo pedido
-- Encuentra a los clientes que gastaron más de 1000€ en un solo pedido.

SELECT
    c.id AS ID_cliente,
    c.nombre AS Nombre,
    c.apellido AS Apellido,
	p.id AS ID_pedido,
    f.total AS TotalFactura
FROM clientes AS c
INNER JOIN pedidos AS p 
	ON c.id = p.cliente_id
INNER JOIN facturas AS f 
	ON p.id = f.pedido_id
WHERE (f.total) > 1000




-- 7.  Productos en pedidos con estado 'Enviado'
-- Muestra los productos que se han incluido en pedidos que ya han sido enviados.

SELECT 
	p.nombre AS Nombre_Producto,
	pd.estado AS estado_Pedido
FROM productos AS p
INNER JOIN detalles_pedido AS dtp
	ON p.id = dtp.producto_id
INNER JOIN pedidos AS pd
	ON dtp.pedido_id = pd.id
WHERE pd.estado like '%Enviado%'



-- 8. Pedidos con descuentos
-- Muestra los pedidos, incluyendo si tienen algún descuento aplicado, y el código del descuento.

SELECT 
	p.id AS Pedido_ID,
	d.codigo AS Cod_DESC,
	d.porcentaje AS Descuento
FROM pedidos AS p
INNER JOIN pedidos_descuento AS pd
	ON p.id = pd.pedido_id
	INNER JOIN descuentos AS d
		ON pd.descuento_id = d.id;




-- 9. Productos más caros por categoría
-- Muestra el producto más caro de cada categoría.

SELECT
    c.nombre AS Categoría,
    p1.nombre AS ProductoNombre,
    p1.precio AS Precio
FROM categorias AS c
JOIN productos_categoria AS pc1 
	ON c.id = pc1.categoria_id
JOIN productos AS p1 
	ON pc1.producto_id = p1.id
WHERE p1.precio = (
        SELECT MAX(p2.precio)
        FROM productos AS p2
        JOIN productos_categoria AS pc2 
			ON p2.id = pc2.producto_id
        WHERE pc2.categoria_id = c.id
    );



-- 10. Ventas mensuales del año actual
-- Muestra las ventas de cada mes dentro del año actual.


















