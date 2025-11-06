DROP DATABASE biblioteca;
CREATE DATABASE biblioteca;

CREATE TABLE usuario ( 

    id_usuario INT PRIMARY KEY AUTO_INCREMENT, 

    nombre VARCHAR (100), 

    correo VARCHAR (100) UNIQUE, 

    tipo_usuario VARCHAR (20)  

); 

 CREATE TABLE libro ( 

    id_libro INT PRIMARY KEY AUTO_INCREMENT, 

    titulo VARCHAR (200), 

    autor VARCHAR (100), 

    editorial VARCHAR (100), 

    publicacion YEAR, 

    genero VARCHAR (50) 

); 

 CREATE TABLE ejemplar ( 

    id_ejemplar INT PRIMARY KEY AUTO_INCREMENT, 

    estado VARCHAR (20), 

    id_libro INT, 

    FOREIGN KEY (id_libro) REFERENCES libro (id_libro) 

); 

 CREATE TABLE prestamo ( 

    id_prestamo INT PRIMARY KEY AUTO_INCREMENT, 

    fecha_prestamo DATE, 

    fecha_devolucion DATE, 

    id_usuario INT, 

    id_ejemplar INT, 

    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario), 

    FOREIGN KEY (id_ejemplar) REFERENCES ejemplar(id_ejemplar) 

); 

CREATE TABLE Reserva ( 

    id_reserva INT PRIMARY KEY AUTO_INCREMENT, 

    fecha_reserva DATE, 

    id_usuario INT, 

    id_ejemplar INT, 

    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario), 

    FOREIGN KEY (id_ejemplar) REFERENCES ejemplar(id_ejemplar) 

); 

CREATE TABLE Multa ( 

    id_multa INT PRIMARY KEY AUTO_INCREMENT, 

    importe DECIMAL (10, 2), CHECK (importe > 0),

    estado_pago  BOOLEAN NOT NULL DEFAULT FALSE,

    id_usuario INT, 

    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) 

); 