-- 1. Listar todos los clientes. Hay que obtener los siguientes campos.

SELECT
	customerid,
	CONCAT(firstname,' ',lastname) AS Nombre
FROM customer 
	

-- 2. Mostrar los 10 álbumes más recientes ordenados por ArtistId.

SELECT 
	Title, 
	ArtistId
FROM Album
ORDER BY ArtistId DESC
LIMIT 10;


select 
	name,
	artistid
FROM artist

-- 3. Facturas con total superior a 10 dólares

SELECT 
	invoiceid,
	total
FROM Invoice 
WHERE Total > 10
ORDER BY Total DESC;


-- 4. Contar cuántos géneros hay en la base de datos

SELECT 
	COUNT(DISTINCT GenreId) AS TotalGeneros
FROM Genre;


-- 5. Clientes y sus facturas (incluye clientes sin compras)

SELECT 
	c.CustomerId, 
	c.FirstName, 
	c.LastName,
	i.InvoiceId
FROM Customer AS c
LEFT JOIN Invoice AS i 
ON c.CustomerId = i.CustomerId;


-- 6. Listar todas las playlists con sus canciones (incluye playlists vacías)

SELECT 
	p.PlaylistId, 
	p.Name, 
	t.TrackId, 
	t.Name AS canción
FROM Playlist AS p
LEFT JOIN PlaylistTrack pt 
ON p.PlaylistId = pt.PlaylistId
LEFT JOIN Track AS t 
ON pt.TrackId = t.TrackId;


-- 7. Facturas y sus clientes (muestra facturas sin cliente)

SELECT 
	i.InvoiceId, 
	c.CustomerId, 
	c.FirstName, 
	c.LastName
FROM Invoice AS i
LEFT JOIN Customer AS c 
ON i.CustomerId = c.CustomerId;


-- 8. Listar empleados y los clientes que atienden (muestra clientes sin empleados asignados)

SELECT 
	e.EmployeeId, 
	e.FirstName,
	e.LastName, 
	c.CustomerId, 
	c.FirstName AS FirstnameCliente,
	c.lastname AS LastnameCliente
FROM Employee AS e
LEFT JOIN Customer AS c 
ON e.EmployeeId = c.SupportRepId;


-- 9. Obtener todas las facturas con su cliente

SELECT 
	i.InvoiceId,
	i.InvoiceDate,
	i.Total, 
	c.FirstName,
	c.LastName
FROM Invoice AS i
INNER JOIN Customer AS c 
ON i.CustomerId = c.CustomerId;


-- 10. Listar todas las canciones con su género

SELECT 
	t.TrackId, 
	t.Name AS Canción, 
	g.Name AS NombreGenero
FROM Track AS t
INNER JOIN Genre AS g 
ON t.GenreId = g.GenreId;


-- 11. Canciones, álbumes y artistas (mostrando canciones sin álbum o artista)

SELECT 
	t.TrackId, 
	t.Name AS Canción,
	a.AlbumId, 
	a.Title AS NombreAlbum, 
	ar.ArtistId,
	ar.Name AS NombreArtista
FROM Track AS t
LEFT JOIN Album AS a 
ON t.AlbumId = a.AlbumId
LEFT JOIN Artist AS ar 
ON a.ArtistId = ar.ArtistId;


-- 12. Clientes, facturas y empleados (incluye clientes sin facturas)

SELECT 
	c.CustomerId, 
	c.FirstName, 
	c.LastName, 
	i.InvoiceId, 
	e.EmployeeId,
	e.FirstName AS NombreEmpleado
FROM Customer AS c
LEFT JOIN Invoice AS i 
ON c.CustomerId = i.CustomerId
LEFT JOIN Employee AS e
ON c.SupportRepId = e.EmployeeId;


-- 13. Facturas y detalles de factura (incluyendo facturas sin detalles)

SELECT 
	i.InvoiceId,
	i.Total,
	il.InvoiceLineId, 
	il.TrackId, 
	il.UnitPrice, 
	il.Quantity
FROM Invoice AS i
LEFT JOIN InvoiceLine AS il
ON i.InvoiceId = il.InvoiceId;


-- 14. Contar cuántas facturas tiene cada cliente

SELECT 
	c.CustomerId,
	c.FirstName, 
	c.LastName,
	COUNT(i.InvoiceId) AS TotalFacturas
FROM Customer AS c
LEFT JOIN Invoice AS i
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId;


-- 15. Mostrar las canciones más caras Ordenado por UnitPrice.

SELECT 
	Name,
	UnitPrice
FROM Track
ORDER BY UnitPrice DESC;


-- 16. Sumar la duración total de todas las canciones Cinco canciones

SELECT 
	SUM(Milliseconds/60000) AS minutos
FROM Track
LIMIT 5;


-- 17. Clientes con nombres que empiezan con "A"

SELECT 
	CustomerId, 
	FirstName, 
	LastName
FROM Customer
WHERE FirstName LIKE 'A%';


-- 18. Mostrar los 5 artistas más populares (basado en número de álbumes) Ordenado por la medida resultante

SELECT 
	ar.Name, 
	COUNT(a.AlbumId) AS NumeroÁlbumes
FROM Artist AS ar
INNER JOIN Album AS a 
ON ar.ArtistId = a.ArtistId
GROUP BY ar.ArtistId
ORDER BY NumeroÁlbumes DESC
LIMIT 5;


-- 19. Facturas con fecha en 2010 o después

SELECT 
	InvoiceId, 
	InvoiceDate, 
	Total
FROM Invoice
WHERE InvoiceDate >= '2010-01-01';


-- 20. Obtener todas las canciones que duran más de 5 minutos

SELECT 
	TrackId, 
	Name, 
	Milliseconds/60000 AS minutos
FROM Track
WHERE Milliseconds > 300000 
ORDER BY minutos DESC;

