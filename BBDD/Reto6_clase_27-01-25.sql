DROP DATABASE IF EXISTS  Reto6 ;

CREATE DATABASE Reto6 ;

USE Reto6 ;


CREATE TABLE Empleados (

	id_empleado INT PRIMARY KEY AUTO_INCREMENT, 

    nombre VARCHAR (30) NOT NULL , 

    edad INT NOT NULL , 

    salario DECIMAL (8,2) NOT NULL ,
    
    nombre_departamento VARCHAR (20) NOT NULL
    
    );

INSERT INTO Empleados (nombre,edad,salario,nombre_departamento) VALUES

('Juan', 28 , 3000 , 'Desarrollo' ),
('María', 32 , 3500 , 'Marketing' ),
('Pedro', 45 , 4000 , 'Desarrollo' ),
('Ana', 29 , 3200 , 'RRHH' ),
('Luis', 35 , 3700 , 'Marketing' );



-- 1) Mostrar el nombre y salario de todos los empleados

		SELECT nombre, salario FROM Empleados; 
 
 
 -- 2) Mostrar el nombre y el salario de los empleados con un salario mayor a 3500.

		SELECT nombre, salario  
		FROM Empleados  
		WHERE salario > 3500; 
        
 
 -- 3) Mostrar el nombre y la edad de los empleados, ordenados por edad de forma descendente
 
		SELECT nombre, edad  
		FROM Empleados  
		ORDER BY edad DESC; 
		
        
-- 4) Contar cuántos empleados hay en cada departamento

		SELECT nombre_departamento, COUNT(*) AS Departamento_Empleados  
		FROM Empleados  
		GROUP BY nombre_departamento;
        
 
-- 5)  Mostrar el salario promedio de los empleados en cada departamento

		SELECT nombre_departamento, AVG(salario) AS salario_promedio  
		FROM Empleados  
		GROUP BY nombre_departamento; 
 
 
 -- 6)  Mostrar el nombre del empleado más joven de la empresa
 
		SELECT nombre  
		FROM Empleados  
		WHERE edad = (SELECT MIN(edad) FROM Empleados);
        
        
-- 7)  Mostrar el nombre de los empleados que pertenecen al departamento de "Desarrollo".

		SELECT nombre  
		FROM Empleados  
		WHERE nombre_departamento = 'Desarrollo';
        

-- 8)  Mostrar el salario más alto en cada departamento

		SELECT nombre_departamento, MAX(salario) AS salario_maximo  
		FROM Empleados  
		GROUP BY nombre_departamento; 
        
        
-- 9)  Buscar empleados cuyo nombre empieza con "M"

		SELECT nombre 
		FROM Empleados  
		WHERE nombre LIKE 'm%';
        
        
-- 10)  Mostrar empleados cuyo salario esté entre 3000 y 4000

		SELECT nombre, salario FROM Empleados
		WHERE salario BETWEEN 3000 AND 4000
        ORDER BY salario DESC;