use chinook;

-- 1) Empleados con su nombre, apellido y cargo

SELECT 
	FirstName,
	LastName,
	Title 
FROM Employee;


-- 2) Obtener los clientes que viven en un país específico

SELECT 
	FirstName, 
	LastName, 
	Country 
FROM Customer 
WHERE Country = 'Spain';



-- 3) Cantidad de clientes de cada País

SELECT Country, COUNT(*) AS TotalClientes 
FROM Customer 
GROUP BY Country 
ORDER BY TotalClientes DESC;


-- 4) Facturas de un cliente ESPECÍFICO

SELECT InvoiceID,
	CustomerID, 
    InvoiceDate, 
    Total 
FROM Invoice 
WHERE CustomerID = 3 ;

-- 5) Calculo de total de ventas usando la tabla de facturas

SELECT SUM(Total) AS TotalVentas 
FROM Invoice;


-- 6) Facturas ordenadas por fecha de más nueva a más antigua

SELECT InvoiceID, 
	CustomerID, 
    InvoiceDate, 
    Total 
FROM Invoice 
ORDER BY InvoiceDate DESC;


-- 7) Clientes con registro de compañía en sus datos

SELECT FirstName, LastName, Company
From Customer 
WHERE Company IS NOT NULL;


-- 8) Clientes sin registro de compañía en sus datos

SELECT FirstName, LastName
From Customer 
WHERE Company IS NULL;


-- 9) Facturas con cargo superior a 10$ organizadas de manera de descendente

SELECT InvoiceID, CustomerID, InvoiceDate, Total 
FROM Invoice 
WHERE Total > 10
ORDER BY Total DESC;


-- 10) País con más clientes registrados

SELECT Country, COUNT(*) AS TotalClientes 
FROM Customer 
GROUP BY Country 
ORDER BY TotalClientes DESC 
LIMIT 1;


-- 11) Fecha de contratación del empleado más longevo

SELECT FirstName, LastName, HireDate 
FROM Employee 
ORDER BY HireDate ASC 
LIMIT 1;


-- 12) Cantidad de empleados que hay por departamento ('title') 

SELECT Title, COUNT(*) AS CantidadEmpleados 
FROM Employee 
GROUP BY Title;


-- 13) Todos los géneros disponibles en la tienda

SELECT Name
FROM Genre;

-- 14) Las 5 canciones más largas de todo la tienda ( medido em minutos)

SELECT Name, Milliseconds/ 60000 AS Duracion_minutos
FROM Track
ORDER BY Milliseconds DESC
LIMIT 10;

-- 15) Las 5 canciones más cortas de todo la tienda ( medido em minutos)

SELECT Name, Milliseconds/ 60000 AS Duracion_minutos
FROM Track
ORDER BY Milliseconds ASC
LIMIT 10;


-- 16) Todos los artistas que se encuentran en la tienda

SELECT Name
FROM Artist;



-- 17) Solo los artistas que empiezan por la letra R 

SELECT Name
		FROM Artist  
		WHERE Name LIKE 'R%';

-- 18) listado que relaciona id's de track y playlist 

SELECT TrackID, PlaylistID
FROM PlaylistTrack

