use chinook;

-- 1. Obtener todas las líneas de factura

SELECT * 
FROM invoice;

-- 2. Contar cuántas líneas de factura existen

SELECT 
	COUNT(*) AS TotalFacturas
FROM Invoice;


-- 3. Sumar todas las cantidades vendidas

SELECT 
	SUM(Quantity) AS TotalVentas 
FROM InvoiceLine;

-- 4. Obtener el precio unitario promedio

SELECT 
	AVG (UnitPrice) AS PrecioUnitario_promedio
FROM Track;


-- 5. Buscar líneas de factura con más de 5 unidades vendidas (No existen en esta BBDD)

SELECT *
FROM  InvoiceLine
WHERE Quantity > 5;


-- 6. Obtener el valor total de cada línea de factura (Quantity * UnitPrice)

SELECT 
	InvoiceLineID, 
    Quantity*UnitPrice 
FROM InvoiceLine;


-- 7. Obtener el precio más alto y más bajo de los productos en `InvoiceLine`

SELECT 
	MAX(UnitPrice) AS MaxPrice,
	MIN(UnitPrice) AS MinPrice 
FROM InvoiceLine;

-- 8. Listar las primeras 10 líneas de factura

SELECT *
FROM InvoiceLine 
ORDER BY InvoiceLineID ASC 
LIMIT 10;

-- 9. Listar las últimas 10 líneas de factura

SELECT *
FROM InvoiceLine 
ORDER BY InvoiceLineID DESC 
LIMIT 10;

-- 10. Obtener el número de facturas distintas en `InvoiceLine`

SELECT 
	COUNT(DISTINCT InvoiceId) AS Facturas_Distintas
FROM InvoiceLine;

-- 11. Obtener todas las facturas

SELECT * 
FROM Invoice;

-- 12. Obtener el total facturado en toda la base de datos

SELECT 
	SUM(Total) AS TotalFacturado 
FROM Invoice;

-- 13. Obtener el promedio de gasto por factura

SELECT 
	AVG(Total) AS Promedio_GastoFactura
FROM Invoice;

-- 14. Buscar facturas con un total mayor a 10

SELECT * 
FROM Invoice 
WHERE Total > 10
ORDER BY Total DESC;

-- 15. Contar cuántas facturas hay en la base de datos

SELECT 
	COUNT(InvoiceID)  AS Total_Facturas
FROM Invoice;

-- 16. Listar las facturas más altas

SELECT * 
FROM Invoice 
ORDER BY Total DESC
LIMIT 10;

-- 17. Listar las facturas más bajas

SELECT * 
FROM Invoice 
ORDER BY Total ASC
LIMIT 10;

-- 18. Obtener el total facturado por país

SELECT 
	BillingCountry, 
	SUM(Total) AS TotalFacturado_Pais 
FROM Invoice 
GROUP BY BillingCountry;

-- 19. Contar cuántas facturas hay por país

SELECT 
	BillingCountry, 
	COUNT(InvoiceID) AS Numero_FacturasPais
FROM Invoice 
GROUP BY BillingCountry;

-- 20. Obtener el total facturado en 2010

SELECT
	YEAR(InvoiceDate) AS Año,
	SUM(Total) AS Total_Facturado
FROM Invoice
WHERE YEAR (InvoiceDate) = 2010;

-- 21. Obtener todos los clientes

SELECT * 
FROM Customer;

-- 22. Contar cuántos clientes hay

SELECT 
	COUNT(CustomerID) AS Total_Clientes
FROM Customer;
    
-- 23. Obtener los nombres de los clientes en orden alfabético

SELECT 
	FirstName
FROM Customer
ORDER BY FirstName ASC;

-- 24. Buscar clientes cuyo nombre empiece con 'A'

SELECT 
	FirstName
FROM Customer
WHERE FirstName like 'A%';

-- 25. Contar cuántos clientes hay por país

SELECT 
	Country, 
	COUNT(*) AS TotalClientes 
FROM Customer 
GROUP BY Country 
ORDER BY TotalClientes DESC;

-- 26. Obtener el país con más clientes

SELECT 
	Country, 
	COUNT(*) AS MaxClientes 
FROM Customer 
GROUP BY Country 
ORDER BY MaxClientes DESC 
LIMIT 1;

-- 27. Mostrar los emails de clientes con cuentas en Gmail

SELECT 
	FirstName,
    LastName,
	Email
FROM Customer
WHERE Email like '%gmail%';

-- 28. Obtener la dirección de un cliente específico (cambia el nombre)

SELECT 
	Address,
    FirstName,
    LastName
FROM Customer 
WHERE FirstName = 'Tim' AND LastName = 'Goyer';

-- 29. Listar los 5 últimos clientes registrados

SELECT *
FROM Customer
ORDER BY CustomerID DESC
LIMIT 5;

-- 30. Ver los clientes de Canadá

SELECT *
FROM Customer
WHERE Country = 'Canada';