CREATE DATABASE examen_mysql2;
USE examen_mysql2;

CREATE TABLE pais (
id_pais SMALLINT(11) AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
ultima_actualizacion TIMESTAMP
);

CREATE TABLE  ciudad(
id_ciudad SMALLINT(11) AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
id_pais SMALLINT(11),
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_pais) REFERENCES pais(id_pais)

);

CREATE TABLE direccion(
id_direccion SMALLINT(11) PRIMARY KEY,
direccion VARCHAR(50),
direccion2 VARCHAR(50),
distrito VARCHAR(20),
id_ciudad SMALLINT(11),
codigo_postal VARCHAR(10),
telefono VARCHAR(20),
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);
CREATE TABLE empleado(
id_empleado SMALLINT(11) PRIMARY KEY,
nombre VARCHAR(45),
apellidos VARCHAR(45),
id_direccion SMALLINT(11),
imagen BLOB,
email VARCHAR(50),
activo TINYINT(1),
username VARCHAR(16),
pasword VARCHAR(40),
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

CREATE TABLE almacen(
id_almacen TINYINT PRIMARY KEY,
id_direccion SMALLINT,
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

CREATE TABLE empleado_almacen (
id_almacen TINYINT,
id_empleado SMALLINT,
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen),
FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE cliente(
id_cliente SMALLINT PRIMARY KEY,
id_almacen TINYINT,
nombre VARCHAR(45),
apellidos VARCHAR(45),
email VARCHAR(50)    ,
id_direccion SMALLINT,
activo TINYINT(1),
fecha_creacion DATETIME,
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

CREATE TABLE idioma(
id_idioma TINYINT PRIMARY KEY,
nombre CHAR(20),
ultima_actualizacion TIMESTAMP
);

CREATE TABLE pelicula(
id_pelicula SMALLINT PRIMARY KEY,
titulo VARCHAR(255),
descripcion TEXT,
anyo_lanzamiento YEAR,
id_idioma TINYINT,
id_idioma_original TINYINT,
duracion_alquiler TINYINT,
rental_date DECIMAL(4,2),
duracion SMALLINT,
replacement_cost DECIMAL(5,2),
clasificacion ENUM('G', 'PG','PG-13', 'R', 'NC-17'),
caracteristicas_especiales SET('Trailers','Commentaries','Deleted Scenes','Behind the scenes'),
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_idioma) REFERENCES idioma(id_idioma)
);

CREATE TABLE actor(
id_actor SMALLINT PRIMARY KEY,
nombre VARCHAR(45),
apellidos VARCHAR(45),
ultima_actualizacion TIMESTAMP
);

CREATE TABLE pelicula_actor(
id_actor SMALLINT,
id_pelicula SMALLINT,
ultima_actualizacion TIMESTAMP,
PRIMARY KEY(id_actor, id_pelicula),
FOREIGN KEY (id_actor) REFERENCES actor(id_actor),
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
);

CREATE TABLE pelicula_categoria(
id_pelicula SMALLINT,
id_categoria TINYINT PRIMARY KEY,
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula)
);

CREATE TABLE categoria(
id_categoria TINYINT PRIMARY KEY,
nombre VARCHAR(25),
ultima_actualizacion TIMESTAMP
);

CREATE TABLE inventario(
id_inventario MEDIUMINT PRIMARY KEY,
id_pelicula SMALLINT,
id_almacen TINYINT,
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
FOREIGN KEY (id_almacen) REFERENCES almacen(id_almacen)
);
CREATE TABLE alquiler(
id_alquiler INT PRIMARY KEY,   
fecha_alquiler DATETIME,
id_inventario MEDIUMINT,
id_cliente SMALLINT,
fecha_devolucion DATETIME,
id_empleado SMALLINT,
ultima_actualizacion TIMESTAMP,
FOREIGN KEY (id_inventario)  REFERENCES inventario(id_inventario),
FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


CREATE TABLE pago(
id_pago SMALLINT PRIMARY KEY,
id_cliente SMALLINT,
id_empleado SMALLINT,
id_alquiler INT,
total DECIMAL(5,2),
fecha_pago DATETIME,
ultima_actualizacion TIMESTAMP    
);

CREATE TABLE film_text (
film_id SMALLINT,
title VARCHAR(255),
descripcion TEXT
);


