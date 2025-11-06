DROP DATABASE IF EXISTS ejercicio_final;
CREATE DATABASE ejercicio_final;

USE ejercicio_final;

CREATE TABLE fotografo ( 

    id_fotografo INT PRIMARY KEY AUTO_INCREMENT, 

    nombre VARCHAR (100) NOT NULL, 

    apellido VARCHAR (100) NOT NULL,
    
    especialidad ENUM ('retratos','paisajes','eventos') NOT NULL,

    añosExperiencia INT NOT NULL 
); 

 CREATE TABLE cliente ( 

    id_cliente INT PRIMARY KEY AUTO_INCREMENT, 

    nombre VARCHAR (100) NOT NULL, 

    apellido VARCHAR (100) NOT NULL, 

    correoElectronico VARCHAR (100) NOT NULL, 

	telefono INT NOT NULL
); 

CREATE TABLE sesion ( 

    id_sesion INT PRIMARY KEY AUTO_INCREMENT, 
    
    fecha DATE,
    
    tipoSesion ENUM ('retrato','paisaje','boda','producto') NOT NULL,

	duracion DATETIME,
    
    id_cliente INT NOT NULL, 
    
    id_fotografo INT NOT NULL, 
    
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente), 

    FOREIGN KEY (id_fotografo) REFERENCES fotografo (id_fotografo)
    
); 

CREATE TABLE fotografia ( 

	id_fotografia INT PRIMARY KEY AUTO_INCREMENT,
   
	nombreArchivo VARCHAR (100) NOT NULL,
   
	formato ENUM ('jpg','raw','png','otro') NOT NULL,
    
    resolucion VARCHAR (100) NOT NULL,
    
    tamañoArchivo VARCHAR (100) NOT NULL,
   
	id_sesion INT, 

	FOREIGN KEY (id_sesion) REFERENCES sesion(id_sesion)
); 

CREATE TABLE impresion ( 

	id_impresion INT PRIMARY KEY AUTO_INCREMENT,
   
	precio INT NOT NULL,
    
    tipoPapel ENUM ('mate','brillante') NOT NULL,
    
    tamañoImpresion VARCHAR (100) NOT NULL,
   
	id_fotografia INT NOT NULL, 

	FOREIGN KEY (id_fotografia) REFERENCES fotografia (id_fotografia)
);

 /*HE INCORPORADO LA FUNCION 'DATETIME' EN LA TABLA SESION PUESTO QUE SEGÚN LEÍ ASÍ SE REGISTRA EL INICIO Y EL FINAL DE UN EVENTO*/